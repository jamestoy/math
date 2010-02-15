%% We model a bridge in N dimensions.  We fix N=2 here.
%% Each member gives an unknown x (which represents the tension on that
%% member).
%% Each vertex gives us N equations (one for each dimension), with one
%% exception: vertices with one member are assumed to be held stationary,
%% and contribute no equations.  These "stationary" vertices must be last!
%% The vertices are described by a v x N matrix V, where v is the number of
%% vertices; each row gives the coordinates of a vertex.
%% The members are described by an m x 2 matrix M, where m is the number of
%% members.  If the ith row is [a b], then member i joins vertices a and b.
%% The external forces are described by a v x N matrix.  The ith row gives
%% the external force on vertex i.

%% The mechanics of the bridge are described by an (N*v') x m matrix F, where
%% v' is the number of non-stationary vertices.  Given a vector c describing
%% the compression on each member, Fc gives the resulting forces on each
%% non-stationary vertex.  Of course, for each vertex, there are N components
%% of force.  All the x forces are listed first, then the y forces, then
%% the z forces (if applicable).

%% makebridge(k) returns a truss with k segments.
%% V is the set of vertices, M the members, and L an example of a load
%% that could be put on the bridge.

%% Here's the pattern of vertices, for k=2:
%%    2---4
%%   / \ / \
%%  1---3---5
%%  |       |
%%  6       7
%%  The members all have length 2.
%%  Here's the pattern of members (lettered from a):
%%    2-g-4
%%   a b c d
%%  1-e-3-f-5
%%  h       i
%%  6       7
function [V, M, l] = makebridge(k)
  N = 2; %The dimension we work in.
  V = zeros(2*k+1 + 2, N); %The last two vertices are for supports.
  V(1:(2*k+1),1) = (0:2*k)'; %x coordinates
  V(2:2:2*k,2) = sqrt(3); %y coordinates of even vertices
  V(2*k+2,:) = [0, -2]; %left support vertex
  V(2*k+3,:) = [2*k, -2]; %right support vertex
  M = zeros(4*k-1+2, N);
  %The first 2*k members go from vertex n to n+1.
  M(1:2*k,1) = (1:2*k)';
  M(1:2*k,2) = M(1:2*k,1)+1;
  %The next 2*k-1 members go from vertex n to n+2.
  M(2*k + (1:(2*k-1)), 1) = (1:(2*k-1))';
  M(2*k + (1:(2*k-1)), 2) =   M(2*k + (1:(2*k-1)), 1) + 2;
  % Then we have the two support members.
  M(4*k,:) = [1, 2*k+2];
  M(4*k+1,:) = [2*k+1, 2*k+3];
  l = zeros(N*(2*k+1), 1);
  % We put a downward force on vertex k+1.
  l((2*k+1) + k+1) = -1;
end
