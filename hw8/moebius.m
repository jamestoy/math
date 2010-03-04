function v = moebius(P)
%MOEBIUS(P)	Moebius tranformation, returns vector V
%
%	v = moebius(P) is given 3 points (x,y) as the rows of P, 
%	returns(as vector v) the coefficients a,b,c,d such that 
%	each of the points in P is on the graph of y = f(x).

%function in the form of Av = 0; A is 3x4.
A = [P(:1), ones(3,1), P(:2), ones(3,1) * -1]

end
