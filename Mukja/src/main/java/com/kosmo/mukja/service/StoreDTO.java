package com.kosmo.mukja.service;

public class StoreDTO {
	private String username;
	private String password;
	private String store_name;
	private String store_regnum;
	private String store_phnum;
	private String store_email;
	private int store_avg;
	private String store_intro;
	private String store_time;
	private double store_lat;
	private double store_lng;
	private String store_role;
	private String enabled;
	private String authority;
	
	private String menu_no;
	private String menu_name;
	private String menu_tend;
	private String menu_info;
	private String menu_regidate;
	private String username_1;
	public StoreDTO(String username, String password, String store_name, String store_regnum, String store_phnum,
			String store_email, int store_avg, String store_intro, String store_time, double store_lat,
			double store_lng, String store_role, String enabled, String authority, String menu_no, String menu_name,
			String menu_tend, String menu_info, String menu_regidate, String username_1) {
		super();
		this.username = username;
		this.password = password;
		this.store_name = store_name;
		this.store_regnum = store_regnum;
		this.store_phnum = store_phnum;
		this.store_email = store_email;
		this.store_avg = store_avg;
		this.store_intro = store_intro;
		this.store_time = store_time;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.store_role = store_role;
		this.enabled = enabled;
		this.authority = authority;
		this.menu_no = menu_no;
		this.menu_name = menu_name;
		this.menu_tend = menu_tend;
		this.menu_info = menu_info;
		this.menu_regidate = menu_regidate;
		this.username_1 = username_1;
	}
	public StoreDTO() {
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public int getStore_avg() {
		return store_avg;
	}
	public void setStore_avg(int store_avg) {
		this.store_avg = store_avg;
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
	public String getStore_role() {
		return store_role;
	}
	public void setStore_role(String store_role) {
		this.store_role = store_role;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
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
	public String getUsername_1() {
		return username_1;
	}
	public void setUsername_1(String username_1) {
		this.username_1 = username_1;
	}
	
}
