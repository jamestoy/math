function [t,y] = euler(f, interval, initval, h)
% EULER Solve an ODE using Euler's method.
% EULER(f, interval, initval, h) approximates a solution to the initial
% value problem yprime = f(t,y).
% The argument f should expect two arguments, t and y.  For a
% d-dimensional system, the second argument y will be a column vector
% with d entries.  interval should be a vector with two entries a,b
% describing the interval [a,b] to integrate over.  initval should
% be the initial value of y.  h is the stepsize.
% The return value t is a row vector of the t-values used.
% The return value y is a matrix in which the kth column is the solution
% at t(k); i.e., the first column will be initval, the second column
% will be the result of the first step, etc.

a = interval(1);
b = interval(2);
t = a:h:b; % Values of t
n = length(t);
d = length(initval); % The dimension of the system.
y = zeros(d,n);
y(:,1) = initval; %Plug in the initial value to get started.
for k = 1:n-1
    s1 = f(t(k),y(k));
    s2 = f(t(k)+(h/2),y(n)+(h/2)*s1);
    s3 = f(t(k)+(h/2),y(n)+(h/2)*s1);
    s4 = f(t(k)+(h/2),y(n)+(h/2)*s1);
  y(:,k+1) = y(:,k) + h*f(t(k), y(:,k));
end
