-- drop table e_image;

create table e_image(
    e_imageNo number,
    e_image VARCHAR2(500),
    regDate date default sysdate,
    e_no number
    -- constraint e_e_no foreign key (e_no) references event(e_no)
);

select * from e_image;