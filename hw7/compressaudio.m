function [freqs, coeffs, len] = compressaudio(x,n)
%COMPRESSAUDIO returns prominent frequencies in a signal
%
%   [freqs,coeffs,len] = compressaudio(x,n) returns, in freqs a list 
%   of the n most prominent frequencies in signal x.  The vector coeffs
%   should store the coefficients that correspond to these frequencies.

%length of the signal vector
len = length(x);

% givens
X = fft(x);
amps = abs(X(1:len/2));
[s,ind] = sort(amps, 'descend');

freqs = ind(1:n);
coeffs = X(freqs(1:n));

% cut out some fat (we are making these shorts / uint16)
coeffs = single(coeffs);
freqs = uint16(freqs);

end % function
