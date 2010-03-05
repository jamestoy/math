function approx = hermitequad(f,a,b,n,d0,dn)
%HERMITEQUAD(f,a,b,n,d0,dn)
%
%	approx = hermitequad(f,a,b,n,d0,dn) numerically approximates
%	the integral from a to b of f(x)dx and returns the result
%	f is the function to integrade a and b are the lower and upper
%	bounds -- n is the number of subintervals and d0 and dn are f'(a) and f'(b)
%	which we use as d0 and dn

	h = (b-a) / n; %setup the sub-intervals
	x = linspace(a,b,n+1)'; %'; TRANSPOSE NOT WORKING ... n+1 to account for silly matlab off by one thing
	y = f(x); %solve for y based on parameter f
	approx = ([1/2, ones(1, n-1), 1/2] * y + h/12 * (d0-dn)) * h; %from homework problem number 3

end % hermitequad
