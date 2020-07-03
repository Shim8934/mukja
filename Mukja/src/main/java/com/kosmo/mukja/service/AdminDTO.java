package com.kosmo.mukja.service;

import java.sql.Date;

public class AdminDTO {
	
	// 공지사항용 변수
	private String NT_NO;
	private String NT_TITLE;
	private String NT_CONTENT;
	private String USERNAME;
	private Date NT_REGITDATE;
	// 공지사항 이미지용 변수
	private String BF_NO;
	private String BF_PATH;
	
	// 유저신고게시판 변수
	private String UR_NO;
	private String UR_TITLE;
	private String UR_CONTENT;
	private String UR_TARGET;
	private String UR_REPORTER;
	private Date UR_REGIDATE;
	private String UR_TYPE;
	
	// 관리자 로그인 정보용 변수
	private String enabled; // 신고에서 유저 enabled 동시 활용
	private String admin_role;
	private String authority;
	
	// 제휴 승인용(스토어 변수)	
	private String store_NAME;
	private String store_REGINUM;
	private String store_PHNUM;
	private String store_EMAIL;
	private String store_INTRO;
	private String store_ADDR;
	private double store_LAT;
	private double store_LNG;
	
	// 신고 관리용 유저 및 스토어
	private String username; // 스토어도 같이 씀
	private String username_1;
	private String username_2;
	private String store_name1;
	private String store_name2;
	
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminDTO(String nT_NO, String nT_TITLE, String nT_CONTENT, String uSERNAME, Date nT_REGITDATE, String bF_NO,
			String bF_PATH, String uR_NO, String uR_TITLE, String uR_CONTENT, String uR_TARGET, String uR_REPORTER,
			Date uR_REGIDATE, String uR_TYPE, String enabled, String admin_role, String authority, String store_NAME,
			String store_REGINUM, String store_PHNUM, String store_EMAIL, String store_INTRO, String store_ADDR,
			double store_LAT, double store_LNG, String username2, String username_1, String username_2,
			String store_name1, String store_name2) {
		super();
		NT_NO = nT_NO;
		NT_TITLE = nT_TITLE;
		NT_CONTENT = nT_CONTENT;
		USERNAME = uSERNAME;
		NT_REGITDATE = nT_REGITDATE;
		BF_NO = bF_NO;
		BF_PATH = bF_PATH;
		UR_NO = uR_NO;
		UR_TITLE = uR_TITLE;
		UR_CONTENT = uR_CONTENT;
		UR_TARGET = uR_TARGET;
		UR_REPORTER = uR_REPORTER;
		UR_REGIDATE = uR_REGIDATE;
		UR_TYPE = uR_TYPE;
		this.enabled = enabled;
		this.admin_role = admin_role;
		this.authority = authority;
		this.store_NAME = store_NAME;
		this.store_REGINUM = store_REGINUM;
		this.store_PHNUM = store_PHNUM;
		this.store_EMAIL = store_EMAIL;
		this.store_INTRO = store_INTRO;
		this.store_ADDR = store_ADDR;
		this.store_LAT = store_LAT;
		this.store_LNG = store_LNG;
		username = username2;
		this.username_1 = username_1;
		this.username_2 = username_2;
		this.store_name1 = store_name1;
		this.store_name2 = store_name2;
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

	public String getUR_NO() {
		return UR_NO;
	}

	public void setUR_NO(String uR_NO) {
		UR_NO = uR_NO;
	}

	public String getUR_TITLE() {
		return UR_TITLE;
	}

	public void setUR_TITLE(String uR_TITLE) {
		UR_TITLE = uR_TITLE;
	}

	public String getUR_CONTENT() {
		return UR_CONTENT;
	}

	public void setUR_CONTENT(String uR_CONTENT) {
		UR_CONTENT = uR_CONTENT;
	}

	public String getUR_TARGET() {
		return UR_TARGET;
	}

	public void setUR_TARGET(String uR_TARGET) {
		UR_TARGET = uR_TARGET;
	}

	public String getUR_REPORTER() {
		return UR_REPORTER;
	}

	public void setUR_REPORTER(String uR_REPORTER) {
		UR_REPORTER = uR_REPORTER;
	}

	public Date getUR_REGIDATE() {
		return UR_REGIDATE;
	}

	public void setUR_REGIDATE(Date uR_REGIDATE) {
		UR_REGIDATE = uR_REGIDATE;
	}

	public String getUR_TYPE() {
		return UR_TYPE;
	}

	public void setUR_TYPE(String uR_TYPE) {
		UR_TYPE = uR_TYPE;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getAdmin_role() {
		return admin_role;
	}

	public void setAdmin_role(String admin_role) {
		this.admin_role = admin_role;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getStore_NAME() {
		return store_NAME;
	}

	public void setStore_NAME(String store_NAME) {
		this.store_NAME = store_NAME;
	}

	public String getStore_REGINUM() {
		return store_REGINUM;
	}

	public void setStore_REGINUM(String store_REGINUM) {
		this.store_REGINUM = store_REGINUM;
	}

	public String getStore_PHNUM() {
		return store_PHNUM;
	}

	public void setStore_PHNUM(String store_PHNUM) {
		this.store_PHNUM = store_PHNUM;
	}

	public String getStore_EMAIL() {
		return store_EMAIL;
	}

	public void setStore_EMAIL(String store_EMAIL) {
		this.store_EMAIL = store_EMAIL;
	}

	public String getStore_INTRO() {
		return store_INTRO;
	}

	public void setStore_INTRO(String store_INTRO) {
		this.store_INTRO = store_INTRO;
	}

	public String getStore_ADDR() {
		return store_ADDR;
	}

	public void setStore_ADDR(String store_ADDR) {
		this.store_ADDR = store_ADDR;
	}

	public double getStore_LAT() {
		return store_LAT;
	}

	public void setStore_LAT(double store_LAT) {
		this.store_LAT = store_LAT;
	}

	public double getStore_LNG() {
		return store_LNG;
	}

	public void setStore_LNG(double store_LNG) {
		this.store_LNG = store_LNG;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername_1() {
		return username_1;
	}

	public void setUsername_1(String username_1) {
		this.username_1 = username_1;
	}

	public String getUsername_2() {
		return username_2;
	}

	public void setUsername_2(String username_2) {
		this.username_2 = username_2;
	}

	public String getStore_name1() {
		return store_name1;
	}

	public void setStore_name1(String store_name1) {
		this.store_name1 = store_name1;
	}

	public String getStore_name2() {
		return store_name2;
	}

	public void setStore_name2(String store_name2) {
		this.store_name2 = store_name2;
	}
	
}///// class AdminDTO
