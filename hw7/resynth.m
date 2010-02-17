function y = resynth(freqs, coeffs, len)
%RESYNTH  resynthesizes a compressed signal created by COMPRESSAUDIO
%	y = resynth(freqs, coeffs, len) takes a list of freqencies, coefficients,
%	and a length as produced by COMPRESSAUDIO.  It then synthesizes the corresponding
%	signal which is returned in 'y'.

% setup: init and fill Y with the coefficients and order based on freqs vector
Y = zeros(len); % init and allocate mem for 
Y(freqs(1:length(freqs))) = coeffs(1:length(coeffs));

% ifft, coversion to real, ensure span[-1,1],  and account for compressaudio's dropped negative freqs
y = ifft(Y); % inverse fast fourier transform
y = real(y); % convert everything to reals

% rescale if necessary
if max(abs(y)) > 1
        y = y ./ max(abs(y)); %ALTERNATE :: -1 + (1 - (-1)) * (value - min)/(max-min)
end % if

y = [y y];   % account for negative freqs deleted in compress

end % resynth
