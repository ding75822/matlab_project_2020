count1=0;
model_vert = mesh.m_verts;
[n,~] = size(model_vert);
for i=1:n
    count1=count1+1;
    verts(count1,1)=model_vert(i,1).x;
    verts(count1,2)=model_vert(i,1).y;
    verts(count1,3)=model_vert(i,1).z;
end

