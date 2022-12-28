-- drop table inquery;

create table inquery(
    iq_no number primary key not null,
    u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
    iq_title	 varchar2(50)	 not null,		-- ����
    iq_writeDate	 date		 default sysdate,	-- �ۼ�����
    iq_content	 varchar2(500)	 not null,		-- ����
    iq_image	 varchar2(500), -- �̹���
    search_type VARCHAR2(50) default '', -- �˻�����
    keyword VARCHAR2(50) default '', --�˻���
    constraint inquery_email foreign key (u_email) references user_on(u_email)
);

insert into inquery values(1, 'user01@mail.com', '����', sysdate, 'zzz', 'null', default, default);
commit;

select * from inquery;