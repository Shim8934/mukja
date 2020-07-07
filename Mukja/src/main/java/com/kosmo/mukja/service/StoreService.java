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
	public TableDTO getTable (Map map);
	public int updateTableInfo(Map map);
	public List<StoreDTO> selectFoodImg(Map map);
	
	
	/*가게 정보 수정*/
	public int updateStoreInfo(Map map);
	public int updateStoreImg(Map map);
	public int insertStoreImg(Map map);

	
	
	/*리뷰 쓰기*/
	public int insertReview(Map map);
	public int updateReview(Map map);
	public int deleteReview(Map map);
	
	
	/*리뷰 가져오기*/
	public int getStRvTotal(Map map);
	public List<MyPageDTO> getStoreReviewcnt(Map map);
	public List<MyPageDTO> getStoreReviewimg(Map map);
	public List<UsersDTO> getUsersNicks(Map map);;
	
	
	/*리뷰 좋아요*/
	public List<StoreDTO> getRVThumb(Map map) ;
	public int insertRVThumb(Map map) ;
	public int deleteRVThumb(Map map) ;
	
	
}
