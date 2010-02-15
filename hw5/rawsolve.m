function rxinfo = rawsolve(start,R)
%RAWSOLVE  Solves f(v) = 0 using Newton's method.
%    rxinfo = rawsolve(start,R) computes the root of f for f(v) = 0 where
%    start is the initial value of v.
	[m,n] = size(R);
	x = start;
	y = x + ones(m,n);

	while(norm(y-x) > 10^(-12))
		y = x;
		x = x - jacobian(x,R)\f(x,R);
	end
	rxinfo = x;
end
