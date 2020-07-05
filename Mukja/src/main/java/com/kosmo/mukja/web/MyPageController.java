package com.kosmo.mukja.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	@RequestMapping(value = "/MyPage.bbs")
	public String MyPage(
							@RequestParam Map map,
							@RequestParam(required = false,defaultValue = "1") int nowPage, 
							Model model, 
							HttpServletRequest req,
							Authentication auth) {
		System.out.println("여기");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user_id = userDetails.getUsername();
		map.put("user_id",user_id);
		System.out.println("user_id 출력! : "+user_id);
					
				
		// ddd 왜자꾸 reject 될까............ㅇ
		
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
		System.out.println("myInfo username : "+myInfo.getUsername());
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
		
		List<MyPageDTO> myJjim = service.getMyJjim(map);
		//데이타 저장]
//		String jjimPagingString = PagingUtil.pagingBootStrapStyle(jjimCount, pageSize,blockPage, nowPage, req.getContextPath()+"/Mukja/Member/MyPage.bbs?");
		
		model.addAttribute("myJjim", myJjim);
//		model.addAttribute("jjimPagingString", jjimPagingString);	
		
		List<StoreDTO> storetxt = service.getJjimInfo(map);
		for(int i=0; i<storetxt.size();i++) {
			System.out.println("storetxt : "+storetxt.get(i).getUsername());
		}
		model.addAttribute("storetxt",storetxt);
		
		List<StoreIMGDTO> storeimgs = service.getJjimImgs(map);
		for(int i=0; i<storeimgs.size();i++) {
			System.out.println("storeimgs : "+storeimgs.get(i).getUsername());
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
		String rvPagingString=PagingUtil.pagingBootStrapStyle(rvCount, pageSize,blockPage, nowPage, req.getContextPath()+"/Member/MyPage.bbs?");
		model.addAttribute("rvcnt",rvcnt);
		model.addAttribute("rvPagingString", rvPagingString);
		
		List<MyPageDTO> rvimgs = service.getMyReviewPics(map);
		model.addAttribute("rvimgs",rvimgs);
		
		
		
		
		/*ET기록*/
//		List<MyPageDTO> myETs = service.getETList(map);
//		
//		model.addAttribute("myETs",myETs);
//		System.out.println(myETs);
//		
//		
//		List<MyPageDTO> myETnms = service.getETNames(map);
//		for(int i=0; i<myETnms.size();i++) {
//			System.out.println(myETnms.get(i).getUsername());
//		}		
//		model.addAttribute("myETnms",myETnms);
//		
//
//		List<UsersDTO> myUsNx = service.getUsersNks(map);
//		for(int i=0; i<myUsNx.size();i++) {
//			System.out.println(myUsNx.get(i).getU_nick());
//		}		
//		model.addAttribute("myUsNx",myUsNx);
		
		
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
		model.addAttribute("myET0",myET0);
		for(int i=0; i<myET0.size();i++) {
			System.out.println("myET0 username : " + myET0.get(i).getUsername());
			System.out.println("myET0 ertend : " + myET0.get(i).getEr_tend());
			System.out.println("myET0 user_id : " + myET0.get(i).getUser_id());
			System.out.println("myET0 ertime : " + myET0.get(i).getEr_time());
			System.out.println("myET0 er_no  :" + myET0.get(i).getEr_no());
		}
		
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
			System.out.println("myET1 username : " + myET1.get(i).getUsername());
			System.out.println("myET1 user_id : " + myET1.get(i).getUser_id());
			System.out.println("myET1 ertend : " + myET1.get(i).getEr_tend());
			System.out.println("myET1 ertime : " + myET1.get(i).getEr_time());
			System.out.println("myET1 er_no : " + myET1.get(i).getEr_no());
		}					
		model.addAttribute("myET1",myET1);
		
		
		List<MyPageDTO> Nicks = service.getNicks(map);
		System.out.println("닉네임얻기");
		for(int i=0; i<Nicks.size(); i++) {	
			System.out.println("Nicks : "+Nicks.get(i).getEr_no());	
			System.out.println("Nicks : "+Nicks.get(i).getUsername());
		}		
		model.addAttribute("Nicks",Nicks);

		
//		/*ET기록
//		List<MyPageDTO> myservice.getMyETHistory(map);
//		model.addAttribute("myETHist",myETHist);*/ 
		
		
		return "Member/MyPage.tiles";
	}
	
	
	
	
	
	
	
	
	
}