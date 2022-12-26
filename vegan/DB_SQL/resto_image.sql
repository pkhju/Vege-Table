-- drop table resto_image;
create table resto_image(
    imageFileNo varchar2(50),
    imageFileName varchar2(50),
    regDate date default sysdate,
    resto_no number
);

commit;
select * from resto_image;