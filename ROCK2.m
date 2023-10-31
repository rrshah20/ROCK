ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;

leftSpeed = 41;
rightSpeed = 40;

setGlobalRunning(true);
brick.SetColorMode(color, 2);

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

        brick.MoveMotorAngleRel(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

        t = 0;
        while t < 7
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleRel(left, leftSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(left)), 'Brake');
                brick.MoveMotorAngleRel(right, rightSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(right)), 'Brake');

                pause(7 - t);
                t = 7;
            elseif brick.ColorCode(color) == 2
                brick.beep(1);
                pause(1);
                brick.beep(1);
                setGlobalRunning(false);
                break;
            elseif brick.ColorCode(color) == 3
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                setGlobalRunning(false);
                break;
            else
                pause(0.1);
                t = t + 0.1;
            end
        end
    elseif brick.TouchPressed(touch) == 1
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -6*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -6*360/(2*pi*1.1), 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -196, 'Brake');

        t = 0;
        while t < 7
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleRel(left, leftSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(left)), 'Brake');
                brick.MoveMotorAngleRel(right, rightSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(right)), 'Brake');

                pause(7 - t);
                t = 7;
            elseif brick.ColorCode(color) == 2
                brick.beep(1);
                pause(1);
                brick.beep(1);
                setGlobalRunning(false);
                break;
            elseif brick.ColorCode(color) == 3
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                setGlobalRunning(false);
                break;
            else
                pause(0.1);
                t = t + 0.1;
            end
        end
    else
        brick.StopAllMotors();
    
        brick.MoveMotorAngleRel(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
    
        t = 0;
        while t < 7
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleRel(left, leftSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(left)), 'Brake');
                brick.MoveMotorAngleRel(right, rightSpeed, abs(24*360/(2*pi*1.1) - brick.GetMotorAngle(right)), 'Brake');

                pause(7 - t);
                t = 7;
            elseif brick.ColorCode(color) == 2
                brick.beep(1);
                pause(1);
                brick.beep(1);
                setGlobalRunning(false);
                break;
            elseif brick.ColorCode(color) == 3
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                brick.beep(1);
                pause(1);
                setGlobalRunning(false);
                break;
            else
                pause(0.1);
                t = t + 0.1;
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