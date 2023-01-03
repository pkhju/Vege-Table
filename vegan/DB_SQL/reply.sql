-- drop table reply;

create table reply(
    reply_no number primary key not null,
    c_articleNo number not null,
    reply_content varchar2(500),
    reply_writeDate date default sysdate,
    u_email VARCHAR2(50) not null,
    show char(1) default 'Y'
    -- constraint reply_articleNo foreign key (c_articleNo) references community(c_articleNo),
    -- constraint reply_email foreign key (u_email) references user_on(u_email)
);
create SEQUENCE reply_seq
START WITH 1
INCREMENT by 1;

commit;
select * from reply;