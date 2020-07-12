package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface AndroidService {
	AndroidDTO anIsLogin(AndroidDTO dto);
	List<AndroidReviewDTO> getAndroidReviewList(Map map);
	List<AndroidReviewImgDTO> getAndroidReviewImg(Map map);
	
	List<AndroidReviewDTO> getMyAndroidReviewList(Map map);
	
	UsersDTO getUserInfo(Map map);
	List<FallowDTO> getFallowList(Map map);
	
	
	int deleteAndroidFallow(Map map);
	int deleteAndroidReview(Map map);
	int FallowAndroidReview(Map map);
	
	int androidRequestER_Accept(Map map);
	int androidRequestER_Reject(Map map);
	List<AndroidERDTO> getRequestERList(Map map);
	List<AndroidMyERDTO> getMyRequestERList(Map map);
	
	int boomMyER(Map map);
	int androidDeleteERMembers(Map map);
	
}

