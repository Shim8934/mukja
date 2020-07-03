package com.kosmo.mukja.web;

import java.io.Console;
import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.DongDTO;
import com.kosmo.mukja.service.ERDTO;
import com.kosmo.mukja.service.ErcDTO;
import com.kosmo.mukja.service.StoreDTO;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.service.impl.SearchMapServiceImpl;

@Controller
public class SearchMapController {
	@Resource(name = "serchService")
	SearchMapServiceImpl service;
	//필터 코드 배열
	private String[] check_avoid= {"FS","EG","MK","BD","PK","CW","PE","SF","DP","FL","SB"};
	private	String[] check_prefer= {"CS","JS","HS","BS","YS"};
	List<String> avoid_codes= new Vector<String>();
	List<String>  prefer_codes=new Vector<String>();
	
	
	@ResponseBody
	@RequestMapping(value = "/Search/Place.do", produces="application/json; charset=utf8")
	public String searchDong(@RequestParam Map map) {
		System.out.println("searchDong 접근");
		 System.out.println("dong : "+map.get("dong").toString());
		 List<DongDTO> list = service.searchDong(map);
		 if(list.size()==0)return null;
		 //디버그
		 System.out.println("dong : "+map.get("dong").toString());
		 System.out.println(list.get(0).getSido()+list.get(0).getSi_goon_go()+list.get(0).getDong()+list.get(0).getDong_sub());
		 System.out.println("list size "+String.valueOf(list.size()));
		 JSONArray jsonArray = new JSONArray();
		 for(DongDTO dto : list) {
			 
			JSONObject jsonDto = new JSONObject();
			jsonDto.put("code", dto.getCode());
			jsonDto.put("sido", dto.getSido());
			jsonDto.put("si_goon_go", dto.getSi_goon_go()==null?" ":dto.getSi_goon_go());
			jsonDto.put("dong", dto.getDong());
			jsonDto.put("dong_sub", dto.getDong_sub());
			jsonDto.put("lat", dto.getLat());
			jsonDto.put("lng", dto.getLng());
			jsonArray.add(jsonDto);
		 }
		 System.out.println("toJSONString"+jsonArray.toJSONString());
		return jsonArray.toJSONString(); 
	}
	/*
	public int check_tend(List<String> array,Map map,int avoid_loop) {
		
		//배열을 돌면서
			for(int i=0; i<array.size();i++) {
				System.out.println(array.get(i)+" : "+map.get(array.get(i)));
				//만약 맵에 필터가 있다면
				if(!map.get(array.get(i)).equals("")) {
					//필터체크 변수 증가
					avoid_loop++;
					System.out.println(avoid_loop);
				}
			}
		return avoid_loop;
	}
	*/
	public void add_tend_avoid(Map map) {
		for(int i=0;i<check_avoid.length;i++) {
			System.out.println("check_avoid["+i+"]:"+check_avoid[i]);
			System.out.println("map.get(check_avoid["+i+"])"+map.get(check_avoid[i]));
			if(check_avoid[i].equals(map.get(check_avoid[i]))&&!map.get(check_avoid[i]).equals("")) {
				System.out.println("맵에 있는 기피코드:"+map.get(check_avoid[i])+"\r\n");
				avoid_codes.add(check_avoid[i]);
			}
			
		}
		for(int i=0;i<check_prefer.length;i++) {
			System.out.println("check_prefer["+i+"]:"+check_prefer[i]);
			System.out.println("map.get(check_prefer["+i+"])"+map.get(check_prefer[i]));
			if(check_prefer[i].equals(map.get(check_prefer[i]))&&!map.get(check_prefer[i]).equals("")) {
				System.out.println("맵에 있는 선호코드"+map.get(check_prefer[i]));
				prefer_codes.add(check_prefer[i]);
			}
		}
	}
	
	
	
	
	
	
public JSONArray retrunJsonArray(List<StoreDTO> list,int mode) {
	//json파싱구간
	JSONArray jsonArray = new JSONArray();	
	//선호필터 1 / 기피필터 0 / 선호 필터후 기피필터 -1
	if(mode==1) {
		for(int dtoi=0;dtoi<list.size();dtoi++) {
			StoreDTO dto = list.get(dtoi);
			System.out.println("---------------[선호모드]---------------");
			System.out.println("음식점 : "+dto.getStore_name());	
			
			//선호체크
			for(String prefer_code : prefer_codes) {
				System.out.println("dto.getMenu_tend() : "+dto.getMenu_tend());
				System.out.println("루프안 선호된 코드:"+prefer_code);
				if(dto.getMenu_tend().contains(prefer_code)) {
					System.out.println("선택된 음식점 : "+dto.getStore_name());
					System.out.println("현재 위치 음식점이름"+list.get(dtoi).getUsername());
					//System.out.println("다음위치 음식점 이름:"+list.get(dtoi+1).getUsername());
					System.out.println();
					//중복 체크
					//for(StoreDTO dto2:list)System.out.println(dto2.getUsername());
					if(!(dtoi+2>list.size())) {
						if(list.get(dtoi+1).getUsername().equals(list.get(dtoi).getUsername())) {
							System.out.println();
							System.out.println("중복발견!!!");
							System.out.println("현재 위치 음식점이름"+list.get(dtoi).getUsername());
							System.out.println("다음위치 음식점 이름:"+list.get(dtoi+1).getUsername());
							System.out.println();
							continue;
						}else {
						 JSONObject jsonDto = new JSONObject();
						 jsonArray.add(jsonParsing(jsonDto,dto));	
						 System.out.println("가게배열길이 : "+jsonArray.size());
						}
					}else {
						 JSONObject jsonDto = new JSONObject();
						 jsonArray.add(jsonParsing(jsonDto,dto));	
						 System.out.println("가게배열길이 : "+jsonArray.size());
					}
				}//발견시에 리스트화
			}//배열체크포문
		
		}//코드로 디티오 필터 포문
		return jsonArray;
		} /*
			 * else if(mode==0) { for(String avoid_code : avoid_codes) {
			 * System.out.println("---------------[기피모드]---------------"); for(StoreDTO dto
			 * : list) { if(!(dto.getMenu_tend().contains(avoid_code))) { JSONObject jsonDto
			 * = new JSONObject(); jsonArray.add(jsonParsing(jsonDto,dto)); }//텐드로 조건
			 * }//배열체크포문 }//코드로 디티오 필터 포문
			 * 
			 * return jsonArray; }
			 */
		else{			
		System.out.println("---------------[선호한다음 기피모드]---------------");
		int f=0;
		for(int dtoi=0;dtoi<list.size();dtoi++) {
			StoreDTO dto = list.get(dtoi);
			for(String prefer_code : prefer_codes) {	
				Map dtomap = new HashMap();
				dtomap.put("store_name", dto.getUsername());
				int menu_total_count=service.getMenuCount(dtomap);
				System.out.println(dto.getUsername()+"의 매뉴 갯수"+menu_total_count);
			
				if(dto.getMenu_tend().contains(prefer_code)) {
					for(String avoid_code : avoid_codes) {
							  System.out.println("---------------[기피모드]---------------");
							 System.out.println(" 음식점 이름:"+dto.getStore_name());
							 System.out.println("음식점 매뉴:"+dto.getMenu_name());
							 System.out.println("음식점 매뉴코드:"+dto.getMenu_tend());
							 System.out.println("기피코드 :"+avoid_code);
							
						if(dto.getMenu_tend().contains(avoid_code)){
								
								  System.out.println("[기피재료발견] 음식점 이름:"+dto.getStore_name());
								  System.out.println("[기피재료발견] 음식점 매뉴:"+dto.getMenu_name());
								  System.out.println("[기피재료발견] 음식점 매뉴코드:"+dto.getMenu_tend());
								  System.out.println("[기피재료발견]기피코드 :"+avoid_code);
								  System.out.println(dto.getMenu_tend().contains(avoid_code)?"기피코드가 메뉴에 포함되어있다"
								  :"기피코드가 메뉴에 포함안되있다.");
								  System.out.println("----------------------------------------");
								 
							f++;							
							System.out.println(dto.getStore_name()+"에서 기피재료발견 f증가:"+f);
						}
						
					}//코드로 디티오 필터 포문
					if(f<menu_total_count) {					
						System.out.println("미발견 매뉴 갯수:"+f);
						System.out.println("깊 가게 "+dto.getStore_name());
						JSONObject jsonDto = new JSONObject();	
						if(list.size()>=dtoi+2) {
							if(list.get(dtoi+1).getUsername().equals(list.get(dtoi).getUsername())) {
								System.out.println("jsonArray.toJSONString():"+jsonArray.toJSONString());
								continue;
							}
						}
						jsonArray.add(jsonParsing(jsonDto,dto));
						
					}
				}//선호 조건
				f=0;
			}//배열체크포문
		}//배열체크포문
		return jsonArray;
	}//모드
	
	

}
	
//dto to json
public JSONObject jsonParsing(JSONObject jsonDto,StoreDTO dto) {
		jsonDto.put("store_id", dto.getUsername());	
		jsonDto.put("store_name", dto.getStore_name());				
		jsonDto.put("store_phonenumber", dto.getStore_phnum());
		jsonDto.put("store_email", dto.getStore_email());
		jsonDto.put("store_avg", dto.getStore_avg());
		jsonDto.put("store_intro", dto.getStore_intro());
		jsonDto.put("store_time", dto.getStore_time());
		jsonDto.put("store_lat", dto.getStore_lat());
		jsonDto.put("store_lng", dto.getStore_lng());	
		jsonDto.put("store_addr", dto.getStore_addr());	
		//여기부턴 메뉴
		jsonDto.put("menu_no", dto.getMenu_no());
		jsonDto.put("menu_name", dto.getMenu_name());
		jsonDto.put("menu_tend", dto.getMenu_tend());
		jsonDto.put("menu_info", dto.getMenu_info());
		jsonDto.put("menu_regidate", dto.getMenu_regidate());
		jsonDto.put("username_1", dto.getUsername_1());
		return jsonDto;
	}
	
	
	
