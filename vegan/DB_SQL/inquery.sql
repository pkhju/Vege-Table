-- drop table inquery;

create table inquery(
    iq_no number primary key not null,
    u_email	varchar2(50)	 not null,		-- 유저 이메일주소
    iq_title	 varchar2(50)	 not null,		-- 제목
    iq_writeDate	 date		 default sysdate,	-- 작성일자
    iq_content	 varchar2(500)	 not null,		-- 내용
    iq_image	 varchar2(500), -- 이미지
    search_type VARCHAR2(50) default '', -- 검색필터
    keyword VARCHAR2(50) default '', --검색어
    constraint inquery_email foreign key (u_email) references user_on(u_email)
);

insert into inquery values(1, 'user01@mail.com', '뭔의', sysdate, 'zzz', 'null', default, default);
commit;

select * from inquery;