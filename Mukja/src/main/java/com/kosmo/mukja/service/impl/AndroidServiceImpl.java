package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidERDTO;
import com.kosmo.mukja.service.AndroidMyERDTO;
import com.kosmo.mukja.service.AndroidReviewDTO;
import com.kosmo.mukja.service.AndroidReviewImgDTO;
import com.kosmo.mukja.service.AndroidService;
import com.kosmo.mukja.service.FallowDTO;
import com.kosmo.mukja.service.UsersDTO;

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
		public List<AndroidReviewDTO> getAndroidReviewList(Map map) {
			return dao.getAndroidReviewList(map);
		}

		@Override
		public List<AndroidReviewImgDTO> getAndroidReviewImg(Map map) {
			return dao.getAndroidReviewImg(map);
		}

		@Override
		public UsersDTO getUserInfo(Map map) {
			return dao.getUserInfo(map);
		}

		@Override
		public List<AndroidReviewDTO> getMyAndroidReviewList(Map map) {
			return dao.getMyAndroidReviewList(map);
		}

		@Override
		public int deleteAndroidReview(Map map) {
			return dao.deleteAndroidReview(map);
		}

		@Override
		public int FallowAndroidReview(Map map) {
			return dao.FallowAndroidReview(map);
		}

		@Override
		public List<FallowDTO> getFallowList(Map map) {
			return dao.getFallowList(map);
		}

		@Override
		public int deleteAndroidFallow(Map map) {
			return dao.deleteAndroidFallow(map);
		}

		@Override
		public List<AndroidERDTO> getRequestERList(Map map) {
			return dao.getRequestERList(map);
		}

		@Override
		public int androidRequestER_Accept(Map map) {
			return dao.androidRequestER_Accept(map);
		}

		@Override
		public int androidRequestER_Reject(Map map) {
			return dao.androidRequestER_Reject(map);
		}

		@Override
		public List<AndroidMyERDTO> getMyRequestERList(Map map) {
			return dao.getMyRequestERList(map);
		}

		@Override
		public int androidDeleteERMembers(Map map) {
			return dao.androidDeleteERMembers(map);
		}

		@Override
		public int boomMyER(Map map) {
			return dao.boomMyER(map);
		}

	

	

		
}
