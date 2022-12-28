-- drop table point;

create table point (
	email varchar2(50) not null,-- ���� �̸����ּ�
	point_change number,-- ����Ʈ ��ȭ��
	point_rest number,-- ��������Ʈ
	point_history char(1),-- ����Ʈ ��������
	point_detail number-- ����Ʈ ���� �ŷ���ȣ
	reserv_no number, -- 예약시 포인트 사용한 경우 예약번호 저장
	point_no not null -- 포인트 사용시 시퀀스로 기록
);
-- ����Ʈ �������� �÷�(char) : ����, ���, Ŀ�´�Ƽ, �̺�Ʈ(����� ���� ������ ����)
-- ���� ( C ), ���� ( B ), Ŀ�´�Ƽ �� �ۼ� ( W ), �̺�Ʈ ���� ( E ), ���� �ۼ� ( R )

commit;
select * from point;

-- 2022-12-28 추가
-- alter table point add reserv_no	number;
-- alter table point add point_no number;
