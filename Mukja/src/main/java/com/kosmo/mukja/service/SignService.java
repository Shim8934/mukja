package com.kosmo.mukja.service;

import java.util.Map;

public interface SignService {
	boolean isLogin(Map map);
	int signup(Map map);
	int storesignup(Map map);
	int foodmenu(Map map);
	UsersDTO idPass(Map map);
	int kakaoidCheck(Map map);
	int storeIdCheck(Map map);
	int userIdCheck(Map map);	
	public FoodMenuDTO getMenuNo(Map map);
	int insertFoodImg(Map map);
	int insertStoreImg22(Map map);
	int updateMyInfo(Map map) ;
	int insertStoreNewTable(Map map);
	UsersDTO getOneInfo(Map map);

}
