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
	public int deleteNotice(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(map);
	}

	@Override
	public int noticeInsert(Map map) {
		// TODO Auto-generated method stub
		return dao.noticeInsert(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	@Override
	public AdminDTO selectPrev(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPrev(map);
	}

	@Override
	public AdminDTO selectNext(Map map) {
		// TODO Auto-generated method stub
		return dao.selectNext(map);
	}

	@Override
	public List<AdminDTO> selectUserRpList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectUserRpList(map);
	}

	@Override
	public int getUsRPTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return dao.getUsRPTotalRecord(map);
	}

	@Override
	public AdminDTO selectUsRPOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectUsRPOne(map);
	}

	@Override
	public AdminDTO selectUsRPPrev(Map map) {
		// TODO Auto-generated method stub
		return dao.selectUsRPPrev(map);
	}

	@Override
	public AdminDTO selectUsRPNext(Map map) {
		// TODO Auto-generated method stub
		return dao.selectUsRPNext(map);
	}

	@Override
	public int deleteUsRP(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteUsRP(map);
	}

	@Override
	public int insertUsRP(Map map) {
		// TODO Auto-generated method stub
		return dao.insertUsRP(map);
	}

	@Override
	public int updateUsRP(Map map) {
		// TODO Auto-generated method stub
		return dao.updateUsRP(map);
	}

	@Override
	public int bfInsert(Map map) {
		// TODO Auto-generated method stub
		return dao.bfInsert(map);
	}

	@Override
	public AdminDTO selectForBf(Map map) {
		// TODO Auto-generated method stub
		return dao.selectForBf(map);
	}

	@Override
	public int deleteBf(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteBf(map);
	}

}
