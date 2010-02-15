m = 7;	%6;5;10;
f = @exp;
coefs = chebcoeffs(f,m);
x = linspace(-1,1,512)';
fx = f(x);
gx = cheveval(coefs,x);

plot(fx-gx);
max = max(abs(fx-gx);
max


