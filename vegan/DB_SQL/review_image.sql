-- drop table review_image;

create table review_image(
	resto_no number not null,
    imageFileNo varchar2(50),
    imageFileName varchar2(50),
    regDate date default sysdate
);

commit;
select * from review_image;
