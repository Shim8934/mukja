package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.MyPageService;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.UsersDTO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Resource(name = "myPageDAO")
	private MyPageDAO dao;


   @Override
   public UsersDTO getMyInfo(Map map) {
      return dao.getMyInfo(map);
   }

	@Override
	public int updateMyInfo(Map map) {
		return dao.updateMyInfo(map);
	}

	
   
   
   @Override
   public List<MyPageDTO> getMyJjim(Map map) {
      return dao.getMyJjim(map);
   }

   @Override
   public List<StoreDTO> getJjimInfo(Map map) {
      return dao.getJjimInfo(map);
   }
	@Override
	public List<StoreIMGDTO> getJjimImgs(Map map) {
		return dao.getJjimImgs(map);
	}

	@Override
	public int deleteMyJjim(Map map) {
		return dao.deleteMyJjim(map);
	}

	
	@Override
	public List<MyPageDTO> getMyReview(Map map) {
		return dao.getMyReview(map);
	}
	@Override
	public List<MyPageDTO> getMyReviewPics(Map map) {
		return dao.getMyReviewPics(map);
	}
	@Override
	public int updateMyReview(Map map) {
		return dao.updateMyReview(map);
	}
	@Override
	public int deleteMyReview(Map map) {
		return dao.deleteMyReview(map);
	}
	@Override
	public int deleteMyReviewPic(Map map) {
		return dao.deleteMyReviewPic(map);
	}
	@Override
	public int deleteMyReviewThumb(Map map) {
		return dao.deleteMyReviewThumb(map);
	}
	
	@Override
	public MyPageDTO getMyReviewForUpdate(Map map) {
		return dao.getMyReviewForUpdate(map);
	}

	@Override
	public MyPageDTO getMyReviewPicForUpdate(Map map) {
		return dao.getMyReviewPicForUpdate(map);
	}

	@Override
	public List<StoreDTO> getMenu(Map map) {
		return dao.getMenu(map);
	}

	
	
	@Override
	public List<MyPageDTO> getETrecv0(Map map) {
		return dao.getETrecv0(map);
	}
	@Override
	public List<MyPageDTO> getNicks(Map map) {
		return dao.getNicks(map);
	}
	@Override
	public List<MyPageDTO> getETrecv1(Map map) {
		return dao.getETrecv1(map);
	}
	@Override
	public List<MyPageDTO> getInCount(Map map) {
		return dao.getInCount(map);
	}
	

	@Override
	public int er_Accept(Map map) {
		return dao.er_Accept(map);
	}

	@Override
	public int er_Reject(Map map) {
		return dao.er_Reject(map);
	}

	
	
	@Override
	public int getMyJjimTotal(Map map) {		
		return dao.getMyJjimTotal(map);
	}
	
	@Override
	public int getMyReviewTotal(Map map) {
		return dao.getMyReviewTotal(map);
	}	

	@Override
	public int getMyETApplTotal(Map map) {
		return dao.getMyETApplTotal(map);
	}

	@Override
	public int getMyETHistTotal(Map map) {
		return dao.getMyETHistTotal(map);
	}

	@Override
	public int updateMyReviewPic(Map map) {
		return dao.updateMyReviewPic(map);
	}

	@Override
	public int deleteMyEM(Map map) {
		return dao.deleteMyEM(map);
	}
	@Override
	public int deleteMyER(Map map) {
		return dao.deleteMyER(map);
	}

	@Override
	public int deleteMyERC(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteMyERC(map);
	}


	
	
//	@Override
//	public MyPageDTO selectOne(Map map) {
//		return dao.selectOne(map);
//	}
//	
//	@Override
//	public MyPageDTO selectPrev(Map map) {
//		return dao.selectPrev(map);
//	}
//
//	@Override
//	public MyPageDTO selectNext(Map map) {
//		return dao.selectNext(map);
//	}
//

}