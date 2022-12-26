-- user 회원정보 테이블
-- drop table user_on;

create table user_on (				
u_name	varchar2(50),			-- 유저이름(암호화)
u_tel	char(11),			-- 전화번호 (암호화)
u_email	varchar2(50)	 primary key, 		-- 이메일
u_pwd	varchar2(50)	 not null,		-- 비밀번호
u_nick	varchar2(10)	 not null,		-- 닉네임
u_point	number		 default 0,	-- 포인트
u_lvl	char(1)	,		-- 비건단계 (A~G)
u_addr	varchar2(50),			-- 주소 (암호화)
u_joinDate	date	default sysdate	not null,	-- 가입일(인증일)
u_auth	char(1)	default 'A'	not null,	-- 계정상태 (인증필요A,활성화B,비활성화C)
offDate	date	null		-- 계정 비활성화 일자
);
select * from user_on;
insert into user_on values('user01', '01012345678', 'user01@mail.com', '1111', 'usernick01', 10000, 'A', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user04', '01012345678', 'user04@mail.com', '4444', 'usernick04', 10000, 'B', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user05', '01012345222', 'user05@mail.com', '5555', 'usernick05', 10000, 'B', 'address01', to_date('2022/11/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into user_on values('user02', '01012345678', 'user02@mail.com', '2222', 'usernick02', 0, 'C', 'address02', to_date('2022/11/16 13:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'C', to_date('2022/11/18 13:10:44', 'YYYY/MM/DD HH24:MI:SS')); 
insert into user_on values('user03', '01012345678', 'user03@mail.com', '3333', 'usernick03', 0, 'E', 'address03', to_date('2022/12/15 14:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'A', default); 

update user_on set u_point=200000 where u_name='user05';
commit;
select * from user_on;

-- client 회원정보 테이블
-- drop table client_on;

create table client_on (				
c_name	varchar2(50)	,		-- 유저이름(암호화)
c_tel	char(11)	,		-- 휴대전화(암호화)
c_email	varchar2(50)	primary key,		-- 이메일
c_pwd	varchar2(50)	not null,		-- 비밀번호
regiNum	char(10)	not null,		-- 사업자등록번호
certify	char(10)	not null,		-- 영업허가번호
c_point	number		 default 0,	-- 포인트
c_joinDate	date	default sysdate	not null,	-- 가입일
c_auth	char(1)	default 'A'	not null,	-- 계정상태(인증필요A,활성화B,비활성화C)
c_offDate	date	default sysdate	not null	-- 비활성화일
);	

insert into client_on values('client01', '01022223333', 'client01@mail.com', '1111', '5555555555', '6666666666', 220000, to_date('2022/11/29 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default); 
insert into client_on values('client02', '01022223333', 'client02@mail.com', '2222', '1111111111', '222222222', 0, to_date('2022/12/05 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'C', to_date('2022/12/15 17:10:44', 'YYYY/MM/DD HH24:MI:SS'));
insert into client_on values('client03', '01022223333', 'client03@mail.com', '3333', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'A', default);
insert into client_on values('client04', '01022223333', 'client04@mail.com', '4444', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);
insert into client_on values('client05', '01022223333', 'client05@mail.com', '5555', '3333333333', '4444444444', 0, to_date('2022/11/10 17:10:44', 'YYYY/MM/DD HH24:MI:SS'), 'B', default);

commit;

select * from client_on;