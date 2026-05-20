clc;
clear;
close all;

fprintf('===== PART 1: 3-Axis Planar Robotic Arm =====\n\n');

a1 = 1;
a2 = 1.5;
a3 = 1;

t1 = pi/3;
t2 = pi/12;
t3 = pi/18;

x1 = a1*cos(t1);
y1 = a1*sin(t1);

x2 = x1 + a2*cos(t1+t2);
y2 = y1 + a2*sin(t1+t2);

x3 = x2 + a3*cos(t1+t2+t3);
y3 = y2 + a3*sin(t1+t2+t3);

fprintf('Joint 1 A = (%.4f , %.4f)\n',x1,y1);
fprintf('Joint 2 B = (%.4f , %.4f)\n',x2,y2);
fprintf('End Effector P = (%.4f , %.4f)\n\n',x3,y3);

figure;

hold on;
grid on;
axis equal;

plot([-5 5],[0 0],'r','LineWidth',1.5);
plot([0 0],[-5 5],'g','LineWidth',1.5);

plot([0 x1],[0 y1],'b-o','LineWidth',3,...
    'MarkerFaceColor','k','MarkerSize',7);

plot([x1 x2],[y1 y2],'c-o','LineWidth',3,...
    'MarkerFaceColor','k','MarkerSize',7);

plot([x2 x3],[y2 y3],'m-o','LineWidth',3,...
    'MarkerFaceColor','k','MarkerSize',7);

scatter(0,0,70,'filled','k');

text(0,0,'  O (0,0)','FontWeight','bold');

text(x1,y1,...
sprintf('  A (%.2f, %.2f)',x1,y1),...
'Color','b','FontWeight','bold');

text(x2,y2,...
sprintf('  B (%.2f, %.2f)',x2,y2),...
'Color','c','FontWeight','bold');

text(x3,y3,...
sprintf('  P (%.2f, %.2f)',x3,y3),...
'Color','m','FontWeight','bold');

title('3-Axis Robotic Arm Forward Kinematics');

xlabel('X-axis');
ylabel('Y-axis');

xlim([-6 6]);
ylim([-5 5]);

hold off;

fprintf('\n===== PART 2: 4-Axis SCARA Robot (DH Method) =====\n\n');

q = [pi/4 -pi/4 120 pi/2];
d = [877 0 120 200];
a = [425 325 0 0];
alpha = [pi 0 0 0];
theta = [pi/4 -pi/3 0 pi/2];

disp('q = ');
disp(q);

disp('d = ');
disp(d);

disp('a = ');
disp(a);

disp('alpha = ');
disp(alpha);

disp('theta = ');
disp(theta);

DH = @(th,dv,av,al)[...
    cos(th) -sin(th)*cos(al)  sin(th)*sin(al) av*cos(th);
    sin(th)  cos(th)*cos(al) -cos(th)*sin(al) av*sin(th);
    0        sin(al)          cos(al)         dv;
    0        0                0               1];

T1 = DH(theta(1),d(1),a(1),alpha(1));
T2 = DH(theta(2),d(2),a(2),alpha(2));
T3 = DH(theta(3),d(3),a(3),alpha(3));
T4 = DH(theta(4),d(4),a(4),alpha(4));

disp('T1 = ');
disp(T1);

disp('T2 = ');
disp(T2);

disp('T3 = ');
disp(T3);

disp('T4 = ');
disp(T4);

T = T1*T2*T3*T4;

disp('T = ');
disp(T);

Px = T(1,4);
Py = T(2,4);
Pz = T(3,4);

disp('Px = ');
disp(Px);

disp('Py = ');
disp(Py);

disp('Pz = ');
disp(Pz);