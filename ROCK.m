% constants
ult = 4;
gyro = 2;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
brick.GyroCalibrate(gyro);

setGlobalDirection(1);
setGlobalRunning(true);

while true
    moveUntilTouch(brick, ult, gyro, left, right, touch, kill);
    %moveUntil(brick, gyro, left, right, (-8/(2*pi)*360));

    pause(3);

    turn(brick, gyro, left, right, (90 * getGlobalDirection()), kill);

    pause(5);

    if (brick.TouchPressed(kill))
        break;
    end

end

function setGlobalDirection(val)
    global direction;
    direction = val;
end

function r = getGlobalDirection()
    global direction;
    r = direction;
end

function setGlobalRunning(val)
    global running;
    running = val;
end

function r = getGlobalRunning()
    global running;
    r = running;
end

function turn(brick, gyro, left, right, dir, kill)
    cur = brick.GyroAngle(gyro);
    disp(dir);

    if isnan(cur)
        cur = 0;
    end

    tar = cur + dir;

    Kp = 0.53;
    Ki = 0.077;
    Kd = 0.2;
    err = tar - cur;

    % disp(err);
    % disp(cur);

    prevIntegral = 0;
    prevErr = err;
    intActZone = 10;

    while abs(err) > 2
        prop = Kp * err;

        derivative = Kd * (err - prevErr);

        if abs(err) < intActZone
            integral = Ki * (err + prevIntegral);
        else
            integral = 0;
        end

        factor = prop + integral + derivative;

        moveLeft(factor, brick, left);
        moveRight(-factor, brick, right);

        cur = brick.GyroAngle(gyro);
        prevIntegral = prevIntegral + err;
        prevErr = err;
        err = tar - cur;

        % disp(cur);
        % disp(tar);
        % disp(err);

        if (brick.TouchPressed(kill))
            break;
        end
    end

    brick.StopAllMotors();

    if getGlobalDirection() == -1
        brick.MoveMotorAngleRel(left + right, 50, 3.5 * 360, 'Brake');
    end

    disp('done');
end

function moveLeft(speed, brick, left)
    brick.MoveMotor(left, speed);
end

function [angle] = getLeft(brick, left)
    angle = brick.GetMotorAngle(left);
end

function moveRight(speed, brick, right)
    brick.MoveMotor(right, speed);
end

function [angle] = getRight(brick, right)
    angle = brick.GetMotorAngle(right);
end

function moveForward(speed, brick, left, right, offset)
    moveLeft((speed + offset), brick, left);
    moveRight((speed - offset), brick, right);
end

function moveUntilTouch(brick, ult, gyro, left, right, touch, kill)
    Kp = 1;
    Ki = 0;
    Kd = 0;

    ang = brick.GyroAngle(gyro);
    curAng = brick.GyroAngle(gyro);

    if isnan(curAng)
       curAng = 0;
    end
    
    if isnan(ang)
        ang = 0;
    end

    err = curAng - ang;

    while brick.UltrasonicDist(ult) < 50 && ~brick.TouchPressed(touch)
        off = -err * Kp;

        moveForward(20, brick, left, right, off);

        curAng = brick.GyroAngle(gyro);
        err = curAng - ang;

        % disp(brick.UltrasonicDist(ult));
        % disp(ang);
        % disp(curAng);

        if (brick.TouchPressed(kill))
            break;
        end
    end

    brick.StopAllMotors();

    if (brick.UltrasonicDist(ult) >= 50)
        setGlobalDirection(-1);
        brick.MoveMotorAngleRel(left + right, 50, 1 * 360, 'Brake');
    else
        setGlobalDirection(1);
        brick.MoveMotorAngleRel(left + right, 50, -1 * 360, 'Brake');
    end

    disp('done');
end

function moveUntil(brick, gyro, left, right, dist)
    Kp = 2;

    brick.ResetMotorAngle(left);
    brick.ResetMotorAngle(right);

    cur = 0;
    tar = dist;
    err = tar - cur;

    Kp2 = 1;

    ang = brick.GyroAngle(gyro);
    
    if isnan(ang)
        ang = 0;
    end

    curAng = ang;

    while abs(err) > 5
        prop = Kp * err;

        factor = prop;

        off = (curAng - ang) * Kp2;

        % disp(factor);
        % disp(off);
        % disp(cur);
        % disp(err);

        moveForward(factor, brick, left, right, off);

        cur = (getLeft(brick, left) + getRight(brick, right))/2;
        err = tar - cur;

        curAng = brick.GyroAngle(gyro);
        if(isnan(curAng))
            curAng = 0;
        end

        % disp(ang);
        % disp(curAng);
    end

    brick.StopAllMotors();
    disp('done');
end