package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

import com.kosmo.mukja.service.MyPageDTO;

public interface MyPageService {

	//로그인 용]
//	boolean isLogin(Map map);
	//목록용]
//	List<MyPageDTO> selectList(Map map);
	
	
	public UsersDTO getMyInfo(Map map);
	
	public List<MyPageDTO> getMyJjim(Map map);
	public List<StoreDTO> getJjimInfo(Map map);
	public List<StoreIMGDTO> getJjimImgs(Map map);

	public List<MyPageDTO> getMyReview(Map map);	
	public List<MyPageDTO> getMyReviewPics (Map map);

//	public List<MyPageDTO> getETList(Map map);
//	public List<MyPageDTO> getETtends(Map map);
//	public List<MyPageDTO> getETNames(Map map);
//	public List<UsersDTO> getUsersNks(Map map);
	
	public List<MyPageDTO> getETrecv0(Map map);
	public List<MyPageDTO> getNicks(Map map);	
	public List<MyPageDTO> getETrecv1(Map map);
	public List<MyPageDTO> getNicks1(Map map);	
	
//	public List<MyPageDTO> getMyETAppc(Map map);
//	public List<MyPageDTO> getFriendRecv(Map map);
//	
//	public List<MyPageDTO> getMyETHistory(Map map);
//	
//	//전체 레코드 수]
	int getMyJjimTotal(Map map);
	int getMyReviewTotal(Map map);
//	int getMyETAppcTotal(Map map);
//	int getMyETHistTotal(Map map);
//	
//		//상세보기용]
//	MyPageDTO selectOne(Map map);
//	MyPageDTO selectPrev(Map map);
//	MyPageDTO selectNext(Map map);

}
