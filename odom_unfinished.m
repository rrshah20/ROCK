ult = 4;
touch = 3;
kill = 1;
right = 'C';
left = 'B';

leftSpeed = 41;
rightSpeed = 40;

setGlobalRunning(true);

while getGlobalRunning()
    double intodeg = 360/(2*pi*1.1);
    if brick.UltrasonicDist(ult) > 35
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 196, 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 24*intodeg, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*intodeg, 'Brake');

        pause(7);
    elseif brick.TouchPressed(touch) == 1
        brick.StopAllMotors();

        brick.MoveMotorAngleRel(left, leftSpeed, -6*intodeg, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -6*intodeg, 'Brake');

        pause(3.5);

        brick.MoveMotorAngleRel(left, leftSpeed, 196, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, -196, 'Brake');

        pause(7);
    else
        brick.StopAllMotors();
    
        brick.MoveMotorAngleRel(left, leftSpeed, 24*intodeg, 'Brake');
        brick.MoveMotorAngleRel(right, rightSpeed, 24*intodeg, 'Brake');
    
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

function fwdPID(brick, left, right, dist, timeout)
     kp = 0;
     ki = 0;
     kd = 0;
     iazone = 0;
     curr = 0;
     err = dist-curr;
     time = 0;
     integral = 0;
     preverr = 0;
     xpos = 0;
     ypos = 0;
     ang = 0;

     lreal = 0;
     rreal = 0;
     prevleft = 0;
     prevright = 0;

    while(abs(err)>5 && time<timeout)
        if(abs(err)<iazone)
            integral = err+integral;
        else
            integral = 0;
        end
        deriv = err-preverr;
        output = err*kp+integral*ki+deriv*kd;

        deltar = rreal-prevright;
        deltal = lreal-prevleft;
        dang = deltal-deltar;
        ang = dang+ang;
        


    end



end





