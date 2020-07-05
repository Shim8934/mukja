package com.kosmo.mukja.web;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.mukja.service.AndroidDTO;
import com.kosmo.mukja.service.AndroidService;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.UsersDTO;

/*
 * ※스프링 씨큐리티 사용시에는 
 *  기존방식의 로그인처리 및 로그인 여부 판단 그리고 로그아웃등
 *  모두 제거한다(.jsp 에서 혹은 .java에서)
 *  그리고 나서 스프링 씨큐리티에서 제공하는 API로 처리한다
 *  단,로그인처리 및 로그아웃은 스프링 씨큐리티에서 제공함으로
 *  로그인 판단 여부만 처리하면 된다.
 */
//@SessionAttributes("id")//스프링 씨큐리티를 사용하지 않을때

@RestController
public class AndroidController {
	
	// 서비스 주입]
	@Resource(name = "androidService")
	private AndroidService androidService ;
	
			//안드로이드 앱에 데이타 제공용
			//JSON으로 제공시
			@CrossOrigin
			@GetMapping(value="/android/json")
			public AndroidDTO anIsLogins(AndroidDTO dto) {	
				System.out.println("여기");
				System.out.println(androidService.anIsLogin(dto));
				return	androidService.anIsLogin(dto);	
			}
			
			@CrossOrigin
			@GetMapping(value="/CreatEroom/json")
			public String anEroom(@RequestParam Map map) {	
				System.out.println(map.get("json"));
				return "1";
			}
			
			
//			public String submitER(@RequestParam Map map,Authentication auth) {
//				UserDetails userDetails = (UserDetails)auth.getPrincipal();
//				String username =userDetails.getUsername();
//				JSONArray jsonArray = new JSONArray();
//				Iterator<String> iter = map.keySet().iterator();
//				StringBuffer tendbutt = new StringBuffer();
//				while(iter.hasNext()){
//					String key = iter.next();
//					String val = map.get(key).toString();
//					System.out.println(String.format("키 : %s 값 : %s", key,val));
//					if(!map.get(key).equals("")) {
//						if((!key.equals("ERtitle"))&&!(key.equals("ERcontent"))&&!(key.equals("ERtime"))&&!(key.equals("ERdate"))&&!(key.equals("ERmax"))) {
//							tendbutt.append(map.get(key)+",");	
//						}
//					}
//				}
//				map.put("ER_TEND", tendbutt.toString());
//				map.put("username",username);
//				System.out.println("로그인된 유저의 아이디 : "+username);
//				System.out.println("store_id:"+map.get("store_id"));
//				System.out.println("ERcontent:"+map.get("ERcontent"));
//				System.out.println("ERtitle:"+map.get("ERtitle"));
//				System.out.println("ERtime:"+map.get("ERtime"));
//				System.out.println("ERdate:"+map.get("ERdate"));
//				
//				
//				String date = map.get("ERdate").toString();
//				String time = map.get("ERtime").toString();
//				
//				time=time.replaceAll(":", "시");
//				time+="분";
//				String[] dates=date.split("/");
//				date="";
//				date =date+dates[2]+"년 ";
//				date =date+ dates[0]+"월 ";
//				date =date+ dates[1]+"일 ";
//				String ERtime = date+time;
//				map.put("ERtime", ERtime);
//				
//				
//				//방을 생성함
//				int result = service.insertER(map);
//				if(result==1) {
//					//현 생성된 방의 번호를 불러옴
//					int er_no=service.getERno(map);
//					map.put("er_no",er_no);
//					System.out.println("채팅방생성을 위한 반번호:"+er_no);
//					
//					//생성된 방의 마스터를 가지고옴
//					String er_master=service.getERmaster(map);
//					map.put("er_master",er_master);
//					System.out.println("방참여를 위한 방장이름:"+er_master);
//					
//					//방번에 맞게 채팅방 생성
//					service.joinERC(map);
//					int erc_no=service.getERCno(map);
//					map.put("erc_no",erc_no);
//					System.out.println("채팅방과 참여방의 연결번호:"+erc_no);
//					
//					service.joinER(map);
//					service.setupERjoin_role(map);
//					System.out.println( "{'resunt':"+result+"}");
//				}
//				return "{'resunt':"+result+"}";
//			}


}
