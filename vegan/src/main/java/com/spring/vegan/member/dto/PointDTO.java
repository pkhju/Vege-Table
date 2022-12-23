package com.spring.vegan.member.dto;

import java.sql.Date;

public class PointDTO {
//	create table point (				
//		    u_email	varchar2(50)	 not null,		-- 유저 이메일주소
//		    point_change	 number	 not null,		-- 포인트 변화값
//		    point_date	 date		default sysdate,	-- 변경일자
//		    point_rest	 number	 not null,		-- 남은포인트
//		    point_history	char(1)	not null,		-- 포인트 변동내역
//		    point_detail	number,			-- 포인트 충전 거래번호
//		    constraint point_detail_point foreign key (point_detail) references card_pay(point_detail),				
//		   
	private String email;
	private int point_change; // 포인트 변화값 (+,-)
	private int point_rest; // 남은 포인트: 기존 포인트 + 포인트 변화값
	private String point_history; // 포인트 변경 사유, 충전: C, 예약: B, 커뮤니티 글 작성: W, 이벤트 참여: E, 리뷰 작성: R
	private int point_detail; // 포인트 충전 거래 번호(승인번호)
	private Date point_date; // 포인트 충전 거래 번호(승인번호)
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint_change() {
		return point_change;
	}
	public void setPoint_change(int point_change) {
		this.point_change = point_change;
	}
	public int getPoint_rest() {
		return point_rest;
	}
	public void setPoint_rest(int point_rest) {
		this.point_rest = point_rest;
	}
	public String getPoint_history() {
		return point_history;
	}
	public void setPoint_history(String point_history) {
		this.point_history = point_history;
	}
	public int getPoint_detail() {
		return point_detail;
	}
	public void setPoint_detail(int point_detail) {
		this.point_detail = point_detail;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}

}
