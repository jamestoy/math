function coords = latlongdist(pos)
% LATLONGDIST Translate (x,y,z) into a latitude (degrees),
% longitude (degrees), and distance (km) from Earth's center.
% We think of the origin as the Earth's center,
% the z-axis as pointing out the North pole, and the x-axis as pointing
% out of the point at 0 degrees latitude and 0 degrees longitude.
x = pos(1); y = pos(2); z = pos(3);
longitude = angle(x + i*y) * 180/pi; %degrees east of Prime Meridian
latitude = angle(sqrt(x^2 + y^2) + i*z)*180/pi;
rho = norm(pos(1:3))*299792.458; % convert light-seconds to km.
coords = [latitude; longitude; rho];