package com.kosmo.mukja.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.MyPageService;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.web.util.PagingUtil;
import com.sun.security.auth.UserPrincipal;

import sun.text.normalizer.ICUBinary.Authenticate;


@Controller
public class MyPageController{
	
	@Resource(name = "myPageService")
	private MyPageService service;
	
	//리소스파일(resource.properties)에서 읽어오기
	@Value("${PAGE_SIZE_MP}")
	private int pageSize;
	@Value("${BLOCK_PAGE_MP}")
	private int blockPage;
	
	private String user_id;
	
	@RequestMapping(value = "/MyPage.bbs")
	public String MyPage(
							@RequestParam Map map,
							@RequestParam(required = false,defaultValue = "1") int nowPage, 
							Model model, 
							HttpServletRequest req,
							Authentication auth) {

		
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("user_id 출력! : "+user_id);


		
		/*프로필*/
		UsersDTO myInfo = service.getMyInfo(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS","HS","BS","YS"};
		String[] tend_text= {
				"/resources/tend_IMG/pesco_c.png","/resources/tend_IMG/ovo_c.png","/resources/tend_IMG/dp_c.png",
				"/resources/tend_IMG/chicken_c.png","/resources/tend_IMG/pig_c.png","/resources/tend_IMG/cow2_c.png",
				"/resources/tend_IMG/nuts_c.png","/resources/tend_IMG/shrimp_c.png","/resources/tend_IMG/dairy_c.png",
				"/resources/tend_IMG/gluten_c.png","/resources/tend_IMG/s_c.png","","","","",""};
		for(int j=0; j<tend_codes.length; j++) {
			for(int i=0; i<myInfo.getU_tend().length();i++) {
				myInfo.setU_tend(myInfo.getU_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		model.addAttribute("myInfo",myInfo);
		
		
		
		
		/*찜*/			
		//페이징을 위한 로직 시작]
		//전체 레코드수	
//		int jjimCount = service.getMyJjimTotal(map);
//		//전체 페이지수]
//		int JjimPage = (int)Math.ceil((double)jjimCount/pageSize);			
//		//시작 및 끝 ROWNUM구하기]
//		int jjimstart = (nowPage-1)*pageSize+1;
//		int jjimend   = nowPage*pageSize;	
//		
//		//페이징을 위한 로직 끝]	
//		map.put("jjimstart", jjimstart);
//		map.put("jjimend", jjimend);
//		
		List<MyPageDTO> myJjim = service.getMyJjim(map);
		//데이타 저장]
//		String jjimPagingString = PagingUtil.pagingBootStrapStyle(jjimCount, pageSize,blockPage, nowPage, req.getContextPath()+"/Mukja/Member/MyPage.bbs?");
		
		model.addAttribute("myJjim", myJjim);
//		model.addAttribute("jjimPagingString", jjimPagingString);	
		
		List<StoreDTO> storetxt = service.getJjimInfo(map);
		for(int i=0; i<storetxt.size();i++) {
			System.out.println("storetxt username: "+storetxt.get(i).getUsername());
		}
		model.addAttribute("storetxt",storetxt);

		List<StoreIMGDTO> storeimgs = service.getJjimImgs(map);
		
		for(int i=0; i<storeimgs.size();i++) {
			/*
			 * System.out.println(i); if(storeImgs.size() == 0) {
			 * storeImgs.add(storeimgs.get(i)); } boolean duplicate = false; for(int j = 0;
			 * j < storeImgs.size(); j++) {
			 * if(storeImgs.get(j).getUsername().equals(storeimgs.get(i).getUsername())) {
			 * duplicate = true; }
			 * 
			 * if(duplicate == false) { storeImgs.add(storeimgs.get(i)); } }
			 */
			System.out.println("storeimgs path: "+storeimgs.get(i).getSf_path());
		}
		model.addAttribute("storeimgs",storeimgs);	
		
		
		
		
		/*리뷰*/
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int rvCount = service.getMyReviewTotal(map);
		//전체 페이지수]
		int totalPage = (int)Math.ceil((double)rvCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int rvstart = (nowPage-1)*pageSize+1;
		int rvend   = nowPage*pageSize;	
		//페이징을 위한 로직 끝]	
		map.put("rvstart", rvstart);
		map.put("rvend", rvend);
		
		List<MyPageDTO> rvcnt = service.getMyReview(map);
		//데이타 저장]
		model.addAttribute("rvCount",rvCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("nowPage",nowPage);
		String rvPagingString=PagingUtil.pagingBootStrapStyle(rvCount, pageSize,blockPage, nowPage, req.getContextPath()+"/Member/MyPage.bbs?");
		model.addAttribute("rvcnt",rvcnt);
		model.addAttribute("rvPagingString", rvPagingString);
		
		List<MyPageDTO> rvimgs = service.getMyReviewPics(map);
		model.addAttribute("rvimgs",rvimgs);
		
		
		
		
		
		
		
		List<MyPageDTO> Nicks = service.getNicks(map);
		System.out.println("닉네임얻기");
		model.addAttribute("Nicks",Nicks);
		
		List<MyPageDTO> etInCount = service.getInCount(map);
		model.addAttribute("etInCount",etInCount);
		
		
		
		/*리뷰*/
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int applCount = service.getMyReviewTotal(map);
		//전체 페이지수]
		int applTotalPage = (int)Math.ceil((double)applCount/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int apstart = (nowPage-1)*pageSize+1;
		int apend   = nowPage*pageSize;	
		//페이징을 위한 로직 끝]	
		map.put("apstart", apstart);
		map.put("apend", apend);
		
		List<MyPageDTO> myET0 = service.getETrecv0(map);
		String[] et0tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS","HS","BS,","YS"};
		String[] et0tend_text= {
				"/resources/tend_IMG/pesco_c.png","/resources/tend_IMG/ovo_c.png","/resources/tend_IMG/milk_c.png",
				"/resources/tend_IMG/chicken_c.png","/resources/tend_IMG/pig_c.png","/resources/tend_IMG/cow2_c.png",
				"/resources/tend_IMG/nuts_c.png","/resources/tend_IMG/shrimp_c.png","/resources/tend_IMG/dairy_c.png",
				"/resources/tend_IMG/gluten_c.png","/resources/tend_IMG/s_c.png","","","","",""};
		for(int j=0; j<et0tend_codes.length; j++) {
			for(int i=0; i<myET0.size();i++) {
				myET0.get(i).setEr_tend(myET0.get(i).getEr_tend().replaceAll(et0tend_codes[j], et0tend_text[j]));					
			}
		}//리스트에서 뽑은 성향의 포문			
		for(int i=0; i<myET0.size();i++) {
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replaceAll(" ",""));
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replace("년", "-"));	
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replace("월", "-"));
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replace("일", " "));
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replace("시", ":"));
			myET0.get(i).setEr_time(myET0.get(i).getEr_time().replace("분", ""));				
		}
		model.addAttribute("applCount",applCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("nowPage",nowPage);
		String applPagingString=PagingUtil.pagingBootStrapStyle(applCount, pageSize, blockPage, nowPage, req.getContextPath()+"/Member/MyPage.bbs?");
		model.addAttribute("myET0",myET0);
		model.addAttribute("applPagingString", applPagingString);
		
		
		
		
		List<MyPageDTO> myET1 = service.getETrecv1(map);
		System.out.println("myet1 IN");
		String[] et1tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS","HS","BS,","YS"};
		String[] et1tend_text= {
				"/resources/tend_IMG/pesco_c.png","/resources/tend_IMG/ovo_c.png","/resources/tend_IMG/milk_c.png",
				"/resources/tend_IMG/chicken_c.png","/resources/tend_IMG/pig_c.png","/resources/tend_IMG/cow2_c.png",
				"/resources/tend_IMG/nuts_c.png","/resources/tend_IMG/shrimp_c.png","/resources/tend_IMG/dairy_c.png",
				"/resources/tend_IMG/gluten_c.png","/resources/tend_IMG/s_c.png","","","","",""};
		for(int j=0; j<et1tend_codes.length; j++) {
			for(int i=0; i<myET1.size();i++) {
				myET1.get(i).setEr_tend(myET1.get(i).getEr_tend().replaceAll(et1tend_codes[j], et1tend_text[j]));					
			}
		}//리스트에서 뽑은 성향의 포문			
		for(int i=0; i<myET1.size();i++) {
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replaceAll(" ",""));
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replace("년", "-"));	
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replace("월", "-"));
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replace("일", " "));
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replace("시", ":"));
			myET1.get(i).setEr_time(myET1.get(i).getEr_time().replace("분", ""));				
		}
		for(int i =0; i<myET1.size(); i++) {
			System.out.println("myET1 er_no : " + myET1.get(i).getEr_no());
			System.out.println("myET1 username : " + myET1.get(i).getUsername());
			System.out.println("myET1 user_id : " + myET1.get(i).getUser_id());
			System.out.println("myET1 ertend : " + myET1.get(i).getEr_tend());
			System.out.println("myET1 ertime : " + myET1.get(i).getEr_time());
		}					
		model.addAttribute("myET1",myET1);
		
		List<StoreDTO> menus = service.getMenu(map);
		model.addAttribute("menus",menus);
		
		System.out.println("아우뜨");
		
		return "Member/MyPage.tiles";
	}
	
	
	
	
	//회원정보 수정 폼으로 이동]
	@RequestMapping(value = "/UpdateMyInfo.bbs", method = RequestMethod.GET)
	public String goUpdate(HttpServletRequest req,
			  Authentication auth,
			  Model model,
			  @RequestParam Map map) {			
		System.out.println("수정폼으로 이동 완료!");
		//회원아이디 얻기
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		UsersDTO userInfo = service.getMyInfo(map);
		model.addAttribute("userInfo",userInfo);
		return "/User/UpdateMyInfo.tiles";
	}
	
	//회원정보 수정 처리]
	@RequestMapping(value = "/UpdateMyInfo.bbs", method = RequestMethod.POST)
	public String UpdateCompleted(Authentication auth, Model model, @RequestParam Map map) {	
		System.out.println(map.get("user_id"));
		System.out.println("수정  IN!!!!!!!!!!!!!");
		int result = service.updateMyInfo(map);
		System.out.println(result==0?"수정 실패":"수정 성공");
		System.out.println("수정완료 !!!!!!!!!!!!!");
		return "forward:/MyPage.bbs";
	}///////////
	
	
	
	//리뷰 수정 폼으로 이동]
	@RequestMapping(value = "/updateMyReview.bbs", method = RequestMethod.GET)
	public String updateMyReview(Authentication auth, Model model, @RequestParam Map map) {			
		System.out.println("리뷰 수정폼으로 이동 완료!");
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("회원정보 수정폼 user_id: "+map.get("user_id"));
		
		//서비스 호출]
		MyPageDTO rvcnt4up = service.getMyReviewForUpdate(map);
		System.out.println(rvcnt4up.getRv_content());
		rvcnt4up.setRv_title(rvcnt4up.getRv_title().trim());
		rvcnt4up.setRv_content(rvcnt4up.getRv_content().trim());		
		model.addAttribute("rvcnt4up",rvcnt4up);
		
		System.out.println("리뷰 수정폼 rvcnt4up의 rv_no : "+rvcnt4up.getRv_no());
		System.out.println("리뷰 수정폼 rvcnt4up의 Menu_no : "+rvcnt4up.getMenu_no());	
		System.out.println("리뷰 수정폼 rvcnt4up의 Store_name2 : "+rvcnt4up.getStore_name2());		
		
		MyPageDTO rvimgs4up = service.getMyReviewPicForUpdate(map);
		model.addAttribute("rvimgs4up", rvimgs4up);
		System.out.println("리뷰 수정폼 rvimgs : " + rvimgs4up);	
		
		List<StoreDTO> menus = service.getMenu(map);
		model.addAttribute("menus",menus);
		for(int i=0; i<menus.size(); i++) {
			System.out.println("리뷰 수정폼 menus.menu_no : "+menus.get(i).getMenu_no());
		}		
			
		return "/User/UpdateMyReview.tiles";
	}
	//리뷰 수정 처리]
	@RequestMapping(value = "/updateMyReviewOk.bbs", method = RequestMethod.POST)
	public String updateMyReview(Authentication auth, @RequestParam Map map) {
		System.out.println("리뷰 수정  IN!!!!!!!!!!!!!");
		System.out.println("user_id : "+user_id);
		System.out.println("rv_no : "+map.get("rv_no"));

		MyPageDTO stRV4up = service.getMyReviewForUpdate(map);
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 rv_no : "+stRV4up.getRv_no());
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());	
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 Store_name2 : "+stRV4up.getStore_name2());		
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 Menu_name : "+stRV4up.getMenu_name());		
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 Menu_no : "+stRV4up.getMenu_no());		
		System.out.println("마이페이지 단 리뷰 수정폼 stRVup의 rf_path : "+stRV4up.getRf_path());			
	
		int updateRV = service.updateMyReview(map);
		System.out.println(updateRV==0?"리뷰 수정 실패":"리뷰 수정 성공");
		System.out.println("리뷰 수정 완료 !!!!!!!!!!!!!");
		
		return "forward:/MyPage.bbs";
	}
	
	//리뷰 삭제 처리]
	@RequestMapping(value="/deleteMyReview.bbs")
	public String deleteMyReview(@RequestParam Map map) {		
		
		System.out.println("리뷰 삭제 IN !!!!!!!!!!!!!");								
		System.out.println(map.get("rv_no").toString()+ "   rv_no 넘어옴?");
		int deleteRVpic = service.deleteMyReviewPic(map);
		System.out.println(deleteRVpic==0?"리뷰 사진 실패":"리뷰 사진 성공");
		int deleteRVth = service.deleteMyReviewThumb(map);
		System.out.println(deleteRVth==0?"리뷰 좋아요 실패":"리뷰 좋아요 성공");
		int deleteRV = service.deleteMyReview(map);
		System.out.println(deleteRV==0?"리뷰 삭제 실패":"리뷰 삭제 성공");
		
		return "forward:/MyPage.bbs";
	}///////////
	
	@ResponseBody
	@RequestMapping(value = "/er_Accept.bbs")
	public String er_Accept(@RequestParam Map map) {
		System.out.println("수락 승인 IN !!!!!!!!!!!!!");
		System.out.println("수락 승인 속 user_id"+map.get("user_id").toString());
		System.out.println("수락 승인 속 er_no"+map.get("er_no").toString());
		System.out.println("수락 승인 속 nowPage"+map.get("nowPage").toString());
      
      int result = service.er_Accept(map);
		System.out.println(result==0?"수락 승인 실패":"수락 승인 성공");

      
      return "forward:/MyPage.bbs";
   }
	
	@ResponseBody
	@RequestMapping(value = "/er_Reject.bbs")
	public String er_Reject(@RequestParam Map map) {
		System.out.println("수락 거절 IN !!!!!!!!!!!!!");
	    System.out.println("수락 거절 속 user_id"+map.get("user_id").toString());
	    System.out.println("수락 거절 속 er_no"+map.get("er_no").toString());
	    System.out.println("수락 거절 속 nowPage"+map.get("nowPage").toString());
	      
	    int result = service.er_Accept(map);
		System.out.println(result==0?"수락 거절 실패":"수락 거절 성공");

	
		return "forward:/MyPage.bbs";
	}//StoreReview
	
	
	
}