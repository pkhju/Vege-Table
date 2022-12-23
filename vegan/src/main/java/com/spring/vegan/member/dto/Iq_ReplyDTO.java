package com.spring.vegan.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("iq_replyDTO")
public class Iq_ReplyDTO {
	private int iq_reply_no;
	private Integer reply_iq_no;
	private String iq_reply_content;
	private Date iq_reply_writeDate;
	private String iq_u_email;
	public int getIq_reply_no() {
		return iq_reply_no;
	}
	public void setIq_reply_no(int iq_reply_no) {
		this.iq_reply_no = iq_reply_no;
	}
	public Integer getReply_iq_no() {
		return reply_iq_no;
	}
	public void setReply_iq_no(Integer reply_iq_no) {
		this.reply_iq_no = reply_iq_no;
	}
	public String getIq_reply_content() {
		return iq_reply_content;
	}
	public void setIq_reply_content(String iq_reply_content) {
		this.iq_reply_content = iq_reply_content;
	}
	public Date getIq_reply_writeDate() {
		return iq_reply_writeDate;
	}
	public void setIq_reply_writeDate(Date iq_reply_writeDate) {
		this.iq_reply_writeDate = iq_reply_writeDate;
	}
	public String getIq_u_email() {
		return iq_u_email;
	}
	public void setIq_u_email(String iq_u_email) {
		this.iq_u_email = iq_u_email;
	}
	
}
