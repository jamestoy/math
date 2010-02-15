function x = newton(a,n)
    %%try
        x = a - (a.^n-1)./(n*a.^(n-1));
    %%catch FAIL
    %%    error(FAIL.message);
    %%end
end
