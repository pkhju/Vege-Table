package com.spring.vegan.member.dto;

import java.sql.Date;

public class ReservDTO {
//	create table reserv (				
//			u_email	varchar2(50)	 not null,		-- 유저 이메일주소
//			reserv_no	 number	 primary key,		-- 예약번호
//			resto_no	 number	 not null,		-- 식당등록번호
//			reserv_date	 date	default sysdate	not null,	-- 예약날짜
//			reserv_sched	 date	 not null,		-- 예약일정
//			reserv_member	 number	 not null,		-- 예약인원
//			reserv_deposit	 number	 not null,		-- 예약포인트
//			reserv_condition	 char(1)	 not null,		-- 예약상태
//			reserv_change	 date	default sysdate	not null,	-- 상태변경일자
//			constraint u_email_reserv foreign key (u_email) references user_on(u_email),				
//			constraint resto_no_reserv foreign key (resto_no) references resto(resto_no)				
//			);				
//			reserv_change 값: 예약대기(a) 예약확정(b) 방문완료(c) 취소(d) 노쇼(e)		
	private String u_email;
	private int reserv_no;
	private int resto_no;
	private Date reserv_date;
	private Date reserv_sched;
	private int reserv_member;
	private int reserv_deposit;
	private String reserv_condition;
	private Date reserv_change;
	
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getReserv_no() {
		return reserv_no;
	}
	public void setReserv_no(int reserv_no) {
		this.reserv_no = reserv_no;
	}
	public int getResto_no() {
		return resto_no;
	}
	public void setResto_no(int resto_no) {
		this.resto_no = resto_no;
	}
	public Date getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(Date reserv_date) {
		this.reserv_date = reserv_date;
	}
	public Date getReserv_sched() {
		return reserv_sched;
	}
	public void setReserv_sched(Date reserv_sched) {
		this.reserv_sched = reserv_sched;
	}
	public int getReserv_member() {
		return reserv_member;
	}
	public void setReserv_member(int reserv_member) {
		this.reserv_member = reserv_member;
	}
	public int getReserv_deposit() {
		return reserv_deposit;
	}
	public void setReserv_deposit(int reserv_deposit) {
		this.reserv_deposit = reserv_deposit;
	}
	public String getReserv_condition() {
		return reserv_condition;
	}
	public void setReserv_condition(String reserv_condition) {
		this.reserv_condition = reserv_condition;
	}
	public Date getReserv_change() {
		return reserv_change;
	}
	public void setReserv_change(Date reserv_change) {
		this.reserv_change = reserv_change;
	}

}
