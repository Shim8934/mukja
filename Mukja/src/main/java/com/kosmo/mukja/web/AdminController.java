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
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
	public String main(Locale locale, Model model) {		
		
		return "AdminMain.admins";
	}
	
	// 1-1) 블랙 리스트 컨트롤러
	@RequestMapping(value="/AdminBlList.bbs", method=RequestMethod.GET)
	public String blackList(Locale locale, String str) {
		
		return "Manage/BlackList/List.admins";
	}
	
	// 1-2) 블랙 관리 컨트롤러
	@RequestMapping(value="/AdminBlManage.bbs", method=RequestMethod.GET)
	public String blackManage(Locale locale, String str) {
		
		return "Manage/BlackList/View.admins";
	}

	// 2-1) 유저신고 리스트 컨트롤러
	@RequestMapping(value = "/UserReportList.bbs", method = RequestMethod.GET)
	public String userReportList(Locale locale, Model model) {		
		
		return "Manage/Report/UserList.admins";
	}
	
	// 2-2) 유저 신고 관리 컨트롤러
	@RequestMapping(value = "/UserAdminReportManage.bbs", method = RequestMethod.GET)
	public String userReportManage(Locale locale, Model model) {		
		
		return "Manage/Report/UserView.admins";
	}
	
	// 2-1) 유저신고 리스트 컨트롤러
	@RequestMapping(value = "/StoreReportList.bbs", method = RequestMethod.GET)
	public String storeReportList(Locale locale, Model model) {		
		
		return "Manage/Report/StoreList.admins";
	}
	
	// 2-2) 유저 신고 관리 컨트롤러
	@RequestMapping(value = "/StoreAdminReportManage.bbs", method = RequestMethod.GET)
	public String storeeportManage(Locale locale, Model model) {		
		
		return "Manage/Report/StoreView.admins";
	}
	
	// 3-1) 가게 메뉴 리스트 컨트롤러
	@RequestMapping(value="/AdminStoreList.bbs", method=RequestMethod.GET)
	public String storeList(Locale locale, String str) {
		
		return "Manage/Store/List.admins";
	}
	
	// 3-2) 가게 메뉴 리스트 컨트롤러
	@RequestMapping(value="/AdminStoreMenuList.bbs", method=RequestMethod.GET)
	public String menuList(Locale locale, String str) {
		
		return "Manage/Store/storeMenu.admins";
	}

	
	// 4-1) 유저 목록 컨트롤러
	@RequestMapping(value="/AdminUserList.bbs", method=RequestMethod.GET)
	public String userList(Locale locale, String str) {
		
		return "Manage/User/List.admins";
	}
	
	// 4-2) 유저 리뷰 컨트롤러
	@RequestMapping(value="/AdminReviewList.bbs", method=RequestMethod.GET)
	public String review(Locale locale, String str) {
		
		return "Manage/User/UserRvManage.admins";
	}
	
	// 4-3) 유저 같이먹자 컨트롤러
	@RequestMapping(value="/AdminETList.bbs", method=RequestMethod.GET)
	public String etTogether(Locale locale, String str) {
		
		return "Manage/User/UserETList.admins";
	}	
	
	// 공지사항 리스트 컨트롤러
	// 이게 목록 하는 명령
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
	
	@RequestMapping(value="/OneNoticeView.bbs", method=RequestMethod.GET)
	public String oneViewNotice(@RequestParam Map map, Model model) {
		System.out.println("nt_no 넘어옴?  "+map.get("NT_NO").toString());
		AdminDTO record = adminService.selectOne(map);
		System.out.println(record);
		record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br>"));
		System.out.println(record);
		
		AdminDTO prev = adminService.selectPrev(map);
		System.out.println(map);
		System.out.println(prev);
		AdminDTO next = adminService.selectNext(map);
		System.out.println(map);
		System.out.println(next);
		
		model.addAttribute("record",record);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		System.out.println(prev==null?"널이래":"널아니래");
		return "Notice/View.admins";
	}
	
	// 공지사항 등록 페이지 이동
	@RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.GET)
	public String moveWriteNotice(Authentication auth, Model model) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String username = userDetails.getUsername();		
		model.addAttribute("username",username);
		return "Notice/Write.admins";
	}
	/*
	// 공지사항 등록 페이지 이동
	@RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.GET)
	public String moveWriteNotice(Authentication auth, Model model) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String username = userDetails.getUsername();		
		model.addAttribute("username",username);
		return "/Admin/Notice/NewFile";
	}
	*/
	// 공지사항 등록 컨트롤러 (본격 등록)
	@RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.POST)
	public String writeNotice(MultipartHttpServletRequest req,
							  Authentication auth,
							  Model model,
							  @RequestParam Map map){
		// 파일 이름 저장용 변수
		String fileName = "";
		// 파일이 저장될 경로 지정
		String path = req.getSession().getServletContext().getRealPath("/resources/Upload/AdminNotice");
		System.out.println(path);
		
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		
		// 디비에 저장할 파일 이름 저장용 변수 선언
		String NT_IMG ="";
		
		System.out.println(map==null?"맵널":"널 아님");
		
		// MultipartHttpServletRequest로 얻어온 파일 데이터 저장용
		Iterator<String> fileNames = req.getFileNames();
		
		// 파일 input 태그(name=NT_IMG)로 얻어온 파일들 저장할 리스트 선언  
		List<MultipartFile> fileList = req.getFiles("NT_IMG");
		System.out.println("파일 체크 "+req.getFiles("NT_IMG"));
		
		// 파일 해체 시작
		for(MultipartFile filePart : fileList) {
			// 올린 파일의 이름(확장자까지)
			fileName = filePart.getOriginalFilename();
			System.out.println(fileName);
			NT_IMG+=fileName+"/";
			System.out.println(NT_IMG);
			if(!fileName.equals("")) {
				try {
					FileOutputStream fs = new FileOutputStream(path+"/"+fileName);
					fs.write(filePart.getBytes());
					fs.close();
				} catch(IOException e) {e.printStackTrace();}
			}
		}
		if(NT_IMG.equals("/")) {
			NT_IMG="";
			map.put("NT_IMG",NT_IMG);
		}
		else {
			// 쿼리문 작업용으로 집어넣음
			map.put("NT_IMG",NT_IMG);
		}
		adminService.insert(map);
		return "forward:NoticeList.bbs";
	}
	
	// 공지사항 삭제 컨트롤러
	@RequestMapping(value="/DeleteNotice.bbs", method=RequestMethod.GET)
	public String deleteNotice(@RequestParam Map map) {
		int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
		map.put("NT_NO", NT_NO);
		System.out.println(NT_NO);
		adminService.delete(map);
		return "forward:NoticeList.bbs";
	}
	
	// 공지사항 수정 컨트롤러 수정폼 이동
	@RequestMapping(value="/EditNotice.bbs", method=RequestMethod.GET)
	public String goEditNotice(@RequestParam Map map, Model model) {
		System.out.println("nt_no 넘어옴?  "+map.get("NT_NO").toString());
		AdminDTO record = adminService.selectOne(map);
		record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br>"));
		model.addAttribute("record",record);
		return "Notice/Edit.admins";
	}
	
	// 공지사항 수정 컨트롤러 수정폼 이동
	@RequestMapping(value="/EditNotice.bbs", method=RequestMethod.POST)
	public String editNotice(MultipartHttpServletRequest req,Map map) {
		
		
		return "forward:/OneNoticeView.bbs";
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "D:/SKY/drawable";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
}//////////class AdminController


