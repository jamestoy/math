function nextx = inversequadstep(P)
  if P(1,2) == P(2,2) || P(2,2) == P(3,2) || P(1,2) == P(3,2)
    error('y1,y2,y3 are not distinct');
  end
  fna = P(1,1);
  fnb = P(2,1);
  fnc = P(3,1);
  a = P(1,2);
  b = P(2,2);
  c = P(3,2);
  %% x = (a*y)^2 + b*y + c);
  x = polyinterp([fna,fnb,fnc],[a,b,c],0);
  a = b;
  b = c;
  c = x;
  nextx = x;
end
