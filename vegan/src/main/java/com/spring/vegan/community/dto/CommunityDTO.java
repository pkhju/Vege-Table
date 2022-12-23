package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityDTO")
public class CommunityDTO {
	private int c_articleNo;
	private String c_category;
	private String u_email;
	private String c_title;
	private Date c_writeDate;
	private String c_content;
	private String c_image;
	private int c_views;
	private int c_scraps;
	private String c_show;
	private int heart;
	private int reply_cnt;
	
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
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
	private String u_nick;
	
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public Date getC_writeDate() {
		return c_writeDate;
	}
	public void setC_writeDate(Date c_writeDate) {
		this.c_writeDate = c_writeDate;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public int getC_views() {
		return c_views;
	}
	public void setC_views(int c_views) {
		this.c_views = c_views;
	}
	public int getC_scraps() {
		return c_scraps;
	}
	public void setC_scraps(int c_scraps) {
		this.c_scraps = c_scraps;
	}
	public String getC_show() {
		return c_show;
	}
	public void setC_show(String c_show) {
		this.c_show = c_show;
	}
}
