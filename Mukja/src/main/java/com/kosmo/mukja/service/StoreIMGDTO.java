package com.kosmo.mukja.service;

public class StoreIMGDTO {
	private String sf_no;
	private String username;
	private String sf_path;
	public StoreIMGDTO() {
	}
	public StoreIMGDTO(String sf_no, String username, String sf_path) {
		this.sf_no = sf_no;
		this.username = username;
		this.sf_path = sf_path;
	}
	public String getSf_no() {
		return sf_no;
	}
	public void setSf_no(String sf_no) {
		this.sf_no = sf_no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSf_path() {
		return sf_path;
	}
	public void setSf_path(String sf_path) {
		this.sf_path = sf_path;
	}
	@Override
	public String toString() {
		return "StoreIMGDTO [sf_no=" + sf_no + ", username=" + username + ", sf_path=" + sf_path + "]";
	}

}
