ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;
claw = 'D';

off = 0;

leftSpeed = 78;
rightSpeed = 73;

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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
                            break;
                    end
                end
                CloseKeyboard();

setDone(false);

while getGlobalRunning() && false
    disp('1');
    if brick.UltrasonicDist(ult) > 50 && brick.TouchPressed(touch) == 1
        disp('10');

        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, -leftSpeed);
        brick.MoveMotor(right, -rightSpeed);

        pause(0.6);

        brick.StopAllMotors('Brake');
        brick.MoveMotorAngleRel(right, 50, 2 * 180, 'Brake');
        pause(2);

        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        t = 0;

        while t < 0.8
            if brick.ColorCode(color) == 5
                pause(0.5);

                brick.StopAllMotors('Brake');
    
                pause(1);

                brick.MoveMotor(left, leftSpeed);
                brick.MoveMotor(right, rightSpeed);

                pause(0.2);

                brick.StopAllMotors();

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
            elseif brick.ColorCode(color) == 7 && getDone() == true
                brick.StopAllMotors();
                setGlobalRunning(false);
                break;
            end

            t = t + 0.1;
            pause(0.1);
        end
    elseif brick.UltrasonicDist(ult) > 50
        disp('2');
        brick.StopMotor(left, 'Brake');

        brick.MoveMotorAngleRel(right, 50, 2 * 180, 'Brake');
        pause(2);

        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        t = 0;

        while t < 0.8
            if brick.ColorCode(color) == 5
                pause(0.5);

                brick.StopAllMotors('Brake');
    
                pause(1);

                brick.MoveMotor(left, leftSpeed);
                brick.MoveMotor(right, rightSpeed);

                pause(0.2);

                brick.StopAllMotors();

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
            elseif brick.ColorCode(color) == 7 && getDone() == true
                brick.StopAllMotors();
                setGlobalRunning(false);
                break;
            end

            t = t + 0.1;
            pause(0.1);
        end
    elseif brick.TouchPressed(touch) == 1
        disp('3');
        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, -leftSpeed);
        brick.MoveMotor(right, -rightSpeed);

        pause(0.6);

        brick.StopAllMotors('Brake');

        brick.MoveMotorAngleRel(left, 75, 2.25 * 180, 'Brake');

        pause(2);

        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        pause(0.2);
    else
        disp('4');
        brick.StopAllMotors();
    
        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);
    
        t = 0;

        while t < 0.01
            disp('6');
            if brick.ColorCode(color) == 5
                pause(0.5);

                brick.StopAllMotors('Brake');
    
                pause(1);

                brick.MoveMotor(left, leftSpeed);
                brick.MoveMotor(right, rightSpeed);

                pause(0.2);

                brick.StopAllMotors();

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
            elseif brick.ColorCode(color) == 7 && getDone() == true
                brick.StopAllMotors();
                setGlobalRunning(false);
                break;
            end

            t = t + 0.01;
            pause(0.01);
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