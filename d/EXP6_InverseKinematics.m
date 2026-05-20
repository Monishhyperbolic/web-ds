%% SCARA Robot - Inverse Kinematics

% Given constants
a1 = 425;
a2 = 375;
d1 = 877;
d4 = 200;

% --- Part 1: Direct calculation with fixed values ---
w1 = 692.82;
w2 = 25;
w3 = 527;
w6 = 1.6487;
theta2 = 60;

q2 = acos(((w1^2) + (w2^2) - (a1^2) - (a2^2)) / (2 * a1 * a2));
q1 = atan2((a2*sin(theta2))*w1 + (a1 + a2*cos(theta2))*w2, ...
           (a1 + a2*cos(theta2))*w1 - a2*sin(theta2)*w2);
q3 = d1 - d4 - w3;
q4 = pi * log(abs(w6));

disp("--- Fixed Value Results ---")
disp("q2 = "); disp(q2)
disp("q1 = "); disp(q1)
disp("q3 = "); disp(q3)
disp("q4 = "); disp(q4)

% --- Part 2: User input ---
w = input("Enter the w vector [w1 w2 w3 w4 w5 w6]: ");
d = input("Enter the d vector [d1 d2 d3 d4]: ");
a = input("Enter the a vector [a1 a2]: ");

q2 = acos(((w(1)^2) + (w(2)^2) - (a(1)^2) - (a(2)^2)) / (2 * a(1) * a(2)));

% Elbow-up solution
Y_a  = (a(2)*sin(q2)*w(1)) + (a(1) + a(2)*cos(q2))*w(2);
X_a  = (a(1) + a(2)*cos(q2))*w(1) - (a(2)*sin(q2)*w(2));
q1a  = atan2(Y_a, X_a);

% Elbow-down solution
Y_b  = (a(2)*sin(-q2)*w(1)) + (a(1) + a(2)*cos(-q2))*w(2);
X_b  = (a(1) + a(2)*cos(-q2))*w(1) - (a(2)*sin(-q2)*w(2));
q1b  = atan2(Y_b, X_b);

q3 = d(1) - d(4) - w(3);
q4 = pi * log(abs(w(6)));

disp("--- User Input Results ---")
disp("q2 = ");  disp(q2)
disp("q1a = "); disp(q1a)
disp("q1b = "); disp(q1b)
disp("q3 = ");  disp(q3)
disp("q4 = ");  disp(q4)

% Input values:
% w = [692.82, 25, 527, 0, 0, 1.6487]
% d = [877, 0, 0, 200]
% a = [425, 375]
