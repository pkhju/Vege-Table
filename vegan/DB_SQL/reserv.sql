-- drop table reserv;

create table reserv (
    resto_name	varchar2(50)	 not null,		-- 식당 이름
    resto_addr	varchar2(150)	 not null,		-- 식당 주소
    c_email	varchar2(50)	not null,		-- 클라이언트 이메일
    u_email	varchar2(50)	 not null,		-- 유저 이메일주소
    reserv_no	 number,		-- 예약번호
    resto_no	 number	 not null,		-- 식당등록번호
    reserv_date	 date		 default sysdate,	-- 식당등록번호
    reserv_sched	 varchar2(50)	 not null,		-- 예약 일정
    reserv_member	 number	 not null,		-- 예약 인원
    reserv_deposit	 number	 not null,		-- 예약 포인트
    reserv_condition	 char(1) default 'A'		-- 예약 상태
);
-- 예약 상태: 예약대기(A) 예약확정(B) 방문완료(C) 취소(D) 노쇼(E)

-- update reserv set reserv_condition='E' where resto_name='에이콘';

commit;
select * from reserv;