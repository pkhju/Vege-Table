-- drop table com_scrap;

create table com_scrap (				
u_email	varchar2(50)	 not null,		-- 유저 이메일주소
c_articleNo	 number	 not null,		-- 글번호
com_scrap_date	 date		default sysdate,	-- 스크랩일자
show char(1) default 'Y' -- 게시여부
-- constraint u_email_scrap foreign key (u_email) references user_on(u_email),				
-- constraint articleNo foreign key (c_articleNo) references community(c_articleNo)				
);

select * from com_scrap;
