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
insert into card_pay values('user02@mail.com','5555666677778888','0825',1,'35','956420',seq_card.nextval,20000,to_date('2022/11/19 15:33:37', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','9899944445556612','0127',3,'98','986421',seq_card.nextval,40000,to_date('2022/11/19 15:33:37', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','1111222233334444','0623',0,'21','930920',seq_card.nextval,10000,to_date('2022/11/22 16:49:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0326',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:19:10', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0523',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:20:17', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0527',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:25:45', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0229',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:26:41', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0425',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:27:14', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0426',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:28:13', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','3456555505553456','0828',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/23 10:29:37', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','7897555505555555','0323',3,'57','978474',seq_card.nextval,10000,to_date('2022/11/23 10:44:56', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','5555555505555555','0629',3,'57','978474',seq_card.nextval,10000,to_date('2022/11/23 14:28:51', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user04@mail.com','1234123412340123','0526',2,'79','930652',seq_card.nextval,20000,to_date('2022/11/26 13:39:37', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user04@mail.com','1234123412340123','0524',2,'46','131313',seq_card.nextval,20000,to_date('2022/11/26 13:40:17', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user04@mail.com','2344234455550754','0326',1,'67','676767',seq_card.nextval,20000,to_date('2022/11/26 14:06:41', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user04@mail.com','4545787809097777','0323',1,'23','232323',seq_card.nextval,40000,to_date('2022/11/26 14:09:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','4564444402221111','0228',2,'12','123456',seq_card.nextval,20000,to_date('2022/11/26 14:12:04', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0426',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/26 14:12:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user04@mail.com','1234123412401234','0225',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/26 14:32:19', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0426',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/26 14:32:52', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user02@mail.com','5555555505555555','0425',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/26 14:34:56', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user02@mail.com','5555555505555555','0425',3,'57','978474',seq_card.nextval,20000,to_date('2022/11/26 14:37:00', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0427',3,'57','978474',seq_card.nextval,100000,to_date('2022/11/30 18:58:55', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user02@mail.com','6767474707073434','0425',3,'77','978474',seq_card.nextval,100000,to_date('2022/11/30 19:14:41', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client01@mail.com','5555555505555555','0323',3,'57','978474',seq_card.nextval,100000,to_date('2022/11/30 22:36:47', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client01@mail.com','1234050545459494','0326',1,'57','930920',seq_card.nextval,100000,to_date('2022/11/30 22:44:45', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client01@mail.com','1111222233330545','0425',3,'57','978474',seq_card.nextval,10000,to_date('2022/11/30 22:50:54', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client02@mail.com','5555555505555555','0325',1,'57','978474',seq_card.nextval,20000,to_date('2022/11/30 22:55:13', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client01@mail.com','5555555505555555','0324',3,'57','978474',seq_card.nextval,200000,to_date('2022/12/01 22:55:24', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('client01@mail.com','5555555505555555','0425',3,'57','978474',seq_card.nextval,20000,to_date('2022/12/02 16:45:53', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0224',3,'57','978474',seq_card.nextval,90000,to_date('2022/12/02 16:48:13', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0324',3,'57','978474',seq_card.nextval,1000,to_date('2022/12/02 17:06:38', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0324',3,'57','978474',seq_card.nextval,1010,to_date('2022/12/02 17:21:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0326',3,'57','978474',seq_card.nextval,9999,to_date('2022/12/02 17:24:13', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user03@mail.com','5555555505555555','0125',3,'57','978474',seq_card.nextval,20000,to_date('2022/12/02 17:26:28', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','1205637890000343','1235',1,'55','123456',seq_card.nextval,20000,to_date('2022/12/07 15:58:17', 'YYYY/MM/DD HH24:MI:SS'));
insert into card_pay values('user01@mail.com','1205637890000343','1235',1,'55','123456',seq_card.nextval,20000,to_date('2022/12/07 15:58:54', 'YYYY/MM/DD HH24:MI:SS'));

commit;
select * from card_pay;