f = @(x) exp(-x/5).*sin(x); %damped harmonic motion
fprime = @(x) exp(-x/5).*(cos(x) - sin(x)/5);
h = 0.1;
x = (0:h:40)';
y = f(x);
plot(x, y);

%% Relatively poor technique: take slope of line through points on
% either side.

y1 = circshift(y,-1); % The kth entry in this vector is y_{k+1}
ym1 = circshift(y,1); % The kth entry in this vector is y_{k-1}

ym2 = circshift(y,2); % will be needed later.
y2 = circshift(y,-2);

poordydx = (y1 - ym1)/(2*h);
plot(x, [fprime(x), poordydx]); %Doesn't look so bad...
fprime(x) - poordydx

%% Better technique: fit a quartic polynomial to 5 consecutive points.

k = (-2:2)';
V = vander(k);
qm2 = V\[1;0;0;0;0];
qm1 = V\[0;1;0;0;0];
q0 = V\[0;0;1;0;0];
q1 = V\[0;0;0;1;0];
q2 = V\[0;0;0;0;1];
[qm2 qm1 q0 q1 q2]
format rat
[qm2 qm1 q0 q1 q2]

%% Alternative way to do the above:
% Putting the solutions to the above side-by-side, we would have
% [qm2 qm1 q0 q1 q2] = V\eye(5) = inv(V).
% Of course, we are just interested in the second-to last row, which
% is extracted by multiplying on the left by [0 0 0 1 0], giving
% [0 0 0 1 0]*inv(V) = [0 0 0 1 0]/V
coeffs = [0 0 0 1 0]/V

%%
ym1 = circshift(y,1);
y1 = circshift(y,-1);
gooddydx = (-1/12*y2 + 2/3*y1 - 2/3*ym1 + 1/12*ym2)/h;
plot(x, [gooddydx, fprime(x)]);
gooddydx - fprime(x)
