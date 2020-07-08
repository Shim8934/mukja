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

/*********************************************************/
   @Override
   public UsersDTO getMyInfo(Map map) {
      return dao.getMyInfo(map);
   }
/*********************************************************/
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

   
	/*********************************************************/   
	
	@Override
	public List<MyPageDTO> getMyReview(Map map) {
		return dao.getMyReview(map);
	}
	@Override
	public List<MyPageDTO> getMyReviewPics(Map map) {
		return dao.getMyReviewPics(map);
	}
	/*********************************************************/   
	
	/*********************************************************/   
	
//	@Override
//	public List<MyPageDTO> getETList(Map map) {
//		return dao.getETList(map);
//	}
//	@Override
//	public List<MyPageDTO> getETtends(Map map) {
//		return dao.getETtends(map);
//	}
//	@Override
//	public List<UsersDTO> getUsersNks(Map map) {
//		return dao.getUsersNks(map);
//	}	
//	@Override
//	public List<MyPageDTO> getETNames(Map map) {
//		return dao.getETNames(map);
//	}	
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
	public List<MyPageDTO> getNicks1(Map map) {
		return dao.getNicks1(map);
	}
	/*********************************************************/   
//   @Override
//   public List<MyPageDTO> getMyETAppc(Map map) {
//      return dao.getMyETAppc(map);
//   }
//   
//   @Override
//	public List<MyPageDTO> getFriendRecv(Map map) {
//		return dao.getFriendRecv(map);
//	}
//
//   @Override
//   public List<MyPageDTO> getMyETHistory(Map map) {
//      return dao.getMyETHistory(map);
//   }
	
/*------------------------페이징------------------------------*/


	
	
	@Override
	public int getMyJjimTotal(Map map) {		
		return dao.getMyJjimTotal(map);
	}
	
	@Override
	public int getMyReviewTotal(Map map) {
		return dao.getMyReviewTotal(map);
	}	
//
//	@Override
//	public int getMyETAppcTotal(Map map) {
//		return dao.getMyETAppcTotal(map);
//	}
//
//	@Override
//	public int getMyETHistTotal(Map map) {
//		return dao.getMyETHistTotal(map);
//	}
//   
//   @Override
//	public boolean isLogin(Map map) {
//		return dao.isLogin(map);
//	}
//
//	@Override
//	public List<MyPageDTO> selectList(Map map) {
//		return dao.selectList(map);
//	}
//
//
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

	@Override
	public int updateMyInfo(Map map) {
		return dao.updateMyInfo(map);
	}

	@Override
	public UsersDTO getOneInfo(Map map) {
		return dao.getOneInfo(map);
	}

	
}