package com.kosmo.mukja.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeachableFoodInfoController {

	@RequestMapping("/Teachable.do")
	public String TeachableFood() {
		
		return "TeachableFood/TachableFoodInfo.tiles";
	}
	
	@RequestMapping("/Teachable_android.do")
	public String TeachableFood_android() {
		
		return "TeachableFood/TachableFoodInfo_android";
	}
	
	
}
