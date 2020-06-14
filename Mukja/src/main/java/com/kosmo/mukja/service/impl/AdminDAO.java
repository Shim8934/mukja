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
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.delete("noticeDelete",map);
	}

	// 글 등록 // 파일 존재 시 경우의 수로 insert문 실행
	@Override
	public int insert(Map map) {
		if(map.get("NT_IMG")==null) {
			return sqlMapper.insert("noticeInsert",map);
		}
		else {
			System.out.println("파일 저장하기 시작");
			sqlMapper.insert("noticeInsert",map);
			System.out.println("NT_NO?  "+map.get("NT_NO"));
			map.put("NT_NO", map.get("NT_NO"));
			System.out.println("파일 경로 따로 저장?");
			return sqlMapper.insert("bbsFileInsert",map);
		}
	}

	// 글 수정
	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("noticeUpdate",map);
	}
	

}
