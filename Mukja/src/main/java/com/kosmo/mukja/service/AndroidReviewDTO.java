package com.kosmo.mukja.service;

import java.sql.Date;

public class AndroidReviewDTO {
	//store review
		private int rv_no;	
		private String rv_title;
		private String rv_content;
		private Date rv_postdate;
		private int menu_no;
		private String u_nick;
		private String u_img;
		private String username;
		private String menu_name;
		
		public AndroidReviewDTO() {
		}
		
		public AndroidReviewDTO(int rv_no, String rv_title, String rv_content,String u_nick,String  u_img, Date rv_postdate, int menu_no,String username) {
			this.rv_no = rv_no;
			this.rv_title = rv_title;
			this.rv_content = rv_content;
			this.rv_postdate = rv_postdate;
			this.menu_no = menu_no;
			this.u_nick = u_nick;
			this.u_nick =  u_img;
			this.username= username;
		}
		
		public String getMenu_name() {
			return menu_name;
		}
		public void setMenu_name(String menu_name) {
			this.menu_name = menu_name;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getU_img() {
			return u_img;
		}
		public void setU_img(String u_img) {
			this.u_img = u_img;
		}
		public int getRv_no() {
			return rv_no;
		}
		public void setRv_no(int rv_no) {
			this.rv_no = rv_no;
		}
		
		
		public String getU_nick() {
			return u_nick;
		}
		public void setU_nick(String u_nick) {
			this.u_nick = u_nick;
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
		
		
}
