clc
clear
%读取txt文件
filename = 'tree.txt';
mesh = HE_Mesh;     %创建网格：节点、边、面
mesh.LoadFromTxt(filename);

