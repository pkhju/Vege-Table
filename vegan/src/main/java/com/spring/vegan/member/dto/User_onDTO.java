package com.spring.vegan.member.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

public class User_onDTO {
//	create table user_on (				
//		    u_name varchar2(50), -- 유저이름(암호화)
//		    u_tel char(11), -- 전화번호(암호화)
//		    u_email varchar2(50) primary key, 		-- 이메일
//		    u_pwd varchar2(50) , -- 비밀번호
//		    u_nick varchar2(10) , -- 닉네임
//		    u_point	number default 0,	-- 포인트
//		    u_lvl char(1),		-- 비건단계
//		    u_addr varchar2(50),			-- 주소(암호화)
//		    u_joinDate date,			-- 가입일(인증일)	
//			u_auth char(1) default 'N' not null -- 이메일 인증 여부
//			u_off	char(1)	default 'N'	not null,	-- 계정 비활성화 여부
//			offDate	date	null		-- 계정 비활성화 일자
//		);
	private String u_name;
	private String u_tel;
	private String u_email;
	private String u_pwd;
	private String u_nick;
	private int u_point;
	private String u_lvl;
	private String u_addr;
	private Date u_joinDate;
	private String u_auth;
	private Date offDate;
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public String getU_lvl() {
		return u_lvl;
	}
	public void setU_lvl(String u_lvl) {
		this.u_lvl = u_lvl;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public Date getU_joinDate() {
		return u_joinDate;
	}
	public void setU_joinDate(Date u_joinDate) {
		this.u_joinDate = u_joinDate;
	}
	public String getU_auth() {
		return u_auth;
	}
	public void setU_auth(String u_auth) {
		this.u_auth = u_auth;
	}
	public Date getOffDate() {
		return offDate;
	}
	public void setOffDate(Date offDate) {
		this.offDate = offDate;
	}
	
}
