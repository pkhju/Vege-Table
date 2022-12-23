package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("replyDTO")
public class ReplyDTO {
	private String u_nick;
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	private int reply_no;
	private int c_articleNo;
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
	private String reply_content;
	private Date reply_writeDate;
	private String u_email;
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	private String show;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_writeDate() {
		return reply_writeDate;
	}
	public void setReply_writeDate(Date reply_writeDate) {
		this.reply_writeDate = reply_writeDate;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
}
