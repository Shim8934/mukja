package com.kosmo.mukja.service;

import java.sql.Date;

public class MyPageDTO {
	private String username;
	private String password;
	/*added*/
	private String u_nick;
	private String user_id;
	private int count;


	//찜스토어
	private int er_no;
	private String er_master;
	private String er_title;
	private String er_content;
	private String er_time;
	private String er_tend;	
	private int er_max;	
	private Date er_postdate;
	
	//er_members
	private Date erjoin_date;
	private int erjoin_num;
	private int erjoin_role;
	private int erc_no;	
	
	//friend-list
	private String fl_send;
	private String fl_recv;
	private Date fl_regidate;
	private int fl_status;	
	private int fl_no;	
	
	//MY_STORELIST
	private String store_name;
	private Date ms_postdate;
	private String ms_comment;
	private String user_email;	
	private int ms_no;	
	private String menu_name;
	
	//store review
	private int rv_no;	
	private String rv_title;
	private String rv_content;
	private Date rv_postdate;
	private int menu_no;
	
	
	//review_file
	private String rf_path;
	private int rf_no;

	
	public MyPageDTO() {
	}


	
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public Number getEr_no() {
		return er_no;
	}

	public void setEr_no(int er_no) {
		this.er_no = er_no;
	}

	public String getEr_master() {
		return er_master;
	}

	public void setEr_master(String er_master) {
		this.er_master = er_master;
	}

	public String getEr_title() {
		return er_title;
	}

	public void setEr_title(String er_title) {
		this.er_title = er_title;
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


	public int getEr_max() {
		return er_max;
	}


	public void setEr_max(int er_max) {
		this.er_max = er_max;
	}


	public Date getEr_postdate() {
		return er_postdate;
	}


	public void setEr_postdate(Date er_postdate) {
		this.er_postdate = er_postdate;
	}


	public Date getErjoin_date() {
		return erjoin_date;
	}


	public void setErjoin_date(Date erjoin_date) {
		this.erjoin_date = erjoin_date;
	}


	public int getErjoin_num() {
		return erjoin_num;
	}


	public void setErjoin_num(int erjoin_num) {
		this.erjoin_num = erjoin_num;
	}


	public int getErjoin_role() {
		return erjoin_role;
	}


	public void setErjoin_role(int erjoin_role) {
		this.erjoin_role = erjoin_role;
	}


	public int getErc_no() {
		return erc_no;
	}


	public void setErc_no(int erc_no) {
		this.erc_no = erc_no;
	}


	public String getFl_send() {
		return fl_send;
	}


	public void setFl_send(String fl_send) {
		this.fl_send = fl_send;
	}


	public String getFl_recv() {
		return fl_recv;
	}


	public void setFl_recv(String fl_recv) {
		this.fl_recv = fl_recv;
	}


	public Date getFl_regidate() {
		return fl_regidate;
	}


	public void setFl_regidate(Date fl_regidate) {
		this.fl_regidate = fl_regidate;
	}


	public int getFl_status() {
		return fl_status;
	}


	public void setFl_status(int fl_status) {
		this.fl_status = fl_status;
	}


	public int getFl_no() {
		return fl_no;
	}


	public void setFl_no(int fl_no) {
		this.fl_no = fl_no;
	}


	public String getStore_name() {
		return store_name;
	}


	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public Date getMs_postdate() {
		return ms_postdate;
	}


	public void setMs_postdate(Date ms_postdate) {
		this.ms_postdate = ms_postdate;
	}


	public String getMs_comment() {
		return ms_comment;
	}


	public void setMs_comment(String ms_comment) {
		this.ms_comment = ms_comment;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public int getMs_no() {
		return ms_no;
	}


	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}


	public int getRv_no() {
		return rv_no;
	}


	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}


	public String getRv_title() {
		return rv_title;
	}


	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}


	public String getRv_content() {
		return rv_content;
	}


	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}


	public Date getRv_postdate() {
		return rv_postdate;
	}


	public void setRv_postdate(Date rv_postdate) {
		this.rv_postdate = rv_postdate;
	}


	public int getMenu_no() {
		return menu_no;
	}


	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}



	public String getMenu_name() {
		return menu_name;
	}



	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}




	public MyPageDTO(String username, String password, String u_nick, String user_id, int er_no, String er_master, String er_title,
			String er_content, String er_time, String er_tend, int er_max, Date er_postdate, Date erjoin_date,
			int erjoin_num, int erjoin_role, int erc_no, String fl_send, String fl_recv, Date fl_regidate,
			int fl_status, int fl_no, String store_name, Date ms_postdate, String ms_comment, String user_email,
			int ms_no, int rv_no, String rv_title, String rv_content, Date rv_postdate, int menu_no, String rf_path,
			int rf_no, int count, String menu_name) {
		super();
		this.username = username;
		this.password = password;
		this.u_nick = u_nick;
		this.user_id = user_id;
		this.er_no = er_no;
		this.er_master = er_master;
		this.er_title = er_title;
		this.er_content = er_content;
		this.er_time = er_time;
		this.er_tend = er_tend;
		this.er_max = er_max;
		this.er_postdate = er_postdate;
		this.erjoin_date = erjoin_date;
		this.erjoin_num = erjoin_num;
		this.erjoin_role = erjoin_role;
		this.erc_no = erc_no;
		this.fl_send = fl_send;
		this.fl_recv = fl_recv;
		this.fl_regidate = fl_regidate;
		this.fl_status = fl_status;
		this.fl_no = fl_no;
		this.store_name = store_name;
		this.ms_postdate = ms_postdate;
		this.ms_comment = ms_comment;
		this.user_email = user_email;
		this.ms_no = ms_no;
		this.rv_no = rv_no;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_postdate = rv_postdate;
		this.menu_no = menu_no;
		this.rf_path = rf_path;
		this.rf_no = rf_no;
		this.count = count;
		this.menu_name = menu_name;
	}


}	