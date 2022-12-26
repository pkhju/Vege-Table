-- drop table reserv;

create table reserv (
    resto_name	varchar2(50)	 not null,		-- 식당이름
    resto_addr	varchar2(150)	 not null,		-- 식당주소
    c_email	varchar2(50)	not null,		-- 클라이언트 이메일
    u_email	varchar2(50)	 not null,		-- 유저 이메일주소
    reserv_no	 varchar2(50),		-- 예약번호
    resto_no	 number	 not null,		-- 식당등록번호
    reserv_date	 date		 default sysdate,	-- 예약날짜
    reserv_sched	 varchar2(50)	 not null,		-- 예약일정
    reserv_member	 number	 not null,		-- 예약인원
    reserv_deposit	 number	 not null,		-- 예약포인트
    reserv_condition	 char(1) default 'A'		-- 예약대기(a) 예약확정(b) 방문완료(c) 취소(d) 노쇼(e)
);

update reserv set reserv_condition='E' where resto_name='에이콘';

commit;
select * from reserv;