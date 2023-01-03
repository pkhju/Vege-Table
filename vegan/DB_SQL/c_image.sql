-- drop table c_image;

create table c_image(
    c_imageNo number,
    c_image VARCHAR2(500),
    regDate date default sysdate,
    c_articleNo number
    -- constraint c_imagearticleNo foreign key (c_articleNo) references community(c_articleNo)
);

select * from c_image;