%% Create a bridge and analyze its modes of vibration.

[V,M,dummy] = makebridge(10); % Create bridge
[members,dummy] = size(M); % Get number of members
[n, dummy] = size(V); % Get number of vertices

% We describe the spring-like physics of the bridge with an equation
% u'' = Au.
% The entries of u are x1,y1, x2,y2,... (as displacements from nominal
% position).
% We form the matrix A by summing the contributions from each member.
A = zeros(2*n);
for m = 1:members
 v1 = M(m,1); %index of v1, first vertex of member
 v2 = M(m,2); %index of v2, second vertex of member
 d = V(v2,:) - V(v1,:); %vector from v1 to v2
 d = d'; % Make it a column.
 l = norm(d);
 d = d/l; %d is now a unit vector
 x1 = 2*v1-1; %index of x1 in u
 y1 = 2*v1; %index of y1 in u
 x2 = 2*v2-1; %index of x1 in u
 y2 = 2*v2; %index of y1 in u

 % The following does not account for spring constants or length of springs.
 
 P = d*d';
 indices = [x1 y1 x2 y2];
 A(indices,indices) = A(indices,indices) + [-P, P; P, -P];

%%The long way to do the previous three lines:

%  dx = d(1); dy = d(2);

%  A(x2,x1) += dx*dx; 
%  A(y2,x1) += dx*dy; 
%  A(x1,x1) -= dx*dx;
%  A(y1,x1) -= dx*dy;

%  A(x2,y1) += dy*dx;
%  A(y2,y1) += dy*dy;
%  A(x1,y1) -= dy*dx;
%  A(y1,y1) -= dy*dy;

%  A(x1,x2) += dx*dx;
%  A(y1,x2) += dx*dy;
%  A(x2,x2) -= dx*dx;
%  A(y2,x2) -= dx*dy;

%  A(x1,y2) += dy*dx;
%  A(y1,y2) += dy*dy;
%  A(x2,y2) -= dy*dx;
%  A(y2,y2) -= dy*dy;
end

% The eigenvectors give vibrational modes of the bridge.
% The corresponding eigenvalue lambda is always <= 0.
% For lambda < 0, the corresponding frequency omega satisfies
% omega^2 = -lambda; in other words, the frequencies are the square
% roots of the negated eigenvalues.
% Eigenvalues of 0 come from a lack of rigidity.  With our sorts of bridges,
% we get 5 of these.  *Essentially*, these correspond to the following
% degrees of freedom:
%  Motion in x-direction at constant speed
%  Motion in y-direction at constant speed
%  Rotation at constant rate
%  Support 1 "flopping"
%  Support 2 "flopping"
% If we removed some members, we would get more degrees of freedom.

[S,L] = eig(A);

k = 2; % Let's try the second eigenvector.  Try other values.
a = S(:,k); %The kth eigenvector
b = reshape(a, 2, n)'; % The kth eigenvector, rearranged into an n by 2
                       % matrix in which row i is the displacement
                       % of vertex i.
scale = 1; % The amplitude of the vibration.
timescale = 10; % How much to scale the frequencies.
freq = sqrt(-L(k,k));
for t = 0:0.1:6*pi
 W = V + scale*b*cos(freq*timescale*t);
 drawbridge(W,M);
 pause(0.1);
end
