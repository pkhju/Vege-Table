-- drop table resto;

create table resto (	
	resto_no	number primary key,		-- �Ĵ��Ϲ�ȣ
    vegan	char(1)		default 'N',	-- ���/����
    c_email	varchar2(50),		-- ����� �̸����ּ�
    resto_name	varchar2(50)	 not null,		-- �Ĵ��̸�
    resto_addr	varchar2(150)	 not null,		-- �Ĵ��ּ�
    resto_tel	varchar2(20)	 not null,		-- ��ȭ��ȣ
    resto_time	char(8)	 not null,		-- �����ð�
    resto_break	char(8)	 not null,		-- �극��ũŸ��
    resto_detail	varchar2(1000)	 not null,		-- ������
    imageFileName	varchar2(100),		-- �̹�������(�̹������ϸ� ��ȯ �ʿ�)
    avg_rate	number(2,1) default 0,		-- ����   
    deposit	number	 not null,		-- ��������Ʈ
    resto_info varchar2(200),
    regDate date default sysdate			
);

create sequence resto_seq
start with 100000
increment by 1;

insert into resto values(resto_seq.nextval, 'Y', 'client01@mail.com', 'restoname01', 'resto - address01', '0245687549', '09002200', '15001700', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname01_imgFileName01', default, 20000, '�Ĵ� �Ұ� ��� 01', default);
insert into resto values(resto_seq.nextval, 'Y', 'client02@mail.com', 'restoname02', 'resto - address02', '07012345678', '11002300', '15001600', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname02_imgFileName02', default, 15000, '�Ĵ� �Ұ� ��� 02', default);
insert into resto values(resto_seq.nextval, 'Y', 'client03@mail.com', 'restoname03', 'resto - address03', '07065653131', '12002200', '15001800', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname03_imgFileName03', default, 25000, '�Ĵ� �Ұ� ��� 03', default);

-- update resto set deposit=4000 where resto_name='������';

commit;
select * from resto;