package com.kosmo.mukja.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidService;

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
	public int createEroom(Map map) {
		return sqlMapper.insert("createEroom",map);
	}
	
	@Override
	public int getRoomNo(Map map) {
		return sqlMapper.selectOne("getRoomNo",map);
	}
	
	@Override
	public String getRoomMaster(Map map) {
		return sqlMapper.selectOne("getRoomMaster",map);
	}

	@Override
	public int creatERC(Map map) {
		return sqlMapper.insert("creatERC",map);
	}

	@Override
	public int getERoomCno(Map map) {
		return sqlMapper.selectOne("getERoomCno",map);
	}

	@Override
	public int joinERoom(Map map) {
		return sqlMapper.insert("joinERoom",map);
	}

	@Override
	public int setupER_role(Map map) {
		return sqlMapper.update("setupER_role",map);
	}

	

	


}
