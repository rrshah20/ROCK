ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';

leftSpeed = 41.5;
rightSpeed = 40;

setGlobalRunning(true);

while getGlobalRunning()
    if brick.UltrasonicDist(ult) > 35
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 196, 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

        pause(7);
    elseif brick.TouchPressed(touch) == 1
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -6*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -6*360/(2*pi*1.1), 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -196, 'Brake');

        pause(7);
    else
        brick.StopAllMotors();
    
        brick.MoveMotorAngleRel(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
    
        pause(7);
    end

    if brick.TouchPressed(kill)
        setGlobalRunning(false);
    end
end

function setGlobalRunning(val)
    global running;
    running = val;
end

function r = getGlobalRunning()
    global running;
    r = running;
end