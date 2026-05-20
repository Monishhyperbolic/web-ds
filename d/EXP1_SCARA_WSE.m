
clc; clear; close all;

fprintf('===== SCARA Robot - Work Space Envelope (WSE) =====\n\n');

fprintf('Robot Configurations:\n');
fprintf('  Cartesian : PPP  | Box-shaped WSE\n');
fprintf('  Cylindrical: RPP | Cylindrical WSE\n');
fprintf('  Spherical  : RRP | Spherical WSE\n');
fprintf('  SCARA      : RRP | Complex planar + vertical WSE\n');
fprintf('  Articulated: RRR | Partial sphere WSE\n\n');
fprintf('Enter SCARA robot parameters:\n');

L1         = input('Link 1 length (shoulder to elbow) in cm [e.g. 3]: ');
L2         = input('Link 2 length (elbow to wrist) in cm   [e.g. 2]: ');
theta1_max = input('Max angle of Joint 1 (degrees)         [e.g. 270]: ');
theta2_max = input('Max angle of Joint 2 (degrees)         [e.g. 270]: ');
d3_min     = input('Min vertical stroke (cm)               [e.g. 0]: ');
d3_max     = input('Max vertical stroke (cm)               [e.g. 5]: ');

theta1_range = deg2rad(theta1_max);
theta2_range = deg2rad(theta2_max);


R_max = L1 + L2;             
R_min = abs(L1 - L2);        
vertical_stroke = d3_max - d3_min;

fprintf('\n=== WSE Results ===\n');
fprintf('Maximum Horizontal Reach : %.2f cm\n', R_max);
fprintf('Minimum Horizontal Reach : %.2f cm\n', R_min);
fprintf('Vertical Stroke          : %.2f cm\n', vertical_stroke);


A_annulus = pi * (R_max^2 - R_min^2) * (theta1_max/360);
WSE_volume = A_annulus * vertical_stroke;
fprintf('Approximate WSE Volume   : %.4f cm^3\n', WSE_volume);


figure('Name', 'SCARA WSE - Top View');
theta = linspace(0, theta1_range, 300);


x_outer = R_max * cos(theta);
y_outer = R_max * sin(theta);


x_inner = R_min * cos(theta);
y_inner = R_min * sin(theta);

fill([x_outer, fliplr(x_inner)], [y_outer, fliplr(y_inner)], ...
    [0.6 0.8 1], 'EdgeColor', 'b', 'LineWidth', 1.5);
hold on;
plot(0, 0, 'r+', 'MarkerSize', 12, 'LineWidth', 2);
title('SCARA Robot Work Space Envelope (Top View)');
xlabel('X (cm)'); ylabel('Y (cm)');
legend('Work Envelope', 'Robot Base');
axis equal; grid on;


figure('Name', 'SCARA WSE - Side View');
rect_x = [R_min, R_max, R_max, R_min, R_min];
rect_y = [d3_min, d3_min, d3_max, d3_max, d3_min];
fill(rect_x, rect_y, [0.6 0.8 1], 'EdgeColor', 'b', 'LineWidth', 1.5);
xlabel('Radial Distance (cm)'); ylabel('Vertical Height (cm)');
title('SCARA Robot Work Space Envelope (Side View)');
grid on;

fprintf('\nConclusion: WSE of SCARA robot obtained with R_max = %.2f cm, Volume ≈ %.2f cm^3\n', R_max, WSE_volume);