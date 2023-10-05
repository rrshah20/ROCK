% constants
ult = 4;
gyro = 2;
right = 'C';
left = 'B';
% color = 3;

brick.GyroCalibrate(gyro);

moveUntil(30, brick, ult, left, right);
turnRight(brick, gyro, left, right);

%while true
 %   moveUntil(30, brick, ult, left, right);
 %   turnRight(brick, gyro);
%end

function turnRight(brick, gyro, left, right)
    cur = brick.GyroAngle(gyro);
    tar = cur + 90;
    Kp = 0.5;
    err = tar - cur;

    disp(err);
    disp(cur);

    while abs(err) > 1
        prop = Kp * err;

        moveLeft(prop, brick, left);
        moveRight(-prop, brick, right);

        cur = brick.GyroAngle(gyro);
        err = tar - cur;

        pause(0.5);
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
    brick.MoveMotor(right, speed * 0.92);
end

function [angle] = getRight()
    angle = brick.GetMotorAngle(right);
end

function moveForward(speed, brick, left, right)
    moveLeft(speed, brick, left);
    moveRight(speed, brick, right);
end

function moveUntil(dist, brick, ult, left, right)
    cur = brick.UltrasonicDist(ult);
    tar = dist;
    Kp = 2;
    err = cur - tar;

    while abs(err) > 1
        prop = Kp * err;

        moveForward(prop, brick, left, right);

        cur = brick.UltrasonicDist(ult);
        err = cur - tar;

        % pause(0.0001);
    end

    brick.StopAllMotors();
    disp('done');
end