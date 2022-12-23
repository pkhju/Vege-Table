package com.spring.vegan.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("e_imageDTO")
public class E_ImageDTO {
	private int e_imageNo;
	private String e_image;
	private Date regDate;
	private int e_no;
	public int getE_imageNo() {
		return e_imageNo;
	}
	public void setE_imageNo(int e_imageNo) {
		this.e_imageNo = e_imageNo;
	}
	public String getE_image() {
		return e_image;
	}
	public void setE_image(String e_image) {
		this.e_image = e_image;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
}
