package com.kosmo.mukja.service.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidService;
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

	


}
