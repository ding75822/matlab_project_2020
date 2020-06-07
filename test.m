clc
clear
%读取的txt文件名
filename = 'test1000.txt';
%filename = 'tree.txt';

%创建网格：节点、边、面
mesh = HE_Mesh;     

%读取txt文件
mesh.LoadFromTxt(filename);

%简单的点云图
cloud_point(mesh)