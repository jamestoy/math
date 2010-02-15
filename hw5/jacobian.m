function J = jacobian(v,R)
%%JACOBIAN  Caclulates Jacobian matrix of f @ v
%    J = jacobian(v,R) computers the jacobian matrix at v based on a fixed R
%
%    NOTE: this is essentially the same as V - R where we negate the final column
	[m,n] = size(R);
	V = ones(m,1) * v';
	J = V - R;
	J(:,n) = -J(:,n); %negate the last column
end
