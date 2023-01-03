-- drop table card_pay;

create table card_pay (  -- 포인트 충전 테이블(카드결제내역)  
email varchar2(50) not null,  -- 유저 이메일주소
card_no char(16) ,  -- 카드번호
card_valid char(4) ,  -- 유효기간 MMYY
card_month number ,  -- 할부개월
card_pwd varchar2(50),  --  신용카드 비밀번호 앞 2자리
card_regiNum varchar2(50),  -- 주민등록번호 앞  6자리 또는 법인카드는 사업자등록번호 10자리
point_detail number primary key,  -- 포인트 충전 거래번호
card_price number ,  -- 승인금액
card_time date  default sysdate -- 결제시간
);    

create sequence seq_card
start with 10001
increment by 1;

insert into card_pay values('user01@mail.com','1111222233334444','0623',0,'21','930920',seq_card.nextval,50000,to_date('2022/11/19 15:33:37', 'YYYY/MM/DD HH24:MI:SS'));

commit;
select * from card_pay;