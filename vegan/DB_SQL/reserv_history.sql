-- drop table reserv_history;

create table reserv_history (    
reserv_no  varchar2(50),  -- 예약번호
reserv_condition char(1),  -- 예약상태
reserv_change date default sysdate -- 상태변경일자
);    
-- reserv_change 값: 예약대기(A) 예약확정(B) 방문완료(C) 취소(D) 노쇼(E)

commit;
select * from reserv_history;