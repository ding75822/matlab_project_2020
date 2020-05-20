clc
clear
%��ȡtxt�ļ�
filename = 'test_cubic.txt';
datatable = importdata(filename);
%����
header = char(datatable.rowheaders);
data = datatable.data;

[data_rows,~] = size(data);

count = 0;
%��ʼ��
mesh = HE_Mesh;     %�������񣺽ڵ㡢�ߡ���

while (count~=data_rows)
    
    count = count + 1;
    
    
    if (header(count)=='v')
        mesh.InsertVertex(data(count,1),data(count,2),data(count,3));
    end
    
    
    tic
    if (header(count)=='f')
        mesh.InsertFace(data(count,1),data(count,2),data(count,3));
    end
    toc
end


