clc
clear
%��ȡtxt�ļ�
filename = 'test1000.txt';
%filename = 'tree.txt';
mesh = HE_Mesh;     %�������񣺽ڵ㡢�ߡ���
mesh.LoadFromTxt(filename);

face=mesh.m_faces(500);%��mesh���������ȡһ����Ƭ
res=face.IsFaceCross(0.13)%�ж������Ƭ�Ƿ����ƽ��z=0.13�ཻ

face1=FirstFace(mesh,0.13);%��mesh�����ҵ���һ����z=0.13�ཻ����Ƭ
faces=CrossFace(face1,0.13)


%ֻ���ر����еõ��ĵ�һ��������������Ƭ���Զ��������䲻����
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