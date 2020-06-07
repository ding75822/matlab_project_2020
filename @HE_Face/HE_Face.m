classdef HE_Face<handle
   properties
      f_verts = [HE_Vertex.empty];
      f_edge;
   end
   methods
       function bool = eq(obj1,obj2)
         if (obj1.f_verts(1,1)==obj2.f_verts(1,1)&&obj1.f_verts(2,1)==obj2.f_verts(2,1)&&obj1.f_verts(3,1)==obj2.f_verts(3,1))
             bool=1;
         else
             bool=0;
         end
       end
       
       function res=IsFaceCross(face,z)
           vert1=face.f_verts(1,1);
           vert2=face.f_verts(2,1);
           vert3=face.f_verts(3,1);
           
           heights=[vert1.z,vert2.z,vert3.z];
           zmax=max(heights);
           zmin=min(heights);
           
           if(zmax>=z && zmin<=z)
               res=1;
           else
               res=0;
           end
       end
   end
end