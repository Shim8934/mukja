package com.kosmo.mukja.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.JsonObject;
import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.AdminService;
import com.kosmo.mukja.service.FileUploadService;
import com.kosmo.mukja.web.util.PagingUtil;

@Controller
public class AdminController {
   
   @Resource(name="adminService")
   private AdminService adminService;

   //리소스파일(resource.properties)에서 읽어오기
   @Value("${PAGE_SIZE}")
   private int pageSize;
   @Value("${BLOCK_PAGE}")
   private int blockPage;
   
   // 0. 관리자 메인 컨트롤러
   @RequestMapping(value = "/AdminMain.bbs", method = RequestMethod.GET)
   public String main(Model model, Map map) {
	   int signUpTotalCount = adminService.getStSignTotalRecord(map);
	   model.addAttribute("signUpTotalCount",signUpTotalCount);
	   int getStSignRecord = adminService.getStSignRecord(map);
	   model.addAttribute("getStSignRecord",getStSignRecord);
	   
	   int reportCount = adminService.getUsRPTotalRecord(map);
	   model.addAttribute("reportCount",reportCount);
	   int reportTotalCount = adminService.UsRpCount(map);
	   model.addAttribute("UsRpTotalCount",reportTotalCount);
	   
	   
      return "AdminMain.admins";
   }

   // 2-1-1) 유저신고 리스트 컨트롤러
   @RequestMapping(value = "/UserReportList.bbs", method = RequestMethod.GET)
   public String userReportList(@RequestParam Map map,
                         @RequestParam(required = false,defaultValue = "1") int nowPage,
                         HttpServletRequest req,
                         Model model) {      
      String searchColumn = "";
      String searchWord = "";
      int totalRecordCount = adminService.getUsRPTotalRecord(map);
      //전체 페이지수]
      int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
      //시작 및 끝 ROWNUM구하기]
      int start = (nowPage-1)*pageSize+1;
      int end   = nowPage*pageSize;   
      //페이징을 위한 로직 끝]   
      map.put("start", start);
      map.put("end", end);
      List<AdminDTO> list = adminService.selectUserRpList(map);
      //데이타 저장]
      if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
         searchColumn = map.get("searchColumn").toString();
         searchWord = map.get("searchWord").toString();
      }
      else {
         searchColumn ="";
         searchWord = "";
      }
      
