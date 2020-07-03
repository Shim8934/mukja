package com.kosmo.mukja.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;

@Controller
public class AndroidContoroller {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/DetailView.do" , produces = "application/json; charset=utf8")
	public String StoreDetail(@RequestParam Map map, Model model) {
		
		System.out.println("username:"+map.get("store_id"));
		System.out.println("username:"+map.get("user_id"));
		map.put("username",map.get("store_id").toString().replaceAll("\"", ""));
		map.put("user_id",map.get("user_id").toString().replaceAll("\"", ""));
		
		
		//가게정보 파싱
		List<StoreDTO> list = service.getStoreInfo(map);
		System.out.println("반환리스트크기"+list.size());
	
		JSONObject storeInfoJson = new JSONObject();
		storeInfoJson.put("store_name", list.get(0).getStore_name().toString());
		storeInfoJson.put("store_addr", list.get(0).getStore_addr().toString());
		storeInfoJson.put("store_intro", list.get(0).getStore_intro().toString());
		storeInfoJson.put("store_email", list.get(0).getStore_email().toString());
		storeInfoJson.put("store_phnum", list.get(0).getStore_phnum().toString());
		storeInfoJson.put("store_time", list.get(0).getStore_time().toString());
	
		
		//가게이미지 파싱
		List<StoreIMGDTO> imglist = service.getStoreIMG(map);
		JSONArray imglistJson =new JSONArray();
		for( StoreIMGDTO imgDTO :imglist) {			
			imglistJson.add(imgDTO.getSf_path());		
		}		
		storeInfoJson.put("store_imgList", imglistJson);

		//좋아요 여부
		int is_Thumb =service.isThumb(map);
		storeInfoJson.put("isThumb", is_Thumb);
		
		//메뉴변환
		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS,","JS,","HS,","BS,","YS,"};
		String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
		
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		JSONArray menulistJson =new JSONArray();
		for( FoodMenuDTO menuDTO :foodMenuList) {
			JSONObject menu = new JSONObject();
			menu.put("menuName",  menuDTO.getMenu_name()) ;
			menu.put("menuCost",menuDTO.getMenu_price());
			menu.put("menuInfo",menuDTO.getMenu_tend());
			menu.put("menuIntro",menuDTO.getMenu_info());			
			menulistJson.add(menu);
		}		
		storeInfoJson.put("menuList", menulistJson);
		
		
		return storeInfoJson.toJSONString();
	}
	

	
}
