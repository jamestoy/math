function nextx = iqipoly(P)
  if P(1,2) == P(2,2) || P(2,2) == P(3,2) || P(1,2) == P(3,2)
    error('y1,y2,y3 are not distinct');
  end
  x = polyinterp(P(:,2),P(:,1),0);
  nextx = x;
end
