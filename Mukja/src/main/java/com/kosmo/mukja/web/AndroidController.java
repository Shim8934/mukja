package com.kosmo.mukja.web;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
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
import com.kosmo.mukja.service.ErcDTO;
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
		System.out.println("안드에서 접속");
		return androidService.anIsLogin(dto);
	}

	// 방만들기
	@CrossOrigin
	@GetMapping(value = "/CreatEroom/json")
	public String anEroom(@RequestParam Map map) {
		int result = 0;
		try {
			String ERtitle = map.get("title").toString();
			String ERcontent = map.get("content").toString();
			String ERtime = map.get("date").toString() + " " + map.get("time").toString();
			String ER_TEND = map.get("tend").toString();
			String ERmax = map.get("max").toString();
			map.put("ERtitle", ERtitle);
			map.put("ERcontent", ERcontent);
			map.put("ERmax", ERmax);
			map.put("ERtime", ERtime);
			map.put("ER_TEND", ER_TEND);

			// 방을 생성함
			result = androidService.createEroom(map);
			if (result == 1) {
				// 현 생성된 방의 번호를 불러옴
				int er_no = androidService.getRoomNo(map);
				map.put("er_no", er_no);
				System.out.println("채팅방생성을 위한 반번호:" + er_no);

				// 생성된 방의 마스터를 가지고옴
				String er_master = androidService.getRoomMaster(map);
				map.put("er_master", er_master);
				System.out.println("방참여를 위한 방장이름:" + er_master);

				// 방번에 맞게 채팅방 생성
				androidService.creatERC(map);
				int erc_no = androidService.getERoomCno(map);
				map.put("erc_no", erc_no);
				System.out.println("채팅방과 참여방의 연결번호:" + erc_no);

				androidService.joinERoom(map);
				androidService.setupER_role(map);
				System.out.println("{'resunt':" + result + "}");
			}

		} catch (NullPointerException e) {
			String ER_TEND = " ";
		}
		return "{'resunt':" + result + "}";
	}

	// 방 참여하기
	@GetMapping(value = "/ERoomjoin.do")
	public String requestERjoin(@RequestParam Map map) {
		String er_no = map.get("er_no").toString();
		String username = map.get("username").toString();
		String store_id = map.get("store_id").toString();
		System.out.println("er_no:" + er_no);
		System.out.println("username:" + username);
		System.out.println("store_id:" + store_id);
		int erc_no = androidService.getERoomCno(map);
		System.out.println("erc_no:" + erc_no);
		map.put("erc_no", erc_no);
		JSONObject jsonObject = new JSONObject();
		int joinER = androidService.joinERoom(map);// 이게 1이면 참가신청 완료 0이면 참여신청은 됬고
		int selectrool = androidService.selectrool(map);// 이게 1이면 참여중 0이면 대기중 -1 거절
		jsonObject.put("erc_no", erc_no);
		jsonObject.put("selectrool", selectrool);
		jsonObject.put("joinER", joinER);
		return jsonObject.toJSONString();
	}

	// 내가 참여중인 방목록
	@GetMapping(value = "/chattingList.do", produces = "application/json; charset=utf8")
	public String chattingList(@RequestParam Map map) {

		String username = map.get("username").toString();
		// 내가 참여중인 방 정보 얻기
		List<ErcDTO> ercList = androidService.myERoomCList(map);
		// 얻어온 리스트를 통해서 내가 지금 참여중인 채팅방 정보를 송신(json파싱)
		JSONArray jsonArray = new JSONArray();
		if (ercList != null) {
			for (ErcDTO erc : ercList) {
				JSONObject jsonDto = new JSONObject();
				jsonDto.put("username", erc.getUsername());
				jsonDto.put("er_no", erc.getEr_no());
				jsonDto.put("erc_no", erc.getErc_no());
				jsonDto.put("er_master", erc.getEr_master());
				map.put("er_master", erc.getEr_master());
				jsonDto.put("master_nick", androidService.getMasterNick(map));
				jsonDto.put("master_img", androidService.getMasterimg(map));
				jsonDto.put("store_id", erc.getstore_id());
				map.put("store_id", erc.getstore_id());
				jsonDto.put("store_name", androidService.getStoreInfos(map).getStore_name());
				jsonDto.put("er_title", erc.getEr_title());
				jsonDto.put("er_content", erc.getEr_content());
				jsonDto.put("er_time", erc.getEr_time());
				jsonDto.put("er_tend", erc.getEr_tend());
				jsonDto.put("er_max", erc.getEr_max());
				jsonArray.add(jsonDto);
			} // for
			System.out.println(jsonArray.toJSONString());
		} // if
		return jsonArray.toJSONString();
	}

	@GetMapping(value = "/ERoomold.do",produces = "application/json; charset=utf8")
	public String ERoomold(@RequestParam Map map) {
		System.out.println(map.get("er_no"));
		System.out.println(map.get("erc_no"));
		System.out.println(androidService.ERoomold(map));
		
		return androidService.ERoomold(map).replace("어서오세요 같이먹자 채팅방입니다.즐거운 시간되세요!","");
	}

}
