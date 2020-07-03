package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.MainDTO;
import com.kosmo.mukja.service.MainService;

@Repository
public class MainDAO implements MainService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	@Override
	public List<MainDTO> selectList(Map map) {
		return sqlMapper.selectList("selectOrderByRank",map);
	}

	@Override
	public List<MainDTO> selectRank1List(Map map) {
		return sqlMapper.selectList("selectList",map);
	}

	@Override
	public List<MainDTO> selectRank1Img(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectImg",map);
	}

	@Override
	public List<MainDTO> selectRank2List(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectList",map);
	}

	@Override
	public List<MainDTO> selectRank2Img(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectImg",map);
	}

	@Override
	public List<MainDTO> selectRank3List(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectList",map);
	}

	@Override
	public List<MainDTO> selectRank3Img(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectImg",map);
	}

	
	/* 공지사항 */
	@Override
	public List<MainDTO> selectNoticeList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectNoticeList",map);
	}

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("getTotalRecord",map);
	}

	@Override
	public MainDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectOne1",map);
	}

	@Override
	public MainDTO selectPrev(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectPrev1",map);
	}

	@Override
	public MainDTO selectNext(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectNext1",map);
	}

	@Override
	public List<MainDTO> selectReviewList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectBestRv",map);
	}

	@Override
	public MainDTO selectContent(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectContent",map);
	}

	@Override
	public MainDTO selectStore_Name(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectStore_name",map);
	}
	
	
	
}
