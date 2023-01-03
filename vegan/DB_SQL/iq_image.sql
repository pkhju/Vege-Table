-- drop table iq_image;

create table iq_image(
    iq_imageNo number,
    iq_image VARCHAR2(500),
    regDate date default sysdate,
    iq_no number
    -- constraint iq_iq_no foreign key (iq_no) references inquery(iq_no)
);
commit;
select * from iq_image;