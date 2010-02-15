function C = complexrectangle(N, topleft, bottomright)
    %% returns a matrix with topleft and bottomright with respect
    %% to the plane (is this the right word?)
    %% C = X + iY
    X = ones(N,1) * linspace(real(topleft),real(bottomright),N);
    Y = linspace(imag(topleft),imag(bottomright),N)' * ones(1,N);
    C = X + (i*Y);
end
