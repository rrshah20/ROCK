brick.GyroCalibrate(1);

while true
    moveUntil(30);
    turnRight();
end

function turnRight()
    cur = brick.GyroAngle(1);
    tar = curr + 90;
    Kp = 0.5;
    err = tar - cur;

    moveRight(0);

    while abs(err) > 1
        prop = Kp * err;

        moveLeft(prop);
        moveRight(-prop);

        cur = brick.GyroAngle(1);
        err = tar - cur;

        pause(0.5);
    end

    moveLeft(0);

    disp('done');
end

function moveLeft(speed)
    brick.moveMotor('A', speed);
end

function moveRight(speed)
    brick.moveMotor('D', speed);
end

function moveForward(speed)
    brick.moveMotor('AD', speed);
end

function moveUntil(dist)
    cur = brick.UltrasonicDist(1);
    tar = dist;
    Kp = 0.5;
    err = abs(tar - cur);

    while err > 1
        prop = Kp * err;

        moveForward(prop);

        cur = brick.GyroAngle(1);
        err = abs(tar - cur);

        pause(0.5);
    end
end