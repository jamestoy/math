function [P, sphere] = makesphere()
% MAKESPHERE Generate points on a random sphere.
% MAKESPHERE() chooses a random sphere and generates 10-20 points 
% on that sphere, which are returned as rows of the matrix P.
% The sphere's center (a,b,c) and radius r are returned in
% the vector sphere = [a;b;c;r], for aid in testing.
n = round(10+rand*10);  %n will be 10 to 20.
bias = randn(1,3); %This will prevent the points from being evenly distributed
center = randn(3,1);
radius = abs(2+randn);
sphere = [center; radius];
points = ones(n,1)*bias + randn(n,3); %at first just a cloud of points
noiselevel = 0.05*radius;
noise = randn(n,3)*noiselevel;
% Normalize the points to the given radius, then recenter.
for k = 1:n
  points(k,:) = center' + radius*points(k,:)/norm(points(k,:));
end
% Add noise
P = points + 0.2*noise;
