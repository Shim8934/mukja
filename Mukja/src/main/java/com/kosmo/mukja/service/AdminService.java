package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	//로그인 용]
	boolean isLogin(Map map);
	//목록용]
	List<AdminDTO> selectList(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	//상세보기용]
	AdminDTO selectOne(Map map);
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
}
