classdef HE_Edge <handle
   properties
      e_pair = HE_Edge.empty;  %��ż��
      e_succ = HE_Edge.empty;  %��̱�
      e_vert = HE_Vertex.empty; %�׶���
      e_face = HE_Face.empty;   %�Ҳ���
   end
   methods
       function edge = HE_Edge()
       end
   end
end