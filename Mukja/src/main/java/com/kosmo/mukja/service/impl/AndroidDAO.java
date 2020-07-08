package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidERDTO;
import com.kosmo.mukja.service.AndroidMyERDTO;
import com.kosmo.mukja.service.AndroidReviewDTO;
import com.kosmo.mukja.service.AndroidReviewImgDTO;
import com.kosmo.mukja.service.AndroidService;
import com.kosmo.mukja.service.FallowDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.UsersDTO;


@Repository
public class AndroidDAO implements AndroidService {

	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	//로그인 용]
	@Override
	public AndroidDTO anIsLogin(AndroidDTO dto) {
		return sqlMapper.selectOne("anIsLogin",dto);
	}

	@Override
	public List<AndroidReviewDTO> getAndroidReviewList(Map map) {
		return sqlMapper.selectList("getAndroidReviewList",map);
	}
	@Override
	public List<AndroidReviewImgDTO> getAndroidReviewImg(Map map) {
		return sqlMapper.selectList("getAndroidReviewImg",map);
	}
	@Override
	public UsersDTO getUserInfo(Map map) {
		return sqlMapper.selectOne("getAndroidUserInfo",map);
	}
	@Override
	public List<AndroidReviewDTO> getMyAndroidReviewList(Map map) {
		return sqlMapper.selectList("getMyAndroidReviewList",map);
	}
	@Override
	public int deleteAndroidReview(Map map) {
		return sqlMapper.delete("deleteAndroidReview",map);
	}
	@Override
	public int FallowAndroidReview(Map map) {
		return sqlMapper.insert("FallowAndroidReview",map);
	}
	@Override
	public List<FallowDTO> getFallowList(Map map) {
		return sqlMapper.selectList("getFallowList",map);
	}
	@Override
	public int deleteAndroidFallow(Map map) {
		return sqlMapper.delete("deleteAndroidFallow",map);
	
	}
	@Override
	public List<AndroidERDTO> getRequestERList(Map map) {
		return sqlMapper.selectList("getRequestERList",map);
	}
	
	@Override
	public int androidRequestER_Accept(Map map) {
		return sqlMapper.update("androidRequestER_Accept",map);
	}
	
	@Override
	public int androidRequestER_Reject(Map map) {
		return sqlMapper.update("androidRequestER_Reject",map);
	}
	@Override
	public List<AndroidMyERDTO> getMyRequestERList(Map map) {
		return sqlMapper.selectList("getMyRequestERList",map);
	}

	

	


}
