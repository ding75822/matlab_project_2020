function theta=cal_theta(mesh1,normal_vector)
%����mesh �� ����ķ����� ���ػ����ƵĽǶ�
    if nargin==1
        normal_vector = [0;0;1];
    end
        [T,Xb]=search(mesh1);
        TR = triangulation(T,Xb);
        F = faceNormal(TR); 
        theta = acos((F*normal_vector)./norm(normal_vector,2));%������
end