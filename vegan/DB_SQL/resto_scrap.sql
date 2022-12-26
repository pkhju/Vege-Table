-- drop table resto_scrap;

create table resto_scrap (				
    u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
    resto_no	 number	 not null,		-- �Ĵ��Ϲ�ȣ
    resto_scrap_date	 date		default sysdate,	-- ��ũ������
    show char(1),
    constraint u_email_restoscrap foreign key (u_email) references user_on(u_email),				
    constraint resto_no_scrap foreign key (resto_no) references resto(resto_no)				
);

insert into resto_scrap values('user01@mail.com',123456, sysdate, default);
insert into resto_scrap values('user02@mail.com',554466, sysdate, default);
insert into resto_scrap values('user03@mail.com',111223, sysdate, default);


commit;
select * from resto_scrap;