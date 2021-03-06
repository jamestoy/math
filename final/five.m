points = [
    -2.8 0
    1.4 4.5
    3.1 -6.0
    3.6 2.3];

x = points(:,1);
y = points(:,2);

v_mat = vander(x);
interp = v_mat\y;


% %%OUTPUT
% x =
% 
%   -2.800000000000000
%    1.400000000000000
%    3.100000000000000
%    3.600000000000000
% 
% 
% y =
% 
%                    0
%    4.500000000000000
%   -6.000000000000000
%    2.300000000000000
% 
% 
% interp =
% 
%    1.809593540806152
%   -4.304766504059248
%  -15.595654554194546
%   29.805734047856408