-- drop table review;

create table review (				
    resto_no	 number	 not null,		-- 식당등록번호
    u_nick varchar2(10),		-- 유저 닉네임
    review_content	varchar2(500)	 not null,		-- 리뷰 컨텐츠
    review_date	 date default sysdate,	-- 리뷰일자
    imageFileName	 varchar2(100)		,	-- 이미지파일명
    rate	 number	 not null,		-- 평점
    show	 char(1)		default 'y',	-- 게시여부
    del char(1) default 'n',
    review_no number,
    constraint resto_no_review foreign key (resto_no) references resto(resto_no)				
);

delete from review where resto_no='554467';
delete from review where review_content='2';

commit;
select  * from review;