alpha = 1;
beta = 1;
gamma = 1;
delta = 1;

r = 1.5;
s = 0.5;

roe = [0,.5,1.5];

rprime = alpha*r - beta*r*s;

for k = 1 : 3
    sprime(k) = gamma*r*s-delta*s+roe(k);
end