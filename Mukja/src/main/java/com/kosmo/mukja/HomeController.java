package com.kosmo.mukja;

import java.net.Socket;
import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MainDTO;
import com.kosmo.mukja.service.MainService;
import com.kosmo.mukja.service.MyPageService;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.web.util.PagingUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//리소스파일(resource.properties)에서 읽어오기
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
  
	@Resource(name = "mainService")
	private MainService mainService;
	@Resource(name = "myPageService")
	private MyPageService myPageService;
	private String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS","HS","BS","YS"};
	private String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model,
		   			  Map map,
		   			  @RequestParam(required = false,defaultValue = "1") int nowPage,
		   			  HttpServletRequest req,
		   			  Authentication auth
		   			  ) {
	   
      logger.info("Welcome home! The client locale is {}.", locale);

      List<MainDTO> dto = mainService.selectList(map);
      System.out.println(dto.get(0).getUsername());
      map.put("username", dto.get(0).getUsername());
      MainDTO temp = new MainDTO();
      
      temp = mainService.selectRankContent(map);
      List<MainDTO> rank1 = mainService.selectRank1List(map);
      List<MainDTO> rank1storeImg = mainService.selectRank1Img(map);
      List<MainDTO> rank1FoodImg = mainService.selectFoodMenuForMain(map);
      
      rank1.get(0).setStore_intro(temp.getStore_intro().trim());      
      System.out.println(rank1storeImg.get(0).getSf_path().toString());
      
      map.put("username", dto.get(1).getUsername());
      temp = mainService.selectRankContent(map);
      List<MainDTO> rank2 = mainService.selectRank2List(map);
      List<MainDTO> rank2storeImg = mainService.selectRank2Img(map);
      List<MainDTO> rank2FoodImg = mainService.selectFoodMenuForMain(map);
      rank2.get(0).setStore_intro(temp.getStore_intro().trim());
      
      map.put("username", dto.get(2).getUsername());
      temp = mainService.selectRankContent(map);
      List<MainDTO> rank3 = mainService.selectRank3List(map);
      List<MainDTO> rank3storeImg = mainService.selectRank3Img(map);
      List<MainDTO> rank3FoodImg = mainService.selectFoodMenuForMain(map);
      rank3.get(0).setStore_intro(temp.getStore_intro().trim());
      // 1) 랭킹 추천수에 따른 가게 뿌리기 끝
      
      // 2) 리뷰 추천수에 따른 뿌리기
      List<MainDTO> review = mainService.selectReviewList(map);
      
      map.put("rv_no", review.get(0).getRv_no());
      MainDTO content1 = mainService.selectContent(map);
      review.get(0).setRv_content(content1.getRv_content().toString());
      map.put("username", review.get(0).getStore_name());
      content1 = mainService.selectStore_Name(map);
      review.get(0).setUsername(content1.getUsername().toString());
      review.get(0).setStore_name(content1.getStore_name().toString());
      
      map.put("rv_no", review.get(1).getRv_no());
      MainDTO content2 = mainService.selectContent(map);
      review.get(1).setRv_content(content2.getRv_content().toString());
      map.put("username", review.get(1).getStore_name());
      content2 = mainService.selectStore_Name(map);
      review.get(1).setUsername(content2.getUsername().toString());
      review.get(1).setStore_name(content2.getStore_name().toString());
      
      map.put("rv_no", review.get(2).getRv_no());
      MainDTO content3 = mainService.selectContent(map);
      review.get(2).setRv_content(content3.getRv_content().toString());
      map.put("username", review.get(2).getStore_name());
      content3 = mainService.selectStore_Name(map);
      review.get(2).setUsername(content3.getUsername().toString());
      review.get(2).setStore_name(content3.getStore_name().toString());
      
      map.put("rv_no", review.get(3).getRv_no());
      MainDTO content4 = mainService.selectContent(map);
      review.get(3).setRv_content(content4.getRv_content().toString());
      map.put("username", review.get(3).getStore_name());
      content4 = mainService.selectStore_Name(map);
      review.get(3).setUsername(content4.getUsername().toString());
      review.get(3).setStore_name(content4.getStore_name().toString());
   
      // 3) 공지사항 뿌리기
	  String searchColumn = "";
	  String searchWord = "";
	  int totalRecordCount = mainService.getTotalRecord(map);
	  //전체 페이지수]
	  int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	  //시작 및 끝 ROWNUM구하기]
	  int start = (nowPage-1)*pageSize+1;
	  int end   = nowPage*pageSize;	
	  //페이징을 위한 로직 끝]	
	  map.put("start", start);
	  map.put("end", end);
	  List<MainDTO> list = mainService.selectNoticeList(map);
	  //데이타 저장]
	  if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
			searchColumn = map.get("searchColumn").toString();
			searchWord = map.get("searchWord").toString();
	  }
	  else {
			searchColumn ="";
			searchWord = "";
	  }
	  
	  // 3) 공지사항 뿌리기 끝
		
	  // 1) 가게 랭킹
      model.addAttribute("rank1",rank1);
      model.addAttribute("rank1storeImg",rank1storeImg);
      model.addAttribute("rank1FoodImg",rank1FoodImg);
      
      model.addAttribute("rank2",rank2);
      model.addAttribute("rank2storeImg",rank2storeImg);
      model.addAttribute("rank2FoodImg",rank2FoodImg);
      
      model.addAttribute("rank3",rank3);
      model.addAttribute("rank3storeImg",rank3storeImg);
      model.addAttribute("rank3FoodImg",rank3FoodImg);
      
      // 2) 리뷰 랭킹
      model.addAttribute("reviewList",review);
      
      // 3) 공지사항
      model.addAttribute("totalRecordCount",totalRecordCount);
	  model.addAttribute("pageSize",pageSize);
	  model.addAttribute("nowPage",nowPage);
	  model.addAttribute("list", list);
	  
	  
	  
	  //....................회원님을 위한 추천
	  
	 
	  if(auth!=null&&req.isUserInRole("ROLE_USER")) {
			
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			String user_id = userDetails.getUsername();
			map.put("user_id", user_id);
			UsersDTO myInfo = myPageService.getMyInfo(map);
			System.out.println("유저 성향 : "+myInfo.getU_tend());
			String[] tends = myInfo.getU_tend().split(",");
			String u_nick= myInfo.getU_nick();
			List<FoodMenuDTO> menuList= new Vector<FoodMenuDTO>();
			List<FoodMenuDTO> resultList= new Vector<FoodMenuDTO>();
			//성향 키워드 갯수만큼 반복하여 성향과 일치하는 모든 메뉴 담기
			for(String tend:tends) {
				map.put("tend", tend);
				menuList.addAll(mainService.getRandomRecommendMenu(map));		
			}
			
			
			
			//리스트의 전체 크기사이의 숫자에서 랜덤수로 dto를 얻어서 결과 list에 삽입
			for(int i=0; i<5;i++) {
				 Random random = new Random();
				int randomInt = random.nextInt(menuList.size());
				resultList.add(menuList.get(randomInt));
			}
			
			//성향 코드를 단어로 변경
			for(int i=0; i<resultList.size();i++) {
				for(int j=0; j<tend_codes.length;j++) {
					resultList.get(i).setMenu_tend(resultList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]).replaceAll(",", " "));
					System.out.println(tend_codes[j]+"가  "+tend_text[j]+"로 변환");
				}
			}//리스트에서 뽑은 성향의 포문
			System.out.println(resultList.toString());
			System.out.println(u_nick);
			model.addAttribute("u_nick", u_nick);
			 model.addAttribute("recommend_menu", resultList);	
	  }else {
		
			List<FoodMenuDTO> menuList= mainService.getRandomRecommendMenuAll(map);
			List<FoodMenuDTO> resultList= new Vector<FoodMenuDTO>();
		
			//리스트의 전체 크기사이의 숫자에서 랜덤수로 dto를 얻어서 결과 list에 삽입
			for(int i=0; i<5;i++) {
				Random random = new Random();
				int randomInt = random.nextInt(menuList.size());
				resultList.add(menuList.get(randomInt));
			}
			//성향 코드를 단어로 변경
			for(int i=0; i<resultList.size();i++) {
				for(int j=0; j<tend_codes.length;j++) {
					resultList.get(i).setMenu_tend(resultList.get(i).getMenu_tend().replaceAll(",", " ").replaceAll(tend_codes[j], tend_text[j]));
					System.out.println(tend_codes[j]+"가  "+tend_text[j]+"로 변환");
				}
			}//리스트에서 뽑은 성향의 포문
			System.out.println(resultList.toString());
			model.addAttribute("recommend_menu", resultList);	
	  }
      return "Main/MukjaMain.tiles";
   }
   
   @RequestMapping(value = "/MainNoticeList.bbs", method = RequestMethod.GET)
   public String noticeMain(Model model,
		   			  Map map,
		   			  @RequestParam(required = false,defaultValue = "1") int nowPage,
		   			  HttpServletRequest req) {
      
	// 3) 공지사항 뿌리기
	   String searchColumn = "";
	   String searchWord = "";
	   int totalRecordCount = mainService.getTotalRecord(map);
	   //전체 페이지수]
	   int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	   //시작 및 끝 ROWNUM구하기]
	   int start = (nowPage-1)*pageSize+1;
	   int end   = nowPage*pageSize;	
	   //페이징을 위한 로직 끝]	
	   map.put("start", start);
	   map.put("end", end);
	   List<MainDTO> list = mainService.selectNoticeList(map);
	   
	   //데이타 저장]
	   if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
		   searchColumn = map.get("searchColumn").toString();
		   searchWord = map.get("searchWord").toString();
		}
	   	else {
	   		searchColumn ="";
			searchWord = "";
	   	}
	   int i= 0;
		  while(i<list.size()) {
			  list.get(i).setNT_CONTENT(list.get(i).getNT_CONTENT().replace("\r\n", "<br/>"));
		  StringTokenizer imageList=null;
			System.out.println(list.get(i).getBF_PATH());
			System.out.println(list.get(i).getBF_PATH()+" = Homecontroller 파일 정보");
			if(list.get(i).getBF_PATH()!=null) {
				System.out.println(list.get(i).getBF_PATH().toString());
				imageList = new StringTokenizer(list.get(i).getBF_PATH().toString(),"/");
				List<String> image = new ArrayList<String>();
				while(imageList.hasMoreTokens()) {
					image.add(imageList.nextToken());
				}
				System.out.println("리스트 toString  "+image.toString());
				list.get(i).setBF_PATH(image.toString().replace("[", "").replace("]", "").replace(", ", ",").trim());
				System.out.println("이미지 경로 출력 홈컨트롤러    "+list.get(i).getBF_PATH().toString());
			}
			else {
				list.get(i).setBF_PATH(null);
			}
			i++;
		  }
	   
	   System.out.println(req.getContextPath() + "    reqContext 출력");
	   	String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize,blockPage, nowPage, req.getContextPath()+"/MainNoticeList.bbs?", searchColumn, searchWord);
	   	model.addAttribute("totalRecordCount",totalRecordCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("nowPage",nowPage);
		System.out.println("list 존재?"+list);
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
	   
      return "Main/NoticeMain";
   }
   
   @ResponseBody
   @RequestMapping(value="/mainAndroid.bbs", produces = "application/json; charset=utf8" )
   public String androidHome(Map map,
		   					@RequestParam(required = false,defaultValue = "1") int nowPage) {
	   JSONObject json = new JSONObject();
	   List<MainDTO> dto = mainService.selectList(map);
	   System.out.println(dto.get(0).getUsername());
	   MainDTO temp = new MainDTO();
	   map.put("username", dto.get(0).getUsername());
	   temp = mainService.selectRankContent(map);
	   dto.get(0).setStore_intro(temp.getStore_intro().toString());
	   List<MainDTO> rank12Img = mainService.selectRank1Img(map);
	   
	   map.put("username", dto.get(1).getUsername());
	   temp = mainService.selectRankContent(map);    
	   dto.get(1).setStore_intro(temp.getStore_intro().toString());
	   List<MainDTO> rank22Img = mainService.selectRank2Img(map);
	   
	   map.put("username", dto.get(2).getUsername());
	   temp = mainService.selectRankContent(map);
	   dto.get(2).setStore_intro(temp.getStore_intro().toString());
	   List<MainDTO> rank32Img = mainService.selectRank3Img(map);
	   String img = "";

	   	for(int k=0; k<rank12Img.size();k++) {
	   	 System.out.println("1위 가게 이미지들"+rank12Img.get(k).getSf_path());
    	  if((k+1)==rank12Img.size()) {
    		  img += rank12Img.get(k).getSf_path().toString() + "|1|";
    		  System.out.println("1위 if문 안 ="+img);
    	  }
    	  else {
    		  img += rank12Img.get(k).getSf_path().toString() + "|"; 
    		  System.out.println("1위 else문 안 ="+img);
    	  }
	   	}
	   	for(int k=0; k<rank22Img.size();k++) {
	   	 System.out.println("2위 가게 이미지들"+rank22Img.get(k).getSf_path());
    	  if((k+1)==rank22Img.size()) {
    		  img += rank12Img.get(k).getSf_path().toString() + "|2|";
    		  System.out.println("2위 if문 안 ="+img);
    	  }
    	  else {
    		  img += rank22Img.get(k).getSf_path().toString() + "|"; 
    		  System.out.println("2위 else문 안 ="+img);
    	  }
	   	}
      for(int k=0; k<rank32Img.size();k++) {
    	  System.out.println("3위 가게 이미지들"+rank32Img.get(k).getSf_path());
    	  if((k+1)==rank32Img.size()) {
    		  img += rank32Img.get(k).getSf_path().toString() + "|3|";
    		  System.out.println("3위 if문 안 ="+img);
    	  }
    	  else {
    		  img += rank32Img.get(k).getSf_path().toString() + "|";
    		  System.out.println("3위 else문 안 ="+img);
    	  }
      }
      
      String img1 = img.substring(0,img.lastIndexOf("|1|"));
      System.out.println(img1 + " img1 찍기");
      String img2 = img.substring(img.indexOf("|1|")+3,img.lastIndexOf("|2|"));
      System.out.println(img2 + " img2 찍기");
      String img3 = img.substring(img.indexOf("|2|")+3,img.lastIndexOf("|3|"));
      System.out.println(img3 + " img3 찍기");
      dto.get(0).setSf_path(img1);
      dto.get(1).setSf_path(img2);
      dto.get(2).setSf_path(img3);
      
      JSONArray mainJsonArray = new JSONArray();
      int l=1;
      for(MainDTO mdto : dto) {
    	  if(l==4) {
    		  continue;
    	  }
    	  JSONObject rank = new JSONObject();
    	  rank.put("username",mdto.getUsername().toString());
    	  rank.put("store_name",mdto.getStore_name().toString());
    	  rank.put("store_intro",mdto.getStore_intro().toString());
    	  rank.put("sa_avg",mdto.getSa_avg().toString());  	  
    	  rank.put("sf_path",mdto.getSf_path().toString());
    	  mainJsonArray.add(rank);
    	  
    	  System.out.println(String.format("랭크 찍어봄 = %s번째", l));
    	  l++;
      }
      
      // 2) 리뷰 추천수에 따른 뿌리기
      List<MainDTO> review = mainService.selectReviewList(map);
      for(int i=0;i<review.size();i++) {
    	  map.put("rv_no", review.get(i).getRv_no().toString());
    	  MainDTO content = mainService.selectContent(map);
    	  review.get(i).setRv_content(content.getRv_content().toString());
    	  map.put("username", review.get(i).getStore_name().toString());
    	  content = mainService.selectStore_Name(map);
    	  review.get(i).setStore_name(content.getStore_name().toString());
    	     	  
      }
      l=1;
      for(MainDTO rdto : review) {
    	  JSONObject rv = new JSONObject();
    	  rv.put("rv_no", rdto.getRv_no().toString());
    	  rv.put("rv_title", rdto.getRv_title().toString());
    	  rv.put("rv_content",rdto.getRv_content().toString());
    	  rv.put("store_name", rdto.getStore_name().toString());
    	  rv.put("menu_no", rdto.getMenu_no().toString());
    	  rv.put("rf_path", rdto.getRf_path().toString());
    	  rv.put("menu_name",rdto.getMenu_name().toString());
    	  rv.put("good", rdto.getGood().toString());
    	  mainJsonArray.add(rv);
    	  System.out.println(String.format("리뷰 찍어봄 = %s번째", l));
    	  l++;
      }
      
   // 3) 공지사항 뿌리기
	   String searchColumn = "";
	   String searchWord = "";
	   int totalRecordCount = mainService.getTotalRecord(map);
	   //전체 페이지수]
	   int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	   //시작 및 끝 ROWNUM구하기]
	   int start = (nowPage-1)*pageSize+1;
	   int end   = nowPage*pageSize;	
	   //페이징을 위한 로직 끝]	
	   map.put("start", start);
	   map.put("end", end);
	   List<MainDTO> list = mainService.selectNoticeList(map);
	   
	   //데이타 저장]
	   if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
		   searchColumn = map.get("searchColumn").toString();
		   searchWord = map.get("searchWord").toString();
		}
	   	else {
	   		searchColumn ="";
			searchWord = "";
	   	}
	   int i= 0;
		  while(i<list.size()) {
			  list.get(i).setNT_CONTENT(list.get(i).getNT_CONTENT().replace("\r\n", "<br/>"));
		  StringTokenizer imageList=null;
			System.out.println(list.get(i).getBF_PATH());
			System.out.println(list.get(i).getBF_PATH()+" = Homecontroller 파일 정보");
			if(list.get(i).getBF_PATH()!=null) {
				System.out.println(list.get(i).getBF_PATH().toString());
				imageList = new StringTokenizer(list.get(i).getBF_PATH().toString(),"/");
				List<String> image = new ArrayList<String>();
				while(imageList.hasMoreTokens()) {
					image.add(imageList.nextToken());
				}
				list.get(i).setBF_PATH(image.toString().replace("[", "").replace("]", "").replace(", ", ",").trim());
			}
			else {
				list.get(i).setBF_PATH(null);
			}
			i++;
		  }
		  
		  l=1;
		  for(MainDTO ldto : list) {
			  JSONObject li = new JSONObject();
			  li.put("nt_no",ldto.getNT_NO().toString());
			  li.put("bf_path", ldto.getBF_PATH());
			  li.put("nt_title",ldto.getNT_TITLE().toString());
			  li.put("nt_content",ldto.getNT_CONTENT().toString());
			  li.put("nt_regitdate", ldto.getNT_REGITDATE());
			  mainJsonArray.add(li);
			  System.out.println(String.format("공지사항 찍어봄 = %s번째", l));
	    	  l++;
		  }
     
		  System.out.println("안드에서 접속함");
		  for(int o=0; o<mainJsonArray.size();o++) {
			  System.out.println(o+"번째 배열 = "+mainJsonArray.get(o).toString());
		  }
	  return mainJsonArray.toString();
   }
   
   
   @RequestMapping(value = "/Map.bbs", method = RequestMethod.GET)
   public String mapBumsam(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      return "index.tiles";
   }
   

   
   /*----------------------------가게페이지------------------------------*/
   @RequestMapping(value="/Restaurants.bbs", method = RequestMethod.GET)
   public String resTaurants(String str) {   
      return "/Store/Restaurants.tiles";
   }
   @RequestMapping(value="/MenuList.bbs", method = RequestMethod.GET)
   public String MenuList(String str) {
      return "Store/Menu/List.tiles";
   }
   
   

}