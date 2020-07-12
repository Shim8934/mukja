package com.kosmo.mukja.web;

import java.io.File;
import java.security.Principal;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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

import com.kosmo.mukja.service.FoodIMGDTO;
import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.StoreIMGDTO;
import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.web.util.FileUtility;
import com.oreilly.servlet.MultipartRequest;


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

	@RequestMapping(value = "/StoreMypage/editStImg.do",method = RequestMethod.POST)
	public String editStImg(@RequestParam Map map,
							Model model,
							Authentication authentication,
							HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/resources/storeIMG");
		System.out.println("경로 찍어보기 = "+path);
	      File dir = new File(path);
	      if(!dir.exists()) {
	    	  dir.mkdirs();
	    	  System.out.println("경로 만듦 / ");
	      }
		MultipartRequest mr = FileUtility.upLoad(req, path);
		String sf_path = mr.getFilesystemName("sf_path");
		String sf_path1 = mr.getFilesystemName("sf_path1");
		String sf_path2 = mr.getFilesystemName("sf_path2");
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("유저이름 찍어봄 = " + userDetails.getUsername());
		map.put("username", userDetails.getUsername());
		// 스토어 이미지
		List<StoreIMGDTO> strImgDto = service.getStoreIMG(map);
		map.put("username",userDetails.getUsername());
		List<StoreDTO> stDto = service.selectFoodImg(map);
		
		model.addAttribute("storeImg",strImgDto);
		model.addAttribute("fmImg",stDto);

		return "Store/StoreMyPage/ImgPop.tiles";
	}
	
	
	// 가게 수정 // 왜 내가 ajax처리함? ajax 의미없게 함
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
							 HttpServletRequest req) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("username", userDetails.getUsername());
		System.out.println("유저 이름 찍어봄(가게 아이디)  "+userDetails.getUsername());
		String path = req.getSession().getServletContext().getRealPath("/resources/storeIMG");
		System.out.println("경로 찍어보기 = "+path);
	      File dir = new File(path);
	      if(!dir.exists()) {
	    	  dir.mkdirs();
	    	  System.out.println("경로 만듦 / ");
	      }
		MultipartRequest mr = FileUtility.upLoad(req, path);
		String uploadDir ="/resources/storeIMG";
		
		System.out.println("이미지 받아옴1? "+mr.getParameter("sf_path0"));
		System.out.println("이미지 받아옴2? "+mr.getParameter("sf_path1"));
		System.out.println("이미지 받아옴3? "+mr.getParameter("sf_path2"));
		System.out.println("기존 경로 받아옴0 ? " + mr.getParameter("oriImg0"));
		System.out.println("기존 경로 받아옴1 ? " + mr.getParameter("oriImg1"));
		System.out.println("기존 경로 받아옴2 ? " + mr.getParameter("oriImg2"));
		
		System.out.println("플래그0 "+mr.getParameter("flag0"));
		System.out.println("플래그 1 "+mr.getParameter("flag1"));
		System.out.println("플래그 2 "+mr.getParameter("flag2"));
		
		String sf_path="";
		String oriSf_path = "";
		String oriSf_no = "";
		int result=0;
		if(mr.getParameter("flag0")!=null) {
				// 가게 기존 이미지가 3개인 경우 / 즉, 수정만
				for(int i=0;i<3;i++) {
					sf_path = mr.getFilesystemName("sf_path"+i);
					oriSf_no = mr.getParameter("oriNo"+i);
					oriSf_path = mr.getParameter("oriImg"+i);
						if(sf_path!=null) {
								// if 안에 들어오면 올린 이미지가 존재
								map.put("sf_no", oriSf_no);
								
								sf_path = uploadDir+"/"+sf_path;
								map.put("sf_path",sf_path);
								System.out.println("파일 경로 찍어봄 가게 수정 페이지    "+sf_path);
								result = service.updateStoreImg(map);
								if(result==1) {
									System.out.println(" 수정하고 파일 삭제 1");
									FileUtility.deleteFile(req, uploadDir, oriSf_path);
								}
								System.out.println(result==1?"수정했음":"수정 오류남 ");
						} // for문 안 if
						else {
						// else 안에 들어오면 올린 이미지 없음
						// 그럼 수정만 안 되게 처리 즉, continue
							continue;
						} // for문 안 else
				}// for문
		}// 처음 if
		else {
			// 기존 가게 이미지가 1~2개인 경우
			
				if(mr.getParameter("flag1")==null) {
				// 기존 가게 이미지가 2개있는 경우	
					for(int i=0;i<2;i++) {
						sf_path = mr.getFilesystemName("sf_path"+i);
						oriSf_no = mr.getParameter("oriNo"+i);
						oriSf_path = mr.getParameter("oriImg"+i);
							if(sf_path != null) {
							// if 안에 들어오면 올린 이미지가 존재
									map.put("sf_no", oriSf_no);
									System.out.println("파일 경로 찍어봄 가게 수정 페이지    "+sf_path);
									sf_path = uploadDir+"/"+sf_path;
									map.put("sf_path",sf_path);
									result = service.updateStoreImg(map);
									if(result==1) {
										System.out.println(" 수정하고 파일 삭제 2");
										FileUtility.deleteFile(req, uploadDir, oriSf_path);
									}
									System.out.println(result==1?"수정했음":"수정 오류남 ");
							} // for문 안 if
							else {
							// else 안에 들어오면 올린 이미지 없음
							// 그럼 수정만 안 되게 처리 즉, continue
								continue;
							} // for문 안 else
					}// for문
					if(mr.getFilesystemName("sf_path2")!=null) {
						System.out.println("기존 이미지 2개 있고 / 사진 신규 등록");
						// 기존 가게 이미지 2개 있는 경우 중, 신규 이미지  등록
						sf_path = mr.getFilesystemName("sf_path2");
						sf_path = uploadDir+"/"+sf_path;
						map.put("sf_path",sf_path);
						service.insertStoreImg(map);
					}
				
				}// 기존 이미지 2개인 경우 끝
				else {
				// 기존 가게 이미지가 1개 있는 경우
					if(mr.getFilesystemName("sf_path0")!=null) {
						// 기존 이미지 수정하는 경우
						oriSf_no = mr.getParameter("oriNo0");
						oriSf_path = mr.getParameter("oriImg0");
						map.put("sf_no", oriSf_no);
						sf_path = uploadDir+"/"+sf_path;
						map.put("sf_path",sf_path);
						result = service.updateStoreImg(map);
						if(result==1) {
							System.out.println(" 수정하고 파일 삭제31");
							FileUtility.deleteFile(req, uploadDir, oriSf_path);
						}
					}// 기존 이미지 수정하는 경우 끝
					else {
						// 기존이미지 수정 X
						for(int i=1;i<3;i++) {
							sf_path = mr.getFilesystemName("sf_path"+i);
							if(sf_path!=null) {
								sf_path = uploadDir+"/"+sf_path;
								map.put("sf_path",sf_path);
								service.insertStoreImg(map);
							}
						}
						
					}
				}// 기존 이미지 1개인 경우 끝
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
		public String menuImgPopEdit(Map map, Model model, Authentication authentication, HttpServletRequest req) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			map.put("username", userDetails.getUsername());

			String dbPath = "/resources/storeIMG";
			String path = req.getSession().getServletContext().getRealPath("/resources/storeIMG");

			MultipartRequest mr = FileUtility.upLoad(req, path);
			List<StoreDTO> stDto = service.selectFoodImg(map);

			for(int i=0; i<stDto.size();i++) {
				String editMenu_tend = mr.getParameter("menu_tend"+i).toString();
				String editFm_path = mr.getFilesystemName("fm_path"+i).toString();
				String editMenu_info = mr.getParameter("menu_info"+i).toString();
				String editMenu_name = mr.getParameter("menu_name"+i).toString();
				String editMenu_price = mr.getParameter("menu_price"+i).toString();
				String editMenu_no = mr.getParameter("menu_no"+i).toString();
				editFm_path = dbPath + "/" + editFm_path;
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
	
	
}
