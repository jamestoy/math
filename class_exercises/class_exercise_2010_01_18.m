%%
%% class exercise on 2010-01-18
%% error analysis in solving linear equations -- a comparison of inverse vs LU decomp and G.E.P.P.

n = 20;
H = hilb(n);
o = ones(n,1);
b = H*o;

printf(":::: Preparing to solve with LU decomposition ::::\n");
x = H\b;

printf("the result of x-o is:\n");
x-o

printf("||o - x|| is :\n");
norm(o-x)

printf("||b-Ao|| is:\n");
norm(b-H*o)

printf("||b -Ax||\n");
norm(b-H*x)

printf("cond(H) = \n");
cond(H)


printf("\n");

%%
%% now with inverse
%%

printf(":::: Preparing to solve with the INVERSE ::::\n");
x = inv(H)*b

printf("the result of x-o is:\n");
x-o

printf("||o - x|| is :\n");
norm(o-x)

printf("||b-Ao|| is:\n");
norm(b-H*o)

printf("||b -Ax||\n");
norm(b-H*x)

printf("cond(H) = \n");
cond(H)

%%
%% now with a smaller n
%%
printf(":::: now n = 5 :::: \n");
n = 5;
H = hilb(n);
o = ones(n,1);
b = H*o;

printf(":::: Preparing to solve with LU decomposition ::::\n");
x = H\b;

printf("the result of x-o is:\n");
x-o

printf("||o - x|| is :\n");
norm(o-x)

printf("||b-Ao|| is:\n");
norm(b-H*o)

printf("||b -Ax||\n");
norm(b-H*x)

printf("cond(H) = \n");
cond(H)

printf(":::: now n = 10 ::::\n");
n = 10;
H = hilb(n);
o = ones(n,1);
b = H*o;

printf(":::: Preparing to solve with LU decomposition ::::\n");
x = H\b;

printf("the result of x-o is:\n");
x-o

printf("||o - x|| is :\n");
norm(o-x)

printf("||b-Ao|| is:\n");
norm(b-H*o)

printf("||b -Ax||\n");
norm(b-H*x)

printf("cond(H) = \n");
cond(H)

%%
%% use randn matrix instead of the hilbert
%%

printf(":::: now using randn matrix instead of hilbert ::::\n");
n = 20;
H = randn(n);
o = ones(n,1);
b = H*o;

printf(":::: Preparing to solve with LU decomposition ::::\n");
x = H\b;

printf("the result of x-o is:\n");
x-o

printf("||o - x|| is :\n");
norm(o-x)

printf("||b-Ao|| is:\n");
norm(b-H*o)

printf("||b -Ax||\n");
norm(b-H*x)

printf("cond(H) = \n");
cond(H)


%%
%% random 10x10 matrix A compute :
%%

printf(":::: random 10 x 10 matrix A computations\n");
A = randn(10)

printf("norm(A) =\n");
norm(A)

printf("norm(inv(A)) =\n");
norm(inv(A))

printf("svd(A) = \n");
svd(A)

printf("cond(A) = \n");
cond(A)
