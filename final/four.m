cricket_data = [
82 56.5
112 64.8
136 69.2
182 78.5 ];

T = cricket_data(:,2)
C = cricket_data(:,1)

A = [ones(4,1),C]

v = A\T
