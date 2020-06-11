package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.SignService;
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
}
