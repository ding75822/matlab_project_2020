clc
clear
%读取txt文件
filename = 'test1000.txt';
%filename = 'tree.txt';
mesh = HE_Mesh;     %创建网格：节点、边、面
mesh.LoadFromTxt(filename);

face=mesh.m_faces(500);%从mesh里面任意读取一个面片
res=face.IsFaceCross(0.13)%判断这个面片是否和切平面z=0.13相交

face1=FirstFace(mesh,0.13);%从mesh里面找到第一个与z=0.13相交的面片
faces=CrossFace(face1,0.13)


%只返回遍历中得到的第一个符合条件的面片，对多个封闭区间不适用
function face1=FirstFace(mesh,z)
i=1;
while(i<=length(mesh.m_faces))
    face=mesh.m_faces(i);
    bool=face.IsFaceCross(z);
    if bool==1
        face1=face;
        break
    else
        i=i+1;
    end
end

if i==length(mesh.m_faces)+1
    disp('No Face Cross');
    face1=0;
end

end    