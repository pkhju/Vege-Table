package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("c_imageDTO")
public class C_ImageDTO {
	private int c_imageNo;
	private String c_image;
	private Date regDate;
	private int c_articleNo;
	public int getC_imageNo() {
		return c_imageNo;
	}
	public void setC_imageNo(int c_imageNo) {
		this.c_imageNo = c_imageNo;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
}
