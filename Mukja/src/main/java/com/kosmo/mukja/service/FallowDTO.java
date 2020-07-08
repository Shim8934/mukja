package com.kosmo.mukja.service;

public class FallowDTO {
	private String ms_no;
	private String store_name;
	private String username;
	private String ms_postdate;
	private String sf_path;
	public String getMs_no() {
		return ms_no;
	}
	public void setMs_no(String ms_no) {
		this.ms_no = ms_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getMs_postdate() {
		return ms_postdate;
	}
	public void setMs_postdate(String ms_postdate) {
		this.ms_postdate = ms_postdate;
	}
	public String getSf_path() {
		return sf_path;
	}
	public void setSf_path(String sf_path) {
		this.sf_path = sf_path;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public FallowDTO(String ms_no, String store_name, String ms_postdate, String sf_path,String username) {
		this.ms_no = ms_no;
		this.store_name = store_name;
		this.ms_postdate = ms_postdate;
		this.sf_path = sf_path;
		this.username = username;
	}
	public FallowDTO() {
	}
	
	
	


}
