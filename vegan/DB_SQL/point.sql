-- drop table point;

create table point (
	point_no number not null, -- 포인트 등록 시퀀스
	email varchar2(50) not null, -- 유저 또는 클라이언트 이메일
	point_change number, -- 포인트 변화값
	point_rest number, -- 남은포인트
	point_history char(1), -- 포인트 변동내역
	point_detail number, -- 포인트 충전 거래번호
	reserv_no number, -- 예약 번호
	point_date default sysdate
);
-- 포인트 변동내역 컬럼(char) : 충전, 사용, 커뮤니티, 이벤트(경우의 수가 정해져 있음)
-- 충전 ( C ), 예약 ( B ), 커뮤니티 글 작성 ( W ), 이벤트 참여 ( E ), 리뷰 작성 ( R )

create sequence point_seq
start with 1
increment by 1;

insert into point values(point_seq.nextval, 'user01@mail.com', 50, 0, 'W', null, null);

commit;
select * from point;

-- 2022-12-28 수정
-- alter table point add reserv_no	number;
-- alter table point add point_no number;
-- alter table point add point_date default sysdate;
-- 테이블에 수정되어 있음