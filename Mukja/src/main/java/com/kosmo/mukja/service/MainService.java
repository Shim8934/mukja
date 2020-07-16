package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	/* 1) 추천 랭킹 수 */
	List<MainDTO> selectList(Map map);

	List<MainDTO> selectRank1List(Map map);
	List<MainDTO> selectRank1Img(Map map);
	MainDTO selectRankContent(Map map);
	List<MainDTO> selectFoodMenuForMain(Map map);
	
	List<MainDTO> selectRank2List(Map map);
	List<MainDTO> selectRank2Img(Map map);
	
	List<MainDTO> selectRank3List(Map map);
	List<MainDTO> selectRank3Img(Map map);
	/*  추천 랭킹 수 끝 */
	
	/* 2) 리뷰 추천 수 */
	List<MainDTO> selectReviewList(Map map);
	MainDTO selectContent(Map map);
	MainDTO selectStore_Name(Map map);

	/* 리뷰 추천 수 끝 */
	
	/* 3) 공지사항 뿌리기용  */ 
	
	// 1. 글 목록
	List<MainDTO> selectNoticeList(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	MainDTO selectOne(Map map);
	MainDTO selectPrev(Map map);
	MainDTO selectNext(Map map);
	
	
	//랜덤 매뉴추천
	List<FoodMenuDTO> getRandomRecommendMenu(Map map);
	List<FoodMenuDTO> getRandomRecommendMenuAll(Map map);
	
}
