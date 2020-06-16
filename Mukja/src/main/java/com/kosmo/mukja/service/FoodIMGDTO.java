package com.kosmo.mukja.service;

public class FoodIMGDTO {
	private String menu_no;
	private String fm_path;
	private String fm_no;
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getFm_path() {
		return fm_path;
	}
	public void setFm_path(String fm_path) {
		this.fm_path = fm_path;
	}
	public String getFm_no() {
		return fm_no;
	}
	public void setFm_no(String fm_no) {
		this.fm_no = fm_no;
	}
	@Override
	public String toString() {
		return "FoodIMGDTO [menu_no=" + menu_no + ", fm_path=" + fm_path + ", fm_no=" + fm_no + "]";
	}
	public FoodIMGDTO() {
	}
	public FoodIMGDTO(String menu_no, String fm_path, String fm_no) {
		this.menu_no = menu_no;
		this.fm_path = fm_path;
		this.fm_no = fm_no;
	}
	
	
}
