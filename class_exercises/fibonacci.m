function res = fibonacci(n)
    res = ones(n,1);
    for k = 3:n
        res(k)=res(k-2) + res(k-1)
    end
end
