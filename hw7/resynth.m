function y = resynth(freqs, coeffs, len)
%RESYNTH  resynthesizes a compressed signal created by COMPRESSAUDIO
%	y = resynth(freqs, coeffs, len) takes a list of freqencies, coefficients,
%	and a length as produced by COMPRESSAUDIO.  It then synthesizes the corresponding
%	signal which is returned in 'y'.

% setup
Y = coeffs(freqs(1:len)); % fill Y with the coefficients and order based on freqs vector
Y = real(Y); % convert everything to reals
Y = Y * 2; % account for negative freqs deleted in compress

% rescale if necessary
if max(abs(Y)) > 1
	Y = Y ./ length(Y);
end % if

% inverse fast fourier transform
y = ifft(Y);

end % resynth
