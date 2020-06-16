package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public List<StoreDTO> getStoreInfo(Map map);
	public int getReviewCount(Map map);
	public List<FoodMenuDTO> getFoodMenu(Map map);
	public List<StoreIMGDTO> getStoreIMG(Map map);
	public List<FoodIMGDTO> getFoodIMG(String menu_no);
	public int updateStoreAvg(Map map);
	public float getStoreAvg(Map map);
	public int updateStoreRecommand(Map map);
	public int getStoreThumb(Map map);
	public int isThumb(Map map);
}