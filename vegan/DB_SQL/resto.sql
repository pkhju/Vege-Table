-- drop table resto;

create table resto (	
	resto_no	number primary key,		-- 식당등록번호
    vegan	char(1)		default 'N',	-- 비건/논비건
    c_email	varchar2(50),		-- 사업자 이메일주소
    resto_name	varchar2(50)	 not null,		-- 식당이름
    resto_addr	varchar2(150)	 not null,		-- 식당주소
    resto_tel	varchar2(20)	 not null,		-- 전화번호
    resto_time	char(8)	 not null,		-- 영업시간
    resto_break	char(8)	 not null,		-- 브레이크타임
    resto_detail	varchar2(1000)	 not null,		-- 상세정보
    imageFileName	varchar2(100),		-- 이미지파일(이미지파일명 변환 필요)
    avg_rate	number(2,1) default 0,		-- 평점   
    deposit	number	 not null,		-- 예약포인트
    resto_info varchar2(200),
    regDate date default sysdate			
);

create sequence resto_seq
start with 100000
increment by 1;

insert into resto values(resto_seq.nextval, 'Y', 'client01@mail.com', 'restoname01', 'resto - address01', '0245687549', '09002200', '15001700', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname01_imgFileName01', default, 20000, '식당 소개 요약 01', default);
insert into resto values(resto_seq.nextval, 'Y', 'client02@mail.com', 'restoname02', 'resto - address02', '07012345678', '11002300', '15001600', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname02_imgFileName02', default, 15000, '식당 소개 요약 02', default);
insert into resto values(resto_seq.nextval, 'Y', 'client03@mail.com', 'restoname03', 'resto - address03', '07065653131', '12002200', '15001800', 'Lorem Ipsum is simply dummy text of the printing and typesetting indus', 'restoname03_imgFileName03', default, 25000, '식당 소개 요약 03', default);

-- update resto set deposit=4000 where resto_name='에이콘';

commit;
select * from resto;