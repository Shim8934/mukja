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
	private String enabled;
	private String admin_role;
	private String authority;
	
	// 리뷰 관리용 변수(음식점 정보)
	private String store_name;
	private String store_regnum;
	private String store_phnum;
	private String store_email;
	private String store_intro;
	private double store_lat;
	private double store_lng;
	
	// 리뷰 관리 + 같이먹자 관리용 변수(메뉴 정보)
	private String menu_no;
	private String menu_name;
	private String menu_tend;
	private String menu_info;
	private String menu_regidate;
	private java.sql.Date postDate;
	
	// 신고 관리용 유저 및 스토어
	private String username;
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
			Date uR_REGIDATE, String uR_TYPE, String enabled, String admin_role, String authority, String store_name,
			String store_regnum, String store_phnum, String store_email, String store_intro, double store_lat,
			double store_lng, String menu_no, String menu_name, String menu_tend, String menu_info,
			String menu_regidate, Date postDate, String username2, String username_1, String username_2,
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
		this.store_name = store_name;
		this.store_regnum = store_regnum;
		this.store_phnum = store_phnum;
		this.store_email = store_email;
		this.store_intro = store_intro;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.menu_no = menu_no;
		this.menu_name = menu_name;
		this.menu_tend = menu_tend;
		this.menu_info = menu_info;
		this.menu_regidate = menu_regidate;
		this.postDate = postDate;
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

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_regnum() {
		return store_regnum;
	}

	public void setStore_regnum(String store_regnum) {
		this.store_regnum = store_regnum;
	}

	public String getStore_phnum() {
		return store_phnum;
	}

	public void setStore_phnum(String store_phnum) {
		this.store_phnum = store_phnum;
	}

	public String getStore_email() {
		return store_email;
	}

	public void setStore_email(String store_email) {
		this.store_email = store_email;
	}

	public String getStore_intro() {
		return store_intro;
	}

	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}

	public double getStore_lat() {
		return store_lat;
	}

	public void setStore_lat(double store_lat) {
		this.store_lat = store_lat;
	}

	public double getStore_lng() {
		return store_lng;
	}

	public void setStore_lng(double store_lng) {
		this.store_lng = store_lng;
	}

	public String getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_tend() {
		return menu_tend;
	}

	public void setMenu_tend(String menu_tend) {
		this.menu_tend = menu_tend;
	}

	public String getMenu_info() {
		return menu_info;
	}

	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}

	public String getMenu_regidate() {
		return menu_regidate;
	}

	public void setMenu_regidate(String menu_regidate) {
		this.menu_regidate = menu_regidate;
	}

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
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
