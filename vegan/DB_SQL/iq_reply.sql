-- drop table iq_reply;

create table iq_reply(
    iq_reply_no number primary key not null,
    reply_iq_no number not null,
    iq_reply_content varchar2(500),
    iq_reply_writeDate date default sysdate,
    iq_u_email VARCHAR2(50) not null
    -- constraint reply_iq_no foreign key (reply_iq_no) references inquery(iq_no),
    -- constraint iq_reply_email foreign key (iq_u_email) references user_on(u_email)
);

create SEQUENCE iq_reply_no_seq
START WITH 1 INCREMENT by 1;

insert into iq_reply values(iq_reply_no_seq.nextval, 1, '관리자 답변 내용', to_date('2022/11/19 15:33:37', 'YYYY/MM/DD HH24:MI:SS'), 'user01@mail.com');

commit;

select * from iq_reply;