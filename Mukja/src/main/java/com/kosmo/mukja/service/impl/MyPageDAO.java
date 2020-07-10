package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.MyPageService;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.UsersDTO;

@Repository("myPageDAO")
public class MyPageDAO implements MyPageService {
	@Resource(name = "template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public UsersDTO getMyInfo(Map map) {
		System.out.println(map.get("user_id"));
		return sqlMapper.selectOne("getMyInfo", map);
	}
	
	@Override
	public int updateMyInfo(Map map) {
		return sqlMapper.update("updateMyInfo",map);
	}

	
	
	
	 @Override 
	 public List<MyPageDTO> getMyJjim(Map map) { 
		 return sqlMapper.selectList("getMyJjim",map); 
	}	 
	 @Override 
	 public List<StoreDTO> getJjimInfo(Map map) { 
		 return sqlMapper.selectList("getJjimInfo",map); 
	} 
	
	 @Override 
	 public List<StoreIMGDTO> getJjimImgs(Map map) { 
		 return sqlMapper.selectList("getJjimImgs",map); 
	}

	 
	 
	 
	@Override
	public List<MyPageDTO> getMyReview(Map map) {
		return sqlMapper.selectList("getMyReview",map);
	}

	@Override
	public List<MyPageDTO> getMyReviewPics(Map map) {
		return sqlMapper.selectList("getMyReviewPics",map);
	}
	

	@Override
	public MyPageDTO getMyReviewForUpdate(Map map) {
		System.out.println("리뷰dao");
		return sqlMapper.selectOne("getMyReviewForUpdate",map);
	}

	@Override
	public MyPageDTO getMyReviewPicForUpdate(Map map) {
		return sqlMapper.selectOne("getMyReviewPicForUpdate",map);
	}

	@Override
	public List<StoreDTO> getMenu(Map map) {
		return sqlMapper.selectList("getMenu",map);
	}

	@Override
	public int updateMyReview(Map map) {
		return sqlMapper.update("updateMyReview",map);
	}
	@Override
	public int deleteMyReview(Map map) {
		return sqlMapper.delete("deleteMyReview",map);
	}
	
	
	 
	
	@Override
	public List<MyPageDTO> getETrecv0(Map map) {
		return sqlMapper.selectList("getETrecv0",map);
	}
	@Override
	public List<MyPageDTO> getETrecv1(Map map) {
		return sqlMapper.selectList("getETrecv1",map);
	}
	@Override
	public List<MyPageDTO> getNicks(Map map) {
		return sqlMapper.selectList("getNicks",map);
	}
	@Override
	public List<MyPageDTO> getInCount(Map map) {
		return sqlMapper.selectList("getInCount",map);
	}


	
	@Override
	public int er_Accept(Map map) {
		return sqlMapper.update("er_Accept",map);
	}
	
	@Override
	public int er_Reject(Map map) {
		return sqlMapper.update("er_Reject",map);
	}
	@Override
	public int getMyJjimTotal(Map map) {
		return sqlMapper.selectOne("getMyJjimTotal",map);
	}
	@Override
	public int getMyReviewTotal(Map map) {
		return sqlMapper.selectOne("getMyReviewTotal",map);
	}
	@Override
	public int getMyETApplTotal(Map map) {
		return sqlMapper.selectOne("getMyETApplTotal",map);
	}
	@Override
	public int getMyETHistTotal(Map map) {
		return sqlMapper.selectOne("getMyETHistTotal",map);
	}

	




}