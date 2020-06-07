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
       
       function bool = eq(obj1,obj2)
         if (obj1.x==obj2.x && obj1.y==obj2.y && obj1.z==obj2.z&&obj1.num==obj2.num)
             bool=1;
         else
             bool=0;
         end
       end
       
       
   end
end

