package com.kosmo.mukja.service;

public class AndroidReviewImgDTO {
	private String rf_path;
	private int rf_no;
	public AndroidReviewImgDTO(String rf_path, int rf_no) {
		super();
		this.rf_path = rf_path;
		this.rf_no = rf_no;
	}
	public AndroidReviewImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRf_path() {
		return rf_path;
	}
	public void setRf_path(String rf_path) {
		this.rf_path = rf_path;
	}
	public int getRf_no() {
		return rf_no;
	}
	public void setRf_no(int rf_no) {
		this.rf_no = rf_no;
	}
	
	
}
