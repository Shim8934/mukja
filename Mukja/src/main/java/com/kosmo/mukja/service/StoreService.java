package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public List<StoreDTO> getStoreInfo(Map map);
	public int getReviewCount(Map map);
	public List<FoodMenuDTO> getFoodMenu(Map map);
}
