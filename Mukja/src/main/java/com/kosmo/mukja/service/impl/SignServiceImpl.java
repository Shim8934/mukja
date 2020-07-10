package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.UsersDTO;
@Service("signService")
public class SignServiceImpl implements SignService {

	//OneMemoDAO주입]
		@Resource(name="signDAO")
		private SignDAO dao;
		
		@Override
		public boolean isLogin(Map map) {
			return dao.isLogin(map);
		}

		@Override
		public int signup(Map map) {
			return dao.signup(map);
		}
		
		@Override
		public int storesignup(Map map) {
			return dao.storesignup(map);
		}
		@Override
		public int foodmenu(Map map) {
			return dao.foodmenu(map);
		}
		@Override
		public int storeIdCheck(Map map) {
			return dao.storeIdCheck(map);
		}

		@Override
		public int updateMyInfo(Map map) {
			return 0;
		}

		@Override
		public UsersDTO getOneInfo(Map map) {
			return null;
		}

		@Override
		public int insertStoreImg22(Map map) {
			// TODO Auto-generated method stub
			return dao.insertStoreImg22(map);
		}

		@Override
		public int insertFoodImg(Map map) {
			// TODO Auto-generated method stub
			return dao.insertFoodImg(map);
		}

		@Override
		public FoodMenuDTO getMenuNo(Map map) {
			// TODO Auto-generated method stub
			return dao.getMenuNo(map);
		}

		@Override
		public int insertStoreNewTable(Map map) {
			// TODO Auto-generated method stub
			return dao.insertStoreNewTable(map);
		}

		@Override
		public int userIdCheck(Map map) {
			// TODO Auto-generated method stub
			return dao.userIdCheck(map);
		}

		
	



		
}
