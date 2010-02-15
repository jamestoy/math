function x = localextreme(f,a,b)
  
  X = [a; (a+b)/2; b];
  Y = [f(a); f((a+b)/2); f(b)];
  P = [X,Y];
  
  while abs(b-a) > sqrt(eps)*abs(b)
    'entered while'
    x = quadstep(P);
    P(1:2,:) = P(2:3,:);
    P(3,:) = [x,f(x)];
    a = b;
    b = x;
  end %while
  'if no value we never entered while'
end %localextreme
