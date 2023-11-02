ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;
claw = 'D';

leftSpeed = 52;
rightSpeed = 50;

setGlobalRunning(true);
brick.SetColorMode(color, 2);

% brick.MoveMotorAngleRel(claw, 75, 360 * 6);

while false
    disp(brick.ColorCode(color));

    if brick.TouchPressed(kill)
        setGlobalRunning(false);
    end
end

while getGlobalRunning()
    if brick.UltrasonicDist(ult) > 35
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 196, 'Brake');

        pause(3.5);

        brick.ResetMotorAngle(left + right);

        brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

        while brick.GetMotorAngle(left) < 24*360/(2*pi*1.1) || brick.GetMotorAngle(right) < 24*360/(2*pi*1.1)
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
                brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

                break;
            elseif brick.ColorCode(color) == 2
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                setGlobalRunning(false);
                break;
            elseif brick.ColorCode(color) == 3
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                setGlobalRunning(false);
                break;
            end
        end
    elseif brick.TouchPressed(touch) == 1
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -6*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -6*360/(2*pi*1.1), 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -196, 'Brake');
    else
        brick.StopAllMotors();

        brick.ResetMotorAngle(left + right);
    
        brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
    
        while brick.GetMotorAngle(left) < 24*360/(2*pi*1.1) || brick.GetMotorAngle(right) < 24*360/(2*pi*1.1)
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
                brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

                break;
            elseif brick.ColorCode(color) == 2
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                setGlobalRunning(false);
                break;
            elseif brick.ColorCode(color) == 3
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                setGlobalRunning(false);
                break;
            end
        end
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