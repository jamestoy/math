function y = resynth(freqs, coeffs, len)
%RESYNTH  resynthesizes a compressed signal created by COMPRESSAUDIO
%	y = resynth(freqs, coeffs, len) takes a list of freqencies, coefficients,
%	and a length as produced by COMPRESSAUDIO.  It then synthesizes the corresponding
%	signal which is returned in 'y'.

% setup: init and fill Y with the coefficients and order based on freqs vector
Y = zeros(0,len);
Y(freqs(1:length(freqs))) = coeffs(1:length(coeffs));

% ifft, coversion to real, ensure span[-1,1],  and account for compressaudio's dropped negative freqs
y = ifft(Y); % inverse fast fourier transform
y = real(y); % convert everything to reals
y = y * 2;   % account for dropped negative values in compressaudio

signal_max = max(abs(y));

% rescale if necessary
if signal_max > 1
        y = y ./ signal_max;
end % if

end % resynth
