-- drop table com_scrap;

create table com_scrap (				
u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
c_articleNo	 number	 not null,		-- �۹�ȣ
com_scrap_date	 date		default sysdate,	-- ��ũ������
show char(1) default 'Y' -- �Խÿ���
-- constraint u_email_scrap foreign key (u_email) references user_on(u_email),				
-- constraint articleNo foreign key (c_articleNo) references community(c_articleNo)				
);

select * from com_scrap;
