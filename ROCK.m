% constants
ult = 4;
gyro = 2;
right = 'C';
left = 'B';
brick.GyroCalibrate(gyro);

% color = 3;

setGlobalRunning(true);

while getGlobalRunning()
    moveUntil(30, brick, ult, left, right);
    % turnRight(brick, gyro, left, right);
end

function setGlobalRunning(val)
    global running;
    running = val;
end

function r = getGlobalRunning()
    global running;
    r = running;
end

function turnRight(brick, gyro, left, right)
    cur = brick.GyroAngle(gyro);

    n = fix(rand() * 2);

    if isnan(cur)
        cur = 0;
    end

    if n == 0
        tar = cur + 90 - mod(cur, 90);
    else
        tar = cur - 90 + mod(cur, 90);
    end

    Kp = 0.53;
    Ki = 0.075;
    Kd = 0.1;
    err = tar - cur;

    disp(err);
    disp(cur);

    prevIntegral = 0;
    prevErr = err;
    intActZone = 10;

    while abs(err) > 4
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

        if brick.TouchPressed(1)
            setGlobalRunning(false);
        end
    end

    moveRight(0, brick, right);
    moveLeft(0, brick, left);

    disp('done');
end

function moveLeft(speed, brick, left)
    brick.MoveMotor(left, speed);
end

function [angle] = getLeft()
    angle = brick.GetMotorAngle(left);
end

function moveRight(speed, brick, right)
    brick.MoveMotor(right, speed * 0.84);
end

function [angle] = getRight()
    angle = brick.GetMotorAngle(right);
end

function moveForward(speed, brick, left, right)
    moveLeft(speed, brick, left);
    moveRight(speed, brick, right);
end

function moveUntil(dist, brick, ult, left, right)
    Kp = 2;
    Ki = 0.02;
    Kd = 0.1;

    cur = brick.UltrasonicDist(ult);
    tar = dist;
    err = cur - tar;

    prevIntegral = 0;
    prevErr = err;
    intActZone = 10;

    while abs(err) > 2 && getGlobalRunning()
        prop = Kp * err;

        derivative = Kd * (err - prevErr);

        if abs(err) < intActZone
            integral = Ki * (err + prevIntegral);
        else
            integral = 0;
        end

        factor = prop + integral + derivative;

        moveForward(factor, brick, left, right);

        cur = brick.UltrasonicDist(ult);
        prevIntegral = prevIntegral + err;
        prevErr = err;
        err = cur - tar;

        if brick.TouchPressed(1)
            setGlobalRunning(false);
        end

        disp(brick.UltrasonicDist(ult));
    end

    brick.StopAllMotors();
    disp('done');
end