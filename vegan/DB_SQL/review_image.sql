-- drop table review_image;

create table review_image(
    imageFileNo varchar2(50),
    imageFileName varchar2(50),
    regDate date default sysdate,
    resto_no number
);

commit;
select * from review_image;
