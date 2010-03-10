function v = plotmoebius(P)
%PLOTMOEBIUS	uses MOEBIUS to plot the function f(x) together with original points P
%
%	v = plotmoebius(P) is a function that is used to plot a non trivial solution to Av = 0 
%	via the MATLAB null() command.  It plots the points in addition to the non-trivial solution
%

%get our points from P
px = P(:,1);
py = P(:,2);

%setup
v = moebius(P);
%x = linspace(-5,5,512);
x = linspace(0,5,512);

%derives the solution to the original equation y = (ax+b)/(cx+d);
y = (v(1)*x + v(2))./(v(3)*x + v(4));

% das plotting
plot(x,y); hold on; plot(px,py,'o');
end
