-- drop table reserv_history;

create table reserv_history (    
reserv_no  varchar2(50),  -- �����ȣ
reserv_condition char(1),  -- �������
reserv_change date default sysdate -- ���º�������
);    
-- reserv_change ��: ������(A) ����Ȯ��(B) �湮�Ϸ�(C) ���(D) ���(E)

insert into reserv_history values(100001,'A',to_date('2022/10/11 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100002,'A',to_date('2022/10/24 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100003,'A',to_date('2022/11/03 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100001,'B',to_date('2022/10/13 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100002,'B',to_date('2022/10/25 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100003,'B',to_date('2022/11/05 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100001,'C',to_date('2022/10/15 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100002,'D',to_date('2022/10/27 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100003,'C',to_date('2022/11/09 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100004,'A',to_date('2022/10/19 00:00:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100007,'A',to_date('2022/11/30 19:15:44', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100010,'A',to_date('2022/12/02 17:25:46', 'YYYY/MM/DD HH24:MI:SS'));
insert into reserv_history values(100011,'A',to_date('2022/12/02 17:26:14', 'YYYY/MM/DD HH24:MI:SS'));

commit;
select * from reserv_history;