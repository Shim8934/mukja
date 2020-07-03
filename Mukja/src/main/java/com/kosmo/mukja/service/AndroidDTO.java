package com.kosmo.mukja.service;

import java.sql.Date;

public class AndroidDTO {
	private String username;
	private String password;
	private String u_nick;
	private java.sql.Date u_regidate;
	private String u_img;
	private String u_age;
	private String u_tend;
	private String u_addr;
	private int u_lat;
	private int u_lng;
	private String u_ph;
	private int enabled;
	private String authority;
	
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

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public java.sql.Date getU_regidate() {
		return u_regidate;
	}

	public void setU_regidate(java.sql.Date u_regidate) {
		this.u_regidate = u_regidate;
	}

	public String getU_img() {
		return u_img;
	}

	public void setU_ing(String u_img) {
		this.u_img = u_img;
	}

	public String getU_age() {
		return u_age;
	}

	public void setU_age(String u_age) {
		this.u_age = u_age;
	}

	public String getU_tend() {
		return u_tend;
	}

	public void setU_tend(String u_tend) {
		this.u_tend = u_tend;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public int getU_lat() {
		return u_lat;
	}

	public void setU_lat(int u_lat) {
		this.u_lat = u_lat;
	}

	public int getU_lng() {
		return u_lng;
	}

	public void setU_lng(int u_lng) {
		this.u_lng = u_lng;
	}

	public String getU_ph() {
		return u_ph;
	}

	public void setU_ph(String u_ph) {
		this.u_ph = u_ph;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
}
