-- drop table community;

create table community(
c_articleNo	 number	 primary key not null,		-- 글번호
c_category	 varchar2(50)	 not null,		-- 카테고리
u_email	varchar2(50)	 not null,		-- 유저 이메일주소
c_title	 varchar2(50)	 not null,		-- 제목
c_writeDate	 date		 default sysdate,	-- 작성일자
c_content	 varchar2(500)	 not null,		-- 내용
c_image	 varchar2(500)		,	-- 이미지파일명(파일명 변환 필요)
c_views	 number		default 0,	-- 조회수
c_scraps	 number		default 0,	-- 스크랩수
c_show	 char(1)		default 'Y',	-- 게시여부
heart number default 0, -- 하트수
search_type VARCHAR2(50) default '', -- 검색필터
keyword VARCHAR2(50) default '', -- 검색어
reply_cnt number default 0 -- 댓글수
);

delete from community where c_articleNo=1;
insert into community values(0,'recipe', 'u1@u1', '더미', default, '더미', null, default, default, default, default, default, default, default);

insert into community values(8, 'vegan life', 'user04@mail.com', '비건라이프1', default, '이렇게 살아봅시다', null, default, default, default, default, default, default, default);
insert into community values(9, 'vegan life', 'user04@mail.com', '비건라이프2', default, '건강하게 살아요', null, default, default, default, default, default, default, default);
insert into community values(2, 'recipe', 'user01@mail.com', '가지감바스 레시피~', default, '1. 가지를 씻고 2.마늘을 볶고 3. 알아서', null, default, default, default, default, default, default, default);
insert into community values(3, 'recipe', 'user01@mail.com', '비건스시롤 리세피입니다', default, '1. 재료 준비해서 2. 잘 싸면됩니다', null, default, default, default, default, default, default, default);
insert into community values(4, 'vegan life', 'user01@mail.com', '비건뷰티추천해요', default, '이거 좋네요 ㅎㅎ', null, default, 4, default, default, default, default, default);
insert into community values(5, 'recipe', 'user04@mail.com', '비건부대찌개 레시피', default, '1. 넣고 2. 끓이기', null, default, default, default, default, default, default, default);
insert into community values(6, 'recipe', 'user04@mail.com', '비건렌틸타코 레시피에요', default, '1. 그냥 싸서 먹으면 됩니다', null, 7, 1, default, default, default, default, default);
insert into community values(7, 'vegan life', 'user04@mail.com', '비건뷰티 두번째 추천', default, '이거 좋아요', null, default, default, default, default, default, default, default);

commit;
select * from community;
