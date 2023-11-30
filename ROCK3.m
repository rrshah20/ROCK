ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;
claw = 'D';

leftSpeed = 67.5;
rightSpeed = 65;

setGlobalRunning(true);
brick.SetColorMode(color, 2);

global key

setDone(false);

while getGlobalRunning()
    disp('1');
    if brick.TouchPressed(touch) == 1
        disp('3');
        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, -leftSpeed);
        brick.MoveMotor(right, -rightSpeed);

        pause(0.6);

        brick.StopAllMotors('Brake');

        brick.MoveMotorAngleRel(right, 50, 2.25 * 180, 'Brake');

        pause(2);
    elseif brick.UltrasonicDist(ult) > 35
        disp('2');
        brick.StopMotor(right, 'Brake');

        brick.MoveMotorAngleRel(left, 50, 2.1 * 180, 'Brake');

        pause(2);

        brick.StopAllMotors();

        pause(0.5);

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        pause(1.5);

        brick.StopAllMotors();
    else
        disp('4');
        brick.StopAllMotors();
    
        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);
    
        t = 0;

        while t < 0.4
            disp('6');
            if brick.ColorCode(color) == 5
                pause(0.5);

                brick.StopAllMotors('Brake');
    
                pause(1);

                brick.MoveMotor(left, leftSpeed);
                brick.MoveMotor(right, rightSpeed);

                pause(1);

                break;
            elseif brick.ColorCode(color) == 2
                brick.StopAllMotors();
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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
                            break;
                    end
                end
                CloseKeyboard();
                break;
            elseif brick.ColorCode(color) == 3
                brick.StopAllMotors();
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
                            brick.StopAllMotors('Brake');
                        case 'x'
                            setDone(true);
                        case 'q'
                            brick.StopAllMotors('Brake');
                            break;
                    end
                end
                CloseKeyboard();
                break;
            elseif brick.ColorCode(color) == 4 && getDone()
                brick.StopAllMotors();
                setGlobalRunning(false);
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

brick.StopAllMotors('Brake');

function setGlobalRunning(val)
    global running;
    running = val;
end

function r = getGlobalRunning()
    global running;
    r = running;
end

function setDone(val)
    global done;
    done = val;
end

function r = getDone()
    global done;
    r = done;
end