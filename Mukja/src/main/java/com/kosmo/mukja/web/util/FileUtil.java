package com.kosmo.mukja.web.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;


public class FileUtil {
	public static String getNewFile(MultipartHttpServletRequest req, String path, String columnName) {
		// 추가할거? -> 같은 이름의 파일이 존재할 시, 디비에 넣을 파일 이름 데이터까지 다 복사본(ex -> 원본_1)으로바꿔서 저장및 데이터 입력
		// 각 파일 이름 임시로 담을 변수
		String fileName = "";
		// 파일 이름 추가용 변수
		int i;
		// 디비로 넘어갈 파일 데이터 이름집합 담을 변수
		String dbFileName = "";
		
		path = req.getSession().getServletContext().getRealPath(path);
		
		// 파일 input 태그(name=NT_IMG)로 얻어온 파일들 저장할 리스트 선언  
		List<MultipartFile> fileList = req.getFiles(columnName);
		
		// 파일 해체 시작
		for(MultipartFile filePart : fileList) {
			// 업로드 파일의 이름(확장자까지)
			fileName = filePart.getOriginalFilename();
			System.out.println("다운될 파일의 이름? ==  "+fileName);
			
			// 기존과 같은 이름의 파일 업로드 체크용 파일 객체
			File checkFile = new File(path+"/"+fileName);
			// 체크용 파일의 파일 이름(경로 제외)
			String checkFileName = checkFile.getName();
			// 업로드 파일 디비에 넣기용으로 변환 - 디비에 넣을 때 무조건 파일이름 뒤에 / 가 붙음
			dbFileName+=fileName+" / ";
			System.out.println("디비에 저장할 데이터 값? = "+dbFileName+"\r\n");
			// 파일 등록 시, 파일 경로에 생성
			if(checkFile.exists()&&!fileName.equals("")) {
				// 이름이 같은 파일 존재해서 임의의 이름을 가진 파일로 만드는 중(처음 복사하는 경우)
				if(!StringUtils.isNumeric((fileName.substring(fileName.lastIndexOf("_")+1,fileName.lastIndexOf("_")+2)))) {
					i=1;
					fileName = fileName.substring(0,fileName.lastIndexOf("."))+"_"+i+fileName.substring(fileName.lastIndexOf("."));
					System.out.println("같은 이름 파일 존재할 경우 11    "+fileName+"\r\n");
				}
				// 이름이 같은 파일 존재해서 임의의 이름을 가진 파일로 만드는 중(처음 복사가 아닌 경우)
				else {
					i=(Integer.parseInt(fileName.substring(fileName.lastIndexOf("_")+1,fileName.lastIndexOf("_")+2)))+1;
					System.out.println("i값은 무엇?  "+i);
					fileName = fileName.substring(0,fileName.lastIndexOf("."))+File.separator+"_"+i+fileName.substring(fileName.lastIndexOf("_")+1);
					System.out.println("같은 이름 파일 존재할 경우 22     "+fileName+"\r\n");
				}
				
			}
			else {
				// 기존 서버단의 파일에 같은 이름 파일 미존재, 즉 이름 원본대로 저장
				fileName = fileName.substring(0,fileName.lastIndexOf("."))+fileName.substring(fileName.lastIndexOf("."));
				System.out.println("같은 이름 파일 존재 X   "+fileName+"\r\n");
			}
			try {
				FileOutputStream fs = new FileOutputStream(path+"/"+fileName);
				fs.write(filePart.getBytes());
				fs.close();
			} catch(IOException e) {e.printStackTrace();}
		}
		// 디비에 저장할 String값만 반환
		return dbFileName;
	}

}///class
