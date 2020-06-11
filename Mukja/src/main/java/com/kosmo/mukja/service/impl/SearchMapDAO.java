package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.ERDTO;
import com.kosmo.mukja.service.SearchMapService;
import com.kosmo.mukja.service.StoreDTO;

@Repository
public class SearchMapDAO implements SearchMapService{
	//SqlSessionTemplate객체 주입
		@Resource(name="template")
		private SqlSessionTemplate sqlMapper;

		@Override
		public List<DongDTO> searchDong(Map map) {			
			return sqlMapper.selectList("searchDongList",map);
		}

		@Override
		public List<StoreDTO> getMarkerList(Map map) {
			return sqlMapper.selectList("getMarkerList", map);
		}

		@Override
		public List<StoreDTO> getMarkerWithMenuList(Map map) {
			return sqlMapper.selectList("getMarkerWithMenuList", map);
		}

		@Override
		public List<ERDTO> getEatTogetherList(Map map) {
			return sqlMapper.selectList("getEatTogetherList", map);
		}

		@Override
		public int getMenuCount(Map map) {
			return sqlMapper.selectOne("getMenuCount", map);
		}

		@Override
		public int insertER(Map map) {
			return sqlMapper.insert("insertER",map);
		}

		@Override
		public int joinER(Map map) {
			return sqlMapper.insert("joinER",map);
		}

		@Override
		public int joinERC(Map map) {
			return sqlMapper.insert("joinERC",map);
		}

		@Override
		public int currcount(Map map) {
			return sqlMapper.selectOne("currcount",map);
		}

		@Override
		public int getERno(Map map) {
			return sqlMapper.selectOne("getERno",map);
		}

		@Override
		public String getERmaster(Map map) {
			return sqlMapper.selectOne("getERmaster",map);
		}

		@Override
		public int setupERjoin_role(Map map) {
			return sqlMapper.update("setupERjoin_role",map);
		}

		@Override
		public int getERCno(Map map) {
			return sqlMapper.selectOne("getERCno",map);
		}
		
		

}
