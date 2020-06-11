package com.kosmo.mukja.web;

import java.util.Collection;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	// 서비스 주입]
	@Resource(name = "signService")
	private SignService signService;

	// 로그인 폼으로 이동]

	@RequestMapping(value = "/SignIn.bbs", method = RequestMethod.GET)
	public String SignIn(String str) {
		return "/Member/SignIn.tiles";
	}
	// 회원가입 폼으로 이동]
	@RequestMapping(value = "/SignUp.bbs", method = RequestMethod.GET)
	public String SignUp(String str) {
		return "/Member/SignUp.tiles";
	}

	// 회원가입 처리]
	@RequestMapping(value = "/isSignUp.bbs", method = RequestMethod.POST)
	public String SignUp(@RequestParam Map map) {
		System.out.println(map);
		map.remove("passwordOk");
		map.remove("addr");
		System.out.println(map);
		signService.signup(map);
		return "/index.tiles";
	}///////////

}
