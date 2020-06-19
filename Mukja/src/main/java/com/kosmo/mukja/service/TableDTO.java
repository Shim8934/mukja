package com.kosmo.mukja.service;

public class TableDTO {

	private String store_id;
	private String xy_boundary;
	private String xy_data;
	private int wating_count;
	private int avg_wating_time;
	@Override
	public String toString() {
		return "TableDTO [store_id=" + store_id + ", xy_boundary=" + xy_boundary + ", xy_data=" + xy_data
				+ ", wating_count=" + wating_count + ", avg_wating_time=" + avg_wating_time + "]";
	}
	public TableDTO() {
	}
	public TableDTO(String store_id, String xy_boundary, String xy_data, int wating_count, int avg_wating_time) {
		this.store_id = store_id;
		this.xy_boundary = xy_boundary;
		this.xy_data = xy_data;
		this.wating_count = wating_count;
		this.avg_wating_time = avg_wating_time;
	}
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
	public int getWating_count() {
		return wating_count;
	}
	public void setWating_count(int wating_count) {
		this.wating_count = wating_count;
	}
	public int getAvg_wating_time() {
		return avg_wating_time;
	}
	public void setAvg_wating_time(int avg_wating_time) {
		this.avg_wating_time = avg_wating_time;
	}
	
	
	
}
