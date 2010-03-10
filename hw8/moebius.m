function v = moebius(P)
%MOEBIUS(P)	Moebius tranformation, returns vector v 
%
%	v = moebius(P) is given 3 points (x,y) as the rows of P, 
%	returns(as vector v) the coefficients a,b,c,d such that 
%	each of the points in P is on the graph of y = f(x).

%function in the form of Av = 0; A is 3x4.
x = P(:,1); y = P(:,2);
A = [x, ones(3,1), -x.*y, -y] 

%Return an orthonormal basis of the null space of A
v = null(A)
end
