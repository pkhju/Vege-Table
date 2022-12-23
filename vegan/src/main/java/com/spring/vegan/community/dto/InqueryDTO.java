package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("inqueryDTO")
public class InqueryDTO {
	private int iq_no;
	private String u_email;
	private String iq_title;
	private Date iq_writeDate;
	private String iq_content;
	private String iq_image;
	private String iq_thumb;
	
	private String search_type;
	private String keyword;
	
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getIq_thumb() {
		return iq_thumb;
	}
	public void setIq_thumb(String iq_thumb) {
		this.iq_thumb = iq_thumb;
	}
	public int getIq_no() {
		return iq_no;
	}
	public void setIq_no(int iq_no) {
		this.iq_no = iq_no;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getIq_title() {
		return iq_title;
	}
	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}
	public Date getIq_writeDate() {
		return iq_writeDate;
	}
	public void setIq_writeDate(Date iq_writeDate) {
		this.iq_writeDate = iq_writeDate;
	}
	public String getIq_content() {
		return iq_content;
	}
	public void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}
	public String getIq_image() {
		return iq_image;
	}
	public void setIq_image(String iq_image) {
		this.iq_image = iq_image;
	}
}
