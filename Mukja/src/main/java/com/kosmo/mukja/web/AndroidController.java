package com.kosmo.mukja.web;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	private AndroidService androidService;

	// 안드로이드 앱에 데이타 제공용
	// JSON으로 제공시
	@CrossOrigin
	@GetMapping(value = "/android/json")
	public AndroidDTO anIsLogins(AndroidDTO dto) {
		System.out.println("여기");
		System.out.println(androidService.anIsLogin(dto));
		return androidService.anIsLogin(dto);
	}

	@CrossOrigin
	@GetMapping(value = "/CreatEroom/json")
	public String anEroom(@RequestParam Map map) {
		try {
			
			System.out.println("username:" + map.get("username").toString());
			System.out.println("title:" + map.get("title").toString());
			System.out.println("content:" + map.get("content").toString());
			System.out.println("horizontalCounter:" + map.get("horizontalCounter").toString());
			System.out.println("datePicker:" + map.get("datePicker").toString());
			System.out.println("timePicker:" + map.get("timePicker").toString());
			System.out.println("tent:" + map.get("tent").toString());
		} catch (NullPointerException e) {
			String tent = "";
		}
		return null;
	}

}
