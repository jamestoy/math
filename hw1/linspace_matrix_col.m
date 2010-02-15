%% column implementation as opposed to default
%% row implementation found in linspace_matrix
function out = linspace_matrix_col(N)
    linspace(2,-2,N)' * ones(1,N)
end