	@ResponseBody
	@RequestMapping( value = "/getMarker.pbs", produces = "application/json; charset=utf8")
	public String getMarker(@RequestParam Map map) {		
		//필터 목록과 맵에 넘어온 필터코드들을 분석하여
		// 선호 및 기피 컬랙션을 만듬
		
		  Iterator<String> mapIter = map.keySet().iterator();
		  
	        while(mapIter.hasNext()){
	 
	            String key = mapIter.next();
	            String value = map.get( key ).toString();
	 
	            System.out.println(key+" : "+value);
	 
	        }
		for(String item:check_prefer)
			System.out.println(map.get(item));
		
		add_tend_avoid(map);				
		
		//필터가 존재할지 확인해줄 변수
		int avoid_loop=0;
		int prefer_loop=0;
		System.out.println("avoid_codes.size()  "+avoid_codes.size());
		System.out.println("prefer_codes.size()  "+prefer_codes.size());
		// 컬랙션을 통해 필터 존재여부판단 
		if(avoid_codes.size()>0) avoid_loop++;
		if(prefer_codes.size()>0) prefer_loop++;
		System.out.println("avoid_loop  "+avoid_loop);
		System.out.println("prefer_loop  "+prefer_loop);
		//위 결과로
		if(prefer_loop>0&&avoid_loop>0) { 
			System.out.println("------------------------여기는 선호 및 기피 체크 파트----------------------");
			//비즈니스모델 호출
			List<StoreDTO>list = service.getMarkerWithMenuList(map);
			for(String code:prefer_codes)
				System.out.println("선호컬렉션:"+code);
			for(String code:avoid_codes)
				System.out.println("기피컬랙션:"+code);
			//선호필터 1 / 기피필터 0 / 선호 필터후 기피필터 -1
			JSONArray jsonArray = retrunJsonArray(list,-1);
			avoid_codes.clear();
			prefer_codes.clear();
			//선호필터 1 / 기피필터 0 / 선호 필터후 기피필터 -1
			System.out.println("--------------------리턴전 확인!!----------------------");
			System.out.println(  jsonArray.toJSONString());
			System.out.println("길이" + jsonArray.toJSONString().length());
			System.out.println("--------------------=========----------------------");
			return  jsonArray.toJSONString();
			 
			 
		}else if(prefer_loop>0) { 
			System.out.println("------------------------여기는 선호 체크 파트----------------------");
			//비즈니스모델 호출
			List<StoreDTO>list = service.getMarkerWithMenuList(map);
			
			System.out.println("list길이"+list.size());
			
			for(String code:prefer_codes)
			System.out.println("선호컬렉션:"+code);
			//선호필터 1 / 기피필터 0 / 선호 필터후 기피필터 -1
			JSONArray jsonArray = retrunJsonArray(list,1);
			avoid_codes.clear();
			prefer_codes.clear();
			System.out.println("--------------------리턴전 확인!!----------------------");
			System.out.println(  jsonArray.toJSONString());
			System.out.println("길이" + jsonArray.toJSONString().length());
			System.out.println("--------------------=========----------------------");
			return  jsonArray.toJSONString();
		}else if(avoid_loop>0) { // 필터가 있을경우	
			System.out.println("------------------------여기는 기피 체크 파트----------------------");
			/*
			 * for(String code:avoid_codes) System.out.println("기피컬랙션:"+code); //비즈니스모델 호출
			 * List<StoreDTO>list = service.getMarkerWithMenuList(map);
			 * System.out.println("getMarkerWithMenuList:"+list.toString()); //선호필터 1 / 기피필터
			 * 0 / 선호 필터후 기피필터 -1 //JSONArray jsonArray = retrunJsonArray(list,0);
			 */			
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			jsonArray.add(jsonObject);
			avoid_codes.clear();
			prefer_codes.clear();
			System.out.println("--------------------리턴전 확인!!----------------------");
			System.out.println(  jsonArray.toJSONString());
			System.out.println("길이" + jsonArray.toJSONString().length());
			System.out.println("--------------------=========----------------------");
			return  jsonArray.toJSONString();
		}else{//필터가 없을 경우
			JSONArray jsonArray = new JSONArray();
					 
			JSONObject jsonDto = new JSONObject();
			jsonDto.put("store_id", "");	
			jsonDto.put("store_name","");				
			jsonDto.put("store_phonenumber", "");
			jsonDto.put("store_email", "");
			jsonDto.put("store_avg", "");
			jsonDto.put("store_intro", "");
			jsonDto.put("store_time", "");
			jsonDto.put("store_lat","");
			jsonDto.put("store_lng", "");			
			jsonArray.add(jsonDto);
			System.out.println("--------------------리턴전 확인!!----------------------");
			System.out.println(  jsonArray.toJSONString());
			System.out.println("길이" + jsonArray.toJSONString().length());
			System.out.println("--------------------=========----------------------");
			
			 return jsonArray.toJSONString();
			
		}
	}
	
	
	@RequestMapping("Store/StoreDetail.do")
	public String toStoreDetial() {
			System.out.println("스토어 디테일로 이동");
		return "bbs/View";
	}
	
