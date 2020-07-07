package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.service.TableDTO;
import com.kosmo.mukja.service.UsersDTO;

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
		System.out.println("떰브 dao");
		int result=0;
		int selectResult = sqlMapper.selectOne("selectThumb",map);
		if(selectResult!=0) {
			System.out.println("떰브 삭제");
			result = sqlMapper.update("deleteThumb",map);
		}else {
			System.out.println("떰브 인설트");
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
		
		int result=0;
		int affected=sqlMapper.selectOne("isFindTableInfo",map);
		if(affected==1) {
			
			sqlMapper.update("updateTableInfo",map);
		}else {
			
			sqlMapper.update("insertTableInfo",map);	
		}
		
		
		
		return result;
	}

	@Override
	public List<StoreDTO> selectFoodImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("selectFoodImg",map);
	}
	
	
	@Override
	public int updateStoreInfo(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateStoreInfo",map);
	}

	@Override
	public int updateStoreImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateStoreImg", map);
	}

	@Override
	public int insertStoreImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("insertStoreImg",map);
	}
	
	
	
	
	
	
	
	
	

	@Override
	public int insertReview(Map map) {
		return sqlMapper.insert("insertReview", map);
	}

	@Override
	public int updateReview(Map map) {
		return sqlMapper.update("updateReview", map);
	}


	@Override
	public int deleteReview(Map map) {
		return sqlMapper.delete("deleteReview", map);
	}

	
	

	@Override
	public List<MyPageDTO> getStoreReviewcnt(Map map) {
		return sqlMapper.selectList("getStoreReviewcnt", map);
	}
	@Override
	public List<MyPageDTO> getStoreReviewimg(Map map) {
		return sqlMapper.selectList("getStoreReviewimg", map);
	}
	
	@Override
	public List<UsersDTO> getUsersNicks(Map map) {
		return sqlMapper.selectList("getUsersNicks", map);
	}
	/*주요*/
	@Override
	public int getStRvTotal(Map map) {
		 return sqlMapper.selectOne("getStRvTotal",map);
	}
	
	
	
	
	

	@Override
	public int insertRVThumb(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getRVThumb(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRVThumb(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
