package com.kosmo.mukja;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kosmo.mukja.service.MainDTO;
import com.kosmo.mukja.service.MainService;
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
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model,
		   			  Map map,
		   			  @RequestParam(required = false,defaultValue = "1") int nowPage,
		   			  HttpServletRequest req) {
      logger.info("Welcome home! The client locale is {}.", locale);

      List<MainDTO> dto = mainService.selectList(map);
      System.out.println(dto.get(0).getUsername());
      map.put("username", dto.get(0).getUsername());
      
      List<MainDTO> rank1 = mainService.selectRank1List(map);
      List<MainDTO> rank1Img = mainService.selectRank1Img(map);
      System.out.println(rank1Img.get(0).getSf_path());
      map.put("username", dto.get(1).getUsername());
      List<MainDTO> rank2 = mainService.selectRank2List(map);
      List<MainDTO> rank2Img = mainService.selectRank2Img(map);
      map.put("username", dto.get(2).getUsername());
      List<MainDTO> rank3 = mainService.selectRank3List(map);
      List<MainDTO> rank3Img = mainService.selectRank3Img(map);
      // 1) 랭킹 추천수에 따른 가게 뿌리기 끝
      
      // 2) 리뷰 추천수에 따른 뿌리기
      List<MainDTO> review = mainService.selectReviewList(map);
      
      map.put("rv_no", review.get(0).getRv_no());
      MainDTO content1 = mainService.selectContent(map);
      review.get(0).setRv_content(content1.getRv_content().toString());
      map.put("username", review.get(0).getStore_name());
      content1 = mainService.selectStore_Name(map);
      review.get(0).setStore_name(content1.getStore_name().toString());
      
      map.put("rv_no", review.get(1).getRv_no());
      MainDTO content2 = mainService.selectContent(map);
      review.get(1).setRv_content(content2.getRv_content().toString());
      map.put("username", review.get(1).getStore_name());
      content2 = mainService.selectStore_Name(map);
      review.get(1).setStore_name(content2.getStore_name().toString());
      
      map.put("rv_no", review.get(2).getRv_no());
      MainDTO content3 = mainService.selectContent(map);
      review.get(2).setRv_content(content3.getRv_content().toString());
      map.put("username", review.get(2).getStore_name());
      content3 = mainService.selectStore_Name(map);
      review.get(2).setStore_name(content3.getStore_name().toString());
      
      map.put("rv_no", review.get(3).getRv_no());
      MainDTO content4 = mainService.selectContent(map);
      review.get(3).setRv_content(content4.getRv_content().toString());
      map.put("username", review.get(3).getStore_name());
      content4 = mainService.selectStore_Name(map);
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
      model.addAttribute("rank1Img",rank1Img);
      
      model.addAttribute("rank2",rank2);
      model.addAttribute("rank2Img",rank2Img);
      
      model.addAttribute("rank3",rank3);
      model.addAttribute("rank3Img",rank3Img);
      
      // 2) 리뷰 랭킹
      model.addAttribute("reviewList",review);
      
      // 3) 공지사항
      model.addAttribute("totalRecordCount",totalRecordCount);
	  model.addAttribute("pageSize",pageSize);
	  model.addAttribute("nowPage",nowPage);
	  model.addAttribute("list", list);
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
      map.put("username", dto.get(0).getUsername());
      JSONArray jsonArray = new JSONArray();
      
      List<MainDTO> rank1 = mainService.selectRank1List(map);
      List<MainDTO> rank1Img = mainService.selectRank1Img(map);
      
      System.out.println(rank1Img.get(0).getSf_path());
      map.put("username", dto.get(1).getUsername());
      List<MainDTO> rank2 = mainService.selectRank2List(map);
      List<MainDTO> rank2Img = mainService.selectRank2Img(map);
      map.put("username", dto.get(2).getUsername());
      List<MainDTO> rank3 = mainService.selectRank3List(map);
      List<MainDTO> rank3Img = mainService.selectRank3Img(map);
      // 1) 랭킹 추천수에 따른 가게 뿌리기 끝
         
      
      
      // 2) 리뷰 추천수에 따른 뿌리기
      List<MainDTO> review = mainService.selectReviewList(map);
      
      map.put("rv_no", review.get(0).getRv_no());
      MainDTO content1 = mainService.selectContent(map);
      review.get(0).setRv_content(content1.getRv_content().toString());
      map.put("username", review.get(0).getStore_name());
      content1 = mainService.selectStore_Name(map);
      review.get(0).setStore_name(content1.getStore_name().toString());
      
      map.put("rv_no", review.get(1).getRv_no());
      MainDTO content2 = mainService.selectContent(map);
      review.get(1).setRv_content(content2.getRv_content().toString());
      map.put("username", review.get(1).getStore_name());
      content2 = mainService.selectStore_Name(map);
      review.get(1).setStore_name(content2.getStore_name().toString());
      
      map.put("rv_no", review.get(2).getRv_no());
      MainDTO content3 = mainService.selectContent(map);
      review.get(2).setRv_content(content3.getRv_content().toString());
      map.put("username", review.get(2).getStore_name());
      content3 = mainService.selectStore_Name(map);
      review.get(2).setStore_name(content3.getStore_name().toString());
      
      map.put("rv_no", review.get(3).getRv_no());
      MainDTO content4 = mainService.selectContent(map);
      review.get(3).setRv_content(content4.getRv_content().toString());
      map.put("username", review.get(3).getStore_name());
      content4 = mainService.selectStore_Name(map);
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
      json.put("rank1",rank1);
      json.put("rank1Img",rank1Img);
      
      json.put("rank2",rank2);
      json.put("rank2Img",rank2Img);
      
      json.put("rank3",rank3);
      json.put("rank3Img",rank3Img);
      
      // 2) 리뷰 랭킹
      json.put("reviewList",review);
      
      json.put("list", list);
	   
	  System.out.println("안드에서 접속함");
	  System.out.println(json.toJSONString());
	   
	  return json.toJSONString();
   }
   
   
   @RequestMapping(value = "/Map.bbs", method = RequestMethod.GET)
   public String mapBumsam(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
//      server = new AndroidChatServer();
//      server.start();
      return "index.tiles";
   }
   
   @RequestMapping(value="/Mypage.bbs", method = RequestMethod.GET)
   public String Mypage(String str) {
      return "/Member/MyPage.tiles";
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