-- drop table card_pay;

create table card_pay (  -- ����Ʈ ���� ���̺�(ī���������)  
email varchar2(50) not null,  -- ���� �̸����ּ�
card_no char(16) ,  -- ī���ȣ
card_valid char(4) ,  -- ��ȿ�Ⱓ MMYY
card_month number ,  -- �Һΰ���
card_pwd varchar2(50),  --  �ſ�ī�� ��й�ȣ �� 2�ڸ�
card_regiNum varchar2(50),  -- �ֹε�Ϲ�ȣ ��  6�ڸ� �Ǵ� ����ī��� ����ڵ�Ϲ�ȣ 10�ڸ�
point_detail number primary key,  -- ����Ʈ ���� �ŷ���ȣ
card_price number ,  -- ���αݾ�
card_time date  default sysdate -- �����ð�
);    

create sequence seq_card
start with 10001
increment by 1;

insert into card_pay values('user01@mail.com','1111222233334444','0623',0,'21','930920',seq_card.nextval,50000,to_date('2022/11/19 15:33:37', 'YYYY/MM/DD HH24:MI:SS'));

commit;
select * from card_pay;