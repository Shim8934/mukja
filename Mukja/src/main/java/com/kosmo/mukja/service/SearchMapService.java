package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface SearchMapService {
	public List<DongDTO> searchDong(Map map);
	public List<StoreDTO> getMarkerList(Map map);
	public List<StoreDTO> getMarkerWithMenuList(Map map);
	public List<ERDTO>getEatTogetherList(Map map);
	public int getMenuCount(Map map);
	public int insertER(Map map);
	public int joinER(Map map);
	public int joinERC(Map map);
	public int currcount(Map map);
	public int getERno(Map map);
	public String getERmaster(Map map);
	public int setupERjoin_role(Map map);
	public int getERCno(Map map);
	public StoreDTO getStoreInfo(Map map);
	public List<ErcDTO> myERCList(Map map);
	public String getERC_content(Map map);
	public String getUserNick(Map map);
}
