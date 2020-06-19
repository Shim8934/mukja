package com.kosmo.mukja.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kosmo.mukja.service.SignService;

/*
 * ※스프링 씨큐리티 사용시에는 
 *  기존방식의 로그인처리 및 로그인 여부 판단 그리고 로그아웃등
 *  모두 제거한다(.jsp 에서 혹은 .java에서)
 *  그리고 나서 스프링 씨큐리티에서 제공하는 API로 처리한다
 *  단,로그인처리 및 로그아웃은 스프링 씨큐리티에서 제공함으로
 *  로그인 판단 여부만 처리하면 된다.
 */
//@SessionAttributes("id")//스프링 씨큐리티를 사용하지 않을때

@Controller
public class SignController {
	
	@Inject
	JavaMailSender mailSender;
	// 서비스 주입]
	@Resource(name = "signService")
	private SignService signService;


	//로그인 폼으로 이동]
	@RequestMapping(value = "/SignIn.bbs", method = RequestMethod.GET)
	public String SignIn(String str) {
		return "/Member/SignIn.tiles";
	}
	
	//로그인 처리별 화면 이동
	@RequestMapping(value = "/LoginProcess.bbs", method = RequestMethod.GET)
	public String role(Authentication auth, Map map) {
	 String list = auth.getAuthorities().toString();
	 	
	 	if(list.contains("STORE")) {
	 		return "forward:/StroeMypage/StroeMypageMain.do";
	 	}
	 	if(list.contains("ADMIN")) {
	 		return "forward:/AdminMain.bbs";
	 	}
		
		return "index.tiles";
		
	
		
		
	}
	
	//사용자 회원가입 폼으로 이동]
	@RequestMapping(value = "/SignUp.bbs", method = RequestMethod.GET)
	public String SignUp(String str) {
		return "/Member/SignUp.tiles";
	}
	
	
	
	
	//판매자 회원가입 폼으로 이동]
		@RequestMapping(value = "/StoreSignUp.bbs", method = RequestMethod.GET)
		public String StoreSignUp(String str) {
			return "/Member/StoreSignUp.tiles";
		}
	
		
		
		
	// 회원가입 처리]
	@RequestMapping(value = "/isSignUp.bbs", method = RequestMethod.POST)
	public String SignUp(@RequestParam Map map) {
		System.out.println(map);
		map.remove("passwordOk");
		System.out.println(map);
		signService.signup(map);
		return "/index.tiles";
	}///////////
	
	// 스토어 회원가입 처리]
		@RequestMapping(value = "/StoreSignUp.bbs", method = RequestMethod.POST)
		public String StoreSignUp(@RequestParam Map map) {

			if(signService.storesignup(map)==1) {
				signService.foodmenu(map);
			}
			return "/index.tiles";
		}///////////
		
		@ResponseBody
		@RequestMapping(value = "/idCheck.bbs", method = RequestMethod.GET)
		public int IdCheck(@RequestParam Map map) {
			System.out.println(map);
			return signService.idCheck(map);
		}///////////
	
		
	    
	    
	    // mailSending 코드
			@ResponseBody
	        @RequestMapping( value = "/mailCheck.bbs" , method=RequestMethod.POST )
	        public String mailSending(@RequestParam Map map) throws IOException {
	 
	            Random r = new Random();
	            int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)	            
	            String setfrom = "wkdrns3213@gamil.com";
	            String tomail = map.get("username").toString(); // 받는 사람 이메일
	            System.out.println(tomail);
	            String title = "회원가입 인증 이메일 입니다."; // 제목
	            String content =
	            
	            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	            
	            System.getProperty("line.separator")+
	                    
	            "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	    
	            " 인증번호는 " +dice+ " 입니다. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	            
	            
	            try {
	                MimeMessage message = mailSender.createMimeMessage();
	                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                        true, "UTF-8");
	 
	                messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	                messageHelper.setTo(tomail); // 받는사람 이메일
	                messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	                messageHelper.setText(content); // 메일 내용
	                
	                mailSender.send(message);
	            } catch (Exception e) {
	                System.out.println(e);
	            }
	            
	            JSONObject jo = new JSONObject();
	            jo.put("resutl",1);
	            jo.put("dice",dice);
	           return jo.toJSONString();
	
	        }

	

}
