package com.kosmo.mukja.web;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.web.util.PagingUtil;


@Controller
public class StoreDetailController {
	@Resource(name = "StoreInfoService")
	private StoreService service;

	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	

	private String store_id;
	
	
	@RequestMapping("/Store/DetailView.do")
	public String StoreDetail(
			@RequestParam Map map, Model model, 
			Authentication authentication,
			@RequestParam(required = false,defaultValue = "1") int nowPage, 
			HttpServletRequest req ) {
		
		System.out.println("username : "+map.get("username"));
		store_id=map.get("username").toString();
		System.out.println("store_id : "+store_id);
		
		if(authentication!=null) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			map.put("user_id", userDetails.getUsername());
			System.out.println("user_id:"+map.get("user_id"));
			int is_Thumb =service.isThumb(map);
			System.out.println("is_Thumb:"+is_Thumb);
			model.addAttribute("is_Thumb",is_Thumb);
		}else {
			System.out.println("is_Thumb:"+0);
			model.addAttribute("is_Thumb",0);
		}
		List<StoreDTO> list = service.getStoreInfo(map);
		model.addAttribute("list",list);
		
		
		
		int reviewCount= service.getReviewCount(map);
		model.addAttribute("reviewCount",reviewCount);
		
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
		

		
		/*가게리뷰보기*/
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int strvCount = service.getStRvTotal(map);
		//전체 페이지수]
		int strvPage = (int)Math.ceil((double)strvCount/pageSize);			
		//시작 및 끝 ROWNUM구하기]
		int strvstart = (nowPage-1)*pageSize+1;
		int strvend   = nowPage*pageSize;	
		
		//페이징을 위한 로직 끝]	
		map.put("strvstart", strvstart);
		map.put("strvend", strvend);
		
		List<MyPageDTO> strvcnts= service.getStoreReviewcnt(map);
		//데이타 저장]
		String strvPagingString = PagingUtil.pagingBootStrapStyle(strvCount, pageSize,blockPage, nowPage, req.getContextPath()+"/Store/DetailView.do?");
		System.out.println("strvcnts"+strvcnts);
		model.addAttribute("strvcnts", strvcnts);		
		model.addAttribute("strvPagingString", strvPagingString);	


		List<MyPageDTO> strvimgs = service.getStoreReviewimg(map);	
		model.addAttribute("strvimgs",strvimgs);
		System.out.println("strvimgs"+strvimgs);
		
		List<UsersDTO> usersnks = service.getUsersNicks(map);
		model.addAttribute("usersnks",usersnks);
		System.out.println("usersnks"+usersnks);
		
		
		List<MyPageDTO> rvThumb = service.getRVThumb(map);
		model.addAttribute("rvThumb",rvThumb);
		for(int k =0; k< rvThumb.size();k++) {
		System.out.println("rvThumb.rv_no : "+rvThumb.get(k).getRv_no()
				+" rvThumb.count : "+rvThumb.get(k).getCount());
		}
		//베스트리뷰 뽑기
		return "/Store/DetailView.tiles";
	}
	
	@ResponseBody
	@RequestMapping("/updateStoreAvg.do")
	public String updateStoreAvg(@RequestParam Map map) {
		System.out.println("------------------updateStoreAvg----------");
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		int result = service.updateStoreAvg(map);
		
		return "{'result':"+result+"}";
	}
	
	
	@ResponseBody
	@RequestMapping("/updateStoreRecommand.do")
	public String updateStoreRecommand(@RequestParam Map map) {
		int result=service.updateStoreRecommand(map);
		return "{'result':"+result+"}";
	}



	@ResponseBody
	@RequestMapping(value="/insertSTReview.do",method=RequestMethod.POST)
	public String insertSTReview(HttpServletRequest req,
			  Authentication auth,
			  Model model,
			  @RequestParam Map map) {	
		//가게아이디 얻기
		System.out.println("리뷰쓰기폼 속 store_id : " + store_id);
		//회원아이디 얻기
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("user_id2 : "+map.get("user_id"));	
		//인서트		
		int insertrv = service.insertReview(map);
		
		return "forward:/Store/DetailView.tiles";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/insertRVThumb.do",method=RequestMethod.GET)
	public String insertRVThumb(@RequestParam Map map, Authentication auth,Model model, HttpServletRequest req) {	
		
		System.out.println("username3 : "+map.get("username"));	
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user_id = userDetails.getUsername();
		map.put("user_id",user_id);		
		
		int clickThumb = service.insertRVThumb(map);
		model.addAttribute("clickThumb",clickThumb);
		System.out.println(clickThumb==0?"실패":"성공");
	
	
		return "/Store/DetailView.tiles";
	}
	
//
//	
	/*리뷰 좋아요*/	
	@ResponseBody
	@RequestMapping(value="/disThumb.bbs",method=RequestMethod.GET)
	public String disThumb(@RequestParam Map map, Authentication auth,Model model, HttpServletRequest req) {	
		System.out.println("username3 : "+map.get("username"));	
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user_id = userDetails.getUsername();
		map.put("user_id",user_id);		
		
		int disThumb = service.deleteRVThumb(map);
		model.addAttribute("disThumb",disThumb);
		System.out.println(disThumb!=0?"성공":"실패");
		
		
		return "/Store/DetailView.tiles";
	}
	
	
	
}
