package com.kosmo.mukja.service;

public class ErcDTO {
	private String er_no;
	private String username;
	private String erjoin_date;
	private String erjoin_num;
	private String erjoin_role;
	private String erc_no;
	private String er_master;
	private String store_id;
	private String er_title;
	private String er_content;
	private String er_time;
	private String er_tend;
	private String er_max;
	private String er_postdate;
	public ErcDTO() {}
	public ErcDTO(String er_no, String username, String erjoin_date, String erjoin_num, String erjoin_role,
			String erc_no, String er_master, String store_id, String er_content, String er_time, String er_tend,
			String er_max, String er_postdate, String er_title) {
		this.er_no = er_no;
		this.username = username;
		this.erjoin_date = erjoin_date;
		this.erjoin_num = erjoin_num;
		this.erjoin_role = erjoin_role;
		this.erc_no = erc_no;
		this.er_master = er_master;
		this.store_id = store_id;
		this.er_content = er_content;
		this.er_time = er_time;
		this.er_tend = er_tend;
		this.er_max = er_max;
		this.er_postdate = er_postdate;
		this.er_title = er_title;
	}
	public String getEr_no() {
		return er_no;
	}
	public void setEr_no(String er_no) {
		this.er_no = er_no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getErjoin_date() {
		return erjoin_date;
	}
	public void setErjoin_date(String erjoin_date) {
		this.erjoin_date = erjoin_date;
	}
	public String getErjoin_num() {
		return erjoin_num;
	}
	public void setErjoin_num(String erjoin_num) {
		this.erjoin_num = erjoin_num;
	}
	public String getErjoin_role() {
		return erjoin_role;
	}
	public void setErjoin_role(String erjoin_role) {
		this.erjoin_role = erjoin_role;
	}
	public String getErc_no() {
		return erc_no;
	}
	public void setErc_no(String erc_no) {
		this.erc_no = erc_no;
	}
	public String getEr_master() {
		return er_master;
	}
	public void setEr_master(String er_master) {
		this.er_master = er_master;
	}
	public String getstore_id() {
		return store_id;
	}
	public void setstore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getEr_content() {
		return er_content;
	}
	public void setEr_content(String er_content) {
		this.er_content = er_content;
	}
	public String getEr_time() {
		return er_time;
	}
	public void setEr_time(String er_time) {
		this.er_time = er_time;
	}
	public String getEr_tend() {
		return er_tend;
	}
	public void setEr_tend(String er_tend) {
		this.er_tend = er_tend;
	}
	public String getEr_max() {
		return er_max;
	}
	public void setEr_max(String er_max) {
		this.er_max = er_max;
	}
	public String getEr_postdate() {
		return er_postdate;
	}
	public void setEr_postdate(String er_postdate) {
		this.er_postdate = er_postdate;
	}
	public String getEr_title() {
		return er_title;
	}
	public void setEr_title(String er_title) {
		this.er_title = er_title;
	}
	@Override
	public String toString() {
		return "ErcDTO [er_no=" + er_no + ", username=" + username + ", erjoin_date=" + erjoin_date + ", erjoin_num="
				+ erjoin_num + ", erjoin_role=" + erjoin_role + ", erc_no=" + erc_no + ", er_master=" + er_master
				+ ", store_id=" + store_id + ", er_content=" + er_content + ", er_time=" + er_time + ", er_tend="
				+ er_tend + ", er_max=" + er_max + ", er_postdate=" + er_postdate +  ", er_title=" + er_title + "]";
	}
	
	
	
	
}
