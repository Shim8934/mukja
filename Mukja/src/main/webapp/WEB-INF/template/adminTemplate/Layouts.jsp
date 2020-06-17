<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>골라먹자 : 세상의 모든 음식을 골라먹자</title>
  <link href="<c:url value="/resources/adminbootstrap/main.css"/>" rel="stylesheet">
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
  <style>
	
  </style>
  </head>
  <body>
  <!-- 전체 감싸는 div -->
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header fixed-footer closed-sidebar">
    
	<!-- top부분 -->
	<tiles:insertAttribute name="top"/>
    <!-- body부분 -->
    <tiles:insertAttribute name="body"/>  
    
    <!-- footer부분 -->
    <tiles:insertAttribute name="footer"/>
    
    
    
    	</div>
    	<!-- 본문파일에서 시작하는 app-main__outer끝 -->
    </div>
    <!-- Top시작하는 app-main 끝 -->
    <!-- 전체 감싸는 div 끝 -->  
   
	<!-- 템플릿 스크립트 -->
    <script type="text/javascript" src="<c:url value="/resources/adminbootstrap/assets/scripts/main.js"/>"></script>
  </body>
</html>