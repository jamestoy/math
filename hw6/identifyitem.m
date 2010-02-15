function params = identifyitem(P)
%IDENTIFYITEM  Determines if an object is a sphere from a given set a points P
%	[a,b,c,r,err] = identifyitem(P) takes a list of points (one per row of P) and returns 
%	a vector(a,b,c,r,err) where (a,b,c) is the center of the ball, r is its radius
%	and and err is a measure of how un-ball-like the object is

% givens
[m,n] = size(P);

% setup
A = [2*P, ones(m,1)]; % 2xa + 2yb + 2zc + 1
b = P.^2 * ones(3,1); % x^2 + y^2 + z^2

% solve
v = A\b; % v = [a,b,c,k]
r = sqrt(v(1)^2 + v(2)^2 + v(3)^2 + v(4)) % r = sqrt(a^2 + b^2 + c^2 + k)

% residual
% error = || b - Av || 
residual = norm(b - A*v)

% this is a bad test, but sort of works
err = residual / r

if (err > 0.5)
	'NON_SPHERE'
else
	'SPHERE'
end
% return vector
params = [v(1), v(2), v(3), r, err];
