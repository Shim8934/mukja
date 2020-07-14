package com.kosmo.mukja.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosmo.mukja.service.FoodMenuDTO;
import com.kosmo.mukja.service.SignService;
import com.kosmo.mukja.service.UsersDTO;
import com.kosmo.mukja.web.util.FileUtility;
import com.oreilly.servlet.MultipartRequest;

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

	// 로그인 폼으로 이동]
	@RequestMapping(value = "/SignIn.bbs", method = RequestMethod.GET)
	public String SignIn(String str) {
		return "Member/SignIn.tiles";
	}

	// 로그인 처리별 화면 이동
	   @RequestMapping(value = "/LoginProcess.bbs", method = RequestMethod.GET)
	   public String role(Authentication auth, Map map,HttpSession session) {
	      String list = auth.getAuthorities().toString();

	      if (list.contains("STORE")) {
	         session.setAttribute("isStore", "isStore");
	         return "forward:/StoreMypage/StoreMypageMain.do";      
	      }
	      if (list.contains("ADMIN")) {
	         session.setAttribute("isAdmin", "isAdmin");
	         return "forward:/AdminMain.bbs";
	      }
	      return "index.tiles";

	   }

	// 사용자 회원가입 폼으로 이동]
	@RequestMapping(value = "/SignUp.bbs", method = RequestMethod.GET)
	public String SignUp(String str) {
		return "/Member/SignUp.tiles";
	}
	
	// 판매자 회원가입 폼으로 이동]
	@RequestMapping(value = "/StoreSignUp.bbs", method = RequestMethod.GET)
	public String StoreSignUp(String str) {
		return "/Member/StoreSignUp.tiles";
	}

	
	// 카카오로그인시 회원가입되있는지 ]
	@ResponseBody
	@RequestMapping(value = "/kakao.bbs", method = RequestMethod.GET)
	public int kakao(@RequestParam Map map, Model model) {
		System.out.println(map);
		map.put("username",map.get("res[kakao_account][email]"));
		System.out.println(map.get("username"));
		int result = signService.kakaoidCheck(map);
		System.out.println(result);
		return result;
	}///////////
	// 카카오 사용자 회원가입 폼으로 이동]
		@RequestMapping(value = "/kakaoSignUp.bbs", method = RequestMethod.POST)
		public String kakaoSignUp(@RequestParam Map map,Model model) {
			model.addAttribute("map",map);			
		return "/Member/SignUp.tiles";
		}
	// 회원가입이 되있고 카카오로그인 눌렀을때]
		@ResponseBody
		@RequestMapping(value = "/kakaoLogin.bbs", method = RequestMethod.GET)
		public UsersDTO kakaoOk(@RequestParam Map map, Model model) {			
			map.put("username",map.get("res[kakao_account][email]"));
			System.out.println(map.get("username"));
			return signService.idPass(map);
		}///////////
	
	// 회원가입 처리]
	@RequestMapping(value = "/isSignUp.bbs", method = RequestMethod.POST)
	public String SignUp(@RequestParam Map map,
						HttpServletRequest req) {
		String userPath = req.getSession().getServletContext().getRealPath("/resources/user_IMG");
		String uploadDir ="/resources/user_IMG";
		
		   File dir = new File(userPath);
		    if(!dir.exists()) {
		    	dir.mkdirs();
		    	System.out.println("경로 만듦 / ");
		    }
		
		MultipartRequest mr = FileUtility.upLoad(req, userPath);
		
		String username = mr.getParameter("username").toString();
		System.out.println("아이디 = "+username);
		
		String password = mr.getParameter("password").toString();
		System.out.println("비밀번호 = "+password);
		
		String u_nick = mr.getParameter("u_nick").toString();
		System.out.println("닉네임 = "+u_nick);
		
		String u_age = mr.getParameter("u_age").toString();
		System.out.println("연령대 = "+u_age);
		
		String u_lat = mr.getParameter("u_lat").toString();
		System.out.println("위도 = "+u_lat);
		
		String u_lng = mr.getParameter("u_lng").toString();
		System.out.println("경도 = "+u_lng);
		
		String u_addr = mr.getParameter("u_addr").toString();
		System.out.println("주소 = "+u_addr);
		
		String u_ph = mr.getParameter("u_ph").toString();
		System.out.println("연락처 = "+u_ph);
		
		String u_tend = mr.getParameter("menu_tend").toString();
		System.out.println("성향 = "+u_tend);
		
		map.put("username", username);
		map.put("password", password);
		map.put("u_nick", u_nick);
		map.put("u_age", u_age);
		map.put("u_lat", u_lat);
		map.put("u_lng", u_lng);
		map.put("u_addr", u_addr);
		map.put("u_ph", u_ph);
		map.put("u_tend", u_tend);
		map.put("authority","ROLE_USER");
		map.put("enabled", 1);
		String u_img = mr.getFilesystemName("u_img");
		String kakao_img = mr.getParameter("kakao_img");
		System.out.println(u_img);
		System.out.println(kakao_img);
		if(u_img!=null) {
			System.out.println("프로필사진 있음 / 경로 세팅 직전 찍어봄 = "+u_img);
			u_img = uploadDir +"/" + u_img;
			System.out.println("디비 최종 입력 직전 찍어봄 = "+u_img);
			map.put("u_img",u_img);
		}
		 else {	         
			 if(mr.getParameter("kakao_img")!=null) {
	            map.put("u_img", mr.getParameter("kakao_img"));
	         }else {
	        	 u_img = uploadDir +"/"+"null";
		         map.put("u_img", u_img);
			}	       
	    }
		signService.signup(map);
		return "/index.tiles";
	}///////////

	// 스토어 회원가입 처리]
	@RequestMapping(value = "/StoreSignUp.bbs", method = RequestMethod.POST)
	public String StoreSignUp(@RequestParam Map map,
							  HttpServletRequest req) {
		String storePath = req.getSession().getServletContext().getRealPath("/resources/storeIMG");
		String uploadDir ="/resources/storeIMG";
		
		System.out.println("경로 찍어보기 = "+storePath);
	    File dir = new File(storePath);
	    if(!dir.exists()) {
	    	dir.mkdirs();
	    	System.out.println("경로 만듦 / ");
	    }
		MultipartRequest mr = FileUtility.upLoad(req, storePath);
		
		// 디비에 넣을 입력 받은 정보들 빼서 맵에 넣기
		String username = mr.getParameter("username").toString();
		map.put("username", username);
		map.put("password", mr.getParameter("password").toString());
		map.put("store_name", mr.getParameter("store_name").toString());
		map.put("store_reginum","1111111111");
		map.put("store_phnum", mr.getParameter("store_phnum").toString());
		map.put("store_email", mr.getParameter("store_email").toString());
		String store_intro = mr.getParameter("store_intro").toString();
		store_intro = store_intro.replace("<p>", "").replace("</p>", "").trim();
		System.out.println("store_intro 찍어봄 = "+store_intro);
		map.put("store_intro", store_intro);
		String store_time = mr.getParameter("store_time").toString();
		store_time = store_time.replace("<p>", "").replace("</p>", "").trim();
		System.out.println("store_time 찍어봄 = "+store_time);
		map.put("store_time", store_time);
		map.put("store_lat", mr.getParameter("store_lat").toString());
		map.put("store_lng", mr.getParameter("store_lng").toString());
		// 상세 주소까지 넣기용
		String store_addr = mr.getParameter("store_addr").toString();
		store_addr = store_addr+"/"+mr.getParameter("store_addrDetail").toString();
		System.out.println(store_addr + "디비에 들어갈 최종 주소값 정보 출력");
		map.put("store_addr", store_addr);
		int result = 0;
		// 회원가입 정보 및 가게 사진 파일 입력용
		if(signService.storesignup(map)==1) {
			for(int i=0;i<3;i++) {
				String sf_path = mr.getFilesystemName("sf_path"+i);
				if(sf_path!=null) {
					System.out.println("가게 회원가입 사진 인설트하기 직전 파일 경로? = "+sf_path);
					map.put("sf_path", uploadDir+"/"+sf_path);
					result = signService.insertStoreImg22(map);
				}
			}
		}// 회원 가입 끝
		
		// 음식 메뉴 / 메뉴 사진 입력 시작
		// 메뉴용 파일 경로 설정
		String foodPath = req.getSession().getServletContext().getRealPath("/resources/foodIMG");
		dir = new File(foodPath);
		if(!dir.exists()) {
	    	dir.mkdirs();
	    	System.out.println("경로 만듦 / ");
	    }
		
		System.out.println("유저네임 찍어봄"+username);
		map.put("username", username);
		System.out.println();
		int k=0;
		boolean j = true;
		while(j) {
			System.out.println("음식 메뉴 및 음식 사진 넣는 while문 안까지 왔음 ");
			if(mr.getParameter("menu_name"+k)!=null) {
				
			String menu_name = mr.getParameter("menu_name"+k);
			System.out.println("메뉴이름 찍어봄 = "+menu_name);
			map.put("menu_name", menu_name);
			
			String menu_tend = mr.getParameter("menu_tend"+k);
			System.out.println(menu_tend);
			String o = Integer.toString(k);
			System.out.println(o + "  o 변수 찍음");
			menu_tend = menu_tend.replace(o, "");
			System.out.println("바꾼 tend 찍어봄 = "+menu_tend);
			map.put("menu_tend",menu_tend);
			
			String menu_info = mr.getParameter("menu_info"+k);
			map.put("menu_info", menu_info);
			String menu_price = mr.getParameter("menu_price"+k);
			System.out.println("메뉴 가격 찍어봄 = "+menu_price);
			map.put("menu_price", menu_price);
			String fm_path = mr.getFilesystemName("fm_path"+k);
			if(fm_path==null) {
				fm_path = "null";
			}
			map.put("fm_path", uploadDir+"/"+fm_path);		
			System.out.println("파일 패스 찍어봄 "+fm_path);
			result = signService.foodmenu(map);
			
			FoodMenuDTO dto = signService.getMenuNo(map);
			map.put("menu_no", dto.getMenu_no().toString());
			System.out.println(dto.getMenu_no().toString());
			result = signService.insertFoodImg(map);
			k++;
			System.out.println(k +"  k 찍어봄");
			}
			else {
				j=false;
			}		
		}
		if(result==1) {
			map.put("username",username);
			signService.insertStoreNewTable(map);
		}// 굳이 조건 안 걸어도 됨.
		
		return "/index.tiles";
	}///////////
	
		@ResponseBody
		@RequestMapping(value = "/storeIdCheck.bbs", method = RequestMethod.GET)
		public int storeIdCheck(@RequestParam Map map) {
			System.out.println(map);
			return signService.storeIdCheck(map);
		}///////////
		
		@ResponseBody
		@RequestMapping(value = "/userIdCheck.bbs", method = RequestMethod.GET)
		public int IdCheck(@RequestParam Map map) {
			System.out.println(map);
			return signService.userIdCheck(map);
		}///////////

	// mailSending 코드
	@ResponseBody
	@RequestMapping(value = "/mailCheck.bbs", method = RequestMethod.POST)
	public String mailSending(@RequestParam Map map) throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		String setfrom = "wkdrns3213@gamil.com";
		String tomail = map.get("store_email").toString(); // 받는 사람 이메일
		System.out.println(tomail);
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		JSONObject jo = new JSONObject();
		jo.put("resutl", 1);
		jo.put("dice", dice);
		return jo.toJSONString();

	}

}
