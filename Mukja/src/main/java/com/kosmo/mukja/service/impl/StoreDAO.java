package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;

@Repository("storeDAO")
public class StoreDAO  implements StoreService{
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	@Override
	public List<StoreDTO> getStoreInfo(Map map) {
		return sqlMapper.selectList("getStoreDetailInfo",map);
	}

	@Override
	public int getReviewCount(Map map) {
		System.out.println("sqlMapper : "+sqlMapper);
		int result=sqlMapper.selectOne("getReviewCount",map);
		System.out.println("result : "+result);
		return result;
	}

	@Override
	public List<FoodMenuDTO> getFoodMenu(Map map) {
		return sqlMapper.selectList("getFoodMenu",map);
	}

	@Override
	public List<StoreIMGDTO> getStoreIMG(Map map) {
		return sqlMapper.selectList("getStoreIMG",map);
	}

	@Override
	public List<FoodIMGDTO> getFoodIMG(String menu_no) {
		return sqlMapper.selectList("getFoodIMG",menu_no);
	}

	@Override
	public int updateStoreAvg(Map map) {
		int selectResult = sqlMapper.selectOne("selectAvg",map);
		System.out.println("평점을 준적이 있다:");
		System.out.println(selectResult==1?"있음":"없음");
		int result=0;
		if(selectResult==1) {
			result = sqlMapper.update("updateStoreAvg",map);
		}else {
			result = sqlMapper.insert("insertStoreAvg",map);
		}
		return result;
	}
	
}
