classdef HE_Vertex <handle
   properties
      x, y, z,num;
   end
   
   properties
      v_edge = HE_Edge.empty;
      v_face = HE_Face.empty;
   end
   
   methods
       
       function vertex = HE_Vertex(x, y, z,num)
           if nargin == 4
               vertex.x = x;
               vertex.y = y;
               vertex.z = z;
               vertex.num = num;
           end
       end
       
       
   end
end

