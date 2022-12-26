-- user ȸ������ ���̺�
-- drop table user_on;

create table user_on (				
u_name	varchar2(50),			-- �����̸�(��ȣȭ)
u_tel	char(11),			-- ��ȭ��ȣ (��ȣȭ)
u_email	varchar2(50)	 primary key, 		-- �̸���
u_pwd	varchar2(50)	 not null,		-- ��й�ȣ
u_nick	varchar2(10)	 not null,		-- �г���
u_point	number		 default 0,	-- ����Ʈ
u_lvl	char(1)	,		-- ��Ǵܰ� (A~G)
u_addr	varchar2(50),			-- �ּ� (��ȣȭ)
u_joinDate	date	default sysdate	not null,	-- ������(������)
u_auth	char(1)	default 'A'	not null,	-- �������� (�����ʿ�A,Ȱ��ȭB,��Ȱ��ȭC)
offDate	date	null		-- ���� ��Ȱ��ȭ ����
);
select * from user_on;
insert into user_on values('user01', '01012345678', 'user01@mail.com', '1111', 'usernick01', 10000, 'A', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user04', '01012345678', 'user04@mail.com', '4444', 'usernick04', 10000, 'B', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user05', '01012345222', 'user05@mail.com', '5555', 'usernick05', 10000, 'B', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user02', '01012345678', 'user02@mail.com', '2222', 'usernick02', 0, 'C', 'address02', to_date('2022/11/16 13:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'C', to_date('2022/11/18 13:10:44', 'YYYY/MM/DD HH24:MI:SS')); 
insert into user_on values('user03', '01012345678', 'user03@mail.com', '3333', 'usernick03', 0, 'E', 'address03', to_date('2022/12/15 14:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'A', default); 

update user_on set u_point=200000 where u_name='user05';
commit;
select * from user_on;

-- client ȸ������ ���̺�
-- drop table client_on;

create table client_on (				
c_name	varchar2(50)	,		-- �����̸�(��ȣȭ)
c_tel	char(11)	,		-- �޴���ȭ(��ȣȭ)
c_email	varchar2(50)	primary key,		-- �̸���
c_pwd	varchar2(50)	not null,		-- ��й�ȣ
regiNum	char(10)	not null,		-- ����ڵ�Ϲ�ȣ
certify	char(10)	not null,		-- �����㰡��ȣ
c_point	number		 default 0,	-- ����Ʈ
c_joinDate	date	default sysdate	not null,	-- ������
c_auth	char(1)	default 'A'	not null,	-- ��������(�����ʿ�A,Ȱ��ȭB,��Ȱ��ȭC)
c_offDate	date	default sysdate	not null	-- ��Ȱ��ȭ��
);	

insert into client_on values('client01', '01022223333', 'client01@mail.com', '1111', '5555555555', '6666666666', 220000, to_date('2022/11/29 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default); 
insert into client_on values('client02', '01022223333', 'client02@mail.com', '2222', '1111111111', '222222222', 0, to_date('2022/12/05 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'C', to_date('2022/12/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'));
insert into client_on values('client03', '01022223333', 'client03@mail.com', '3333', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'A', default);
insert into client_on values('client04', '01022223333', 'client04@mail.com', '4444', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into client_on values('client05', '01022223333', 'client05@mail.com', '5555', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);

commit;

select * from client_on;