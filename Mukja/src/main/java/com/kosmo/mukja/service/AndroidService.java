package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface AndroidService {
	AndroidDTO anIsLogin(AndroidDTO dto);
	//웅
	int createEroom(Map map);
	int getRoomNo(Map map);
	String getRoomMaster(Map map);
	int creatERC(Map map);
	int getERoomCno(Map map);
	int joinERoom(Map map);
	int setupER_role(Map map);
	int selectrool(Map map);
	List<ErcDTO> myERoomCList(Map map);
	
	String getMasterNick(Map map);
	String getMasterimg(Map map);
	StoreDTO getStoreInfos(Map map);

	//범
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
	String ERoomold(Map map);

	
	
	
	
	
	int boomMyER(Map map);
	int androidDeleteERMembers(Map map);
	
}

