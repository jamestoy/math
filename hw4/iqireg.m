function nextx = iqireg(P)
	x = P(:,1);
	y = P(:,2);
	%A = [y.^2,y,ones(3,1)]
	A = vander(y);
	d = A\x;
	nextx = d(3,1);
end	
