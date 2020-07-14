package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public List<StoreDTO> getStoreInfo(Map map);
	public int getReviewCount(Map map);
	
	
	
	public List<FoodMenuDTO> getFoodMenu(Map map);
	public List<StoreIMGDTO> getStoreIMG(Map map);
	public List<FoodIMGDTO> getFoodIMG(String menu_no);
	public List<StoreDTO> selectFoodImg(Map map);
	
	public int updateStoreAvg(Map map);
	public float getStoreAvg(Map map);
	public int updateStoreRecommand(Map map);
	
	public TableDTO getTable (Map map);
	public int updateTableInfo(Map map);
	
	
	/*가게 정보 수정*/
	public int updateStoreInfo(Map map);
	public int updateStoreImg(Map map);
	public int insertStoreImg(Map map);
	

	
	/*가게 좋아요*/
	public int getStoreThumb(Map map);
	public int isThumb(Map map);
	public int insertThumb(Map map) ;
	public int deleteThumb(Map map) ;
	
	/*가게 찜*/
	public int getJjimcount(Map map);
	
	public int isJjim(Map map) ;
	public int insertJjim(Map map) ;
	public int deleteJjim(Map map);
	public int updateStoreJjim(Map map);;
	
	
	
	
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
	public List<MyPageDTO> getBestRV(Map map) ;
	public int insertRVThumb(Map map) ;
	public int deleteRVThumb(Map map) ;
	public int isRVThumb(Map map) ;
	
	

	/*리뷰 수정,삭제*/
	public MyPageDTO getOneReviewForUpdate(Map map);	
	public MyPageDTO getOneReviewPicForUpdate(Map map);
	public List<FoodMenuDTO> getMenu4up(Map map);

	int deleteOneReview(Map map);
	int deleteOneReviewPic(Map map);
	int deleteOneReviewThumb(Map map);
	
	/* 메뉴 수정 */
	public int updateFoodMenu(Map map);
	public int updateFoodImg(Map map);
	
	/* 메뉴 추가 */
	public int insertMoreFoodMenu(Map map);
	public int insertMoreFoodImg(Map map);
	public StoreDTO selectNewMenuNo(Map map);
	
}
