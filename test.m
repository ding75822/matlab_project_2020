clc
clear
%��ȡ��txt�ļ���
filename = 'test1000.txt';
%filename = 'tree.txt';

%�������񣺽ڵ㡢�ߡ���
mesh = HE_Mesh;     

%��ȡtxt�ļ�
mesh.LoadFromTxt(filename);

%�򵥵ĵ���ͼ
cloud_point(mesh)