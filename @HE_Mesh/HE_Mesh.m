classdef HE_Mesh <handle
   properties
      m_verts = [HE_Vertex.empty];
      m_edges = [HE_Edge.empty];
      m_faces = [HE_Face.empty];
   end
   properties
      dict = table(); %�ֵ�
   end
   methods
       %1.1 ��ʼ������
       function mesh = HE_Mesh()
       end
       
       %1.2 ���ֵ��м���Ԫ��
       function dict_add(mesh,num_v1,num_v2,edge)   
           %tic
           %marker = strcat(int2str(num_v1),int2str(num_v2));
           marker = sprintf('%d%d',num_v1,num_v2);
           tmp = table({marker},{edge});
           
           mesh.dict = [mesh.dict;tmp];
          %time = toc
          
       end
       
        %1.3 ���ֵ��в���Ԫ��
       function edge = dict_find(mesh,marker)
           TF = ismissing(mesh.dict,marker);
            if sum(TF)==0
                edge = 0;
                return
            else
                [row,~] = find(TF);
                edge = mesh.dict.Var2{row};
            end
       end
       
       %2.1 ����ڵ㣬����1������ ����2��3��4���ڵ�����
       function InsertVertex(mesh,x,y,z)
           tmp = HE_Vertex(x,y,z);
           mesh.m_verts = [mesh.m_verts;tmp];
       end
       
       %2.2 ����ߣ�����1������ ����2��3:�ڵ�(�ڼ����ڵ�) ����4���ֵ�
       function edge = InsertEdge(mesh,num_v1,num_v2) 
           
           marker = strcat(int2str(num_v1),int2str(num_v2));
           %�ж��������Ƿ�����������
           edge_ = dict_find(mesh,marker);
           
           if edge_~=0
               edge = edge_;
               return
           else
               v1 = mesh.m_verts(num_v1);
               v2 = mesh.m_verts(num_v2);
           %������߼����ż��
               edge = HE_Edge;
               p_edge = HE_Edge;
           %�����㡢�߹�ϵ
               edge.e_vert = v1;
               v1.v_edge = edge;
               p_edge.e_vert = v2;
               v2.v_edge = p_edge;
           %������ż��ϵ
               edge.e_pair = p_edge;
               p_edge.e_pair = edge;
           %���ֵ��м�¼
           %��ʱ0.0045
               dict_add(mesh,num_v1,num_v2,edge)   
               dict_add(mesh,num_v2,num_v1,p_edge) 
           
           %��mesh����ӱ�
               mesh.m_edges = [mesh.m_edges;edge];
           end
    
       end
       %2.3 ������
       function InsertFace(mesh,num_v1,num_v2,num_v3)
           %����inseretedge��ʱ0.015s
            fvert = [mesh.m_verts(num_v1);mesh.m_verts(num_v2);mesh.m_verts(num_v3)];
            e1 = InsertEdge(mesh,num_v1,num_v2);
            e2 = InsertEdge(mesh,num_v2,num_v3);
            e3 = InsertEdge(mesh,num_v3,num_v1);
            
            face = HE_Face;
            e1.e_succ = e2;
            e2.e_succ = e3;
            e3.e_succ = e1;
            e1.e_face = face; e2.e_face = face; e3.e_face = face;
            mesh.m_verts(num_v1).v_face = face;
            mesh.m_verts(num_v2).v_face = face;
            mesh.m_verts(num_v3).v_face = face;
            face.f_edge = e1;
            face.f_verts = fvert;
            mesh.m_faces = [mesh.m_faces;face];
       end
   end
end
