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
import com.kosmo.mukja.service.TableDTO;

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
		if(selectResult!=0) {
			result = sqlMapper.update("updateStoreAvg",map);
			System.out.println("기존내역 발견  : update진행");
		}else {
			result = sqlMapper.insert("insertStoreAvg",map);
			System.out.println("기존내역 미발견  : insert진행");
		}
		return result;
	}

	@Override
	public float getStoreAvg(Map map) {
		return Float.parseFloat(String.valueOf(sqlMapper.selectOne("getStoreAvg",map)==null?0.0:sqlMapper.selectOne("getStoreAvg",map))) ;
	}

	@Override
	public int updateStoreRecommand(Map map) {
		int result=0;
		int selectResult = sqlMapper.selectOne("selectThumb",map);
		if(selectResult!=0) {
			result = sqlMapper.update("deleteThumb",map);
		}else {
			result = sqlMapper.update("insertThumb",map);
		}
		
		return result;
	}

	@Override
	public int getStoreThumb(Map map) {
		return (Integer) (sqlMapper.selectOne("getStoreThumb",map)==null?0:sqlMapper.selectOne("getStoreThumb",map)) ;
	}

	@Override
	public int isThumb(Map map) {
		return (Integer) (sqlMapper.selectOne("isThumb",map)==null?0:sqlMapper.selectOne("isThumb",map)) ;
	}

	@Override
	public  TableDTO getTable(Map map) {
		return sqlMapper.selectOne("getTable",map);
	}

	@Override
	public int updateTableInfo(Map map) {
		return sqlMapper.update("updateTableInfo",map);
	}
	
}
