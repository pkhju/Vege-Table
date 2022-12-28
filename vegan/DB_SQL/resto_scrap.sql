-- drop table resto_scrap;

create table resto_scrap (				
    u_email	varchar2(50)	 not null,		-- 유저 이메일주소
    resto_no	 number	 not null,		-- 식당등록번호
    resto_scrap_date	 date		default sysdate,	-- 스크랩일자
    show char(1),
    constraint u_email_restoscrap foreign key (u_email) references user_on(u_email),				
    constraint resto_no_scrap foreign key (resto_no) references resto(resto_no)				
);

insert into resto_scrap values('user01@mail.com',123456, sysdate, default);
insert into resto_scrap values('user02@mail.com',554466, sysdate, default);
insert into resto_scrap values('user03@mail.com',111223, sysdate, default);


commit;
select * from resto_scrap;