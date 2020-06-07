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