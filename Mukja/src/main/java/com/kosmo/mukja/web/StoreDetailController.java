package com.kosmo.mukja.web;

import java.security.Principal;
import java.security.Security;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
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
	private String user_id;
	
	@RequestMapping("/Store/DetailView.do")
	public String StoreDetail(
			@RequestParam Map map, Model model, 
			Authentication authentication,
			@RequestParam(required = false,defaultValue = "1") int nowPage, 
			HttpServletRequest req ) {
		System.out.println("여기 왔다1");
		System.out.println("username : "+map.get("username"));
		store_id=map.get("username").toString();
		System.out.println("store_id : "+store_id);
		
		if(authentication!=null) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			map.put("user_id", userDetails.getUsername());
			System.out.println("user_id:"+map.get("user_id"));
			
			model.addAttribute("IDmeme",userDetails.getUsername());
			
			int is_Thumb =service.isThumb(map);
			System.out.println("is_Thumb:"+is_Thumb);
			model.addAttribute("is_Thumb",is_Thumb);
		}else {
			System.out.println("is_Thumb:"+0);
			model.addAttribute("is_Thumb",0);
		}
		List<StoreDTO> list = service.getStoreInfo(map);

		// 상세 주소 쪼개기용
		if(list.size()!=0) {
		String store_addr = list.get(0).getStore_addr();
		
			if(store_addr.contains("/")) {
				store_addr = store_addr.substring(0,store_addr.lastIndexOf("/"));
				String store_addr1 = list.get(0).getStore_addr().substring(list.get(0).getStore_addr().lastIndexOf("/")+1);
				list.get(0).setStore_addr(store_addr);
				list.get(0).setStore_addr1(store_addr1);
			} 		// 상세 주소 쪼개기용 끝
		};
		
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
	public String insertSTReviewOk(Authentication auth, Model model, @RequestParam Map map) {	
		System.out.println("---------------------------리뷰쓰기폼-----------------------------");

		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		map.put("user_id", userDetails.getUsername());
		
		JSONObject json= new JSONObject();		
		System.out.println("rv_no: " + map.get("rv_no"));	
		System.out.println("rv_title: "+map.get("rv_title"));	
		System.out.println("rv_content: " + map.get("rv_content"));
		System.out.println("user_id : "+map.get("user_id"));	
		System.out.println("store_id : " + map.get("store_id"));
		System.out.println("menu_no : "+ map.get("menu_no"));

		int insertrv = service.insertReview(map);	
		System.out.println("rv_no: " + map.get("rv_no"));		
		//인서트		
		System.out.println(insertrv==0?"실패":"리뷰 쓰기 성공!!!!");
		return json.toJSONString();
	}
	
	
	//review 수정 폼으로 이동]
	@RequestMapping(value = "/updateSTReview.bbs", method = RequestMethod.GET)
	public String updateMyReview(Authentication auth, Model model, @RequestParam Map map) {			
		System.out.println("스토어 단 리뷰 수정폼으로 이동 완료!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("스토어 단 회원정보 수정폼 user_id: "+map.get("user_id"));
		
		//서비스 호출]
		MyPageDTO stRV4up = service.getOneReviewForUpdate(map);
		System.out.println(stRV4up.getRv_content());
		stRV4up.setRv_title(stRV4up.getRv_title().trim());
		stRV4up.setRv_content(stRV4up.getRv_content().trim());			
		model.addAttribute("stRV4up",stRV4up);
		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 rv_no : "+stRV4up.getRv_no());
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());	
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Store_name2 : "+stRV4up.getStore_name2());		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_name : "+stRV4up.getMenu_name());		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());		
		
		MyPageDTO stRVupImg = service.getOneReviewPicForUpdate(map);
		model.addAttribute("stRVupImg", stRVupImg);
		System.out.println("스토어 단 리뷰 수정폼 stRVupImg : " + stRVupImg);	
		
		map.put("store_id",stRV4up.getStore_name());
		List<FoodMenuDTO> menuSTs = service.getMenu4up(map);
		model.addAttribute("menuSTs",menuSTs);
		for(int i=0; i<menuSTs.size(); i++) {
			System.out.println("스토어 단 리뷰 수정폼 menus.menu_no : "+menuSTs.get(i).getMenu_no());
		}	
		return "Store/Review/UpdateSTReview.tiles";
	}
	//리뷰 수정 처리]
	@RequestMapping(value = "/updateSTReviewOk.bbs", method = RequestMethod.POST)
	public String updateMyReview(Authentication auth, @RequestParam Map map) {
		System.out.println("리뷰 수정  IN!!!!!!!!!!!!!");
		System.out.println(map.get("user_id"));
		System.out.println("rv_no");

		MyPageDTO stRV4up = service.getOneReviewForUpdate(map);
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 rv_no : "+stRV4up.getRv_no());
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());	
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Store_name2 : "+stRV4up.getStore_name2());		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_name : "+stRV4up.getMenu_name());		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());		
		System.out.println("스토어 단 리뷰 수정폼 stRVup의 rf_path : "+stRV4up.getRf_path());			
	
		int updateRV = service.updateReview(map);
		System.out.println(updateRV==0?"리뷰 수정 실패":"리뷰 수정 성공");
		System.out.println("리뷰 수정 완료 !!!!!!!!!!!!!");		
		return "forward:/Store/DetailView.do?username="+map.get("store_id")+"";
	}
	
	//리뷰 삭제 처리]
	@RequestMapping(value="/deleteSTReview.bbs")
	public String deleteMyReview(@RequestParam Map map) {		
		
		System.out.println("리뷰 삭제 IN !!!!!!!!!!!!!");								
		System.out.println(map.get("rv_no").toString()+ "   rv_no 넘어옴?");
		
		
		
//		if(.rf_path != null) {
		int deleteRVpic = service.deleteOneReviewPic(map);
		System.out.println(deleteRVpic==0?"리뷰 사진 실패":"리뷰 사진 성공");
//			}
		
//		if(  != null) {
		int deleteRVth = service.deleteOneReviewThumb(map);
		System.out.println(deleteRVth==0?"리뷰 좋아요 실패":"리뷰 좋아요 성공");
//		}
		
		
		int deleteRV = service.deleteOneReview(map);
		System.out.println(deleteRV==0?"리뷰 삭제 실패":"리뷰 삭제 성공");
		
		return "forward:/Store/DetailView.do?username="+store_id+"";
		}///////////
		
		
	
