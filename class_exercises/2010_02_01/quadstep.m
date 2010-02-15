function nextx = quadstep(P)
	x = P(:,1);
	y = P(:,2);
	%A = [y.^2,y,ones(3,1)]
	A = vander(x);	%%swapped y with x
	d = A\y;	%%swapped x with y
	%%nexty = d(3,1);
	b = d(2);
	a = d(1);
	nextx = ((-b)/(2*a))
end	
