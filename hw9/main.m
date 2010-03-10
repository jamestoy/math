%% james francis toy iv
%% homework 9 main script file

% equation from number 5
f = @(x) exp(-x.^2);

%givens
a = 0;
b = 1;
n = 5;		 
n1 = n*2;	 % double n as the hw says
d0 = 0;		 % this is the derivative of f(x) @ 0
dn = -2*exp(-1); % this is the derivative of f(x) @ 1

%two approximations
k = hermitequad(f,a,b,n,d0,dn);
k1 = hermitequad(f,a,b,n1,d0,dn);
diff = k1-k;
err = norm(diff);

%while the residual is greater than 10e-6
while (err > 10e-6)
	k = hermitequad(f,a,b,n,d0,dn);
	k1 = hermitequad(f,a,b,n1,d0,dn);

	n1 = n1 * 2;
	err = norm(k1-k);
end % while

err
