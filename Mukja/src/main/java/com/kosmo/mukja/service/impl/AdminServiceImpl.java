package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO dao;
	
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return dao.isLogin(map);
	}

	@Override
	public List<AdminDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecord(map);
	}

	@Override
	public AdminDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return dao.delete(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

}
