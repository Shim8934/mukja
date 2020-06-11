<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>골라먹자 : 세상의 모든 음식을 골라먹자</title>

    
   <!-- 템플릿 CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/animate.css'/>">    
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/jquery.timepicker.css'/>">   
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icomoon.css'/>">
    <link rel="stylesheet" href="  <c:url value='/resources/bootstrap/css/style.css'/>">   
   <!-- 친구리스트 -->
   <%-- <link rel="stylesheet" href="<c:url value='/resources/adminbootstrap/assets/css/material-dashbooard.css'/>"> --%>
   <!-- 아이콘  css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-common.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-style.css'/>">
   <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/modernizr.custom.79639.js'/>"></script>
   <!-- 메뉴 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-default.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-component.css'/>">
   <script src="<c:url value='/resources/bootstrap/js/modernizr.custom.js'/>"></script>
   <!-- 한글폰트 -->
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" >
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
   <!-- 영어폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lovers+Quarrel" rel="stylesheet">

   <!-- 탭형 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/tab-style.css'/>">
   
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"/></script>
   <style>
   
   .img_messenger{
  	position:relative;
  	z-index:90000;
  	width: 80px;
  	height: 80px;
  	max-width: 100px;
    max-height: 100px;
  	background-color: white; 
	border: 2px #54DAFF solid; 
	border-radius:100px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	margin: 5px;
  }
 #messenger { 
	 position:absolute; 
	 top:100px; 
	 right:0px; 
	 padding: 3px 10px 
 }
 #messenger_board{
	margin-left:50px;
	margin-top:-50px;
	width:10px;
	height:10px;
 	background-color: #FCFCFC;
 	border: 3px #E8E8E8 solid; 
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 }
   </style>
  </head>
  
  <body>



  
   <!-- top부분 -->
   <tiles:insertAttribute name="top"/>
    <!-- body부분 -->
    <tiles:insertAttribute name="body"/>  
    
    <!-- footer부분 -->
    <tiles:insertAttribute name="footer"/>  
   <!--  -->
  <!--  <div class="fixed-plugin">
      <div class="dropdown show-dropdown">
         <a class="small" href="#" data-toggle="dropdown"> <span
            class="icon-arrow-circle-o-right middle-icon"></span> <i class="fa fa-cog fa-2x"></i>
         </a>
         <ul class="dropdown-menu" style="transform: trslate(0px 0px);">
            <li class="header-title">친구 리스트</li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
         </ul>
      </div>
   </div> -->
   
  
   <!-- 템플릿js -->
   <!-- 메뉴 js -->
   <script src="<c:url value='/resources/bootstrap/js/toucheffects.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/popper.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.easing.1.3.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.waypoints.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.stellar.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.magnific-popup.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/aos.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.animateNumber.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap-datepicker.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.timepicker.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/scrollax.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/main.js'/>"></script>
  
  <!-- 메신저 창 -->

<div id="messenger">
	<img class="img_messenger" id='btn_messenger' src="<c:url value="/resources/messenger/f.JPG"/>"  >
	<div id="messenger_board">
		<div class="row"style="margin-left: 65px;">
			<div id="messnger_content" style="display: none;">
				<div class="row" >
					<h3>채팅목록</h3>
				</div>
				<div class="row">
					<h3>채티</h3>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 메신저끝-->

   <script>
	//메신져 따라다니기
	var currentPosition = parseInt($("#messenger").css("top")); 
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		$("#messenger").stop().animate({
			"top":position+currentPosition+"px"}
		,500); 
		});
	var f=0;
	$('#messenger').click(function(){
		if(f==0){
			/* anime({
				  targets: '#messenger_board',
				  translateX: -250,
				  scaleX: 100,
				  scaleY: 300
				}); */
			anime({
				  targets: '#messenger_board',
				  width: '400px', // -> from '28px' to '100%',
				  height:'700px',
				  easing: 'easeInOutQuad',
				});
				setTimeout(function() {
					$('#messnger_content').fadeIn();
					}, 1000);
				
			f=1;
		}else{
			anime({
				  targets: '#messenger_board',
				  translateX: 0,
				  width: '1px', // -> from '28px' to '100%',
				  height:'1px',
				  easing: 'easeInOutQuad',
				});
				$('#messnger_content').hide();
			f=0;
		}
		
	});
	</script>
  </body>
</html>