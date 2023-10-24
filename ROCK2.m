ult = 4;
gyro = 2;
touch = 3;
kill = 1;
right = 'C';
left = 'B';

while true
    if brick.UltrasonicDist(ult) > 50
        brick.StopAllMotors;

        brick.MoveMotorAngleRel(left, 40, -195, 'Brake');
        brick.MoveMotorAngleRel(right, 35, 195, 'Brake');

        pause(3);

        brick.MoveMotor(left, 40);
        brick.MoveMotor(right, 35);

        pause(3);
    end

    if brick.TouchPressed(touch) == 1
        brick.MoveMotor(left, 40);
        brick.MoveMotor(right, 35);

        pause(3);

        brick.MoveMotorAngleRel(left, 40, 195, 'Brake');
        brick.MoveMotorAngleRel(right, 35, -195, 'Brake');

        pause(3);
    end
        
    brick.MoveMotor(left, 40);
    brick.MoveMotor(right, 35);
end