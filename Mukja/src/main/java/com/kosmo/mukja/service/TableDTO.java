package com.kosmo.mukja.service;

public class TableDTO {

	private String store_id;
	private String xy_boundary;
	private String xy_data;
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getXy_boundary() {
		return xy_boundary;
	}
	public void setXy_boundary(String xy_boundary) {
		this.xy_boundary = xy_boundary;
	}
	public String getXy_data() {
		return xy_data;
	}
	public void setXy_data(String xy_data) {
		this.xy_data = xy_data;
	}
	public TableDTO() {
	}
	public TableDTO(String store_id, String xy_boundary, String xy_data) {
		super();
		this.store_id = store_id;
		this.xy_boundary = xy_boundary;
		this.xy_data = xy_data;
	}
	@Override
	public String toString() {
		return "TableDTO [store_id=" + store_id + ", xy_boundary=" + xy_boundary + ", xy_data=" + xy_data + "]";
	}
	
	
}
