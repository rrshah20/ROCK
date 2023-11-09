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

while false
    disp(brick.ColorCode(color));

    if brick.TouchPressed(kill)
        setGlobalRunning(false);
    end
end

disp(brick.TouchPressed(kill));

global key

InitKeyboard();

while true
    pause(0.1);

    switch key
        case 'uparrow'
            brick.MoveMotor(claw, 65);
        case 'downarrow'
            brick.MoveMotor(claw, -65);
        case 'w'
            brick.MoveMotor(right, 25);
            brick.MoveMotor(left, 29);
        case 's'
            brick.MoveMotor(right, -25);
            brick.MoveMotor(left, -29);
        case 'a'
            brick.MoveMotor(right, 25);
            brick.MoveMotor(left, -29);
        case 'd'
            brick.MoveMotor(right, -25);
            brick.MoveMotor(left, 29);
        case 0
            brick.StopAllMotors();
        case 'q'
            brick.StopAllMotors();
            break;
    end
end

CloseKeyboard();

while getGlobalRunning() && false
    disp('1');
    if brick.TouchPressed(touch) == 1
        disp('3');
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -6*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -6*360/(2*pi*1.1), 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -196, 'Brake');

        pause(3.5);
    elseif brick.UltrasonicDist(ult) > 35
        disp('2');
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 196, 'Brake');

        pause(3.5);

        brick.ResetMotorAngle(left + right);

        brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');

        while abs(brick.GetMotorAngle(left)) < (24*360/(2*pi*1.1)) - 5 || abs(brick.GetMotorAngle(right)) < (24*360/(2*pi*1.1)) - 5
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);
    
                brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
                brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
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
    else
        disp('4');
        brick.StopAllMotors();

        brick.ResetMotorAngle(left + right);
    
        brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
        brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
    
        while abs(brick.GetMotorAngle(left)) < (24*360/(2*pi*1.1)) - 5 || abs(brick.GetMotorAngle(right)) < (24*360/(2*pi*1.1)) - 5
            disp('6');
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
                disp('7');
    
                pause(1);
                disp('8');
    
                brick.MoveMotorAngleAbs(left, leftSpeed, 24*360/(2*pi*1.1), 'Brake');
                brick.MoveMotorAngleAbs(right, rightSpeed, 24*360/(2*pi*1.1), 'Brake');
                disp('9');
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

    disp('5');
    disp(brick.TouchPressed(kill));

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