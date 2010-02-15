function res = drawnewton(n,N,topleft,bottomright)
%% 1) complexretangle gives intialization matrix Z of starting z values
	complex_rect = complexrectangle(N,topleft,bottomright);
%% 2) newtoncolor will then described based on angle what the pixel is to be
%%    colored
	pixel_colors = newtoncolor(complex_rect,n);
%% 3) use the image function to draw the image
	res = image(pixel_colors);
end
