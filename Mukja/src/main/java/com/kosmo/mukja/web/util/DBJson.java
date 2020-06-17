package com.kosmo.mukja.web.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kosmo.mukja.service.TableDTO;

public class DBJson {

	public DBJson() {
	}
	
	public static JSONObject DBtoJson(TableDTO tableDTO){
		//좌석 총수 행값
		JSONObject tableInfo = new JSONObject();
		String x_boundary = tableDTO.getXy_boundary().split(",")[0].trim();
		System.out.println("x_boundary : "+x_boundary);
		
		//좌석 총수 열값
		String y_boundary=tableDTO.getXy_boundary().split(",")[1].trim();
		System.out.println("x_boundaryundary : "+x_boundary);
		
		//json에 잘 사용할수있도록 넣어줌 희희
		tableInfo.put("x_boundary", x_boundary);
		tableInfo.put("y_boundary", y_boundary);
		
		
		String[] xy_dataArray= tableDTO.getXy_data().split(",");
		
		
		//각 행렬의 좌석엘리먼트를 쪼개서 정보 파싱
		int jsonIndex=0;
		//하나의 행을 담당할 컬러정보를 담을 배열
		JSONArray xy_color_array = new JSONArray();
		for(int i=1;i<=xy_dataArray.length;i++) {
			//컬러만 넣어두기
			String xt_data_color = xy_dataArray[i-1].trim().substring(xy_dataArray[i-1].trim().length()-1,xy_dataArray[i-1].trim().length());
			//디버깅
			System.out.println("xy_data["+i+"] : "+xt_data_color);
			xy_color_array.add(xt_data_color);
			System.out.println("나눈 결과: "+i%Integer.parseInt(x_boundary.trim()));
			System.out.println();
			if(i!=1 && i%Integer.parseInt(x_boundary.trim())==0) {
				tableInfo.put(jsonIndex,xy_color_array);
				xy_color_array = new JSONArray();
				jsonIndex++;
			}
			
		}
		return tableInfo;
	}
}
