clc
close
clear
%��ȡ��txt�ļ���
filename = 'test_cubic.txt';
%filename = 'tree.txt';

%�������񣺽ڵ㡢�ߡ���
mesh = HE_Mesh;     

%��ȡtxt�ļ�
mesh.LoadFromTxt(filename);

%����theta��:
%cal_theta(mesh)��search�������Ǳ��룬���ڵ���ʱ���ٶ�������ɾȥ
theta=cal_theta(mesh);%����
theta = theta/pi*180;%�Ƕ�


%��ͼ
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
 

