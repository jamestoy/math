function res = f(v,R)
%%F  calculates f(v) based on fixed R
%    res = f(v,R) computes f(v) based on a fixed R and 
%    
%    RETURNS a vector with four entries
	[m,n] = size(R);
	V = ones(m,1) * v';
	res = (V - R).^2 * [1/2; 1/2; 1/2; -1/2];

end
