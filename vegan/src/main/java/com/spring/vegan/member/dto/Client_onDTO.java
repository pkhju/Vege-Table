package com.spring.vegan.member.dto;

import java.sql.Date;

public class Client_onDTO {
//	create table client_on (				
//		    c_name	varchar2(50)	,		-- 유저이름(암호화)
//		    c_tel	char(11)	,		-- 휴대전화(암호화)
//		    c_email	varchar2(50)	primary key,		-- 이메일
//		    c_pwd	varchar2(50)	,		-- 비밀번호
//		    regiNum	char(10)	,		-- 사업자등록번호
//		    certify	char(10)	,		-- 영업허가번호
//		    c_point	number		 default 0,	-- 포인트
//		    c_joinDate	date		 default sysdate	-- 가입일
//			c_auth	char(1)	default 'N'	not null	-- 이메일 인증여부
//		);
	private String c_name;
	private String c_tel;
	private String c_email;
	private String c_pwd;
	private String regiNum;
	private String certify;
	private int c_point;
	private Date c_joinDate;
	private String c_auth;
	private Date offDate;
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getRegiNum() {
		return regiNum;
	}
	public void setRegiNum(String regiNum) {
		this.regiNum = regiNum;
	}
	public String getCertify() {
		return certify;
	}
	public void setCertify(String certify) {
		this.certify = certify;
	}
	public int getC_point() {
		return c_point;
	}
	public void setC_point(int c_point) {
		this.c_point = c_point;
	}
	public Date getC_joinDate() {
		return c_joinDate;
	}
	public void setC_joinDate(Date c_joinDate) {
		this.c_joinDate = c_joinDate;
	}
	public String getC_auth() {
		return c_auth;
	}
	public void setC_auth(String c_auth) {
		this.c_auth = c_auth;
	}
	public Date getOffDate() {
		return offDate;
	}
	public void setOffDate(Date offDate) {
		this.offDate = offDate;
	}
	
}
