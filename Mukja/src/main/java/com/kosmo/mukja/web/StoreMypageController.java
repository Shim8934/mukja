package com.kosmo.mukja.web;

import java.io.File;
import java.security.Principal;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;


@Controller
public class StoreMypageController {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	@RequestMapping("/StoreMypage/StoreMypageMain.do")
	public String StoreDetail(@RequestParam Map map, Model model, Authentication authentication) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
		
		List<StoreDTO> list = service.getStoreInfo(map);
		System.out.println("StoreDetail 이동 / 가게 주소 찍어봄 = "+list.get(0).getStore_addr().toString());
		String store_addr = list.get(0).getStore_addr().toString();
		if(store_addr.contains("/")) {
			System.out.println("상세 주소 존재해서 분리하는 작업으로 들어옴");
			String store_addr1 = store_addr.substring(store_addr.lastIndexOf("/")+1);
			store_addr = store_addr.substring(0,store_addr.lastIndexOf("/"));
			list.get(0).setStore_addr(store_addr);
			list.get(0).setStore_addr1(store_addr1);
		}
		
		model.addAttribute("list",list);
		
		int reviewCount= service.getReviewCount(map);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("msg", userDetails.getUsername()); 
		

		List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
		String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS,","JS,","HS,","BS,","YS,"};
		String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
		
		for(int j=0; j<tend_codes.length;j++) {
			for(int i=0; i<foodMenuList.size();i++) {
				foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
				/*
				 * System.out.println("대상 :"+foodMenuList.get(i).getMenu_tend().replaceAll(
				 * tend_codes[j], tend_text[j])); System.out.println("tend_codes["+i+"]:"+
				 * tend_codes[j]+"변경할값 :"+tend_text[j]);
				 * System.out.println("변경된 재료 : "+foodMenuList.get(i).getMenu_tend());
				 */
			}
		}//리스트에서 뽑은 성향의 포문
			
		model.addAttribute("foodMenuList",foodMenuList);
		System.out.println("foodMenuList:"+foodMenuList.toString());
		
		List<StoreIMGDTO> imglist = service.getStoreIMG(map);
		model.addAttribute("imglist",imglist);
		System.out.println("imglist:"+imglist.toString());
		
		
		String[] menu_nos = new String[foodMenuList.size()];
		int i=0;
		for(FoodMenuDTO foodmenuDTO:foodMenuList) {
			menu_nos[i]=foodmenuDTO.getMenu_no();
			i++;
			//System.out.println("menu_no:"+foodmenuDTO.getMenu_no());
		 }
		List allFoodImgList = new Vector();
		
		for(String menu_no: menu_nos) {
			System.out.println("menu_no:"+menu_no);
			map.put("menu_no", menu_no);
			allFoodImgList.add(service.getFoodIMG(menu_no));
			System.out.println("음식매뉴이미지:"+service.getFoodIMG(menu_no).toString());
		}
		model.addAttribute("allFoodImgList",allFoodImgList);
		System.out.println("allFoodImgList:"+allFoodImgList.toString());
		
		float store_avg =  service.getStoreAvg(map);
		model.addAttribute("store_avg",store_avg);
		
