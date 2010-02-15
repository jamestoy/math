% Draw a bridge, given its vertices, members, and list of compressions on
% members.
function drawbridge3d(V, M, c)
  cla; %clear
  hold on; %keep all objects
  if (size(V,2) < 3) %expand V to have a third column.
    V(1,3) = 0;
  end
  [X,Y,Z] = cylinder(0.1, 8); %Cylinder of radius 0.1
  [rows, cols] = size(X); % number of rows and columns
  X1 = zeros(rows, cols); %prepare mesh for our cylinders
  Y1 = X1;
  Z1 = X1;
  for m=1:size(M,1) %loop over the members
    i1 = M(m,1); %index of first vertex
    i2 = M(m,2); %index of second vertex
    t = V(i1,:)'; %the translation
    ax = V(i2,:)-V(i1,:); %the axis of the cylinder
    [Q,R] = qr(ax'); 
    Q = Q*diag([R(1) 1 1]); %Q sends x-axis to ax.
    for i=1:rows
      for j=1:cols
          vert = [Z(i,j); X(i,j); Y(i,j)];
          vert = Q*vert; %Rotate and scale
          vert = vert + t;
          vert = vert';
          X1(i,j) = vert(1);
          Y1(i,j) = vert(2);
          Z1(i,j) = vert(3);
	      %[X1(i,j), Y1(i,j), Z1(i,j)] = vert; %Why won't this work?
      end
    end
    surf(X1,Y1,Z1, c(m)*ones(rows,cols));
  end
  hold off
end
