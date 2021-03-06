package com.kosmo.mukja.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

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

	private String store_id;
	private String user_id;
	private String rv_no;
	private String er_no;

	
	@RequestMapping(value = "/MyPage.bbs")
	public String MyPage(
							@RequestParam Map map,
							@RequestParam(required = false,defaultValue = "1") int nowPage, 
							Model model, 
							HttpServletRequest req,
							Authentication auth) {
		System.out.println("-------------------------mypage IN----------------------");
		if(map.get("usercard")==null) {			
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			String user_id = userDetails.getUsername();
			map.put("user_id",user_id);
			
		}
		else {
			String user_id = map.get("usercard").toString();
			map.put("user_id",user_id);
		}
		map.put("store_id",store_id);
		System.out.println("user_id 출력! : "+user_id);
		System.out.println("store_id 출력! : "+store_id);


		
		/*프로필*/
		UsersDTO myInfo = service.getMyInfo(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS","HS","BS","YS"};
		String[] tend_text= {
				"/resources/tend_IMG/pesco_c.png","/resources/tend_IMG/ovo_c.png","/resources/tend_IMG/dp_c.png",
				"/resources/tend_IMG/chicken_c.png","/resources/tend_IMG/pig_c.png","/resources/tend_IMG/cow2_c.png",
				"/resources/tend_IMG/nuts_c.png","/resources/tend_IMG/shrimp_c.png","/resources/tend_IMG/dairy_c.png",
				"/resources/tend_IMG/gluten_c.png","/resources/tend_IMG/s_c.png","","","","",""};
		if(myInfo.getU_tend()==null) {
			myInfo.setU_tend(" ");
		}
		for(int j=0; j<tend_codes.length; j++) {
			for(int i=0; i<myInfo.getU_tend().length();i++) {
				myInfo.setU_tend(myInfo.getU_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		model.addAttribute("myInfo",myInfo);
		List<MyPageDTO> myJjim = service.getMyJjim(map);
		model.addAttribute("myJjim", myJjim);	
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
		System.out.println("Nicks"+Nicks);

		List<MyPageDTO> Nicks0 = service.getNicks0(map);
		System.out.println("닉네임얻기");
		model.addAttribute("Nicks0",Nicks0);
		System.out.println("Nicks0"+Nicks0);
		
		
		
		List<MyPageDTO> etInCount = service.getInCount(map);
		model.addAttribute("etInCount",etInCount);
		
		
		
		
		
		/*신청/거절*/
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
		
		System.out.println("myET0 "+myET0);
		
		
		
		
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
//		for(int i =0; i<myET1.size(); i++) {
//			System.out.println("myET1 er_no : " + myET1.get(i).getEr_no());
//			System.out.println("myET1 username : " + myET1.get(i).getUsername());
//			System.out.println("myET1 user_id : " + myET1.get(i).getUser_id());
//			System.out.println("myET1 ertend : " + myET1.get(i).getEr_tend());
//			System.out.println("myET1 ertime : " + myET1.get(i).getEr_time());
//		}					
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
		System.out.println(userInfo.getU_tend());
		
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
		
		System.out.println(map.get("rv_no"));
		//서비스 호출]
		MyPageDTO rvcnt4up = service.getMyReviewForUpdate(map);
		System.out.println(rvcnt4up.getRv_content());
		rvcnt4up.setRv_title(rvcnt4up.getRv_title().trim());
		rvcnt4up.setRv_content(rvcnt4up.getRv_content().trim());		
		model.addAttribute("rvcnt4up",rvcnt4up);
		
//		System.out.println("리뷰 수정폼 rvcnt4up의 rv_no : "+rvcnt4up.getRv_no());
//		System.out.println("리뷰 수정폼 rvcnt4up의 Menu_no : "+rvcnt4up.getMenu_no());	
//		System.out.println("리뷰 수정폼 rvcnt4up의 Store_name2 : "+rvcnt4up.getStore_name2());		
		
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
	public String updateMyReview(Authentication auth, @RequestParam Map map, HttpServletRequest req, MultipartRequest mr) {
		System.out.println("리뷰 수정  IN!!!!!!!!!!!!!");
		String path ="/resources/IMG";
		String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
				
		String rv_no = map.get("rv_no").toString();
		System.out.println(rv_no +" = 리뷰 번호 보자");
		String menu_no = map.get("menu_no").toString();
		String rv_title = map.get("rv_title").toString();
		String rv_content = map.get("rv_content").toString();
		
		MultipartFile img = mr.getFile("rf_path");
		
		String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
	      
	    File file = new File(realPath+"/"+fileName);
	    System.out.println(String.format("파일 이름 = %s, 파일 경로 = %s", file.getName(),path+"/"+fileName));
	    try {
	      img.transferTo(file);
	    }
	    catch(Exception e) {e.printStackTrace();}
		String rf_path = path+"/"+fileName;
		if(rf_path!=null) {			
			map.put("rf_path", rf_path);			
		}
		map.put("rv_no", rv_no);
		map.put("menu_no", menu_no);
		map.put("rv_title", rv_title);
		map.put("rv_content", rv_content);
		map.put("rf_path", rf_path);
//		System.out.println("rv_no : " + rv_no);
//		System.out.println("menu_no : " + menu_no);
//		System.out.println("rv_title : " + rv_title);
//		System.out.println("rv_content : " + rv_content);
//		System.out.println("rf_path : "+rf_path);
		
		int updateRV = service.updateMyReview(map);
		System.out.println(updateRV==0?"리뷰 수정 실패":"리뷰 수정 성공");
		if(rf_path!=null) {
			int updateRVpic = service.updateMyReviewPic(map);
			System.out.println(updateRV==0?"리뷰pics 수정 실패":"리뷰pics 수정 성공");
		}
		
		System.out.println("리뷰 수정 완료 !!!!!!!!!!!!!");
		
		return "redirect:/MyPage.bbs";
	}
	
	//리뷰 삭제 처리]
	@ResponseBody
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
		return "1";
	}///////////
	
	@ResponseBody
	@RequestMapping(value = "/er_Accept.bbs")
	public String er_Accept(Authentication auth, @RequestParam Map map, HttpServletRequest req) {
		System.out.println("수락 승인 IN !!!!!!!!!!!!!");

//		UserDetails userDetails = (UserDetails)auth.getPrincipal();
//		user_id = userDetails.getUsername();
//		map.put("user_id",user_id);
		er_no = req.getParameter("er_no");
		String applyer = req.getParameter("applyer");	
		System.out.println("er_no 찍음 = "+er_no);
		System.out.println("applyer 찍음 = "+applyer);
		System.out.println("applyer 찍음 = "+map.get("applyer"));
		map.put("applyer",map.get("applyer"));
		map.put("er_no",er_no);
		JSONObject json = new JSONObject();
		System.out.println("user_id : "+user_id);
//		System.out.println("수락 승인 속 user_id : "+map.get("user_id"));
		System.out.println("수락 승인 속 applyer : "+map.get("applyer"));
		System.out.println("수락 승인 속 er_no : "+map.get("er_no"));
//		System.out.println("수락 승인 속 nowPage : "+map.get("nowPage"));
      
		int result = service.er_Accept(map);
		System.out.println(result==0?"수락 승인 실패":"수락 승인 성공");
		json.put("result", result);
		// String temp = "<script>location.replace(\"<c:url value='/MyPage.bbs?username="+user_id+"'/>\");</script>";
		// json.put("temp", temp);
      return json.toJSONString();
   }
	
	@ResponseBody
	@RequestMapping(value = "/er_Reject.bbs")
	public String er_Reject(Authentication auth,@RequestParam Map map, HttpServletRequest req) {
		System.out.println("수락 거절 IN !!!!!!!!!!!!!");		
//		UserDetails userDetails = (UserDetails)auth.getPrincipal();
//		user_id = userDetails.getUsername();
//		map.put("user_id",user_id);
		er_no = req.getParameter("er_no");
		String applyer = req.getParameter("applyer");
		
		System.out.println("er_no 찍음 = "+er_no);
		System.out.println("applyer 찍음 = "+map.get("applyer"));
		
		map.put("er_no",er_no);
		map.put("applyer",map.get("applyer"));
		
		JSONObject json = new JSONObject();
		System.out.println("수락 승인 속 applyer : "+map.get("applyer"));
		System.out.println("수락 failed 속 er_no : "+map.get("er_no"));
	    
		int result = service.er_Reject(map);
		System.out.println(result==0?"수락 failed":"수락 거절 성공");
		json.put("result", result);
		return json.toJSONString();
	}//StoreReview
	
	//찜 삭제 처리]
	@RequestMapping(value="/deleteMyJjim.bbs")
	public String deleteMyJjim(@RequestParam Map map) {	
		System.out.println("!!!!!!!!!!!!!!!!!찜 삭제 IN !!!!!!!!!!!!!");								
		System.out.println("ms_no : "+map.get("ms_no"));
		int deleteJjim = service.deleteMyJjim(map);
		System.out.println(deleteJjim==0?"찜 삭제 실패":"찜 삭제 성공");
		return "forward:/MyPage.bbs";
	}///////////
	
	//ET 삭제 처리]
	@ResponseBody
	@RequestMapping(value="/deleteMyETHist.bbs")
	public String deleteMyETHist(Authentication auth,@RequestParam Map map) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("user_id : "+user_id);
		System.out.println("!!!!!!!!!!!!!!!!!ET 삭제 IN !!!!!!!!!!!!!");								
		System.out.println("er_no : "+map.get("er_no"));
		int deleteEM = service.deleteMyEM(map);
		System.out.println(deleteEM==0?"em 삭제 실패":"em 삭제 성공");
		int deleteEMC = service.deleteMyERC(map);
		System.out.println(deleteEMC==0?"emc 삭제 실패":"emc 삭제 성공");
		int deleteER = service.deleteMyER(map);
		System.out.println(deleteER==0?"er삭제 실패":"er 삭제 성공");
		return "1";
	}///////////

	@ResponseBody
	@RequestMapping(value = "/modal.bbs", method = RequestMethod.GET)
	public UsersDTO modal(@RequestParam Map map) {
	   
	   return service.modal(map);
	}///////////

	@RequestMapping(value="/userReport.bbs")
	public String userReport(Authentication auth,@RequestParam Map map, HttpServletRequest req,Model model) {
		System.out.println("==============================회원신고==============================");		
		
		if(req.getMethod().equals("GET")) {
			System.out.println("!!!!!!!!!!!!!!!!! 회원신고 IN !!!!!!!!!!!!!");	
			
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			user_id = userDetails.getUsername();
			map.put("user_id",user_id);	
			map.put("er_no", map.get("er_no"));
			
			System.out.println("맵쩜갯"+map.get("user_id")+" , "+map.get("er_no"));
			MyPageDTO report = service.get1et1(map);
			System.out.println("리포터안의"+report.getUser_id()+" , "+ report.getEr_no());
			model.addAttribute("user_id", user_id);
			
			List<UsersDTO> urns  = service.getURN(map);	
			for(int i =0; i<urns.size(); i++) {
				System.out.println(urns.get(i).getUsername()+" , "+urns.get(i).getU_nick());
			}
			model.addAttribute("urns",urns);
			return "/User/ReportUser.tiles";
			
		}
		
		System.out.println("!!!!!!!!!!!!!!!!! 회원신고 OK !!!!!!!!!!!!!");	
		System.out.println("ur_title"+map.get("ur_title"));
		System.out.println("ur_content"+map.get("ur_content"));
		System.out.println("ur_target"+map.get("ur_target"));
		System.out.println("ur_reporter"+map.get("ur_reporter"));
		int reportUser = service.reportUser(map);
		System.out.println(reportUser==0?"회원 신고 실패":"회원 신고 성공");
		return "forward:/MyPage.bbs";
	}///////////
	
	//방 나가기
	@RequestMapping(value="/erDelete.bbs")
	public String erDelete(Authentication auth, @RequestParam Map map, HttpServletRequest req,Model model) {
		System.out.println(map.get("er_no"));
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println(user_id);
		service.erDelete(map);
		return "forward:/MyPage.bbs";
	}
	   
	
}

