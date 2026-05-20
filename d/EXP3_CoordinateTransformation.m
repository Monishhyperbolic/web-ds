clear;

P = [1; 2; 3];

rotation_angle = 90;

theta = deg2rad(rotation_angle);

Rz = [cos(theta), -sin(theta), 0;
      sin(theta),  cos(theta), 0;
      0,           0,          1];

Rx = [1, 0,           0;
      0, cos(theta), -sin(theta);
      0, sin(theta),  cos(theta)];

Ry = [cos(theta),  0, -sin(theta);
      0,           1,  0;
      sin(theta),  0,  cos(theta)];

R = Rx * Ry * Rz;

transformed_point = R * P;

disp('Original Point');
disp(P);

disp('Transformed point');
disp(transformed_point);