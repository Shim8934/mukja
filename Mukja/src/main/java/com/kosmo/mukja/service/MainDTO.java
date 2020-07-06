package com.kosmo.mukja.service;

import java.sql.Date;

public class MainDTO {

	private String sa_no;
	private String store_id;
	private String sa_avg;
	private String user_id;
	private String username;
	private String good;
	private String rv_no;
	private String rv_title;
	private String rv_content;
	private String menu_no;
	private String rf_path;
	private String rownum;
	private String menu_name;
	private String u_nick;
	
	private String store_name;
	private String store_intro;
	private String store_time;
	private String store_addr;
	private String sf_path;
	
	// 공지사항용 변수
	private String NT_NO;
	private String NT_TITLE;
	private String NT_CONTENT;
	private String USERNAME;
	private Date NT_REGITDATE;
	// 공지사항 이미지용 변수
	private String BF_NO;
	private String BF_PATH;
	
	public MainDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MainDTO(String sa_no, String store_id, String sa_avg, String user_id, String username, String good,
			String rv_no, String rv_title, String rv_content, String menu_no, String rf_path, String rownum,
			String menu_name, String u_nick, String store_name, String store_intro, String store_time,
			String store_addr, String sf_path, String nT_NO, String nT_TITLE, String nT_CONTENT, String uSERNAME2,
			Date nT_REGITDATE, String bF_NO, String bF_PATH) {
		super();
		this.sa_no = sa_no;
		this.store_id = store_id;
		this.sa_avg = sa_avg;
		this.user_id = user_id;
		this.username = username;
		this.good = good;
		this.rv_no = rv_no;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.menu_no = menu_no;
		this.rf_path = rf_path;
		this.rownum = rownum;
		this.menu_name = menu_name;
		this.u_nick = u_nick;
		this.store_name = store_name;
		this.store_intro = store_intro;
		this.store_time = store_time;
		this.store_addr = store_addr;
		this.sf_path = sf_path;
		NT_NO = nT_NO;
		NT_TITLE = nT_TITLE;
		NT_CONTENT = nT_CONTENT;
		USERNAME = uSERNAME2;
		NT_REGITDATE = nT_REGITDATE;
		BF_NO = bF_NO;
		BF_PATH = bF_PATH;
	}

	public String getSa_no() {
		return sa_no;
	}

	public void setSa_no(String sa_no) {
		this.sa_no = sa_no;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getSa_avg() {
		return sa_avg;
	}

	public void setSa_avg(String sa_avg) {
		this.sa_avg = sa_avg;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGood() {
		return good;
	}

	public void setGood(String good) {
		this.good = good;
	}

	public String getRv_no() {
		return rv_no;
	}

	public void setRv_no(String rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public String getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}

	public String getRf_path() {
		return rf_path;
	}

	public void setRf_path(String rf_path) {
		this.rf_path = rf_path;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_intro() {
		return store_intro;
	}

	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}

	public String getStore_time() {
		return store_time;
	}

	public void setStore_time(String store_time) {
		this.store_time = store_time;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getSf_path() {
		return sf_path;
	}

	public void setSf_path(String sf_path) {
		this.sf_path = sf_path;
	}

	public String getNT_NO() {
		return NT_NO;
	}

	public void setNT_NO(String nT_NO) {
		NT_NO = nT_NO;
	}

	public String getNT_TITLE() {
		return NT_TITLE;
	}

	public void setNT_TITLE(String nT_TITLE) {
		NT_TITLE = nT_TITLE;
	}

	public String getNT_CONTENT() {
		return NT_CONTENT;
	}

	public void setNT_CONTENT(String nT_CONTENT) {
		NT_CONTENT = nT_CONTENT;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public Date getNT_REGITDATE() {
		return NT_REGITDATE;
	}

	public void setNT_REGITDATE(Date nT_REGITDATE) {
		NT_REGITDATE = nT_REGITDATE;
	}

	public String getBF_NO() {
		return BF_NO;
	}

	public void setBF_NO(String bF_NO) {
		BF_NO = bF_NO;
	}

	public String getBF_PATH() {
		return BF_PATH;
	}

	public void setBF_PATH(String bF_PATH) {
		BF_PATH = bF_PATH;
	}

	
}
