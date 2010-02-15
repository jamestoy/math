%% homework 3

%% setup
%k = 2
%k = 10
%k = 20
k = 50
    
N = 2*k+2
G = numgrid('L',N)
A = delsq(G)

[m, n] = size(A)

b = zeros(n, 1)

% setup boundaries
%b(1:1) = 1
%b(k:k) = 1
%b(k:1) = 1 %backwards?? this is failing hards
b(1:k) = 1
% from just before falling off row m to the last row in m
% this sets up the boundaries 
b((m-2*k+1):m) = 1

x = A\b %solve

% setup H for visualizing our answer
H = zeros(size(G))
H(find(G)) = x

%% visualize <-- surfc is a hybrid of surf and contour
surfc(H)

%% memory component
whos

%% condition number
cond_num = condest(A)

%% relative error componsent
% we know to use eps because this is the 
% smallest size we can represent without losing precision
relative_error = cond_num * eps

%% extra -- but its broken... 
b = ones(n, 1)
x = A\b
H(find(G)) = x
surfc(H)
