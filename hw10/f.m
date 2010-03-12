function yprime = f(t,y)
%F	bacteria growth as a function of time
%
%	function yprime = f(t,y) solves a bacteria growth function where
%	the constants were solved via a least-squares fit of a set of staph_data
%	these values are defined inline in the function

	%derived from least squares solution
	a = 1.0350;
	b = -2.8291;

	yprime = -b*y*((-a/b)-y);
end % f
