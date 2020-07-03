package com.kosmo.mukja.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidService;

@Service("androidService")
public class AndroidServiceImpl implements AndroidService {

	//OneMemoDAO주입]
		@Resource(name="androidDAO")
		private AndroidDAO dao;
		
		@Override
		public AndroidDTO anIsLogin(AndroidDTO dto) {
			return dao.anIsLogin(dto);
		}

		
}
