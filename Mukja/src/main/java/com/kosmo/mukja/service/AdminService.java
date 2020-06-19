package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	//로그인 용]
	boolean isLogin(Map map);
	
	// 공지사항용
	List<AdminDTO> selectList(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	//상세보기용]
	AdminDTO selectOne(Map map);
	AdminDTO selectPrev(Map map);
	AdminDTO selectNext(Map map);
	//입력/수정/삭제용]
	int deleteNotice(Map map);
	int deleteBf(Map map);
	// Notice 글 등록
	int noticeInsert(Map map);
	// file 글 등록
	int bfInsert(Map map);
	AdminDTO selectForBf(Map map);
	int update(Map map);
	// 공지사항용 끝
	
	// 공지사항용
	List<AdminDTO> selectUserRpList(Map map);
	//전체 레코드 수]
	int getUsRPTotalRecord(Map map);
	//상세보기용]
	AdminDTO selectUsRPOne(Map map);
	AdminDTO selectUsRPPrev(Map map);
	AdminDTO selectUsRPNext(Map map);
	//입력/수정/삭제용]
	int deleteUsRP(Map map);
	int insertUsRP(Map map);
	int updateUsRP(Map map);
	// 공지사항용 끝
}
