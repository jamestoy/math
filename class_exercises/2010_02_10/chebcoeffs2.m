function coeffs = chebcoeffs2(f,n)
% Find the coefficients of T_0,...,T_n when approximating f.
% This algorithm takes O(n*log(n)) time, which for large n is much faster than
% the O(n^2) runtime of chebcoeffs.  
% For example, chebcoeffs(@exp, 5000) takes 18 seconds, while
% chebcoeffs2(@exp, 5000) takes 0.01 seconds.
% This function also uses much less memory, because we never form an
% n-by-n matrix.
% This algorithm works by treating the function f(x) as the periodic function
% f(cos(theta)), and then using a Fourier transform to find coefficients of
% trig functions that approximate f(cos(theta)); these coincide with coefficients
% of Chebyshev polynomials for f(x).
N = n+1;
x = chebnodes(N);
y = f(x);
p = [y; flipud(y)]; %We have turned f into a periodic function
P = ifft(p); % Use an (inverse) FFT
% We only need the first half of these.
P = P(1:N);
%The phase will be slightly off because the Chebshev nodes start at a
%nonzero angle, but we can fix this:
P = P .* exp(i*(0:N-1)'*pi/(2*N));
P = real(P); %The imaginary parts are 0, within roundoff error.
% since we threw away half our entries, the nonzero frequency components
% need to be doubled.
P(2:end) = 2*P(2:end);
coeffs = P;
