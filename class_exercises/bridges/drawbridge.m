% Draw a bridge, given its vertices and members.
function drawbridge(V, M)
% We create the adjacency matrix
  k = size(V,1); % = number of rows of V = number of vertices
  A = sparse(k,k);
  for m=1:size(M,1)
    A(M(m,1),M(m,2)) = 1;
  end
  gplot(A, V);
end