	@ResponseBody
	@RequestMapping( value = "/eat_together_list.do", produces = "application/json; charset=utf8")
	public String together_list(@RequestParam Map map) {
		System.out.println("store_id : "+ map.get("store_id"));
		if(map.get("store_id")==null) {
			return "{'result':0}";
		}
		List<ERDTO>list = service.getEatTogetherList(map);
		JSONArray jsonArray = new JSONArray();
	
		if(list!=null){
			for(ERDTO er:list) {
				map.put("er_no",er.getEr_no());
				int currcount = service.currcount(map);
				JSONObject jsonDto = new JSONObject();
				jsonDto.put("er_no",er.getEr_no() );	
				jsonDto.put("er_master",er.getEr_master());				
				jsonDto.put("s_username",er.getUsername() );
				jsonDto.put("er_title",er.getEr_title() );
				jsonDto.put("er_content",er.getEr_content() );
				jsonDto.put("er_time", er.getEr_time());
				jsonDto.put("er_tend", er.getEr_tend());
				jsonDto.put("er_max",er.getEr_max());
				jsonDto.put("er_curr",currcount);
				jsonDto.put("er_postdate", er.getEr_postdate());		
				jsonDto.put("password", er.getPassword());		
				jsonDto.put("u_nick", er.getU_nick());		
				jsonDto.put("u_regidate", er.getU_regidate());		
				jsonDto.put("u_img", er.getU_img());		
				jsonDto.put("u_age", er.getU_age());		
				jsonDto.put("u_tend", er.getU_tend());		
				jsonDto.put("u_lat", er.getU_lat());		
				jsonDto.put("u_lng", er.getU_lng());
				jsonDto.put("u_ph", er.getU_ph());		
				jsonDto.put("enabled", er.getEnabled());		
				jsonDto.put("authority", er.getAuthority());
				System.out.println(jsonDto.toJSONString());
				jsonArray.add(jsonDto);
			}//for
			System.out.println( jsonArray.toJSONString());
		}//if
		return jsonArray.toJSONString();
	}//together_list
	@ResponseBody
	@RequestMapping( value = "/submitER.do", produces = "application/json; charset=utf8")
	public String submitER(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String username =userDetails.getUsername();
		JSONArray jsonArray = new JSONArray();
		Iterator<String> iter = map.keySet().iterator();
		StringBuffer tendbutt = new StringBuffer();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			if(!map.get(key).equals("")) {
				if((!key.equals("ERtitle"))&&!(key.equals("ERcontent"))&&!(key.equals("ERtime"))&&!(key.equals("ERdate"))&&!(key.equals("ERmax"))) {
					tendbutt.append(map.get(key)+",");	
				}
			}
		}
		map.put("ER_TEND", tendbutt.toString());
		map.put("username",username);
		System.out.println("로그인된 유저의 아이디 : "+username);
		System.out.println("store_id:"+map.get("store_id"));
		System.out.println("ERcontent:"+map.get("ERcontent"));
		System.out.println("ERtitle:"+map.get("ERtitle"));
		System.out.println("ERtime:"+map.get("ERtime"));
		System.out.println("ERdate:"+map.get("ERdate"));
		
		
		String date = map.get("ERdate").toString();
		String time = map.get("ERtime").toString();
		
