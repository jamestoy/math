function y = chebeval(coeffs, x)
% Given a vector coeffs of coefficients of Chebyshev polynomials,
% with the coefficient of T_0 appearing first,
% evaluate this linear combination of Chebyshev polynomials at the values in x.
n = length(coeffs);
m = length(x);
T = ones(m,n);
%T(:,1) = ones(m,1)
T(:,2) = x;
for k = 3:n
  T(:,k) = 2*x.*T(:,k-1) - T(:,k-2); %T_(n+1) = 2xT_n - T_(n-1).
end
y = T*coeffs;