		int store_Thumb = service.getStoreThumb(map);
		model.addAttribute("store_Thumb",store_Thumb);
		model.addAttribute("imglist",imglist);
		System.out.println("imglist:"+imglist.toString());
		
	
		return "Store/StoreMyPage/StoreMypageMain.tiles";
		
	}

	@ResponseBody
	@RequestMapping("/StoreMypage/editStoreInfo.do")
	public String editStoreInfo(@RequestParam Map map, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
		String store_addr ="";
		if(map.get("store_addr1")!=null) {
			// 상세 주소 적은 경우
			System.out.println("상세 주소 있어서 가게 상세 주소 찍어봄(addr1)  = "+map.get("store_addr1"));
			store_addr = map.get("store_addr").toString() +"/"+ map.get("store_addr1").toString();
			
			System.out.println("합친 주소 찍어봄  =  "+store_addr);
			map.put("store_addr", store_addr);
		}
		else {
			store_addr = map.get("store_addr").toString();
			System.out.println("상세 주소 없는 경우  = " + store_addr);
		}
		System.out.println(map.get("store_intro")!=null?"가게 소개 수정 값 넘어옴 ":" 가게 소개 수정 값  안 넘어옴");
		System.out.println("소개값 넘어와서 찍어봄 = "+map.get("store_intro").toString().trim());
		String store_intro = map.get("store_intro").toString().trim();
		if(store_intro.contains("<p>")&& store_intro.contains("</p>")){
			store_intro = store_intro.replace("<p>", "").replace("</p>", "");
			map.put("store_intro", store_intro);
		}
		
		int result;
		result = service.updateStoreInfo(map);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		if(result==1) {
			System.out.println("가게 정보 수정 성공");
			List<StoreDTO> list = service.getStoreInfo(map);
			jsonObject.put("list",list);
			
			int reviewCount= service.getReviewCount(map);
			jsonObject.put("reviewCount",reviewCount);
			jsonObject.put("msg", userDetails.getUsername()); 
			

			List<FoodMenuDTO> foodMenuList = service.getFoodMenu(map);
			String[] tend_codes= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB","CS,","JS,","HS,","BS,","YS,"};
			String[] tend_text= {"생선","계란","우유","가금류","돼지고기","소고기","땅콩","갑각류","유제품","밀가루","콩","","","","",""};
			
			for(int j=0; j<tend_codes.length;j++) {
				for(int i=0; i<foodMenuList.size();i++) {
					foodMenuList.get(i).setMenu_tend(foodMenuList.get(i).getMenu_tend().replaceAll(tend_codes[j], tend_text[j]));
					/*
					 * System.out.println("대상 :"+foodMenuList.get(i).getMenu_tend().replaceAll(
					 * tend_codes[j], tend_text[j])); System.out.println("tend_codes["+i+"]:"+
					 * tend_codes[j]+"변경할값 :"+tend_text[j]);
					 * System.out.println("변경된 재료 : "+foodMenuList.get(i).getMenu_tend());
					 */
				}
			}//리스트에서 뽑은 성향의 포문
				
			jsonObject.put("foodMenuList",foodMenuList);
			System.out.println("foodMenuList:"+foodMenuList.toString());
			
			List<StoreIMGDTO> imglist = service.getStoreIMG(map);
			jsonObject.put("imglist",imglist);
			System.out.println("imglist:"+imglist.toString());
			
			
			String[] menu_nos = new String[foodMenuList.size()];
			int i=0;
			for(FoodMenuDTO foodmenuDTO:foodMenuList) {
				menu_nos[i]=foodmenuDTO.getMenu_no();
				i++;
				//System.out.println("menu_no:"+foodmenuDTO.getMenu_no());
			 }
			List allFoodImgList = new Vector();
			
			for(String menu_no: menu_nos) {
				System.out.println("menu_no:"+menu_no);
				map.put("menu_no", menu_no);
				allFoodImgList.add(service.getFoodIMG(menu_no));
				System.out.println("음식매뉴이미지:"+service.getFoodIMG(menu_no).toString());
			}
			jsonObject.put("allFoodImgList",allFoodImgList);
			System.out.println("allFoodImgList:"+allFoodImgList.toString());
			
			float store_avg =  service.getStoreAvg(map);
			jsonObject.put("store_avg",store_avg);
			
			int store_Thumb = service.getStoreThumb(map);
			jsonObject.put("store_Thumb",store_Thumb);
			jsonObject.put("imglist",imglist);
			System.out.println("imglist:"+imglist.toString());
		}
		
		jsonArray.add(jsonObject.toJSONString());
		
//		jsonObject.put("", value)
		
		return jsonArray.toJSONString();
	}
	
	// 이미지 수정페이지 이동
	@RequestMapping(value = "/StoreMypage/ImgPop.do")
	public String ImgPop(@RequestParam Map map, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
		
		// 스토어 이미지
		List<StoreIMGDTO> strImgDto = service.getStoreIMG(map);
		map.put("username",userDetails.getUsername());
		List<StoreDTO> stDto = service.selectFoodImg(map);
		
		model.addAttribute("storeImg",strImgDto);
		model.addAttribute("fmImg",stDto);
		
		return "Store/StoreMyPage/ImgPop.tiles";
	}
	
	// 가게 이미지 수정
	@RequestMapping(value = "/StoreMypage/editImgPop.do")
	public String editImgPop(@RequestParam Map map, 
							 Model model,
							 Authentication authentication,
							 HttpServletRequest req,
							 MultipartRequest mr) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
		System.out.println("유저 이름 찍어봄(가게 아이디)  "+userDetails.getUsername());
		
		String path = "/resources/IMG";
		String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
		
		System.out.println("경로 찍어보기 = "+path);
		File dir = new File(path);
		if(!dir.exists()) {
    	  dir.mkdirs();
    	  System.out.println("경로 만듦 / ");
		}
		
		String sf_path="";
		String oriSf_path = "";
		String oriSf_no = "";
		
		int result=0;
		int i= 0;
		if(map.get("flag0")!=null) {
			System.out.println("경우1");
			for(int k=0;k<3;k++) {
				
				MultipartFile img = mr.getFile("sf_path"+k);
				map.put("sf_no", map.get("oriNo"+k));
				if(img.getOriginalFilename().equals("")) {
					System.out.println("경우1-1");
					map.put("sf_path", map.get("oriImg"+k).toString());
					service.updateStoreImg(map);
					continue;
				}
				else {
					System.out.println("경우 1-2");
					String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
				      
				    File file = new File(realPath+"/"+fileName);
				    System.out.println(String.format("파일 이름 = %s, 파일 경로 = %s", file.getName(),realPath+"/"+fileName));
				    try {
				      img.transferTo(file);
				    }
				    catch(Exception e) {e.printStackTrace();}
					sf_path = path+"/"+fileName;
					if(sf_path!=null) {
						System.out.println("가게 회원가입 사진 수정하기 직전 파일 경로? = "+sf_path);
						map.put("sf_path", sf_path);
					}
					img=null;
				}	
				System.out.println("기존 이미지 3개인 경우 수정"+k+"번째");
				service.updateStoreImg(map);
			}
		}
		else {
			for(int k=0;k<3;k++) {
				if(map.get("oriImg"+k)!=null && mr.getFile("sf_path"+k)!=null) {
					System.out.println("경우 2-1");
					map.put("sf_no", map.get("oriNo"+k));
					if(mr.getFile("sf_path"+k).getOriginalFilename().equals("")) {
						System.out.println("기존 이미지 존재하지만 새로 파일 등록 안 한 경우");
						map.put("sf_path", map.get("oriImg"+k));
						service.updateStoreImg(map);
						continue;
					}
					MultipartFile img = mr.getFile("sf_path"+k);
					String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
				      
				    File file = new File(realPath+"/"+fileName);
				    System.out.println(String.format("파일 이름 = %s, 파일 경로 = %s", file.getName(),realPath+"/"+fileName));
				    try {
				      img.transferTo(file);
				    }
				    catch(Exception e) {e.printStackTrace();}
					sf_path = path+"/"+fileName;
					if(sf_path!=null) {
						System.out.println("가게 회원가입 사진 수정하기 직전 파일 경로0000? = "+sf_path);
						map.put("sf_path", sf_path);
						service.updateStoreImg(map);
					}
				}
				else {
					if(mr.getFile("sf_path"+k)==null) {
						System.out.println("경우2-2");
						break;
					}
					else {
						System.out.println("경우2-3");
						MultipartFile img = mr.getFile("sf_path"+k);
						String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
					      
					    File file = new File(realPath+"/"+fileName);
					    System.out.println(String.format("파일 이름 = %s, 파일 경로 = %s", file.getName(),realPath+"/"+fileName));
					    try {
					      img.transferTo(file);
					    }
					    catch(Exception e) {e.printStackTrace();}
						sf_path = path+"/"+fileName;
						if(sf_path!=null) {
							System.out.println("가게 회원가입 사진 인설트하기 직전 파일 경로1111? = "+sf_path);
							map.put("sf_path", sf_path);
						}
						service.insertStoreImg(map);
						img=null;
					}
					
					
				}
			}
		}
		
		// 스토어 이미지
		List<StoreIMGDTO> strImgDto = service.getStoreIMG(map);
		map.put("username",userDetails.getUsername());
		List<StoreDTO> stDto = service.selectFoodImg(map);
		
		model.addAttribute("storeImg",strImgDto);
		model.addAttribute("fmImg",stDto);
		
		return "Store/StoreMyPage/ImgPop.tiles";
	}
	
	// 이미지 수정페이지 이동
	@RequestMapping(value = "/StoreMypage/ImgPop2.do")
	public String menuImgPop(@RequestParam Map map, Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());

		model.addAttribute("msg", userDetails.getUsername()); 


		List<StoreDTO> stDto = service.selectFoodImg(map);

		model.addAttribute("editFoodMenu",stDto);


		return "Store/StoreMyPage/menuEditImg.tiles";
	}

	
	
	// 메뉴 및 메뉴 이미지 수정
	@RequestMapping(value = "/StoreMypage/editImgPop2.do",method = RequestMethod.POST)
	public String menuImgPopEdit(@RequestParam Map map, Model model, Authentication authentication, HttpServletRequest req, MultipartRequest mr) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		map.put("username", userDetails.getUsername());
		String editMenu_tend;
		String path = "/resources/IMG";
		String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");
		
		List<StoreDTO> stDto = service.selectFoodImg(map);

		int sizeFlag = stDto.size();
		
		for(int i=0; i<sizeFlag;i++) {
			if(!map.get("menu_tend"+i).toString().equals("")) {
				System.out.println(i+"번째 메뉴 수정 때 필터 설정함");
				editMenu_tend = map.get("menu_tend"+i).toString();
				String o = Integer.toString(i);
				editMenu_tend = editMenu_tend.replace(o, "");
				System.out.println("바꾼 tend 찍어봄 = "+editMenu_tend);
				map.put("menu_tend", editMenu_tend);
			}
			else {
				System.out.println(i+"번째 메뉴 수정 때 필터 설정 안함11");
				editMenu_tend = map.get("orimenu_tend"+i).toString();
				String o = Integer.toString(i);
				editMenu_tend = editMenu_tend.replace(o, "");
				System.out.println("바꾼 tend 찍어봄 = "+editMenu_tend);
				map.put("menu_tend", editMenu_tend);
			}
			
			String editFm_path;
			MultipartFile img = mr.getFile("fm_path"+i);
			if(img.getOriginalFilename().equals("")) {
				System.out.println("메뉴 사진 안 바꿈1");
				editFm_path = map.get("originImg"+i).toString();
				editFm_path = editFm_path.substring(editFm_path.lastIndexOf("/"));
				editFm_path = path + editFm_path;
			}
			else {
				System.out.println("메뉴 사진 바꿈2");
				String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename();
				File file = new File(realPath+"/"+fileName);
				try {
					img.transferTo(file);
				} catch(Exception e) {e.printStackTrace();}
				editFm_path = path+ "/" + fileName;
			}
			String editMenu_info = map.get("menu_info"+i).toString();
			String editMenu_name = map.get("menu_name"+i).toString();
			String editMenu_price = map.get("menu_price"+i).toString();
			String editMenu_no = map.get("menu_no"+i).toString();
			
			System.out.println("디비에 넣기 직전 파일 경로 찍어봄"+editFm_path);
			map.put("editMenu_no",editMenu_no);
			map.put("editMenu_tend",editMenu_tend);
			map.put("editFm_path", editFm_path);
			map.put("editMenu_info",editMenu_info);
			map.put("editMenu_name",editMenu_name);
			map.put("editMenu_price",editMenu_price);
			service.updateFoodMenu(map);
			service.updateFoodImg(map);
		}
		
		return "forward:/StoreMypage/ImgPop2.do";
	}
	
	// 메뉴 및 메뉴 이미지 추가
		@RequestMapping(value = "/StoreMypage/addImgPop2.do",method = RequestMethod.POST)
		public String menuImgPopInsert(@RequestParam Map map, Model model, Authentication authentication, HttpServletRequest req, MultipartRequest mr) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			map.put("username", userDetails.getUsername());

			String path = "/resources/IMG";
			String realPath = req.getSession().getServletContext().getRealPath("/resources/IMG");

			 File dir = new File(path);
		      if(!dir.exists()) {
		    	  dir.mkdirs();
		    	  System.out.println("경로 만듦 / ");
		      }
			
			int i= 0;
			boolean exitFlag = true; 
			while(exitFlag) {
				System.out.println("등록 첫 메뉴 이름 찍어봄"+map.get("insmenu_name"+i));
				if(map.get("insmenu_name"+i)!=null) {
					String menu_tend = map.get("insmenu_tend"+i).toString();
					String o = Integer.toString(i);
					menu_tend = menu_tend.replace(o, "");
					System.out.println("바꾼 tend 찍어봄 = "+menu_tend);
					
					String menu_info = map.get("insmenu_info"+i).toString();
					String menu_name = map.get("insmenu_name"+i).toString();
					String menu_price = map.get("insmenu_price"+i).toString();
					
					map.put("menu_name", menu_name.toString());
					map.put("menu_info", menu_info.toString());
					map.put("menu_price", menu_price.toString());
					map.put("menu_tend", menu_tend.toString());
					
					 MultipartFile img = mr.getFile("insfm_path"+i);
					 String fileName = UUID.randomUUID().toString().replace("-", "") + img.getOriginalFilename(); 
				      
				      File file = new File(realPath+"/"+fileName);
				      System.out.println(String.format("파일 이름 = %s\r\n 파일 경로 = %s", file.getName(),realPath+"/"+fileName));
				      try {
				    	  img.transferTo(file);
				      }
				      catch(Exception e) {e.printStackTrace();}
				      map.put("fm_path", path+"/"+fileName);
					
					
					service.insertMoreFoodMenu(map);
					map.put("username", userDetails.getUsername());
					
					// 추가한 메뉴번호 이미지 넣기용 번호 얻기
					StoreDTO tempDto = service.selectNewMenuNo(map);
					map.put("menu_no", tempDto.getMenu_no());
					
					// 이미지 삽입
					service.insertMoreFoodImg(map);
					i++;
					System.out.println(i+"번째 음식메뉴 인설트 실행함.");
				}
				else {
					exitFlag = false;
				}
			}
			return "forward:/StoreMypage/ImgPop2.do";
		}
	
}