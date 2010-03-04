function yprime = lotkavolterra(t,y)

yprime = [0.3*y(1) - 0.1*y(1)*y(2); 0.1*y(1)*y(2) - 0.4*y(2)];
