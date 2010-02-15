function P = makenonsphere()
% MAKENONSPHERE Generate a non-spherical object.
% MAKENONSPHERE() returns, as the rows of P, a list of 10-20 points on
% a non-spherical object.
n = round(10+rand*10);  %n will be 10 to 20.
bias = randn(1,3);
size = abs(2+randn);
points = ones(n,1)*bias + size*(rand(n,3)-0.5);
noiselevel = rand*0.1*size;
noise = randn(n,3)*noiselevel;
P = points + noise;
