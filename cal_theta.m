function theta=cal_theta(mesh1,normal_vector)
%输入mesh 和 基面的法向量 返回弧度制的角度
    if nargin==1
        normal_vector = [0;0;1];
    end
        [T,Xb]=search(mesh1);
        TR = triangulation(T,Xb);
        F = faceNormal(TR); 
        theta = acos((F*normal_vector)./norm(normal_vector,2));%弧度制
end