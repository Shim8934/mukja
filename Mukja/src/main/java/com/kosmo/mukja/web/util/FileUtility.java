package com.kosmo.mukja.web.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtility {

	public static MultipartRequest upLoad(HttpServletRequest req, String saveDirectory) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req,saveDirectory,1024*900,"UTF-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {e.printStackTrace();}
		return mr;
	}///upLoad
	
	public static void deleteFile(HttpServletRequest req, String uploadPath, String fileAttached) {
		String saveDirectory = req.getSession().getServletContext().getRealPath(uploadPath);
		System.out.println(saveDirectory);
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
	
}//class FileUtility
