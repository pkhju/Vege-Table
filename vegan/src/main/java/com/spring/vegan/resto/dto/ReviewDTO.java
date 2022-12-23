package com.spring.vegan.resto.dto;

import java.sql.Date;

public class ReviewDTO {
	private int resto_no;
	private String u_nick;
	private String review_content;
	private Date review_date;
	private String imageFileName;
	private int rate;
	private String show;
	private String del;
	private int review_no;
	
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getResto_no() {
		return resto_no;
	}
	public void setResto_no(int resto_no) {
		this.resto_no = resto_no;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}

}