package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.service.TableDTO;
import com.kosmo.mukja.service.UsersDTO;

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

	@Override
	public List<StoreIMGDTO> getStoreIMG(Map map) {
		return dao.getStoreIMG(map);
	}

	@Override
	public List<FoodIMGDTO> getFoodIMG(String menu_no) {
		return dao.getFoodIMG(menu_no);
	}

	@Override
	public int updateStoreAvg(Map map) {
		return dao.updateStoreAvg(map);
	}

	@Override
	public float getStoreAvg(Map map) {
		return dao.getStoreAvg(map);
	}

	@Override
	public int updateStoreRecommand(Map map) {
		return dao.updateStoreRecommand(map);
	}

	@Override
	public int getStoreThumb(Map map) {
		return dao.getStoreThumb(map);
	}

	@Override
	public int isThumb(Map map) {
		return dao.isThumb(map);
	}

	@Override
	public TableDTO getTable(Map map) {
		return dao.getTable(map);
	}

	@Override
	public int updateTableInfo(Map map) {
		return dao.updateTableInfo(map);
	}

	@Override
	public List<StoreDTO> selectFoodImg(Map map) {
		// TODO Auto-generated method stub
		return dao.selectFoodImg(map);
	}
	
	
	
	
	

	@Override
	public int updateStoreInfo(Map map) {
		// TODO Auto-generated method stub
		return dao.updateStoreInfo(map);
	}

	@Override
	public int updateStoreImg(Map map) {
		// TODO Auto-generated method stub
		return dao.updateStoreImg(map);
	}

	@Override
	public int insertStoreImg(Map map) {
		// TODO Auto-generated method stub
		return dao.insertStoreImg(map);
	}
	
	
	
	
	
	
	
	
	

	@Override
	public int insertReview(Map map) {
		return dao.insertReview(map);
	}

	@Override
	public int updateReview(Map map) {
		return  dao.updateReview(map);
	}

	@Override
	public int deleteReview(Map map) {
		return  dao.deleteReview(map);
	}
	
	
	
	
	
	@Override
	public int getStRvTotal(Map map) {
		return dao.getStRvTotal(map);
	}

	@Override
	public List<MyPageDTO> getStoreReviewcnt(Map map) {
		return dao.getStoreReviewcnt(map);
	}

	@Override
	public List<MyPageDTO> getStoreReviewimg(Map map) {
		return dao.getStoreReviewimg(map);
	}
	
	@Override
	public List<UsersDTO> getUsersNicks(Map map) {
		return dao.getUsersNicks(map);
	}

	
	
	

	@Override
	public List<MyPageDTO> getRVThumb(Map map) {
		return dao.getRVThumb(map);
	}
	@Override
	public int insertRVThumb(Map map) {
		return dao.insertRVThumb(map);
	}
	@Override
	public int deleteRVThumb(Map map) {
		return dao.deleteRVThumb(map);
	}
	
	

	@Override
	public MyPageDTO getOneReviewForUpdate(Map map) {
		return dao.getOneReviewForUpdate(map);
	}

	@Override
	public MyPageDTO getOneReviewPicForUpdate(Map map) {
		return dao.getOneReviewPicForUpdate(map);
	}

	

	@Override
	public List<FoodMenuDTO> getMenu4up(Map map) {
		return dao.getMenu4up(map);
	}

	@Override
	public int deleteOneReview(Map map) {		
		return dao.deleteOneReview(map);
	}

	@Override
	public int deleteOneReviewPic(Map map) {	
		return dao.deleteOneReviewPic(map);
	}

	@Override
	public int deleteOneReviewThumb(Map map) {	
		return dao.deleteOneReviewThumb(map);
	}

	@Override
	public int updateFoodMenu(Map map) {
		// TODO Auto-generated method stub
		return dao.updateFoodMenu(map);
	}

	@Override
	public int updateFoodImg(Map map) {
		// TODO Auto-generated method stub
		return dao.updateFoodImg(map);
	}
	

}
