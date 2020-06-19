package com.kosmo.mukja.web;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;


@Controller
public class StoreMypageController {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	@RequestMapping("/StroeMypage/StroeMypageMain.do")
	public String StoreDetail(@RequestParam Map map, Model model, Authentication authentication) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
	
		List<StoreDTO> list = service.getStoreInfo(map);
		model.addAttribute("list",list);
		
		int reviewCount= service.getReviewCount(map);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("msg", userDetails.getUsername()); 
		

		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS,","JS,","HS,","BS,","YS,"};
		String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
		
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
				/*
				 * System.out.println("대상 :"+foodMenuList.get(i).getMenu_tend().replaceAll(
				 * tend_codes[j], tend_text[j])); System.out.println("tend_codes["+i+"]:"+
				 * tend_codes[j]+"변경할값 :"+tend_text[j]);
				 * System.out.println("변경된 재료 : "+foodMenuList.get(i).getMenu_tend());
				 */
			}
		}//리스트에서 뽑은 성향의 포문
			
		model.addAttribute("foodMenuList",foodMenuList);
		System.out.println("foodMenuList:"+foodMenuList.toString());
		
		List<StoreIMGDTO> imglist = service.getStoreIMG(map);
		model.addAttribute("imglist",imglist);
		System.out.println("imglist:"+imglist.toString());
		
		
		String[] menu_nos = new String[foodMenuList.size()];
		int i=0;
		for(FoodMenuDTO foodmenuDTO:foodMenuList) {
			menu_nos[i]=foodmenuDTO.getMenu_no();
			i++;
			//System.out.println("menu_no:"+foodmenuDTO.getMenu_no());
		 }
		List allFoodImgList = new Vector();
		
		for(String menu_no: menu_nos) {
			System.out.println("menu_no:"+menu_no);
			map.put("menu_no", menu_no);
			allFoodImgList.add(service.getFoodIMG(menu_no));
			System.out.println("음식매뉴이미지:"+service.getFoodIMG(menu_no).toString());
		}
		model.addAttribute("allFoodImgList",allFoodImgList);
		System.out.println("allFoodImgList:"+allFoodImgList.toString());
		
		float store_avg =  service.getStoreAvg(map);
		model.addAttribute("store_avg",store_avg);
		
		int store_Thumb = service.getStoreThumb(map);
		model.addAttribute("store_Thumb",store_Thumb);
		model.addAttribute("imglist",imglist);
		System.out.println("imglist:"+imglist.toString());
		
	
		return "Store/StoreMyPage/StoreMypageMain.tiles";
		
	}

	
	@RequestMapping("/StroeMypage/ImgPop.do")
	public String ImgPop(@RequestParam Map map, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
	
		
		
		return "Store/StoreMyPage/ImgPop.tiles";
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/updateStoreAvg.do") public String
	 * updateStoreAvg(@RequestParam Map map) {
	 * System.out.println("------------------updateStoreAvg----------");
	 * Iterator<String> iter = map.keySet().iterator(); while(iter.hasNext()){
	 * String key = iter.next(); String val = map.get(key).toString();
	 * System.out.println(String.format("키 : %s 값 : %s", key,val)); } int result =
	 * service.updateStoreAvg(map);
	 * 
	 * return "{'result':"+result+"}"; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("/updateStoreRecommand.do") public String
	 * updateStoreRecommand(@RequestParam Map map) { int
	 * result=service.updateStoreRecommand(map); return "{'result':"+result+"}"; }
	 */
}
