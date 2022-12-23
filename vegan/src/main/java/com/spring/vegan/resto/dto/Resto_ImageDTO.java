package com.spring.vegan.resto.dto;

import java.sql.Date;

public class Resto_ImageDTO {
	private String imageFileNo;
	private String imageFileName;
	private Date regDate;
	private int resto_no;
	
	public String getImageFileNo() {
		return imageFileNo;
	}
	public void setImageFileNo(String imageFileNo) {
		this.imageFileNo = imageFileNo;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getResto_no() {
		return resto_no;
	}
	public void setResto_no(int resto_no) {
		this.resto_no = resto_no;
	}
}
