clc
close
clear
%读取的txt文件名
filename = 'test_cubic.txt';
%filename = 'tree.txt';

%创建网格：节点、边、面
mesh = HE_Mesh;     

%读取txt文件
mesh.LoadFromTxt(filename);

%计算theta角:
%cal_theta(mesh)中search函数并非必须，后期调试时若速度慢则考虑删去
theta=cal_theta(mesh);%弧度
theta = theta/pi*180;%角度


%画图
[T,Xb]=search(mesh);
TR = triangulation(T,Xb);
P = incenter(TR);
F = faceNormal(TR); 
trisurf(T,Xb(:,1),Xb(:,2),Xb(:,3), ...
     'FaceColor','cyan','faceAlpha',0.8);
axis equal
hold on  
quiver3(P(:,1),P(:,2),P(:,3), ...
     F(:,1),F(:,2),F(:,3),0.5,'color','r');
 
face=mesh.m_faces(3);
res=face.IsFaceCross(0.13)
 

