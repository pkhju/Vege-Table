package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("com_heartDTO")
public class Com_HeartDTO {
	private String u_email;
	private int c_articleNo;
	private Date com_heart_date;
	private String show;
	
	public Date getCom_heart_date() {
		return com_heart_date;
	}
	public void setCom_heart_date(Date com_heart_date) {
		this.com_heart_date = com_heart_date;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
	
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
}
