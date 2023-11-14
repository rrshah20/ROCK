ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;
claw = 'D';

leftSpeed = 75;
rightSpeed = 73.5;

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

while false
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

while getGlobalRunning()
    disp('1');
    if brick.TouchPressed(touch) == 1
        disp('3');
        brick.StopAllMotors();

        brick.MoveMotor(left, -leftSpeed);
        brick.MoveMotor(right, -rightSpeed);

        pause(0.8);

        brick.MoveMotorAngleRel(left, leftSpeed, 200, "Brake");
        brick.MoveMotorAngleRel(right, rightSpeed, -200, "Brake");

        pause(2.25);

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        pause(0.8);
    elseif brick.UltrasonicDist(ult) > 35
        disp('2');
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -194, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 194, 'Brake');

        pause(2);

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        t = 0;

        while t < 0.8
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
    
                pause(1);

                break;
            elseif brick.ColorCode(color) == 2
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
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
                break;
            elseif brick.ColorCode(color) == 3
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
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
                break;
            end

            t = t + 0.1;
            pause(0.1);
        end
    else
        disp('4');
        brick.StopAllMotors();
    
        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);
    
        t = 0;

        while t < 0.1
            disp('6');
            if brick.ColorCode(color) == 5
                brick.StopAllMotors();
                disp('7');
    
                pause(1);
                disp('8');
            elseif brick.ColorCode(color) == 2
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
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
                break;
            elseif brick.ColorCode(color) == 3
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
                brick.playTone(100, 2000, 500);
                pause(1);
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
                break;
            end

            t = t + 0.1;
            pause(0.1);
        end
    end

    disp('5');

    if brick.TouchPressed(kill)
        setGlobalRunning(false);
    end
end

brick.StopAllMotors();

function setGlobalRunning(val)
    global running;
    running = val;
end

function r = getGlobalRunning()
    global running;
    r = running;
end