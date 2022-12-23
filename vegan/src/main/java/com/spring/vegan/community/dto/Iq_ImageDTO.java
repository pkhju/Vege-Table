package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("iq_imageDTO")
public class Iq_ImageDTO {
	private int iq_imageNo;
	private String iq_image;
	private Date regDate;
	private int iq_no;
	public int getIq_imageNo() {
		return iq_imageNo;
	}
	public void setIq_imageNo(int iq_imageNo) {
		this.iq_imageNo = iq_imageNo;
	}
	public String getIq_image() {
		return iq_image;
	}
	public void setIq_image(String iq_image) {
		this.iq_image = iq_image;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getIq_no() {
		return iq_no;
	}
	public void setIq_no(int iq_no) {
		this.iq_no = iq_no;
	}
	
}
