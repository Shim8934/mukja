package com.kosmo.mukja.service.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.UsersDTO;


@Repository
public class SignDAO implements SignService {

	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	//로그인 용]
	@Override
	public boolean isLogin(Map map) {
		return (Integer)sqlMapper.selectOne("isLogin",map)==0 ? false : true;
	}
	
	@Override
	public int signup(Map map) {
		return sqlMapper.insert("signup",map);
	}
    
	@Override
	public int storesignup(Map map) {
		return sqlMapper.insert("storesignup",map);
	}
	@Override
	public int foodmenu(Map map) {
		return sqlMapper.insert("foodmenu",map);
	}
	@Override
	public int idCheck(Map map) {
		return sqlMapper.selectOne("idCheck",map);
	}
	
<<<<<<< HEAD
	@Override
	public int updateMyInfo(Map map) {
		return sqlMapper.update("updateMyInfo",map);
	}

	@Override
	public UsersDTO getOneInfo(Map map) {
		return sqlMapper.selectOne("getOneInfo",map);
	}

	@Override
	public int insertStoreImg22(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertStoreImg22",map);
	}

	@Override
	public int insertFoodImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertFoodImg22",map);
	}

	@Override
	public FoodMenuDTO getMenuNo(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getMenuNo",map);
	}


=======
>>>>>>> branch 'master' of https://github.com/Shim8934/mukja

	


}
