-- drop table reserv;

create table reserv (
    resto_name	varchar2(50)	 not null,		-- �Ĵ��̸�
    resto_addr	varchar2(150)	 not null,		-- �Ĵ��ּ�
    c_email	varchar2(50)	not null,		-- Ŭ���̾�Ʈ �̸���
    u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
    reserv_no	 number,		-- �����ȣ
    resto_no	 number	 not null,		-- �Ĵ��Ϲ�ȣ
    reserv_date	 date		 default sysdate,	-- ���೯¥
    reserv_sched	 varchar2(50)	 not null,		-- ��������
    reserv_member	 number	 not null,		-- �����ο�
    reserv_deposit	 number	 not null,		-- ��������Ʈ
    reserv_condition	 char(1) default 'A'		-- ������(a) ����Ȯ��(b) �湮�Ϸ�(c) ���(d) ���(e)
);

update reserv set reserv_condition='E' where resto_name='������';

commit;
select * from reserv;