package com.kosmo.mukja.service.impl;

import java.util.Map;

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

		@Override
		public int createEroom(Map map) {
			return dao.createEroom(map);
		}

		@Override
		public int getRoomNo(Map map) {
			return dao.getRoomNo(map);
		}

		@Override
		public String getRoomMaster(Map map) {
			return dao.getRoomMaster(map);
		}

		@Override
		public int creatERC(Map map) {
			return dao.creatERC(map);
		}

		@Override
		public int getERoomCno(Map map) {
			return dao.getERoomCno(map);
		}

		@Override
		public int joinERoom(Map map) {
			return dao.joinERoom(map);
		}

		@Override
		public int setupER_role(Map map) {
			return dao.setupER_role(map);
		}

		
}
