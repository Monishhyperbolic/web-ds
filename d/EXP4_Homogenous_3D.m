clc;
clear;
close all;

PM = [1; 0; 0; 1];

disp('Initial Point Matrix:')
disp(PM)

T = eye(4);

disp('Identity Transformation Matrix:')
disp(T)

frame = input('Enter the frame you want Fixed(1) or Mobile(2): ');

op1 = input('Enter your operation as 1 for Rotation or 2 for Translation: ');

if op1 == 1

    angle = input('Enter the input angle for Rotation: ');
    angle = deg2rad(angle);

    axis = input('Enter the input axis of Rotation(1=X, 2=Y, 3=Z): ');

    if axis == 1

        H1 = [1 0 0 0;
              0 cos(angle) -sin(angle) 0;
              0 sin(angle) cos(angle) 0;
              0 0 0 1];

    elseif axis == 2

        H1 = [cos(angle) 0 sin(angle) 0;
              0 1 0 0;
             -sin(angle) 0 cos(angle) 0;
              0 0 0 1];

    elseif axis == 3

        H1 = [cos(angle) -sin(angle) 0 0;
              sin(angle) cos(angle) 0 0;
              0 0 1 0;
              0 0 0 1];
    end

    disp('Rotation Matrix:')
    disp(H1)

elseif op1 == 2

    dist = input('Enter the distance of Translation: ');

    axis = input('Enter the axis of Translation(1=X, 2=Y, 3=Z): ');

    if axis == 1

        H1 = [1 0 0 dist;
              0 1 0 0;
              0 0 1 0;
              0 0 0 1];

    elseif axis == 2

        H1 = [1 0 0 0;
              0 1 0 dist;
              0 0 1 0;
              0 0 0 1];

    elseif axis == 3

        H1 = [1 0 0 0;
              0 1 0 0;
              0 0 1 dist;
              0 0 0 1];
    end

    disp('Translation Matrix:')
    disp(H1)

end

op2 = input('Enter your second operation as 1 for Rotation or 2 for Translation: ');

if op2 == 1

    angle = input('Enter the input angle for Rotation: ');
    angle = deg2rad(angle);

    axis = input('Enter the input axis of Rotation(1=X, 2=Y, 3=Z): ');

    if axis == 1

        H2 = [1 0 0 0;
              0 cos(angle) -sin(angle) 0;
              0 sin(angle) cos(angle) 0;
              0 0 0 1];

    elseif axis == 2

        H2 = [cos(angle) 0 sin(angle) 0;
              0 1 0 0;
             -sin(angle) 0 cos(angle) 0;
              0 0 0 1];

    elseif axis == 3

        H2 = [cos(angle) -sin(angle) 0 0;
              sin(angle) cos(angle) 0 0;
              0 0 1 0;
              0 0 0 1];
    end

    disp('Second Rotation Matrix:')
    disp(H2)

elseif op2 == 2

    dist = input('Enter the distance of Translation: ');

    axis = input('Enter the axis of Translation(1=X, 2=Y, 3=Z): ');

    if axis == 1

        H2 = [1 0 0 dist;
              0 1 0 0;
              0 0 1 0;
              0 0 0 1];

    elseif axis == 2

        H2 = [1 0 0 0;
              0 1 0 dist;
              0 0 1 0;
              0 0 0 1];

    elseif axis == 3

        H2 = [1 0 0 0;
              0 1 0 0;
              0 0 1 dist;
              0 0 0 1];
    end

    disp('Second Translation Matrix:')
    disp(H2)

end

if frame == 1

    H = H2 * H1;

elseif frame == 2

    H = H1 * H2;

else

    error('Invalid frame selection');

end

PF = H * PM;

disp('Final Transformation Matrix:')
disp(H)

disp('Final Transformed Point:')
disp(PF)