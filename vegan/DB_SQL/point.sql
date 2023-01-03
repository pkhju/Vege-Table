-- drop table point;

create table point (
	point_no number not null, -- ����Ʈ ��� ������
	email varchar2(50) not null, -- ���� �Ǵ� Ŭ���̾�Ʈ �̸���
	point_change number, -- ����Ʈ ��ȭ��
	point_rest number, -- ��������Ʈ
	point_history char(1), -- ����Ʈ ��������
	point_detail number, -- ����Ʈ ���� �ŷ���ȣ
	reserv_no number -- ���� ��ȣ
);
-- ����Ʈ �������� �÷�(char) : ����, ���, Ŀ�´�Ƽ, �̺�Ʈ(����� ���� ������ ����)
-- ���� ( C ), ���� ( B ), Ŀ�´�Ƽ �� �ۼ� ( W ), �̺�Ʈ ���� ( E ), ���� �ۼ� ( R )

create sequence point_seq
start with 1
increment by 1;

insert into point values(point_seq.nextval, 'user01@mail.com', 50, 0, 'W', null, null);

commit;
select * from point;

-- 2022-12-28 ����
-- alter table point add reserv_no	number;
-- alter table point add point_no number;
-- ���̺� �����Ǿ� ����