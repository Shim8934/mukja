package com.kosmo.mukja.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.AdminService;
import com.kosmo.mukja.service.FileUploadService;
import com.kosmo.mukja.web.util.PagingUtil;

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="fileUploadService")
	private FileUploadService fileUploadService;

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

	// 2-1) 신고 리스트 컨트롤러
	@RequestMapping(value = "/AdminReportList.bbs", method = RequestMethod.GET)
	public String reportList(Locale locale, Model model) {		
		
		return "Manage/Report/List.admins";
	}
	
	// 2-2) 신고 관리 컨트롤러
	@RequestMapping(value = "/AdminReportManage.bbs", method = RequestMethod.GET)
	public String reportManage(Locale locale, Model model) {		
		
		return "Manage/Report/View.admins";
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
		int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
		map.put("NT_NO", NT_NO);
		AdminDTO prev = adminService.selectOne(map);
		map.put("prev", prev.getNT_TITLE());
		record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br>"));
		model.addAttribute("record",record);
		
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
	
	// 공지사항 등록 컨트롤러 (본격 등록)
	@RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.POST)
	public String writeNotice(MultipartHttpServletRequest req,
							  Authentication auth,
							  Model model,
							  @RequestParam Map map){
		System.out.println("MultipartHttpServletRequest 테스팅 : "+req);
		String fileName = "";
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
		
		// MultipartHttpServletRequest로 얻어온 파일 데이터를 MultipartFile객체로 저장
		// 이건 필요한지 모르겠음.
		MultipartFile mpFile = req.getFile(fileName);
		
		// 파일 input 태그(name=NT_IMG)로 얻어온 파일들 저장할 리스트 선언  
		List<MultipartFile> fileList = req.getFiles("NT_IMG");
		System.out.println("파일 체크 "+req.getFiles("NT_IMG"));
		
		// 파일 해체 시작
		for(MultipartFile filePart : fileList) {
			fileName = filePart.getOriginalFilename();
			System.out.println(fileName);
			NT_IMG+=fileName+"/";
			System.out.println(NT_IMG);
			if(!fileName.equals("")) {
				try {
					FileOutputStream fs = new FileOutputStream(path+fileName);
					fs.write(filePart.getBytes());
					fs.close();
				} catch(IOException e) {e.printStackTrace();}
			}
		}
		// 쿼리문 작업용으로 집어넣음
		map.put("NT_IMG",NT_IMG);

		
		adminService.insert(map);
		
		return "Notice/List.admins";
	}
	
	/*
	// 공지사항 등록 컨트롤러 (본격 등록)
	@RequestMapping(value="/WriteNotice.bbs", method=RequestMethod.POST)
	public String writeNotice(@RequestParam Map map,
							  Model model) {
		String username = map.get("username").toString();
		System.out.println(username);
		model.addAttribute("username",username);
		
		adminService.insert(map);
		return "Notice/List.admins";
		
	}
	*/
	
	// 공지사항 수정 컨트롤러
	@RequestMapping(value="/EditNotice.bbs", method=RequestMethod.GET)
	public String editNotice() {
		return "Notice/Edit.admins";
	}
	
	// 공지사항 삭제 컨트롤러
	@RequestMapping(value="/DeleteNotice.bbs", method=RequestMethod.GET)
	public String deleteNotice(@RequestParam Map map) {
		int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
		map.put("NT_NO", NT_NO);
		System.out.println(NT_NO);
		adminService.delete(map);
		return "Notice/List.admins";
	}
	
	
}//////////class AdminController


