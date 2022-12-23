package com.spring.vegan.community.dto;

import java.sql.Date;

public class EventDTO {
	private int e_no;
	private String e_title;
	private Date e_date;
	private String e_content;
	private String imageFileName;
	private int e_start;
	private int e_end;
	private int e_views;
	
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public int getE_start() {
		return e_start;
	}
	public void setE_start(int e_start) {
		this.e_start = e_start;
	}
	public int getE_end() {
		return e_end;
	}
	public void setE_end(int e_end) {
		this.e_end = e_end;
	}
	public int getE_views() {
		return e_views;
	}
	public void setE_views(int e_views) {
		this.e_views = e_views;
	}

}