//	@ResponseBody
//	@RequestMapping(value="/insertRVThumb.do",method=RequestMethod.GET)
//	public String insertRVThumb(@RequestParam Map map, Authentication auth,Model model, HttpServletRequest req) {	
//		
//		System.out.println("username3 : "+map.get("username"));	
//		UserDetails userDetails = (UserDetails)auth.getPrincipal();
//		String user_id = userDetails.getUsername();
//		map.put("user_id",user_id);		
//		
//		int clickThumb = service.insertRVThumb(map);
//		model.addAttribute("clickThumb",clickThumb);
//		System.out.println(clickThumb==0?"실패":"성공");
//	
//	
//		return "/Store/DetailView.tiles";
//	}
//	
////
////	
//	/*리뷰 좋아요*/	
//	@ResponseBody
//	@RequestMapping(value="/disThumb.bbs",method=RequestMethod.GET)
//	public String disThumb(@RequestParam Map map, Authentication auth,Model model, HttpServletRequest req) {	
//		System.out.println("username3 : "+map.get("username"));	
//		UserDetails userDetails = (UserDetails)auth.getPrincipal();
//		String user_id = userDetails.getUsername();
//		map.put("user_id",user_id);		
//		
//		int disThumb = service.deleteRVThumb(map);
//		model.addAttribute("disThumb",disThumb);
//		System.out.println(disThumb!=0?"성공":"실패");
//		
//		
//		return "/Store/DetailView.tiles";
//	}
//	
//	
	
}
