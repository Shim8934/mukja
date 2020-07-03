package com.kosmo.mukja.web;

import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.mukja.service.StoreService;
import com.kosmo.mukja.service.TableDTO;
import com.kosmo.mukja.web.util.DBJson;

@Controller
public class ReservationController {

	@Resource(name = "StoreInfoService")
	private StoreService service;
	
	
	@RequestMapping("/reservationInfo.do")
	public String reservationInfo(@RequestParam Map map,Model model, Authentication authentication) {
		//현재 로그인해있는 가게아이디 얻기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("store_id", userDetails.getUsername());
		System.out.println();
		//가게 좌석정보 얻어오기
		TableDTO tableDTO =  service.getTable(map);
		if(tableDTO!=null) {
			System.out.println(tableDTO);
			System.out.println(tableDTO.getStore_id());
			JSONObject tableInfo = DBJson.DBtoJson(tableDTO);
			System.out.println(tableInfo.toJSONString());
			model.addAttribute("table_Info",tableInfo.toJSONString());
			
		}
		return "Store/Reservation/ReservationView.tiles";
	}
	
	
	@ResponseBody
	@RequestMapping("/updateReservation.do")
	public String updateReservation(@RequestParam Map map, Authentication authentication) {
		//현재 로그인해있는 가게아이디 얻기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("store_id", userDetails.getUsername());
		System.out.println("updateReservation 돌입");
		JSONParser parser = new JSONParser();
		StringBuffer sb = new StringBuffer();
		try {
			JSONObject tableinfo = (JSONObject)(parser.parse(map.get("data").toString()));
			int row =Integer.parseInt(tableinfo.get("y_boundary").toString());
			int col =Integer.parseInt(tableinfo.get("x_boundary").toString());
			System.out.println("row : "+row+" col:"+col);
			int wating_count=Integer.parseInt( tableinfo.get("wating_count").toString());
			int avg_wating_time=Integer.parseInt( tableinfo.get("avg_wating_time").toString());
			for(int i=0; i<row;i++) {
				for(int j=0; j<col;j++) {
					JSONArray innerData= (JSONArray)tableinfo.get(String.valueOf(i));
					if(i==row-1&&j==col-1) {
						sb.append((i+1)+"-"+(j+1)+"-"+	innerData.get(j));
					}else {
						sb.append((i+1)+"-"+(j+1)+"-"+	innerData.get(j)+",");
						
					}
				}
			}
			System.out.println("sb.toString()");
			System.out.println(sb.toString());
		
			map.put("xy_data", sb.toString());
			map.put("xy_boundary",col+","+row);
			map.put("wating_count",wating_count );
			map.put("avg_wating_time",avg_wating_time );
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		
		int result = service.updateTableInfo(map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		return jsonObject.toJSONString();
	}
	
	
	@ResponseBody
	@RequestMapping("/getRealTimeReservation.do")
	public String getRealTimeReservation(@RequestParam Map map) {
		System.out.println("store_id : "+map.get("store_id"));
		//가게 좌석정보 얻어오기
		TableDTO tableDTO =  service.getTable(map);
		
		if(tableDTO!=null) {
			JSONObject tableInfo = DBJson.DBtoJson(tableDTO);
			System.out.println("tableInfo:"+tableInfo.toJSONString());
			return tableInfo.toJSONString();
		
		}else {
			return "flase";
		}
	}
	
	@RequestMapping("/Resevation/CreateStoreTableMap.do")
	public String CreateStoreTableMap(@RequestParam Map map, Authentication authentication) {
		//현재 로그인해있는 가게아이디 얻기
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		map.put("store_id", userDetails.getUsername());
		System.out.println("store_id : "+map.get("store_id"));
		return "Store/Reservation/CreateStoreTableMap.tiles";
	}
	
}
