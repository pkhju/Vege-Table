-- drop table com_heart;

create table com_heart (				
u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
c_articleNo	 number	 not null,		-- �۹�ȣ
com_heart_date	 date		default sysdate,	-- ��ũ������
show char(1) default 'Y' -- �Խÿ���
-- constraint u_email_heart foreign key (u_email) references user_on(u_email),				
-- constraint h_articleNo foreign key (c_articleNo) references community(c_articleNo)				
);

select * from com_heart;