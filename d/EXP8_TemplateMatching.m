i = [2 1 0 0 3; 0 0 5 0 0; 0 4 0 6 0; 1 0 5 0 0];
t = [0 4 0; 3 0 5; 0 4 0];
P = zeros(2, 3);
m = 5;
n = 4;
m0 = 3;
n0 = 3;

for k = 1:n0
    for j = 1:m0
        for x = 1:n-n0+1
            for y = 1:m-m0+1
                P(x,y) = P(x,y) + abs(i(k+x-1, j+y-1) - t(k,j));
            end
        end
    end
end

disp("P")
disp(P)

Y = min(P, [], 1);
Z = min(Y);

disp("Minimum Performance Index is:")
disp(Z)

[r, c] = size(P);
for a = 1:r
    for b = 1:c
        if P(a,b) == Z
            disp("Location:")
            disp(a-1)
            disp(",")
            disp(b-1)
        end
    end
end