      System.out.println(map.toString());
      model.addAttribute("totalRecordCount",totalRecordCount);
      model.addAttribute("pageSize",pageSize);
      model.addAttribute("nowPage",nowPage);
      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize,blockPage, nowPage, req.getContextPath()+"/UserReportList.bbs?", searchColumn, searchWord);
      System.out.println("list 존재?"+list);
      model.addAttribute("list", list);
      model.addAttribute("pagingString", pagingString);
      return "Manage/User/UserRpList.admins";
   }
   
   // 2-1-2) 유저 신고 관리 컨트롤러
   @RequestMapping(value = "/UserReportView.bbs", method = RequestMethod.GET)
   public String userReportManage(@RequestParam Map map, Model model) {
      System.out.println("UR_no 넘어옴?  "+map.get("UR_NO").toString());
      AdminDTO record = adminService.selectUsRPOne(map);
      record.setUR_CONTENT(record.getUR_CONTENT().replace("\r\n", "<br>"));
      
      AdminDTO prev = adminService.selectUsRPPrev(map);
      System.out.println(map);
      System.out.println(prev);
      AdminDTO next = adminService.selectUsRPNext(map);
      System.out.println(map);
      System.out.println(next);
      
      model.addAttribute("record",record);
      model.addAttribute("prev",prev);
      model.addAttribute("next",next);
      System.out.println(prev==null?"널이래":"널아니래");
      return "Manage/User/UserRpView.admins";
   }
   
   @ResponseBody
   @RequestMapping(value = "/UsReportUpdate.bbs", method = RequestMethod.GET)
   public String updateUserByRp(@RequestParam Map map) {
      System.out.println(map.get("username").toString());
      System.out.println(map.get("UR_NO").toString());
      int result = adminService.updateUsRP(map);
      map.put("UR_NO",map.get("UR_NO").toString());
      result = adminService.updateUsRP2(map);
      JSONObject json = new JSONObject();
      json.put("result",result==1?"성공":"실패");
      
      
      return json.toJSONString();
   }
   
   // 3-1) 가게 제휴 리스트 컨트롤러
   @RequestMapping(value="/SignUpList.bbs", method=RequestMethod.GET)
   public String storeSignList(@RequestParam Map map,
                     @RequestParam(required = false,defaultValue = "1") int nowPage,
                     HttpServletRequest req,//컨텍스트 루트 얻기용
                     Model model) {
      //서비스 호출]
      //페이징을 위한 로직 시작]
      //전체 레코드수   
      String searchColumn = "";
      String searchWord = "";
      int totalRecordCount = adminService.getStSignTotalRecord(map);
      //전체 페이지수]
      int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
      //시작 및 끝 ROWNUM구하기]
      int start = (nowPage-1)*pageSize+1;
      int end   = nowPage*pageSize;   
      //페이징을 위한 로직 끝]   
      map.put("start", start);
      map.put("end", end);
      List<AdminDTO> list = adminService.selectStSignList(map);
      
      //데이타 저장]
      if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
         searchColumn = map.get("searchColumn").toString();
         searchWord = map.get("searchWord").toString();
      }
      else {
         searchColumn ="";
         searchWord = "";
      }
      
      model.addAttribute("totalRecordCount",totalRecordCount);
      model.addAttribute("pageSize",pageSize);
      model.addAttribute("nowPage",nowPage);
      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize,blockPage, nowPage, req.getContextPath()+"/SignUpList.bbs?", searchColumn, searchWord);
      System.out.println("list 존재?"+list);
      model.addAttribute("list", list);
      model.addAttribute("pagingString", pagingString);
      
      return "Manage/Store/SignUpList.admins";
   }

   @ResponseBody
   @RequestMapping(value = "/StSignUpdate.bbs", method = RequestMethod.GET)
   public String updateStSign(@RequestParam Map map) {
      System.out.println(map.get("username").toString());
      System.out.println(map.get("nowPage").toString());
      int result = adminService.updateStSign(map);

      JSONObject json = new JSONObject();
      json.put("nowPage", map.get("nowPage").toString());
      json.put("result",result==1?"성공":"실패");
      return json.toJSONString();
   }
   
   // 공지사항 리스트 컨트롤러
   @RequestMapping(value="/NoticeList.bbs")
   public String noticeList(@RequestParam Map map,
         @RequestParam(required = false,defaultValue = "1") int nowPage,
         HttpServletRequest req,//컨텍스트 루트 얻기용
         Model model) {
      //서비스 호출]
      //페이징을 위한 로직 시작]
      //전체 레코드수   
      String searchColumn = "";
      String searchWord = "";
      int totalRecordCount = adminService.getTotalRecord(map);
      //전체 페이지수]
      int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
      //시작 및 끝 ROWNUM구하기]
      int start = (nowPage-1)*pageSize+1;
      int end   = nowPage*pageSize;   
      //페이징을 위한 로직 끝]   
      map.put("start", start);
      map.put("end", end);
      List<AdminDTO> list = adminService.selectList(map);
      
      //데이타 저장]
      if(map.get("searchColumn")!=null && map.get("searchWord")!=null) {
         searchColumn = map.get("searchColumn").toString();
         searchWord = map.get("searchWord").toString();
      }
      else {
         searchColumn ="";
         searchWord = "";
      }
      
      model.addAttribute("totalRecordCount",totalRecordCount);
      model.addAttribute("pageSize",pageSize);
      model.addAttribute("nowPage",nowPage);
      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize,blockPage, nowPage, req.getContextPath()+"/NoticeList.bbs?", searchColumn, searchWord);
      System.out.println("list 존재?"+list);
      model.addAttribute("list", list);
      model.addAttribute("pagingString", pagingString);
      return "Notice/List.admins";
   }
   
   // 공지사항 View
   @RequestMapping(value="/OneNoticeView.bbs")
   public String oneViewNotice(@RequestParam Map map, Model model) {
      System.out.println("nt_no 넘어옴?  "+map.get("NT_NO").toString());
      AdminDTO record = adminService.selectOne(map);

      record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br/>"));

      AdminDTO prev = adminService.selectPrev(map);

      AdminDTO next = adminService.selectNext(map);

      System.out.println(record.getBF_PATH());
      System.out.println(record.getBF_PATH()+" = Viewcontroller 파일 정보");
      model.addAttribute("record",record);
      model.addAttribute("prev",prev);
      model.addAttribute("next",next);
      System.out.println(prev==null?" View 컨트롤러 이전 글이 널이래":" View 컨트롤러 이전 글 널아니래");
      return "Notice/View.admins";
   }
   
   // 공지사항 등록 이동
   @RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.GET)
   public String moveWriteNotice(Authentication auth, Model model) {
      UserDetails userDetails = (UserDetails) auth.getPrincipal();
      String username = userDetails.getUsername();      
      model.addAttribute("username",username);
      return "Notice/Write.admins";
   }
    
   // 공지사항 본격 등록
   @RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.POST)
   public String writeNotice(MultipartRequest mr,
		   				HttpServletRequest req,
                       Authentication auth,
                       Model model,
                       @RequestParam Map map) {
	  UserDetails userDetails = (UserDetails) auth.getPrincipal();
      String username = userDetails.getUsername();
	   
	  String path = "/resources/IMG";
      String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
      System.out.println(mr.getFile("BF_PATH")==null? "관리자 글 쓰기파일 널이래":"관리자 글 쓰기 파일널아니래");
      MultipartFile img = mr.getFile("BF_PATH");
      File dir = new File(path);
      if(!dir.exists()) {
    	  dir.mkdirs();
    	  System.out.println("경로 만듦 / ");
      }
      
      if(img.getOriginalFilename().equals("")) {
    	  map.put("BF_PATH",null);
      }
      else {
	      String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
	      
	      File file = new File(realPath+"/"+fileName);
	      System.out.println(String.format("파일 이름 = %s, 파일 경로 = %s", file.getName(),realPath+"/"+fileName));
	      try {
	    	  img.transferTo(file);
	      }
	      catch(Exception e) {e.printStackTrace();}
	      map.put("BF_PATH", path+"/"+fileName);
      }
      System.out.println("제목?  "+map.get("NT_TITLE").toString()+"\n\r");
      map.put("NT_TITLE", map.get("NT_TITLE").toString());
      System.out.println("내용?  "+map.get("NT_CONTENT").toString()+"\n\r");
      map.put("NT_CONTENT", map.get("NT_CONTENT").toString());
      System.out.println("이름?  "+map.get("username").toString()+"\n\r");
      map.put("NT_TITLE", map.get("NT_TITLE").toString());
      map.put("NT_CONTENT", map.get("NT_CONTENT").toString());
      map.put("username", username);
      
      System.out.println("글 입력 직전\n\r");
      adminService.noticeInsert(map);
      map.put("NT_NO", map.get("NT_NO"));
      
      map.put("NT_TITLE", map.get("NT_TITLE"));
      AdminDTO forBf = adminService.selectForBf(map);
      System.out.println("NT_NO 얻어오기"+forBf.getNT_NO()+"\n\r");
     
      map.put("NT_NO", forBf.getNT_NO());
      System.out.println("파일 입력 직전\n\r");
      adminService.bfInsert(map);
      return "forward:NoticeList.bbs";
   }
   
   // 공지사항 삭제 컨트롤러
   @RequestMapping(value="/DeleteNotice.bbs", method=RequestMethod.GET)
   public String deleteNotice(@RequestParam Map map, HttpServletRequest req) {
      AdminDTO oneView = adminService.selectOne(map);
      
      if(oneView.getBF_PATH()!=null) {
         String checkFile = "";
         String uploadPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
         
         int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
         map.put("NT_NO", NT_NO);
         // BBS_FILE 글 지워주고 , 연달아서 공지사항 글 지워주기
         int resultBf = adminService.deleteBf(map);
         if(resultBf == 1) {
            String fileAttached = req.getParameter("fileAttached");
            System.out.println(fileAttached);
            System.out.println("DeleteView에서 삭제 쿼리 성공 후, 파일도 삭제 완료");
         }
         System.out.println(resultBf==1?"파일 삭제 성공 " : "파일 삭제 실패");
         adminService.deleteNotice(map);
      }
      else{
         adminService.deleteNotice(map);
      }
      return "forward:NoticeList.bbs";
   }
   
   // 공지사항 수정 컨트롤러 수정폼 이동
   @RequestMapping(value="/EditNotice.bbs", method=RequestMethod.GET)
   public String goEditNotice(@RequestParam Map map, Model model, HttpServletRequest req) {
      System.out.println("수정폼 이동 컨트롤러 / nt_no 넘어옴?  "+map.get("NT_NO").toString());
      AdminDTO record = adminService.selectOne(map);
      model.addAttribute("record",record);
      record.setNT_CONTENT(record.getNT_CONTENT().replace("<br>", "\r\n"));
      return "Notice/Edit.admins";
   }
   
   // 공지사항 글 수정 시, 최종 수정 반영
   @RequestMapping(value="/EditNotice.bbs", method=RequestMethod.POST)
   public String editNotice(@RequestParam Map map,MultipartRequest mr,HttpServletRequest req, Model model){
      String fileName;
      String path = "/resources/IMG";
      String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
      System.out.println(map.get("BF_PATH"));
      System.out.println(map.get("NT_TITLE"));
      System.out.println("본격 수정에서 내용 출력   " +map.get("NT_CONTENT"));
      String NT_CONTENT = map.get("NT_CONTENT").toString().replace("<br>", "\r\n");
      System.out.println(map.get("username"));
      System.out.println(map.get("ori_PATH"));
      // 기존에 파일 정보가 없는 경우
      if(map.get("ori_PATH")==null) {
         fileName=null;
         if(map.get("BF_PATH").toString()==null) {
            System.out.println("기존에 파일 정보가 없는 경우 11");
            map.put("NT_TITLE", map.get("NT_TITLE"));
            map.put("NT_CONTENT", map.get("NT_CONTENT"));
            map.put("NT_NO", map.get("NT_NO"));
            adminService.update(map);
         }
         else {
            System.out.println("기존에 파일 정보가 없는 경우 2");
            MultipartFile img = mr.getFile("BF_PATH");
            fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename();
            File file = new File(realPath+"/"+fileName);
            try {
            	img.transferTo(file);
            } catch(Exception e) {e.printStackTrace();}
            String BF_PATH = path+"/"+fileName;
            System.out.println("BF_PATH 값 출력 해 보기 = "+BF_PATH);
            map.put("BF_PATH",BF_PATH);
            map.put("NT_TITLE", map.get("NT_TITLE"));
            map.put("NT_CONTENT", map.get("NT_CONTENT"));
            map.put("NT_NO", map.get("NT_NO"));
            adminService.bfInsert(map);
            adminService.update(map);
         }
      }
      // 기존에 파일 정보가 있는 경우
      else {
         if(mr.getFile("BF_PATH")==null) {
            System.out.println("기존에 파일 정보가 있는 경우 11");
            map.put("NT_TITLE", map.get("NT_TITLE"));
            map.put("NT_CONTENT", map.get("NT_CONTENT"));
            map.put("NT_NO", map.get("NT_NO"));
            adminService.update(map);
         }
         else {
            System.out.println("기존에 파일 정보가 있는 경우 22");
            fileName = map.get("ori_PATH").toString();
            System.out.println(fileName);
            MultipartFile img = mr.getFile("BF_PATH");
            fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename();
            File file = new File(realPath+"/"+fileName);
            try {
            	img.transferTo(file);
            } catch(Exception e) {e.printStackTrace();}
            String BF_PATH = path+"/"+fileName;
            System.out.println("BF_PATH 값 출력 해 보기 = "+BF_PATH);
            System.out.println("BF_PATH 값 출력 해 보기 = "+BF_PATH);
            map.put("BF_PATH",BF_PATH);
            map.put("NT_TITLE", map.get("NT_TITLE"));
            map.put("NT_CONTENT", map.get("NT_CONTENT"));
            map.put("NT_NO", map.get("NT_NO"));
            adminService.bfUpdate(map);
            adminService.update(map);
         }
      }
      return "forward:/OneNoticeView.bbs?NT_NO="+map.get("NT_NO");
   }
   
}//////////class AdminController

