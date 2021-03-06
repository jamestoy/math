staph_data = [
   3.2000e-02   3.8573e-05
   3.9000e-02   2.2833e-02
   6.9000e-02   6.9316e-02
   1.1000e-01   9.7518e-02
   1.7000e-01   1.1906e-01
   2.2900e-01   8.2924e-02
   2.6100e-01   5.8571e-02
   2.8800e-01   4.7235e-02
   3.0900e-01   3.8754e-02
   3.2700e-01   3.7899e-02
   3.4700e-01   4.2004e-02
];

[m,n] = size(staph_data);

y = staph_data(:,1);
yprime = staph_data(:,2);

A = [y, y.^2];
v = A\yprime; %v = [a;b];
v_trans = v'; %v = [a,b]

a = v_trans(1)
b = v_trans(2)
