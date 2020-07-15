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
	int updateMyInfo(Map map) ;
	public UsersDTO modal(Map map);
	int reportUser(Map map);
	
	
	public List<MyPageDTO> getMyJjim(Map map);
	public List<StoreDTO> getJjimInfo(Map map);
	public List<StoreIMGDTO> getJjimImgs(Map map);
	public int deleteMyJjim(Map map);

	
	
	
	public List<MyPageDTO> getMyReview(Map map);	
	public List<MyPageDTO> getMyReviewPics (Map map);
	int updateMyReview(Map map);
	int updateMyReviewPic(Map map);
	int deleteMyReview(Map map);
	int deleteMyReviewPic(Map map);
	int deleteMyReviewThumb(Map map);
	
	public MyPageDTO getMyReviewForUpdate(Map map);	
	public MyPageDTO getMyReviewPicForUpdate(Map map);
	public List<StoreDTO> getMenu(Map map);

	
	public List<MyPageDTO> getETrecv0(Map map);
	public List<MyPageDTO> getETrecv1(Map map);

	public List<MyPageDTO> getNicks(Map map);	
	public List<MyPageDTO> getInCount(Map map);
	public MyPageDTO get1et1(Map map);	
	public List<UsersDTO> getURN(Map map);	

	
	int er_Accept(Map map);
	int er_Reject(Map map);
	int deleteMyEM(Map map);
	int deleteMyER(Map map);
	int deleteMyERC(Map map);

	//전체 레코드 수]
	int getMyJjimTotal(Map map);
	int getMyReviewTotal(Map map);
	int getMyETApplTotal(Map map);
	int getMyETHistTotal(Map map);

	
	//상세보기용]
//	MyPageDTO selectOne(Map map);
//	MyPageDTO selectPrev(Map map);
//	MyPageDTO selectNext(Map map);
	
	//상세보기용]
//	MyPageDTO selectOne(Map map);
//	MyPageDTO selectPrev(Map map);
//	MyPageDTO selectNext(Map map);
	


}
