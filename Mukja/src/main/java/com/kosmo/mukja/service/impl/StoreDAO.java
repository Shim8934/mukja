package com.kosmo.mukja.service.impl;

import java.util.Iterator;
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
		map.put("store_id", map.get("store_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("별점키 : %s 별점값 : %s", key,val));
			}
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
		map.put("store_id", map.get("store_id").toString().replace("\"",""));
		System.out.println("떰브 dao");
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("떰브키 : %s 떰브값 : %s", key,val));

			map.put(key, val);
		}
		
		int result = 0;
		int selectResult = sqlMapper.selectOne("selectThumb",map);
		if(selectResult != 0) {
			System.out.println("떰브 삭제");
			result = sqlMapper.update("deleteThumb",map);
		}else {
			System.out.println("떰브 인설트");
			result = sqlMapper.update("insertThumb",map);
		}
		System.out.println("result 값 : "+result);
		return result;
	}
	
	@Override
	public int updateStoreJjim(Map map) {
		map.put("store_id", map.get("store_id").toString().replace("\"",""));
		System.out.println("찜업 dao");
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("찜업키 : %s 찜업값 : %s", key,val));

			map.put(key, val);
			}
		
		int result=0;
		int selectResult = sqlMapper.selectOne("selectcount",map);
		if(selectResult != 0) {
			System.out.println("찜업 삭제");
			result = sqlMapper.update("deleteJjim",map);
		}else {
			System.out.println("찜업 인설트");
			result = sqlMapper.update("insertJjim",map);
		}		
		return result;
	}
	
	

//	@Override
//	public int getStoreThumb(Map map) {
//		return (Integer) (sqlMapper.selectOne("getStoreThumb",map)==null?0:sqlMapper.selectOne("getStoreThumb",map)) ;
//	}
//	@Override
//	public int isThumb(Map map) {
//		return (Integer) (sqlMapper.selectOne("isThumb",map)==null?0:sqlMapper.selectOne("isThumb",map)) ;
//	}

	@Override
	public int getStoreThumb(Map map) {
		return sqlMapper.selectOne("getStoreThumb",map) ;
	}
	@Override
	public int isThumb(Map map) {
		return sqlMapper.selectOne("isThumb",map);
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
		return sqlMapper.insert("insertStoreImg",map);
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
	public List<MyPageDTO> getBestRV(Map map) {
		return sqlMapper.selectList("getBestRV", map);
	}
	
	@Override
	public int insertRVThumb(Map map) {
		 return sqlMapper.insert("insertRVThumb",map);
	}

	@Override
	public int deleteRVThumb(Map map) {
		 return sqlMapper.delete("deleteRVThumb",map);
	}
	
	
	
	

	@Override
	public MyPageDTO getOneReviewForUpdate(Map map) {
		return sqlMapper.selectOne("getMyReviewForUpdate",map);
	}

	@Override
	public MyPageDTO getOneReviewPicForUpdate(Map map) {
		return sqlMapper.selectOne("getMyReviewPicForUpdate", map);
	}
	@Override
	public List<FoodMenuDTO> getMenu4up(Map map) {
		return sqlMapper.selectList("getMenu4up",map);
	}

	@Override
	public int deleteOneReview(Map map) {
		return sqlMapper.delete("deleteOneReview", map);
	}

	@Override
	public int deleteOneReviewPic(Map map) {
		return sqlMapper.delete("deleteOneReviewPic", map);
	}

	@Override
	public int deleteOneReviewThumb(Map map) {
		return sqlMapper.delete("deleteOneReviewThumb", map);
	}

	@Override
	public int updateFoodMenu(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateFoodMenu",map);
	}

	@Override
	public int updateFoodImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("updateFoodImg",map);
	}

	@Override
	public int insertMoreFoodMenu(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertMoreFoodMenu",map);
	}

	@Override
	public int insertMoreFoodImg(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.insert("insertMoreFoodImg",map);
	}

	@Override
	public StoreDTO selectNewMenuNo(Map map) {
		return sqlMapper.selectOne("selectNewMenuNo",map);
	}

	@Override
	public int insertThumb(Map map) {
		return sqlMapper.selectOne("insertThumb",map);
	}

	@Override
	public int deleteThumb(Map map) {
		// TODO Auto-generated method s
		return sqlMapper.selectOne("deleteThumb",map);
	}

	@Override
	public int getJjimcount(Map map) {
		return sqlMapper.selectOne("getJjimcount",map);
	}

	@Override
	public int isJjim(Map map) {
		return sqlMapper.selectOne("isJjim",map);
	}

	@Override
	public int insertJjim(Map map) {
		return sqlMapper.selectOne("insertJjim",map);
	}

	@Override
	public int deleteJjim(Map map) {
		return sqlMapper.selectOne("deleteJjim",map);
	}

	@Override
	public int isRVThumb(Map map) {
		return sqlMapper.selectOne("isRVThumb",map);
	}

	
}