		time=time.replaceAll(":", "시");
		time+="분";
		String[] dates=date.split("/");
		date="";
		date =date+dates[2]+"년 ";
		date =date+ dates[0]+"월 ";
		date =date+ dates[1]+"일 ";
		String ERtime = date+time;
		map.put("ERtime", ERtime);
		
		
		//방을 생성함
		int result = service.insertER(map);
		if(result==1) {
			//현 생성된 방의 번호를 불러옴
			int er_no=service.getERno(map);
			map.put("er_no",er_no);
			System.out.println("채팅방생성을 위한 반번호:"+er_no);
			
			//생성된 방의 마스터를 가지고옴
			String er_master=service.getERmaster(map);
			map.put("er_master",er_master);
			System.out.println("방참여를 위한 방장이름:"+er_master);
			
			//방번에 맞게 채팅방 생성
			service.joinERC(map);
			int erc_no=service.getERCno(map);
			map.put("erc_no",erc_no);
			System.out.println("채팅방과 참여방의 연결번호:"+erc_no);
			
			service.joinER(map);
			service.setupERjoin_role(map);
			System.out.println( "{'resunt':"+result+"}");
		}
		return "{'resunt':"+result+"}";
	}
	
	
	@ResponseBody
	@RequestMapping( value = "/requestERjoin.do", produces = "application/json; charset=utf8")
	public String requestERjoin(@RequestParam Map map,Authentication auth) {
		System.out.println("-------------------참가하기 컨트롤러 진입------------------------");
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String username =userDetails.getUsername();
		map.put("username",username);
		System.out.println("로그인된 유저의 아이디 : "+username);
		map.put("er_master",map.get("username"));
		int erc_no = service.getERCno(map);
		map.put("erc_no",erc_no);
		
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
			}
		
		int joinER = service.joinER(map);
		return "{'joinER':"+joinER+"}";
	}
	
	@ResponseBody
	@RequestMapping(value = "/enterERC.do",produces = "application/json; charset=utf8")
	public String getMyERCList(@RequestParam Map map,Authentication auth) {
		System.out.println("-------------------채팅 컨트롤러 진입------------------------");
		//키값확인 디버그코드
		/*
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
		}
		//키값확인 디버그코드 끝
		*/
		//아이디얻기
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String username =userDetails.getUsername();
		System.out.println("로그인된 유저의 아이디 : "+username);
		map.put("username", username);
		
		map.put("er_master",map.get("username"));
		
		//내가 참여중인 방 정보 얻기
		List<ErcDTO> ercList =service.myERCList(map);
		
		//리스트 디버깅용
		for(ErcDTO dtos:ercList) {
			System.out.println(dtos.toString());
		}
		//얻어온 리스트를 통해서 내가 지금 참여중인 채팅방 정보를 송신(json파싱)
		JSONArray jsonArray = new JSONArray();
		if(ercList!=null){
			for(ErcDTO erc:ercList) {
				JSONObject jsonDto = new JSONObject();
				jsonDto.put("er_no",erc.getEr_no() );
				jsonDto.put("erc_no",erc.getErc_no() );	
				jsonDto.put("erMaster",erc.getEr_master());
				jsonDto.put("u_nick",service.getUserNick(map));
				System.out.println(erc.getEr_master());
				jsonDto.put("erjoin_date",erc.getErjoin_date());
				jsonDto.put("erjoin_num",erc.getErjoin_num());
				jsonDto.put("erjoin_role",erc.getErjoin_role());
				jsonDto.put("store_id",erc.getstore_id());
				map.put("store_id", erc.getstore_id());
				System.out.println(erc.getstore_id());
				jsonDto.put("store_name",service.getStoreInfo(map).getStore_name());
				jsonDto.put("er_title",erc.getEr_title());
				jsonDto.put("er_content",erc.getEr_content());
				jsonDto.put("er_time",erc.getEr_time());
				jsonDto.put("er_tend",erc.getEr_tend());
				jsonDto.put("er_max",erc.getEr_max());
				jsonDto.put("er_postdate",erc.getEr_postdate());
				System.out.println(jsonDto.toJSONString());
				jsonArray.add(jsonDto);
			}//for
			System.out.println( jsonArray.toJSONString());
		}//if
		return jsonArray.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getERCcontent.do",produces = "application/json; charset=utf8")
	public String getERCcontent(@RequestParam Map map) {
		System.out.println("-------------------채팅방  내용 부르기 컨트롤러 진입------------------------");
		//키값확인 디버그코드
		
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
		}
		//키값확인 디버그코드 끝
		JSONObject jObject = new JSONObject();
		String erc_content = service.getERC_content(map);
		jObject.put("erc_content", erc_content);
	
		return jObject.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/sendToTable.do",produces = "application/json; charset=utf8")
	public String sendToTable(@RequestParam Map map) {
		System.out.println("-------------------채팅방  내용 업데이트 컨트롤러 진입------------------------");
		//키값확인 디버그코드
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
		}
		//키값확인 디버그코드 끝
	
		int result = service.updateErcContent(map);
		JSONObject jObject = new JSONObject();
		jObject.put("result", result);
		return jObject.toJSONString();
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/interLatLng.do",produces = "application/json; charset=utf8")
	public String interLatLng(@RequestParam Map map,Principal p) {
		System.out.println("-------------------관심지역 돌입------------------------");
		//키값확인 디버그코드
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			String val = map.get(key).toString();
			System.out.println(String.format("키 : %s 값 : %s", key,val));
		}
		//키값확인 디버그코드 끝
		String user_id="";
		if(p!=null) {
			user_id= p.getName();
			map.put("user_id", user_id);
			System.out.println("interLatLng user_id:"+user_id);
			UsersDTO dto= service.getUserInfo(map);
			String u_lat = dto.getU_lat();
			String u_lng = dto.getU_lng();
			JSONObject jObject = new JSONObject();
			jObject.put("u_lat", u_lat);
			jObject.put("u_lng", u_lng);			
			return jObject.toJSONString();
			 
		}else {
			
			JSONObject jObject = new JSONObject();
			jObject.put("u_lat", "37.498825");
			jObject.put("u_lng", "126.722265");			
			return jObject.toJSONString();
		}
	
	}//interLatLng
	
}
