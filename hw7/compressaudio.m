[freqs, coeffs, len] = compressaudio(x,n)
%COMPRESSAUDIO returns prominent frequencies in a signal
%
%   [freqs,coeffs,len] = compressaudio(x,n) returns, in freqs a list 
%   of the n most prominent frequencies in signal x.  The vector coeffs
%   should store the coefficients that correspond to these frequencies.

sample_rate = 44100;

X = fft(x);
amps = abs(X(1:length(X/2)));
[s,ind] = sort(amps, 'descend');

freqs = s(0:length(s)-1) * sample_rate;

for i=0:n
    ret_array = [freqs(i), coeffs(i), len(x)];
end
end