package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidERDTO;
import com.kosmo.mukja.service.AndroidMyERDTO;
import com.kosmo.mukja.service.AndroidReviewDTO;
import com.kosmo.mukja.service.AndroidReviewImgDTO;
import com.kosmo.mukja.service.AndroidService;
import com.kosmo.mukja.service.ErcDTO;
import com.kosmo.mukja.service.FallowDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.UsersDTO;


@Repository
public class AndroidDAO implements AndroidService {

	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	//로그인 용]
	@Override
	public AndroidDTO anIsLogin(AndroidDTO dto) {
		return sqlMapper.selectOne("anIsLogin",dto);
	}

	//웅
	@Override
	public int createEroom(Map map) {
		return sqlMapper.insert("createEroom",map);
	}
	
	@Override
	public int getRoomNo(Map map) {
		return sqlMapper.selectOne("getRoomNo",map);
	}
	
	@Override
	public String getRoomMaster(Map map) {
		return sqlMapper.selectOne("getRoomMaster",map);
	}

	@Override
	public int creatERC(Map map) {
		return sqlMapper.insert("creatERC",map);
	}

	@Override
	public int getERoomCno(Map map) {
		return sqlMapper.selectOne("getERoomCno",map);
	}

	@Override
	public int joinERoom(Map map) {
		return sqlMapper.insert("joinERoom",map);
	}

	@Override
	public int setupER_role(Map map) {
		return sqlMapper.update("setupER_role",map);
	}
	
	@Override
	public int selectrool(Map map) {
		return sqlMapper.selectOne("selectrool",map);
	}

	
	@Override
	public List<ErcDTO> myERoomCList(Map map) {
		return sqlMapper.selectList("myERoomCList",map);
	}
	@Override
	public String getMasterimg(Map map) {
		return sqlMapper.selectOne("getMasterimg",map);
	}
	
	@Override
	public String getMasterNick(Map map) {
		return sqlMapper.selectOne("getMasterNick",map);
	}

	@Override
	public StoreDTO getStoreInfos(Map map) {
		return sqlMapper.selectOne("getStoreInfos",map);
	}
	@Override
	public String ERoomold(Map map) {
		return sqlMapper.selectOne("eRoomold",map);
	}
	
	
	
	
	//범
	@Override
	public List<AndroidReviewDTO> getAndroidReviewList(Map map) {
		return sqlMapper.selectList("getAndroidReviewList",map);
	}
	@Override
	public List<AndroidReviewImgDTO> getAndroidReviewImg(Map map) {
		return sqlMapper.selectList("getAndroidReviewImg",map);
	}
	@Override
	public UsersDTO getUserInfo(Map map) {
		return sqlMapper.selectOne("getAndroidUserInfo",map);
	}
	@Override
	public List<AndroidReviewDTO> getMyAndroidReviewList(Map map) {
		return sqlMapper.selectList("getMyAndroidReviewList",map);
	}
	@Override
	public int deleteAndroidReview(Map map) {
		int result = sqlMapper.delete("deleteAndroidReviewFile",map);
		result +=sqlMapper.delete("deleteAndroidReview",map);
		return result;
	}
	@Override
	public int FallowAndroidReview(Map map) {
		return sqlMapper.insert("FallowAndroidReview",map);
	}
	@Override
	public List<FallowDTO> getFallowList(Map map) {
		return sqlMapper.selectList("getFallowList",map);
	}
	@Override
	public int deleteAndroidFallow(Map map) {
		return sqlMapper.delete("deleteAndroidFallow",map);
	
	}
	@Override
	public List<AndroidERDTO> getRequestERList(Map map) {
		return sqlMapper.selectList("getRequestERList",map);
	}
	
	@Override
	public int androidRequestER_Accept(Map map) {
		return sqlMapper.update("androidRequestER_Accept",map);
	}
	
	@Override
	public int androidRequestER_Reject(Map map) {
		return sqlMapper.update("androidRequestER_Reject",map);
	}
	@Override
	public List<AndroidMyERDTO> getMyRequestERList(Map map) {
		return sqlMapper.selectList("getMyRequestERList",map);
	}

	@Override
	public int androidDeleteERMembers(Map map) {
		return sqlMapper.delete("androidDeleteERMembers",map);
	}
	@Override
	public int boomMyER(Map map) {
		int result;
		result=sqlMapper.delete("boomERMember",map);
		result+=sqlMapper.delete("boomERC",map);
		result+=sqlMapper.delete("boomER",map);
		if(result==3)System.out.println("삭제성공");
		return result;
	}

	@Override
	public int androidInsertReview(Map map) {
		int result;
		result=sqlMapper.insert("androidInsertReview",map);
		System.out.println("username:"+map.get("username"));
		int rv_no=sqlMapper.selectOne("getRv_no",map);
		map.put("rv_no",rv_no);
		
		result=+sqlMapper.insert("androidInsertReviewIMG",map);
		return result;
	}
}
