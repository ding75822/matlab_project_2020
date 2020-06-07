theta = gallery('uniformdata',[100,1],0)*2*pi;
phi = gallery('uniformdata',[100,1],1)*pi;
x = cos(theta).*sin(phi);
y = sin(theta).*sin(phi);
z = cos(phi);
DT = delaunayTriangulation(x,y,z);
[T,Xb] = freeBoundary(DT);
TR = triangulation(T,Xb);
P = incenter(TR);
F = faceNormal(TR); 
trisurf(T,Xb(:,1),Xb(:,2),Xb(:,3), ...
     'FaceColor','cyan','faceAlpha',0.8);
axis equal
hold on  
quiver3(P(:,1),P(:,2),P(:,3), ...
     F(:,1),F(:,2),F(:,3),0.5,'color','r');