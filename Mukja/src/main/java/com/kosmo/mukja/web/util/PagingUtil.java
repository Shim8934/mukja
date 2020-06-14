package com.kosmo.mukja.web.util;

public class PagingUtil {

	public static String pagingBootStrapStyle(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page, String searchColumn, String searchWord){
		
		String pagingStr="<div><nav class=\"\"><ul class=\"pagination\">";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li class=\"page-item\">\r\n" + 
					"<a href='"+page+"nowPage=1' class=\"page-link\" aria-label=\"Previous\">\r\n" + 
					"<span aria-hidden=\"true\">«</span>\r\n" + 
					"<span class=\"sr-only\">Previous</span>\r\n" +
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='"+page+"nowPage="+(intTemp -blockPage)+"' >\r\n" + 
					"<span >&lsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<li class=\"page-item\"><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
			}
		     else {
		    	 if(searchColumn == "" && searchWord == "") {
		    		 pagingStr+="<li class=\"page-item\"><a href='"+page+"nowPage="+intTemp+"' class=\"page-link\">"+intTemp+"</a></li>";
		    	 }
		    	 else {
		    		 pagingStr+="<li class=\"page-item\"><a href='"+page+"nowPage="+intTemp+"&searchColumn="+searchColumn+"&searchWord="+searchWord+"' class=\"page-link\">"+intTemp+"</a></li>";
		    	 }
		    }
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li class=\"page-item\">\r\n" + 
					"<a href='"+page+"nowPage="+intTemp+"' class=\"page-link\">\r\n" + 
					"<span >&rsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='"+page+"nowPage="+totalPage+"' class=\"page-link\">\r\n" + 
					"<span >&raquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav></div>";
		return pagingStr;
	}
	
}
