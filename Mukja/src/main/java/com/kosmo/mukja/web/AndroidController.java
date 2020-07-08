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
			@GetMapping(value = "/CreatEroom/json")
			public String anEroom(@RequestParam Map map) {
				int result = 0;
				try {
					String ERtitle =map.get("title").toString();
					String ERcontent = map.get("content").toString();
					String ERtime = map.get("date").toString()+" "+map.get("time").toString() ;
					String ER_TEND = map.get("store_id").toString()+","+map.get("tend").toString() ;
					String ERmax = map.get("max").toString();
					map.put("ERtitle",ERtitle);
					map.put("ERcontent",ERcontent);
					map.put("ERmax",ERmax);
					map.put("ERtime",ERtime);
					map.put("ER_TEND", ER_TEND);
				
					//방을 생성함
					result = androidService.createEroom(map);
					if(result==1) {
						//현 생성된 방의 번호를 불러옴
						int er_no=androidService.getRoomNo(map);
						map.put("er_no",er_no);
						System.out.println("채팅방생성을 위한 반번호:"+er_no);
						
						//생성된 방의 마스터를 가지고옴
						String er_master=androidService.getRoomMaster(map);
						map.put("er_master",er_master);
						System.out.println("방참여를 위한 방장이름:"+er_master);
						
						//방번에 맞게 채팅방 생성
						androidService.creatERC(map);
						int erc_no=androidService.getERoomCno(map);
						map.put("erc_no",erc_no);
						System.out.println("채팅방과 참여방의 연결번호:"+erc_no);
						
						androidService.joinERoom(map);
						androidService.setupER_role(map);
						System.out.println( "{'resunt':"+result+"}");
					}
					
					
				} catch (NullPointerException e) {
					String ER_TEND = map.get("store_id").toString()+",";
				}
				return "{'resunt':"+result+"}";
			}

}
