-- drop table community;

create table community(
c_articleNo	 number	 primary key not null,		-- �۹�ȣ
c_category	 varchar2(50)	 not null,		-- ī�װ�
u_email	varchar2(50)	 not null,		-- ���� �̸����ּ�
c_title	 varchar2(50)	 not null,		-- ����
c_writeDate	 date		 default sysdate,	-- �ۼ�����
c_content	 varchar2(500)	 not null,		-- ����
c_image	 varchar2(500)		,	-- �̹������ϸ�(���ϸ� ��ȯ �ʿ�)
c_views	 number		default 0,	-- ��ȸ��
c_scraps	 number		default 0,	-- ��ũ����
c_show	 char(1)		default 'Y',	-- �Խÿ���
heart number default 0, -- ��Ʈ��
search_type VARCHAR2(50) default '', -- �˻�����
keyword VARCHAR2(50) default '', -- �˻���
reply_cnt number default 0 -- ��ۼ�
);

delete from community where c_articleNo=1;
insert into community values(0,'recipe', 'u1@u1', '����', default, '����', null, default, default, default, default, default, default, default);

insert into community values(8, 'vegan life', 'user04@mail.com', '��Ƕ�����1', default, '�̷��� ��ƺ��ô�', null, default, default, default, default, default, default, default);
insert into community values(9, 'vegan life', 'user04@mail.com', '��Ƕ�����2', default, '�ǰ��ϰ� ��ƿ�', null, default, default, default, default, default, default, default);
insert into community values(2, 'recipe', 'user01@mail.com', '�������ٽ� ������~', default, '1. ������ �İ� 2.������ ���� 3. �˾Ƽ�', null, default, default, default, default, default, default, default);
insert into community values(3, 'recipe', 'user01@mail.com', '��ǽ��÷� �������Դϴ�', default, '1. ��� �غ��ؼ� 2. �� �θ�˴ϴ�', null, default, default, default, default, default, default, default);
insert into community values(4, 'vegan life', 'user01@mail.com', '��Ǻ�Ƽ��õ�ؿ�', default, '�̰� ���׿� ����', null, default, 4, default, default, default, default, default);
insert into community values(5, 'recipe', 'user04@mail.com', '��Ǻδ�� ������', default, '1. �ְ� 2. ���̱�', null, default, default, default, default, default, default, default);
insert into community values(6, 'recipe', 'user04@mail.com', '��Ƿ�ƿŸ�� �����ǿ���', default, '1. �׳� �μ� ������ �˴ϴ�', null, 7, 1, default, default, default, default, default);
insert into community values(7, 'vegan life', 'user04@mail.com', '��Ǻ�Ƽ �ι�° ��õ', default, '�̰� ���ƿ�', null, default, default, default, default, default, default, default);

commit;
select * from community;
