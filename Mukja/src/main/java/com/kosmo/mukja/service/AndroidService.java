package com.kosmo.mukja.service;

import java.util.List;
import java.util.Map;

public interface AndroidService {
	AndroidDTO anIsLogin(AndroidDTO dto);
	public int createEroom(Map map);
	public int getRoomNo(Map map);
	public String getRoomMaster(Map map);
	public int creatERC(Map map);
	public int getERoomCno(Map map);
	public int joinERoom(Map map);
	public int setupER_role(Map map);
	

}
