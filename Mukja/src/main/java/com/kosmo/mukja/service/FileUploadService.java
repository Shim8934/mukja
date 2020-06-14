package com.kosmo.mukja.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUploadService {
	private static final String PREFIX_URL = "";
	
	public Map restore(MultipartHttpServletRequest req, String save_Path, Map map) {
		File dir = new File(save_Path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		Iterator<String> files = req.getFileNames();
		while(files.hasNext()) {
			
			
		}
		return map;
	}
	
	
}