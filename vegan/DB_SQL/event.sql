-- drop table event;

create table event(
e_no	 number	primary key,		-- 글번호
e_title	 varchar2(100)	 not null,		-- 제목
e_date	 date		 default sysdate,	-- 작성일자
e_content	 varchar2(500)	,		-- 내용
e_image	 varchar2(500) ,		-- 이미지파일명
e_start	 varchar2(500)	 not null,		-- 시작기간
e_end	 varchar2(500)	 not null,	-- 종료기간
e_show CHAR(1) default 'Y'
);

insert into event values(1, '예시이벤트', default, '일시 : ~ 내용 : ~', null, '2023-11-24T11:30', '2023-11-27T11:10', default);
commit;
select * from event;