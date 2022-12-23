package com.spring.vegan.resto.dto;

import java.sql.Date;

public class RestoDTO {
	private String vegan;
	private String c_email;
	private String resto_name;
	private String resto_addr;
	private String resto_tel;
	private String resto_time;
	private String resto_break;
	private String resto_detail;
	private String imageFileName;
	private double avg_rate;
	private int resto_no;
	private int deposit;
	private String resto_info;
	private Date regDate;
	private String selectSearch;
	private String keyword;
	
	public String getVegan() {
		return vegan;
	}
	public void setVegan(String vegan) {
		this.vegan = vegan;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getResto_name() {
		return resto_name;
	}
	public void setResto_name(String resto_name) {
		this.resto_name = resto_name;
	}
	public String getResto_addr() {
		return resto_addr;
	}
	public void setResto_addr(String resto_addr) {
		this.resto_addr = resto_addr;
	}
	public String getResto_tel() {
		return resto_tel;
	}
	public void setResto_tel(String resto_tel) {
		this.resto_tel = resto_tel;
	}
	public String getResto_time() {
		return resto_time;
	}
	public void setResto_time(String resto_time) {
		this.resto_time = resto_time;
	}
	public String getResto_break() {
		return resto_break;
	}
	public void setResto_break(String resto_break) {
		this.resto_break = resto_break;
	}
	public String getResto_detail() {
		return resto_detail;
	}
	public void setResto_detail(String resto_detail) {
		this.resto_detail = resto_detail;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public double getAvg_rate() {
		return avg_rate;
	}
	public void setAvg_rate(double avg_rate) {
		this.avg_rate = avg_rate;
	}
	public int getResto_no() {
		return resto_no;
	}
	public void setResto_no(int resto_no) {
		this.resto_no = resto_no;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public String getResto_info() {
		return resto_info;
	}
	public void setResto_info(String resto_info) {
		this.resto_info = resto_info;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getSelectSearch() {
		return selectSearch;
	}
	public void setSelectSearch(String selectSearch) {
		this.selectSearch = selectSearch;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
