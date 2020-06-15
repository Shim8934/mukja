package com.kosmo.mukja.service;

import java.sql.Date;

public class AdminDTO {
	
	// 공지사항용 변수
	private String NT_NO;
	private String NT_TITLE;
	private String NT_CONTENT;
	private String USERNAME;
	private Date NT_REGITDATE;
	private String NT_IMG;
	
	
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
	private String username;
	private String username_1;
	private String username_2;
	
	// 신고 관리용 변수
	
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminDTO(String nT_NO, String nT_TITLE, String nT_CONTENT, String uSERNAME, Date nT_REGITDATE, String nT_IMG,
			String enabled, String admin_role, String authority, String store_name, String store_regnum,
			String store_phnum, String store_email, String store_intro, double store_lat, double store_lng,
			String menu_no, String menu_name, String menu_tend, String menu_info, String menu_regidate, Date postDate,
			String username2, String username_1, String username_2) {
		super();
		NT_NO = nT_NO;
		NT_TITLE = nT_TITLE;
		NT_CONTENT = nT_CONTENT;
		USERNAME = uSERNAME;
		NT_REGITDATE = nT_REGITDATE;
		NT_IMG = nT_IMG;
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

	public String getNT_IMG() {
		return NT_IMG;
	}

	public void setNT_IMG(String nT_IMG) {
		NT_IMG = nT_IMG;
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
		
}///// class AdminDTO
