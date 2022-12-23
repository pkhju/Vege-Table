package com.spring.vegan.reservation.dto;

import java.sql.Date;

public class ReservDTO {
	private String resto_name;
	private String resto_addr;
	private String c_email;
	private String u_email;
	private String reserv_no;
	private int resto_no;
	private Date reserv_date;
	private String reserv_sched;
	private int reserv_member;
	private int reserv_deposit;
	private String reserv_condition;

	public String getResto_name() {
		return resto_name;
	}
	public void setResto_name(String resto_name) {
		this.resto_name = resto_name;
	}
	public String getResto_addr() {
		return resto_addr;
	}
	public void setResto_addr(String resto_addr) {
		this.resto_addr = resto_addr;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getReserv_no() {
		return reserv_no;
	}
	public void setReserv_no(String reserv_no) {
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
	public String getReserv_sched() {
		return reserv_sched;
	}
	public void setReserv_sched(String reserv_sched) {
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

}
