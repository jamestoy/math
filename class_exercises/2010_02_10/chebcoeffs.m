function coeffs = chebcoeffs(f,n)
% Find the coefficients of T_0,...,T_n when approximating f.
N = n+1;
x = chebnodes(N);
T = ones(N,N);
%T(:,1) = ones(N,1) %T_0 is 0
T(:,2) = x;  % T_1 is x
for k=3:N             
  T(:,k) = 2*x.*T(:,k-1) - T(:,k-2); %T_(n+1) = 2xT_n - T_(n-1)
end                         

y = f(x);
coeffs = T\y;
%We could solve T*coeffs = y more efficiently by taking advantage
%of the fact that the columns of T are orthogonal to each other.
%However, if one is concerned about performance, there are much
%faster algorithms for computing Chebyshev coefficients based on the FFT.
