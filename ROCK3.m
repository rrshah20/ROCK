ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';
color = 2;
claw = 'D';

off = 0;

leftSpeed = 75;
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

while getGlobalRunning()
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
                brick.StopAllMotors('Coast');
    
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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
                            break;
                    end
                end
                CloseKeyboard();
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
                brick.StopAllMotors('Coast');
    
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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
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
                            brick.StopAllMotors('Brake');
                        case 'q'
                            brick.StopAllMotors('Brake');
                            break;
                    end
                end
                CloseKeyboard();
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

        brick.MoveMotorAngleRel(left, 75, 2 * 180, 'Brake');

        pause(2);

        brick.StopAllMotors('Brake');

        brick.MoveMotor(left, leftSpeed);
        brick.MoveMotor(right, rightSpeed);

        pause(0.8); 
    else
        disp('4');
        brick.StopAllMotors('Brake');
    
        brick.MoveMotor(left, leftSpeed + off);
        brick.MoveMotor(right, rightSpeed - off);
    
        t = 0;

        while t < 0.3
            while true
                if brick.UltrasonicDist(ult) < 50
                    disp('25');
                    tar = 25;
                    cur = brick.UltrasonicDist(ult);
                    err = tar - cur;
        
                    p1 = 1;
    
                    if abs(err) > 1
                        off = p1 * err;
                    end
                    disp(off);
                end
                disp('6');
                if brick.ColorCode(color) == 5
                    brick.StopAllMotors('Coast');
                    disp('7');
        
                    pause(1);
                    disp('8');
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
                                brick.StopAllMotors('Brake');
                            case 'q'
                                brick.StopAllMotors('Brake');
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
                                brick.StopAllMotors('Brake');
                            case 'q'
                                brick.StopAllMotors('Brake');
                                break;
                        end
                    end
                    CloseKeyboard();
                    break;
                end

                brick.MoveMotor(left, leftSpeed + off);
                brick.MoveMotor(right, rightSpeed - off);
    
                t = t + 0.01;
                pause(0.01);

                if t == 0.3
                    break;
                end
            end
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