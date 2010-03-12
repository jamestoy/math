function yprime = f(t,y)
%F	use ODE to solve bacteria growth as a function of time
%
%	function yprime = f(t,y) solves a bacteria growth function where
%	the constants were solved via a least-squares fit of a set of staph_data
%	these values are defined inline in the function

	%derived from least squares solution
	a = 1.0350
	b = -2.8291

	f = @(y) -b*y*((-a/b)-y);
	[x,y] = ode45(f,t,y);
end % f
