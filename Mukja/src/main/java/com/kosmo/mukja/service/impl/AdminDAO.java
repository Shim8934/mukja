package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.AdminService;
@Repository
public class AdminDAO implements AdminService{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	// 로그인
	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return (Integer)sqlMapper.selectOne("adminLogin",map)==0 ? false : true;
	}

	// 공지사항 전체 목록 뽑아오기
	@Override
	public List<AdminDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("noticeList",map);
	}

	// 공지사항 검색 조회
	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeGetTotalRecord",map);
	}

	// 공지사항 상세보기
	@Override
	public AdminDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectOne",map);
	}

	// 글 삭제
	@Override
	public int deleteNotice(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("noticeDelete",map);
	}

	// 글 등록 // 파일 존재 시 경우의 수로 insert문 실행
	@Override
	public int noticeInsert(Map map) {
		
		return sqlMapper.insert("noticeInsert",map);
	}

	// 글 수정
	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("noticeUpdate",map);
	}

	@Override
	public AdminDTO selectPrev(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectPrev",map);
	}

	@Override
	public AdminDTO selectNext(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("noticeSelectNext",map);
	}

	@Override
	public List<AdminDTO> selectUserRpList(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("UsRpList",map);
	}

	@Override
	public int getUsRPTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("UsRpGetTotalRecord",map);
	}

	@Override
	public AdminDTO selectUsRPOne(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("UsRpOne",map);
	}

	@Override
	public AdminDTO selectUsRPPrev(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("UsRpSelectPrev",map);
	}

	@Override
	public AdminDTO selectUsRPNext(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("UsRpSelectNext",map);
	}

	@Override
	public int deleteUsRP(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("",map);
	}

	@Override
	public int insertUsRP(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("",map);
	}

	@Override
	public int updateUsRP(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("UsRpUpdate",map);
	}

	@Override
	public int bfInsert(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("bf_pathInsert",map);
	}

	@Override
	public AdminDTO selectForBf(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectOne("selectForBf",map);
	}

	@Override
	public int deleteBf(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("deleteBf",map);
	}
	

}//////class AdminDAO
