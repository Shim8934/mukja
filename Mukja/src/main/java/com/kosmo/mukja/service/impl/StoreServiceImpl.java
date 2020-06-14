package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreService;

@Service("StoreInfoService")
public class StoreServiceImpl implements StoreService{
	@Resource(name = "storeDAO")
	private StoreDAO dao;
	
	@Override
	public List<StoreDTO> getStoreInfo(Map map) {
		return dao.getStoreInfo(map);
	}

	@Override
	public int getReviewCount(Map map) {
		System.out.println("dao:"+dao);
		int result=dao.getReviewCount(map);
		System.out.println("result : "+result);
		return result;
	}

	@Override
	public List<FoodMenuDTO> getFoodMenu(Map map) {
		return dao.getFoodMenu(map);
	}
	
}
