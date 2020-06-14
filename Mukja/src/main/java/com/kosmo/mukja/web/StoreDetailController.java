package com.kosmo.mukja.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreService;


@Controller
public class StoreDetailController {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	@RequestMapping("/Store/DetailView.do")
	public String StoreDetail(@RequestParam Map map, Model model) {
		System.out.println("username : "+map.get("username"));
		
		List<StoreDTO> list = service.getStoreInfo(map);
		model.addAttribute("list",list);
		
		int reviewCount= service.getReviewCount(map);
		model.addAttribute("reviewCount",reviewCount);
		
		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB"};
		String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩"};
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
				System.out.println("대상 :"+foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
				System.out.println("tend_codes["+i+"]:"+ tend_codes[j]+"변경할값 :"+tend_text[j]);
				System.out.println("변경된 재료 : "+foodMenuList.get(i).getMenu_tend());
			}
			
			
		}//리스트에서 뽑은 성향의 포문
	
		model.addAttribute("foodMenuList",foodMenuList);
		
		System.out.println("foodMenuList:"+foodMenuList.toString());
		
		return "/Store/DetailView.tiles";
	}
}
