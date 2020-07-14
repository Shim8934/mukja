package com.kosmo.mukja.service;

public class FoodMenuDTO {
	
	private String menu_no;
	private String menu_name;
	private String menu_tend;
	private String menu_info;
	private String menu_regidate;
	private String username;
	private String menu_price;
	private String fm_path;
	public FoodMenuDTO() {
	}
	public FoodMenuDTO(String menu_no, String menu_name, String menu_tend, String menu_info, String menu_regidate,
			String username, String menu_price) {
		this.menu_no = menu_no;
		this.menu_name = menu_name;
		this.menu_tend = menu_tend;
		this.menu_info = menu_info;
		this.menu_regidate = menu_regidate;
		this.username = username;
		this.menu_price = menu_price;
	}
	
	
	public String getFm_path() {
		return fm_path;
	}


	public void setFm_path(String fm_path) {
		this.fm_path = fm_path;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	@Override
	public String toString() {
		return "FoodMenuDTO [menu_no=" + menu_no + ", menu_name=" + menu_name + ", menu_tend=" + menu_tend
				+ ", menu_info=" + menu_info + ", menu_regidate=" + menu_regidate + ", username=" + username
				+ ", menu_price=" + menu_price + "]";
	}
	
	
	
}
