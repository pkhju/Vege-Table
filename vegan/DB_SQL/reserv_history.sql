-- drop table reserv_history;

create table reserv_history (    
reserv_no  varchar2(50),  -- �����ȣ
reserv_condition char(1),  -- �������
reserv_change date default sysdate -- ���º�������
);    
-- reserv_change ��: ������(A) ����Ȯ��(B) �湮�Ϸ�(C) ���(D) ���(E)

commit;
select * from reserv_history;