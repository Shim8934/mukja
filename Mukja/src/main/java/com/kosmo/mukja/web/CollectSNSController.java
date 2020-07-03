package com.kosmo.mukja.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.mukja.service.StoreService;

@Controller
public class CollectSNSController {
	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	@RequestMapping("/CollectMain.do")
	public String CollectMain() {
		return "CollectSNS/CollectMain.tiles";
	}
}
