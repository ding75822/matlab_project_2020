dict = matfile('myFile.mat','Writable',true);
edge = HE_Edge;

p_edge = HE_Edge;
p2_edge = HE_Edge;
p3_edge = HE_Edge;
edge.e_pair=p_edge;

keySet =   {'Jan', 'Feb', 'Mar', 'Apr'};
valueSet = [327.2, 368.2, 197.6, 178.4];
mapObj = containers.Map(keySet,valueSet);
a='Jan'
mapObj(a)

deal   �����봦������   fieldnames   ��ȡ�ṹ���ֶ���
getfield   ��ȡ�ṹ��ָ���ֶε�ֵ   rmfield   ɾ���ṹ���ֶ�(�����ֶ�����)
setfield   ���ýṹ������ָ�����ֶε�ֵ   struct   �����ṹ����
struct2cell   �ṹ����ת����Ԫ������   isfield   �ж��Ƿ���ڸ��ֶ�
isstruct   �ж�ĳ�����Ƿ��ǽṹ����   