package com.kosmo.mukja.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.mukja.service.AndroidERDTO;
import com.kosmo.mukja.service.AndroidMyERDTO;
import com.kosmo.mukja.service.AndroidReviewDTO;
import com.kosmo.mukja.service.AndroidReviewImgDTO;
import com.kosmo.mukja.service.AndroidService;
import com.kosmo.mukja.service.FallowDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.MyPageDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.service.impl.SearchMapServiceImpl;
import com.kosmo.mukja.web.util.UploadPath;


@Controller
public class AndroidContoroller {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	@Resource(name = "androidService")
	private AndroidService androidService;	
	@Resource(name = "serchService")
	SearchMapServiceImpl serchService;
	private String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS","JS,","HS","BS","YS"};
	private String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
	private final String UPLOAD_PATH="/resources/IMG/";
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/DetailView.do" , produces = "application/json; charset=utf8")
	public String StoreDetail(@RequestParam Map map) {
		
		System.out.println("username:"+map.get("store_id"));
		System.out.println("username:"+map.get("user_id"));
		map.put("username",map.get("store_id").toString().replaceAll("\"", ""));
		map.put("user_id",map.get("user_id").toString().replaceAll("\"", ""));
		
		
		//가게정보 파싱
		List<StoreDTO> list = service.getStoreInfo(map);
		System.out.println("반환리스트크기"+list.size());
	
		JSONObject storeInfoJson = new JSONObject();
		storeInfoJson.put("store_name", list.get(0).getStore_name().toString());
		storeInfoJson.put("store_addr", list.get(0).getStore_addr().toString());
		storeInfoJson.put("store_intro", list.get(0).getStore_intro().toString()
				.replaceAll("<p>","")
				.replaceAll("</p>","")
				.replaceAll("  ","")
				.replace("\r\n"," ")
				);
		storeInfoJson.put("store_email", list.get(0).getStore_email().toString());
		storeInfoJson.put("store_phnum", list.get(0).getStore_phnum().toString());
		storeInfoJson.put("store_time", list.get(0).getStore_time().toString().replaceAll("\\r\\n                           "," "));
		System.out.println("수정된 시간 : "+list.get(0).getStore_time().toString().replaceAll("\\r\\n                           "," "));
		
		//가게이미지 파싱
		List<StoreIMGDTO> imglist = service.getStoreIMG(map);
		JSONArray imglistJson =new JSONArray();
		for( StoreIMGDTO imgDTO :imglist) {			
			imglistJson.add(imgDTO.getSf_path());		
		}		
		storeInfoJson.put("store_imgList", imglistJson);

		//좋아요 여부
		int is_Thumb =service.isThumb(map);
		storeInfoJson.put("isThumb", is_Thumb);
		
		//메뉴변환
		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		JSONArray menulistJson =new JSONArray();
		for( FoodMenuDTO menuDTO :foodMenuList) {
			JSONObject menu = new JSONObject();
			menu.put("menuName",  menuDTO.getMenu_name()) ;
			menu.put("menuCost",menuDTO.getMenu_price());
			menu.put("menuInfo",menuDTO.getMenu_tend());
			menu.put("menuIntro",menuDTO.getMenu_info());			
			menulistJson.add(menu);
		}		
		storeInfoJson.put("menuList", menulistJson);
		String text;
		
		return storeInfoJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/Review.do" , produces = "application/json; charset=utf8")
	public String StoreReview(@RequestParam Map map) {
		map.put("username", map.get("username").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		List<AndroidReviewDTO> reivew_list =  androidService.getAndroidReviewList(map);
		
	
		JSONArray  jsonArray = new JSONArray();
		
		for(AndroidReviewDTO dto:reivew_list) {
			JSONObject jsonObject = new  JSONObject();
			jsonObject.put("rv_no", dto.getRv_no());
			jsonObject.put("rv_title", dto.getRv_title());
			jsonObject.put("rv_content", dto.getRv_content());
			jsonObject.put("rv_postdate", dto.getRv_postdate());
			jsonObject.put("u_nick", dto.getU_nick());			
			jsonObject.put("u_img", dto.getU_img());			
			jsonObject.put("u_id", dto.getUsername());
			jsonObject.put("menu_name", dto.getMenu_name());
			System.out.println("menuname:"+dto.getMenu_no());
			map.put("rv_no",  dto.getRv_no());
			List<AndroidReviewImgDTO> img_list =  androidService.getAndroidReviewImg(map);
			for(AndroidReviewImgDTO imgdto: img_list) {
				jsonObject.put("rf_path", imgdto.getRf_path());	
			}
			 
			jsonArray.add(jsonObject);
			
			
		}
	
		return jsonArray.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/User/UserInfo.do" , produces = "application/json; charset=utf8")
	public String UserInfo(@RequestParam Map map) {
		map.put("username", map.get("username").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		UsersDTO userInfo= androidService.getUserInfo(map);
		System.out.println(userInfo);
		
		String oldTend=userInfo.getU_tend();
		for(int j=0; j<tend_codes.length;j++) {
			if(userInfo.getU_tend()!=null)userInfo.setU_tend(userInfo.getU_tend().replaceAll(tend_codes[j], tend_text[j]));
			else userInfo.setU_tend("없음");
			
			
		}//리스트에서 뽑은 성향의 포문
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("u_id", userInfo.getUsername());
		jsonObject.put("u_pwd", userInfo.getPassword());
		jsonObject.put("u_ph", userInfo.getU_ph());		
		jsonObject.put("u_nick", userInfo.getU_nick());
		jsonObject.put("u_tend", userInfo.getU_tend());
		jsonObject.put("u_img", userInfo.getU_img());
		jsonObject.put("u_addr", userInfo.getU_addr());
		jsonObject.put("u_age", userInfo.getU_age());
		jsonObject.put("u_oldTend", oldTend);
		return jsonObject.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/MyReview.do" , produces = "application/json; charset=utf8")
	public String MyReview(@RequestParam Map map) {
		map.put("username", map.get("username").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		List<AndroidReviewDTO> reivew_list =  androidService.getMyAndroidReviewList(map);
		
	
		JSONArray  jsonArray = new JSONArray();
		
		for(AndroidReviewDTO dto:reivew_list) {
			JSONObject jsonObject = new  JSONObject();
			jsonObject.put("rv_no", dto.getRv_no());
			jsonObject.put("rv_title", dto.getRv_title());
			jsonObject.put("rv_content", dto.getRv_content());
			jsonObject.put("rv_postdate", dto.getRv_postdate());
			jsonObject.put("u_nick", dto.getU_nick());			
			jsonObject.put("u_img", dto.getU_img());			
			jsonObject.put("u_id", dto.getUsername());
			jsonObject.put("menu_name", dto.getMenu_name());
			System.out.println("menuname:"+dto.getMenu_no());
			map.put("rv_no",  dto.getRv_no());
			List<AndroidReviewImgDTO> img_list =  androidService.getAndroidReviewImg(map);
			for(AndroidReviewImgDTO imgdto: img_list) {
				jsonObject.put("rf_path", imgdto.getRf_path());	
			}
			 
			jsonArray.add(jsonObject);
			
			
		}
	
		return jsonArray.toJSONString();
	}//StoreReview
	
	@ResponseBody
	@RequestMapping(value = "/Android/DeleteReview.do" , produces = "application/json; charset=utf8")
	public String deleteReview(@RequestParam Map map) {
		map.put("rv_no", map.get("rv_no").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		int result =  androidService.deleteAndroidReview(map);
		System.out.println("삭제결과 : "+result);
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result", result);
	
		return jsonObject.toJSONString();
	}//StoreReview
	
	
	
	@ResponseBody
	@RequestMapping(value = "/Android/Fallow.do" , produces = "application/json; charset=utf8")
	public String Fallow(@RequestParam Map map) {
		map.put("store_id", map.get("store_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		map.put("fallow_content", "default");
		int result =  androidService.FallowAndroidReview(map);
		
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result", result);
	
		return jsonObject.toJSONString();
	}//StoreReview
	

	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/FallowList.do" , produces = "application/json; charset=utf8")
	public String fallowlist(@RequestParam Map map) {
		map.put("user_id", map.get("user_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		List<FallowDTO> fallow_list =  androidService.getFallowList(map);
		
	
		JSONArray  jsonArray = new JSONArray();
		
		for(FallowDTO dto:fallow_list) {
			JSONObject jsonObject = new  JSONObject();
			jsonObject.put("ms_no", dto.getMs_no());
			jsonObject.put("ms_storename", dto.getStore_name());
			jsonObject.put("ms_postdate", dto.getMs_postdate());
			jsonObject.put("ms_img", dto.getSf_path());
			jsonObject.put("ms_storeid", dto.getUsername());
			jsonArray.add(jsonObject);
		}
	
		return jsonArray.toJSONString();
	}//StoreReview
	
	@ResponseBody
	@RequestMapping(value = "/Android/DeleteAndroidFallow.do" , produces = "application/json; charset=utf8")
	public String deleteAndroidFallow(@RequestParam Map map) {
		map.put("ms_no", map.get("ms_no").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		int result =  androidService.deleteAndroidFallow(map);
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result", result);
	
		return jsonObject.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/ER_list.do" , produces = "application/json; charset=utf8")
	public String getER_list(@RequestParam Map map) {
		map.put("user_id", map.get("user_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		List<AndroidERDTO> er_list =  androidService.getRequestERList(map);
		
	
		JSONArray  jsonArray = new JSONArray();
		
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<er_list.size();i++) {
				er_list.get(i).setU_tend(er_list.get(i).getU_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		
		for(AndroidERDTO dto:er_list) {
			JSONObject jsonObject = new  JSONObject();
			jsonObject.put("store_name", dto.getStore_name());
			jsonObject.put("store_id", dto.getStore_id());
			jsonObject.put("er_title", dto.getEr_title());
			jsonObject.put("er_postdate", dto.getEr_postdate());
			jsonObject.put("user_id", dto.getUser_id());
			
			jsonObject.put("erjoin_num", dto.getErjoin_num());
			jsonObject.put("u_nick", dto.getU_nick());
			jsonObject.put("u_tend", dto.getU_tend());
			jsonObject.put("u_age", dto.getU_age()+"대");
			jsonObject.put("u_img", dto.getU_img());
			jsonArray.add(jsonObject);
		}
	
		return jsonArray.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Android/AndroidRequestER_Accept.do" , produces = "application/json; charset=utf8")
	public String androidRequestER_Accept(@RequestParam Map map) {
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		map.put("erjoin_num", map.get("erjoin_num").toString().replace("\"",""));
		
		int result =  androidService.androidRequestER_Accept(map);
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result_Accept", result);
	
		return jsonObject.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Android/AndroidRequestER_Reject.do" , produces = "application/json; charset=utf8")
	public String androidRequestER_Reject(@RequestParam Map map) {
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		map.put("erjoin_num", map.get("erjoin_num").toString().replace("\"",""));
		
		int result =  androidService.androidRequestER_Reject(map);
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result_Reject", result);
	
		return jsonObject.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Andorid/Store/MyER_list.do" , produces = "application/json; charset=utf8")
	public String getMyER_list(@RequestParam Map map) {
		map.put("user_id", map.get("user_id").toString().replace("\"",""));

		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		List<AndroidMyERDTO> myer_list =  androidService.getMyRequestERList(map);
		
	
		JSONArray  jsonArray = new JSONArray();
		
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<myer_list.size();i++) {
				myer_list.get(i).setU_tend(myer_list.get(i).getU_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<myer_list.size();i++) {
				myer_list.get(i).setEr_tend(myer_list.get(i).getEr_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		
		
		
		for(AndroidMyERDTO dto:myer_list) {
			JSONObject jsonObject = new  JSONObject();
			jsonObject.put("er_no", dto.getEr_no());
			jsonObject.put("erjoin_num", dto.getErjoin_num());
			jsonObject.put("store_name", dto.getStore_name());
			jsonObject.put("er_title", dto.getEr_title());
			jsonObject.put("er_tend", dto.getEr_tend());
			jsonObject.put("er_max", dto.getEr_max());
			jsonObject.put("er_time", dto.getEr_time());
			map.put("er_no", dto.getEr_no());
			int currcount=serchService.currcount(map);
			jsonObject.put("er_currcount", currcount);
			jsonObject.put("u_nick", dto.getU_nick());
			jsonObject.put("u_tend", dto.getU_tend());
			jsonObject.put("u_age", dto.getU_age()+"대");
			jsonObject.put("u_img", dto.getU_img());
			jsonObject.put("u_id", dto.getU_id());
			jsonArray.add(jsonObject);
		}
	
		return jsonArray.toJSONString();
	}//StoreReview
	
	
	@ResponseBody
	@RequestMapping(value = "/Android/DeleteERMembers.do" , produces = "application/json; charset=utf8")
	public String deleteERMembers(@RequestParam Map map) {
		map.put("er_no", map.get("er_no").toString().replace("\"",""));
		map.put("user_id", map.get("user_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		int result =  androidService.androidDeleteERMembers(map);
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result_Reject", result);
	
		return jsonObject.toJSONString();
	}//deleteERMembers
	
	@ResponseBody
	@RequestMapping(value = "/Android/BoomMyER.do" , produces = "application/json; charset=utf8")
	public String boomMyER(@RequestParam Map map) {
		map.put("er_no", map.get("er_no").toString().replace("\"",""));
		map.put("user_id", map.get("user_id").toString().replace("\"",""));
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		
		int result =  androidService.boomMyER(map);
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result_Reject", result);
	
		return jsonObject.toJSONString();
	}//deleteERMembers
	
	
	@ResponseBody
	@RequestMapping(value = "/Android/insertReview.do" , produces = "application/json; charset=utf8")
	public String insertReview(@RequestParam Map map, MultipartRequest mr, HttpServletRequest req) {
		map.put("username",map.get("store_id").toString().replaceAll("\"", ""));
		map.put("store_id",map.get("store_id").toString().replaceAll("\"", ""));
		System.out.println("리뷰작성 컨트롤러 진입");
		
		String dbPath="/resources/IMG";
		String path = req.getSession().getServletContext().getRealPath("/resources/IMG");
	
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		MultipartFile img = mr.getFile("uploadedfile");
	
		
		
		
		String originalFileName = img.getOriginalFilename();
     
        //fileuploadtest.doc
        //lastIndexOf(".") = 14(index는 0번부터)
        //substring(14) = .doc
        
        //업무에서 사용하는 리눅스, UNIX는 한글지원이 안 되는 운영체제 
        //파일업로드시 파일명은 ASCII코드로 저장되므로, 한글명으로 저장 필요
        //UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성                    "-"라면 생략으로 대체
        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileName;
        
        //파일을 저장하기 위한 파일 객체 생성
        File file = new File(path +"\\"+ storedFileName);
        //파일 저장
    	System.out.println("파일명"+file.getName());
    	System.out.println("경로파일:"+path +"\\"+ storedFileName);
    	String dbpath=UPLOAD_PATH+file.getName();
    	map.put("img",dbpath);
    	int result = 0;
        try {
			img.transferTo(file);			
			
			result=androidService.androidInsertReview(map);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
		
		
	
		JSONObject jsonObject = new  JSONObject();
		jsonObject.put("result", result);
	
		return jsonObject.toJSONString();
	}//insertReview

	@ResponseBody
	@RequestMapping(value = "/Android/getreviewmenulist.do" , produces = "application/json; charset=utf8")
	public String insertReview(@RequestParam Map map) {

		System.out.println("매뉴블러오기 컨트롤러 진입");

		map.put("username",map.get("store_id").toString().replaceAll("\"", ""));
		map.put("store_id",map.get("store_id").toString().replaceAll("\"", ""));
		System.out.println("store_id:"+map.get("store_id")+" / username:"+map.get("username"));
		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
			}
		}//리스트에서 뽑은 성향의 포문
		JSONArray menulistJson =new JSONArray();
		for( FoodMenuDTO menuDTO :foodMenuList) {
			JSONObject menu = new JSONObject();
			menu.put("menuName",  menuDTO.getMenu_name()) ;
			menu.put("menuCost",menuDTO.getMenu_price());
			menu.put("menuInfo",menuDTO.getMenu_tend());
			menu.put("menuIntro",menuDTO.getMenu_info());	
			menu.put("menuNo",menuDTO.getMenu_no());	
			menulistJson.add(menu);
		}		
	
		
		
		JSONObject jsonObject = new  JSONObject();
		System.out.println("result"+menulistJson.toJSONString());
		return menulistJson.toJSONString();
	}//insertReview

	
	
}
