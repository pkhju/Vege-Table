-- drop table resto;

create table resto (				
    vegan	char(1)		default 'n',	-- ���/����
    c_email	varchar2(50),		-- ����� �̸����ּ�
    resto_name	varchar2(50)	 not null,		-- �Ĵ��̸�
    resto_addr	varchar2(150)	 not null,		-- �Ĵ��ּ�
    resto_tel	varchar2(20)	 not null,		-- ��ȭ��ȣ
    resto_time	char(8)	 not null,		-- �����ð�
    resto_break	char(8)	 not null,		-- �극��ũŸ��
    resto_detail	varchar2(1000)	 not null,		-- ������
    imageFileName	varchar2(100),		-- �̹�������(�̹������ϸ� ��ȯ �ʿ�)
    avg_rate	number(2,1) default 0,		-- ����   
    resto_no	number primary key,		-- �Ĵ��Ϲ�ȣ
    deposit	number	 not null,		-- ��������Ʈ
    resto_info varchar2(200),
    regDate date default sysdate			
);

insert into resto values('Y', 'client01@mail.com', 'restoname01', 'resto - address01', '0245687549', '09002200', '15001700', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname01_imgFileName01', 0, 1, 20000, '��', default);
insert into resto values('Y', 'client02@mail.com', 'restoname02', 'resto - address02', '07012345678', '11002300', '15001600', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname02_imgFileName02', 0, 554466, 15000, '��');
insert into resto values('Y', 'client03@mail.com', 'restoname03', 'resto - address03', '07065653131', '12002200', '15001800', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname03_imgFileName03', 0, 111223, 25000, '��');
update resto set deposit=4000 where resto_name='������';

commit;
select * from resto;