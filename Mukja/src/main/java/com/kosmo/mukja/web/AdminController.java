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

import com.google.gson.JsonObject;
import com.kosmo.mukja.service.AdminDTO;
import com.kosmo.mukja.service.AdminService;
import com.kosmo.mukja.service.FileUploadService;
import com.kosmo.mukja.web.util.PagingUtil;
import com.kosmo.mukja.web.util.FileUtil;

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
		return "Manage/Report/UserView.admins";
	}
	
	@ResponseBody
	@RequestMapping(value = "/UsReportUpdate.bbs")
	public String updateUserByRp(@RequestParam Map map) {
		System.out.println(map.get("username").toString());
		int result = adminService.updateUsRP(map);
		JSONObject json = new JSONObject();
		json.put("result",result==1?"성공":"실패");
		return json.toJSONString();
	}
	
	// 2-2-1) 스토어신고 리스트 컨트롤러
	@RequestMapping(value = "/StoreReportList.bbs", method = RequestMethod.GET)
	public String storeReportList(@RequestParam Map map, Model model) {		
		
		return "Manage/Report/StoreList.admins";
	}
	
	// 2-2-2) 스토어 신고 관리 컨트롤러
	@RequestMapping(value = "/StoreAdminReportManage.bbs", method = RequestMethod.GET)
	public String storeeportManage(@RequestParam Map map, Model model) {		
		
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
	@RequestMapping(value="/OneNoticeView.bbs", method=RequestMethod.GET)
	public String oneViewNotice(@RequestParam Map map, Model model) {
		System.out.println("nt_no 넘어옴?  "+map.get("NT_NO").toString());
		AdminDTO record = adminService.selectOne(map);

		record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br>"));

		AdminDTO prev = adminService.selectPrev(map);

		AdminDTO next = adminService.selectNext(map);

		StringTokenizer imageList=null;
		System.out.println(record.getBF_PATH());
		System.out.println(record.getBF_PATH()+"Viewcontroller 파일 정보");
		if(record.getBF_PATH()!=null) {
			imageList = new StringTokenizer(record.getBF_PATH(),"/");
			List<String> image = new ArrayList<String>();
			while(imageList.hasMoreTokens()) {
				image.add(imageList.nextToken());
			}
			model.addAttribute("image",image);
		}
		else {
			model.addAttribute("image",null);
		}
		model.addAttribute("record",record);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		System.out.println(prev==null?"널이래":"널아니래");
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
	public String writeNotice(MultipartHttpServletRequest req,
							  Authentication auth,
							  Model model,
							  @RequestParam Map map){
		// 파일 이름 저장용 변수
		String fileName = "";
		String columnName = "BF_PATH";
		// 파일이 저장될 경로 지정 / 프젝 시작 경로 제외한 경로(정적메소드 안에서 절대경로 얻음)
		String path = "/resources/Upload/AdminNotice";
		System.out.println(map.get("BF_PATH")==null?"파일 널이랍니다.": "파일 널 아님");
		System.out.println(req.getAttribute("BF_PATH")==null?"파일 널이랍니다.": "파일 널 아님");
		System.out.println(req.getParameter("BF_PATH")==null?"파일 널이랍니다.": "파일 널 아님");
		System.out.println(map.get("file")==null?"파일 널이랍니다.": "파일 널 아님");
		System.out.println(req.getAttribute("file")==null?"파일 널이랍니다.": "파일 널 아님");
		System.out.println(req.getParameter("file")==null?"파일 널이랍니다.": "파일 널 아님");
		// 디비에 저장할 파일 이름 저장용 변수 선언 및 파일 업로드용 FiltUtil.getNewFile 호출 
		String BF_PATH =FileUtil.getNewFile(req, path,columnName);;
		System.out.println("BF_PATH 값 출력 해 보기 = "+BF_PATH);
		System.out.println(map==null?"맵널":"널 아님");
		map.put("BF_PATH",BF_PATH);
			
		System.out.println("제목?  "+map.get("NT_TITLE").toString()+"\n\r");
		System.out.println("글 입력 직전\n\r");
		adminService.noticeInsert(map);
		
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
			String uploadPath = "/resources/Upload/AdminNotice";
			StringTokenizer fileName = new StringTokenizer(oneView.getBF_PATH().toString(),"/");
			System.out.println("읽어온 파일 갯수 체크 = "+fileName.countTokens());
			
			while(fileName.hasMoreTokens()) {
				checkFile=fileName.nextToken();
				System.out.println(checkFile+ "=삭제 전 파일 이름 체크");
				FileUtil.deleteFile(req, uploadPath, checkFile);
				System.out.println("남은 토큰 있음?="+fileName.hasMoreTokens());
			}
			int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
			map.put("NT_NO", NT_NO);
			// BBS_FILE 글 지워주고 , 연달아서 공지사항 글 지워주기
			int resultBf = adminService.deleteBf(map);
			System.out.println(resultBf==1?"파일 삭제 성공 " : "파일 삭제 실패");
			adminService.deleteNotice(map);
		}
		else{
			adminService.deleteBf(map);
			adminService.deleteNotice(map);
		}
		return "forward:NoticeList.bbs";
	}
	
	// 공지사항 수정 컨트롤러 수정폼 이동
	@RequestMapping(value="/EditNotice.bbs", method=RequestMethod.GET)
	public String goEditNotice(@RequestParam Map map, Model model, HttpServletRequest req) {
		System.out.println("nt_no 넘어옴?  "+map.get("NT_NO").toString());
		AdminDTO record = adminService.selectOne(map);
		record.setNT_CONTENT(record.getNT_CONTENT().replace("\r\n", "<br>"));
		model.addAttribute("record",record);
		
		System.out.println("수정 폼 이동 시 파일 존재? ="+record.getBF_PATH().toString()==null?" null이랍니다.":" 존재합네다");
		
		if(record.getBF_PATH()!=null) {
			
			String checkFile = "";
			String uploadPath = "/resources/Upload/AdminNotice/";
			StringTokenizer fileName = new StringTokenizer(record.getBF_PATH().toString(),"/");
			System.out.println("읽어온 파일 갯수 체크 = "+fileName.countTokens());
			List<File> fileLists = new Vector<File>();
			while(fileName.hasMoreTokens()) {
				checkFile=fileName.nextToken();
				File file = new File(req.getSession().getServletContext().getRealPath(uploadPath+checkFile));
				fileLists.add(file);
				System.out.println(file+" = 리스트 담기 전 파일 체크");
			}
			map.put("fileLists", fileLists);
			int NT_NO = (Integer.parseInt(map.get("NT_NO").toString()));
			map.put("NT_NO", NT_NO);
		}
		else{
			map.put("fileLists", null);
		}
		
		return "Notice/Edit.admins";
	}
	
	// 공지사항 글 수정 시, 최종 수정 반영
	@RequestMapping(value="/EditNotice.bbs", method=RequestMethod.POST)
	public String editNotice(MultipartHttpServletRequest req,Map map) {
		String columnName = "BF_PATH";
		String checkFile="";
		String uploadPath = "/resources/Upload/AdminNotice/";
		String BF_PATH =FileUtil.getNewFile(req, uploadPath,columnName);
		map.put("BF_PATH", BF_PATH);
		
		
		return "forward:/OneNoticeView.bbs";
	}
	
	// 공지사항 수정 파일 수정 시 ajax 처리
	@ResponseBody
	@RequestMapping(value="/selectFiles.bbs", method=RequestMethod.POST)
	public String selectFilesforEdit(MultipartHttpServletRequest req,Map map) {
		System.out.println("req.getATT NT_NO찍어봄 = "+req.getAttribute("NT_NO"));
		
		//  파일 데이터 체크
		AdminDTO forFile = adminService.selectForFile(map);
		
		JSONObject fileCheck = new JSONObject();
		if(map.get("BF_PATH").toString().equals("/")) {
			fileCheck.put("fileData", "");
		}
		fileCheck.put("fileData", forFile);
		
		return fileCheck.toJSONString();
	}
	
	
}//////////class AdminController


