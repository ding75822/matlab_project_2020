classdef HE_Mesh <handle
   properties
      m_verts = [HE_Vertex.empty];
      m_edges = [HE_Edge.empty];
      m_faces = [HE_Face.empty];
   end
   properties
      dict = struct(); %�ֵ�
   end
   methods
       %1.1 ��ʼ������
       function mesh = HE_Mesh()
       end
       
       %1.2 ���ֵ��м���Ԫ��
       function dict_add(mesh,num_v1,num_v2,edge) 
          marker = strcat('e',int2str(num_v1),'_',int2str(num_v2));
          mesh.dict=setfield(mesh.dict,marker,edge);
       end
       
        %1.3 ���ֵ��в���Ԫ��
       function edge = dict_find(mesh,num_v1,num_v2)
            marker = strcat('e',int2str(num_v1),'_',int2str(num_v2));
            bool = isfield(mesh.dict,marker);
            if bool
                edge = getfield(mesh.dict,marker);
                mesh.dict = rmfield(mesh.dict,marker);
            else 
                edge = 0;
            end
       end
       
       %2.1 ����ڵ㣬����1������ ����2��3��4���ڵ�����
       function InsertVertex(mesh,x,y,z)
           tmp = HE_Vertex(x,y,z);
           mesh.m_verts = [mesh.m_verts;tmp];
       end
       
       %2.2 ����ߣ�����1������ ����2��3:�ڵ�(�ڼ����ڵ�) ����4���ֵ�
       function edge = InsertEdge(mesh,num_v1,num_v2) 
           %marker = strcat(int2str(num_v1),int2str(num_v2));
           %�ж��������Ƿ�����������
           edge_ = dict_find(mesh,num_v1,num_v2);
           
           if edge_~=0 %��dict�ڣ���һ����ȱ����Ҫ��ȫ�ñ���Ϣ
               edge = edge_;
               return
           else        %����dict��
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
               dict_add(mesh,num_v2,num_v1,p_edge)         
           %��mesh����ӱ�
               mesh.m_edges = [mesh.m_edges;edge];
           end
    
       end
       %2.3 ������
       function InsertFace(mesh,num_v1,num_v2,num_v3)
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
       
       %3.1 ��ȡtxt�ļ��ĺ���
       function LoadFromTxt(mesh,filename)
            datatable = importdata(filename);
            %����
            header = char(datatable.rowheaders);
            data = datatable.data;

            [data_rows,~] = size(data);
            count = 0;
            %timelen = 0;    
            while (count~=data_rows)
                count = count + 1;
                %tic
                if (header(count)=='v')
                    mesh.InsertVertex(data(count,1),data(count,2),data(count,3));
                end
                if (header(count)=='f')
                    tic
                    mesh.InsertFace(data(count,1),data(count,2),data(count,3));
                    %timelen=toc
                end               
            end
       end
       
       %4.1 ������ĺ���
       
   end
end
