package com.kosmo.mukja.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.ERDTO;
import com.kosmo.mukja.service.SearchMapService;
import com.kosmo.mukja.service.StoreDTO;


@Service("serchService")
public class SearchMapServiceImpl implements SearchMapService{
	@Resource(name = "searchMapDAO")
	SearchMapDAO dao;
	
	@Override
	public List<DongDTO> searchDong(Map map) {		
		return dao.searchDong(map);
	}

	@Override
	public List<StoreDTO> getMarkerList(Map map) {		
		return dao.getMarkerList(map);
	}

	@Override
	public List<StoreDTO> getMarkerWithMenuList(Map map) {
		return dao.getMarkerWithMenuList(map);
	}

	@Override
	public List<ERDTO> getEatTogetherList(Map map) {
		return dao.getEatTogetherList(map);
	}

	@Override
	public int getMenuCount(Map map) {
		return dao.getMenuCount(map);
	}

	@Override
	public int insertER(Map map) {
		return dao.insertER(map);
	}

	@Override
	public int joinER(Map map) {
		return dao.joinER(map);
	}

	@Override
	public int joinERC(Map map) {
		return dao.joinERC(map);
	}

	@Override
	public int currcount(Map map) {
		return dao.currcount(map);
	}

	@Override
	public int getERno(Map map) {
		return dao.getERno(map);
	}

	@Override
	public String getERmaster(Map map) {
		return dao.getERmaster(map);
	}

	@Override
	public int setupERjoin_role(Map map) {
		return dao.setupERjoin_role(map);
	}

	@Override
	public int getERCno(Map map) {
		return dao.getERCno(map);
	}
	
	
	
}
