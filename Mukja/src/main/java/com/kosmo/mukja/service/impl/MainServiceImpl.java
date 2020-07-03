package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.MainDTO;
import com.kosmo.mukja.service.MainService;
@Service("mainService")
public class MainServiceImpl implements MainService{

	@Resource(name = "mainDAO")
	private MainDAO dao;
	
	@Override
	public List<MainDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectList(map);
	}

	@Override
	public List<MainDTO> selectRank1List(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank1List(map);
	}

	@Override
	public List<MainDTO> selectRank1Img(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank1Img(map);
	}

	@Override
	public List<MainDTO> selectRank2List(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank2List(map);
	}

	@Override
	public List<MainDTO> selectRank2Img(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank2Img(map);
	}

	@Override
	public List<MainDTO> selectRank3List(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank3List(map);
	}

	@Override
	public List<MainDTO> selectRank3Img(Map map) {
		// TODO Auto-generated method stub
		return dao.selectRank3Img(map);
	}

	@Override
	public List<MainDTO> selectNoticeList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return dao.getTotalRecord(map);
	}

	@Override
	public MainDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOne(map);
	}

	@Override
	public MainDTO selectPrev(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPrev(map);
	}

	@Override
	public MainDTO selectNext(Map map) {
		// TODO Auto-generated method stub
		return dao.selectNext(map);
	}

	@Override
	public List<MainDTO> selectReviewList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectReviewList(map);
	}

	@Override
	public MainDTO selectContent(Map map) {
		// TODO Auto-generated method stub
		return dao.selectContent(map);
	}

	@Override
	public MainDTO selectStore_Name(Map map) {
		// TODO Auto-generated method stub
		return dao.selectStore_Name(map);
	}

}
