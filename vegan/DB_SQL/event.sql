-- drop table event;

create table event(
e_no	 number	primary key,		-- �۹�ȣ
e_title	 varchar2(100)	 not null,		-- ����
e_date	 date		 default sysdate,	-- �ۼ�����
e_content	 varchar2(500)	,		-- ����
e_image	 varchar2(500) ,		-- �̹������ϸ�
e_start	 varchar2(500)	 not null,		-- ���۱Ⱓ
e_end	 varchar2(500)	 not null,	-- ����Ⱓ
e_show CHAR(1) default 'Y'
);

insert into event values(1, '�����̺�Ʈ', default, '�Ͻ� : ~ ���� : ~', null, '2023-11-24T11:30', '2023-11-27T11:10', default);
commit;
select * from event;