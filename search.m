function [T,Xb]=search(mesh)
%寻找点坐标与连接表
count1=0;
model_vert = mesh.m_verts;
[n,~] = size(model_vert);
for i=1:n
    count1=count1+1;
    verts(count1,1)=model_vert(i,1).x;
    verts(count1,2)=model_vert(i,1).y;
    verts(count1,3)=model_vert(i,1).z;
end
Xb=verts;

count2=0;
model_face = mesh.m_faces;
[m,~] = size(model_face);
for i=1:m
    count2=count2+1;
    faces(count2,1)=model_face(i,1).f_verts(1,1).num;
    faces(count2,2)=model_face(i,1).f_verts(2,1).num;
    faces(count2,3)=model_face(i,1).f_verts(3,1).num;
end
T=faces;
end