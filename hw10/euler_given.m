%%  This assumes that k, C, and the function f have been defined. 
%%
%% written by Chris Hardin

N = 10000; 
h = linspace(2/(k*C), 3/(k*C),N); 
y = zeros(N,1); 
y(1) = 0.36; % initial value 
for n = 1:N-1
	y(n+1) = y(n) + h(n)*f(0, y(n)); % It's okay to pass t=0 since it's ignored.
end
plot(h,y,'.');
