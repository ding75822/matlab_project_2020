classdef HE_Mesh <handle
   properties
      m_verts = [HE_Vertex.empty];
      m_edges = [HE_Edge.empty];
      m_faces = [HE_Face.empty];
   end
   properties
      dict = struct(); %字典
   end
   methods
       %1.1 初始化函数
       function mesh = HE_Mesh()
       end
       
       %1.2 向字典中加入元素
       function dict_add(mesh,num_v1,num_v2,edge) 
          marker = strcat('e',int2str(num_v1),'_',int2str(num_v2));
          mesh.dict=setfield(mesh.dict,marker,edge);
       end
       
        %1.3 在字典中查找元素
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
       
       %2.1 插入节点，参数1：网络 参数2、3、4：节点坐标
       function InsertVertex(mesh,x,y,z)
           tmp = HE_Vertex(x,y,z);
           mesh.m_verts = [mesh.m_verts;tmp];
       end
       
       %2.2 插入边，参数1：网络 参数2、3:节点(第几个节点) 参数4：字典
       function edge = InsertEdge(mesh,num_v1,num_v2) 
           %marker = strcat(int2str(num_v1),int2str(num_v2));
           %判断网络里是否已有这条边
           edge_ = dict_find(mesh,num_v1,num_v2);
           
           if edge_~=0 %在dict内，则一定残缺，则要补全该边信息
               edge = edge_;
               return
           else        %不在dict内
               v1 = mesh.m_verts(num_v1);
               v2 = mesh.m_verts(num_v2);
           %创建半边极其对偶边
               edge = HE_Edge;
               p_edge = HE_Edge;
           %建立点、边关系
               edge.e_vert = v1;
               v1.v_edge = edge;
               p_edge.e_vert = v2;
               v2.v_edge = p_edge;
           %建立对偶关系
               edge.e_pair = p_edge;
               p_edge.e_pair = edge;
           %在字典中记录                
               dict_add(mesh,num_v2,num_v1,p_edge)         
           %在mesh中添加边
               mesh.m_edges = [mesh.m_edges;edge];
           end
    
       end
       %2.3 插入面
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
       
       %3.1 读取txt文件的函数
       function LoadFromTxt(mesh,filename)
            datatable = importdata(filename);
            %数据
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
       
       %4.1 待定义的函数
       
   end
end
