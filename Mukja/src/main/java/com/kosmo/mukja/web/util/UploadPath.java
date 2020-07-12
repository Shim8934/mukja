package com.kosmo.mukja.web.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
//안드로이드용 업로드 클래스
public class UploadPath {
public static String attach_path ="WEB-INF/uploads/";
	
	
	public static String path(HttpServletRequest request){	
		String uploadPath ="";
		
		try{
			String root_path =request.getContextPath();
			uploadPath =root_path+attach_path.replace('/', File.separatorChar);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return uploadPath;
	}
}
