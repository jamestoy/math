function yprime = f(t,y)
%F(t,y)
%
%	yprime = f(t,y) is a function where a system of 
%	ODEs describe a projectile's motion (in two dimentions)
%	
%	we use the function F = -kv^2u where v = ||v|| 
%	(the speed of the projectile) and u = v/||v|| is a
%	unit vector pointing in the direction of the 
%	projectiles motion

% givens
k = 0.01;
m = 1;
g = [0,-9.8];

% robbed from parameters
v = y(3:4);	  % velocity
norm_v = norm(v); % ||v||
u = v/norm_v;	  % u = v/||v||

% drag function
F = (-k*(norm_v^2)*u - m*g) / m;

% acceleration
a = F ./ m;

yprime = [y(3:4) a]
