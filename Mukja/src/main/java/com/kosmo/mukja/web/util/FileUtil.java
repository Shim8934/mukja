package com.kosmo.mukja.web.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;


public class FileUtil {
	
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static String getNewFile(MultipartHttpServletRequest req, String path, String columnName) {
		// 지정 디렉토리가 없을 시, 에러 방지 위해 생성 넣어줌
		File dir = new File(path);
		if (!dir.isDirectory()) { 
			dir.mkdirs();
		}
		
		// 각 파일 이름 임시로 담을 변수
		String fileName = "";
		
		// 파일 생성용 임시 변수
		String dbFile = "";
		// 디비로 넘어갈 파일 데이터 이름집합 담을 변수
		String dbFileName = "";
		try {
			path = req.getSession().getServletContext().getRealPath(path);
			
			// 파일 input 태그(name=BF_PATH)로 얻어온 파일들 저장할 리스트 선언  
			List<MultipartFile> fileList = req.getFiles(columnName);
			
			// 파일 해체 시작
			for(MultipartFile filePart : fileList) {
				if(filePart!=null) {
					// 업로드 파일의 이름(확장자까지)
					fileName = new String(filePart.getOriginalFilename().getBytes("8859_1"),"UTF-8");
					
					System.out.println("다운될 파일의 이름? ==  "+fileName);
					
					// 파일명이 없다면
					if ("".equals(fileName)) {
						continue;
					}
					
					// 확장자(ext)
					String ext = fileName.substring(fileName.lastIndexOf('.'));
					
					// 실제 경로에 복호화한 이름으로 생성용 변수에 이름 담음
					dbFile = getUuid() + ext;
					
					// UUID로 복호화(같은 이름의 파일 존재할 시, 복사본 생성되게(즉, 기존 파일 안 건드리게))
					// 그리고 디비에 저장할 이름을 목록화 - 구분자 "/" 넣어서 저장
					dbFileName += dbFile +"/";
					System.out.println(dbFileName + " = 디비 파일 저장 이름 체크 / 파일 유틸" );
					try {
						FileOutputStream fs = new FileOutputStream(path+"/"+dbFile);
						fs.write(filePart.getBytes());
						fs.close();
					} catch(IOException e) {e.printStackTrace();}
				}
				else {
					return null;
				}
			}
		} catch (UnsupportedEncodingException e1) { e1.printStackTrace(); }
		// 디비에 저장할 String값(파일 이름)만 반환
		return dbFileName;
	}//// 파일 업로드
	
	public static void deleteFile(HttpServletRequest req, String uploadPath, String fileAttached) {
		String saveDirectory = req.getSession().getServletContext().getRealPath(uploadPath);
		File file = new File(saveDirectory+File.separator+fileAttached);
		System.out.println(file + " 파일 삭제 직전 위치 / 파일유틸 안에!");
		System.out.println(file.exists() + "  파일 존재하는지?");
		System.out.println(file.isFile() + "  파일인지?");
		System.out.println(file.isDirectory() + "  그럼 디렉토리냐?");
		if(file.exists()) {
			file.delete();
			System.out.println(file + "  파일 유틸 파일 삭제 들어와서 파일 찍어보기");
			}
	}//deleteFile
	
	public static void downLoad(HttpServletRequest req, HttpServletResponse resp, String fileName, String uploadDir) {
		try {
			String saveDirectory = req.getSession().getServletContext().getRealPath(uploadDir);
			File file = new File(saveDirectory+File.separator+fileName);
			long length=file.length();
			resp.setContentType("application/octet-stream");
			resp.setContentLength((int)length);
			boolean isIe =req.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 ||
					  req.getHeader("user-agent").indexOf("11.0") != -1 ||
					  req.getHeader("user-agent").toUpperCase().indexOf("EDGE") !=-1;
			if(isIe) //인터넷 익스플로러 혹은 엣지
				fileName = URLEncoder.encode(fileName, "UTF-8");
			else{//기타 브라우저
				fileName = new String(fileName.getBytes("UTF-8"),"8859_1");
			}
			resp.setHeader("Content-Disposition", "attachment;filename="+fileName);
			BufferedInputStream bis =
					new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos =
					new BufferedOutputStream(resp.getOutputStream());
			int data;
			while((data = bis.read()) !=-1){
				bos.write(data);
				bos.flush();
			}
			bos.close();
			bis.close();
		} catch(Exception e) {e.printStackTrace();}
	}//downLoad

}///class
