function loc = findposition(R)
%%FINDPOSITION  Determines the position of a GPS receiver.
%    loc = findposition(R) computes the position of a GPS receiver given
%    the data in R.  This function utilizes rawsolve for the root and latlongdist
%    to convert the solution into lat/long/dist from the Earth's center.
	[m,n] = size(R);
	start = zeros(m,1);
	root = rawsolve(start,R);
	loc = latlongdist(root);
end
