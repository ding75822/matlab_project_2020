function face_chain = CrossFace(initial_face,z)
%输入一个初始的face， 返回与高度z相交的所有faces
    face = initial_face;
    face_chain=initial_face;
    face_prv = HE_Face.empty; 
    %e1 = face.f_edge;
    %e2 = face.f_edge.e_succ;
    %e3 = face.f_edge.e_succ.e_succ;
    res1=face.f_edge.e_pair.e_face.IsFaceCross(z);
    res2=face.f_edge.e_succ.e_pair.e_face.IsFaceCross(z);
    res3=face.f_edge.e_succ.e_succ.e_pair.e_face.IsFaceCross(z);
    if res1
        face_prv = face;
        face = face.f_edge.e_pair.e_face;
        face_chain(end+1)=face;
    elseif res2
        face_prv = face;
        face = face.f_edge.e_succ.e_pair.e_face;
        face_chain(end+1)=face;
    elseif res3
        face_prv = face;
        face = face.f_edge.e_succ.e_succ.e_pair.e_face;
        face_chain(end+1)=face;
    else
        disp('error in CrossFace')
        return
    end
count = 0; 
    while ~(face==initial_face)
        e1 = face.f_edge;
        e2 = face.f_edge.e_succ;
        e3 = face.f_edge.e_succ.e_succ;
        res1=e1.e_pair.e_face.IsFaceCross(z);
        res2=e2.e_pair.e_face.IsFaceCross(z);
        res3=e3.e_pair.e_face.IsFaceCross(z);
        if res1&&~(face.f_edge.e_pair.e_face==face_prv)
            face_prv = face;
            face = face.f_edge.e_pair.e_face;
            face_chain(end+1)=face;
        elseif res2&&~(face.f_edge.e_succ.e_pair.e_face==face_prv)
            face_prv = face;
            face = face.f_edge.e_succ.e_pair.e_face;
            face_chain(end+1)=face;
        elseif res3&&~(face.f_edge.e_succ.e_succ.e_pair.e_face==face_prv)
            face_prv = face;
            face = face.f_edge.e_succ.e_succ.e_pair.e_face;
            face_chain(end+1)=face;
        else
            disp('error in CrossFace')
            return
        end
        count = count+1;
        if count>1000
            disp('error? or i am not sure')
            break
        end
    end
face_chain=face_chain(1:end-1);
end