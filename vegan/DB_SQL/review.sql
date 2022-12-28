-- drop table review;

create table review (				
    resto_no	 number	 not null,		-- �Ĵ��Ϲ�ȣ
    u_nick varchar2(10),		-- ���� �г���
    review_content	varchar2(500)	 not null,		-- ���� ������
    review_date	 date default sysdate,	-- ��������
    imageFileName	 varchar2(100)		,	-- �̹������ϸ�
    rate	 number	 not null,		-- ����
    show	 char(1)		default 'y',	-- �Խÿ���
    del char(1) default 'n',
    review_no number,
    constraint resto_no_review foreign key (resto_no) references resto(resto_no)				
);

delete from review where resto_no='554467';
delete from review where review_content='2';

commit;
select  * from review;