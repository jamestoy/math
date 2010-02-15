% Numerical Mathematics and Computing, Fifth Edition
% Ward Cheney & David Kincaid
% Brooks/Cole Publ. Co.
% (c) 2004
%
% file: fractal_fact.m

% basin of attraction 
% using Newton's method to track initial values to
% convergence of the roots for z^3 -1

x = -1:0.01:1; y = -1:0.01:1;
[xx, yy] = meshgrid(x,y);
n = 100;
z2 = -1./2. + i*sqrt(3.)/2.;
z3 = -1./2. - i*sqrt(3.)/2.;
for a = 1:length(y),
  for b = 1:length(x),
    z = xx(a,b) + i*yy(a,b);
    for loop = 1:25,
      z = z - (z.^3 - 1)./(3*z.^2);
      if abs(z - 1) < 1e-4,
      n(a,b) = loop; break,
    end,
  end,
 end,
end,
pgraph(xx,yy,n);
scale(size(xx));

for a = 1:length(y),
  for b = 1:length(x),
    z = xx(a,b) + i*yy(a,b);
    for loop = 26:50,
     z = z - (z.^3 - 1.)./(3*z.^2);
     if abs(z - z3) < 1e-4,
       n(a,b) = loop; break,
     end,
    end,  
  end,
end,
pgraph(xx,yy,n);
scale(size(xx));

for a = 1:length(y),
  for b = 1:length(x),
    z = xx(a,b) + i*yy(a,b);
    for loop = 51:74,
     z = z - (z.^3 - 1.)./(3*z.^2);
     if abs(z - z3) < 1e-4,
       n(a,b) = loop; break,
     end,
    end,  
  end,
end,
pgraph(xx,yy,n);
scale(size(xx));
     



