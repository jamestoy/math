function res = newtoncolor(a,n)
    for k = 1:10
        root = newton(a,n);
    end
    res = 10 * (pi + angle(root));
end
