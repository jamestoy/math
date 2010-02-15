%% Extracts the matrix that describes the forces on the bridge.
%% For now, the fact that the last two vertices are stationary is
%% hard-coded.

function F = bridgeforces(V,M)
  N = 2; % Two dimensions.
  ns = size(V,1)-2; % The number of non-stationary vertices.
  m = size(M,1); % The number of members.
  %% Note: The following might work better as a sparse matrix.
  F = zeros(ns*N, m);

  %% Now loop over the members, and add the contribution from each member.
  %% Each member exerts a force on two vertices.
  for k=1:m
    i1 = M(k,1); %index of first vertex
    i2 = M(k,2); %index of second vertex
    u = V(i2,:) - V(i1,:); %Vector from first vertex to second.
    u = u/norm(u); %Make it a unit vector.

    % In each dimension, calculate the forces on the two vertices.
    for d=1:N
      if (i1 <= ns) %This test makes sure we skip stationary vertices.
	F(ns*(d-1) + i1, k) = -u(d); %Force on first vertex
      end

      if (i2 <= ns) 
	F(ns*(d-1) + i2, k) = u(d); %Force on second vertex
      end
    end
  end
end
