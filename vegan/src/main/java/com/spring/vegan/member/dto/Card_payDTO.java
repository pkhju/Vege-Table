package com.spring.vegan.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("card_payDTO")
public class Card_payDTO {
//	create table card_pay (				
//			email	varchar2(50)	 not null,		-- 유저 이메일주소
//			card_no	char(16)	 not null,		-- 카드번호
//			card_valid	char(4)	not null,		-- 유효기간 MMYY
//			card_month	number	 not null,		-- 할부개월
//			card_pwd	varchar2(50)	not null,		--  신용카드 비밀번호 앞 2자리
//			card_regiNum	varchar2(50)	not null,		-- 주민등록번호 앞  6자리 또는 법인카드는 사업자등록번호 10자리
//			point_detail	number	primary key,		-- 포인트 충전 거래번호
//			card_price	number	not null,		-- 승인금액
//			card_time	date		default sysdate,	-- 결제시간
//			-- constraint u_email_card foreign key (u_email) references user_on(u_email)				
	private String email;
	private String card_no;
	private String card_valid;
	private int card_month;
	private String card_pwd;
	private String card_regiNum;
	private int point_detail;
	private int card_price;
	private Date card_time;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_valid() {
		return card_valid;
	}
	public void setCard_valid(String card_valid) {
		this.card_valid = card_valid;
	}
	public int getCard_month() {
		return card_month;
	}
	public void setCard_month(int card_month) {
		this.card_month = card_month;
	}
	public String getCard_pwd() {
		return card_pwd;
	}
	public void setCard_pwd(String card_pwd) {
		this.card_pwd = card_pwd;
	}
	public String getCard_regiNum() {
		return card_regiNum;
	}
	public void setCard_regiNum(String card_regiNum) {
		this.card_regiNum = card_regiNum;
	}
	public int getPoint_detail() {
		return point_detail;
	}
	public void setPoint_detail(int point_detail) {
		this.point_detail = point_detail;
	}
	public int getCard_price() {
		return card_price;
	}
	public void setCard_price(int card_price) {
		this.card_price = card_price;
	}
	public Date getCard_time() {
		return card_time;
	}
	public void setCard_time(Date card_time) {
		this.card_time = card_time;
	}
	
}
