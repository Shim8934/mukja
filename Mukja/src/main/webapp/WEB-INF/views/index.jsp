<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>    
    


<!-- 제이쿼리  ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 
 <!-- 타임피커 -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/Time-Pic/dist/bootstrap-clockpicker.css"/>">
<script type="text/javascript" src="<c:url value="/resources/Time-Pic/dist/bootstrap-clockpicker.js"/>"></script>


<%-- 
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/Time-Pic/dist/jquery-clockpicker.css"/>">
<script type="text/javascript" src="<c:url value="/resources/Time-Pic/dist/jquery-clockpicker.js"/>"></script>
 --%>


<!--부트스트랩 -->
<link href="<c:url value="/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<!-- kokomap -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8b4c494b923442e4a549fa1dd7f645&libraries=services"></script>
	

	
<!-- 섬머노트 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


 
  

 <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;  left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padd	ing: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
   /*  .wrapper{
	  display: grid;
	  grid-template-columns: 350px auto;
	 
	} */
	
    .overlayDiv{    	
    	background-color: white;       	
    	margin-top: -150px
    }
   
   #selecter{
  	 height: 100px;
   }
   
   #searchButton{
	margin-bottom:10px;
   height: 52px;
   
   }
   #popupSearch {
	position:relative;
	padding-top:20px;
	margin-top:-60px;
	margin-left:-175px;
	/* top:310px; */
	left:50%;  
	z-index:100;
	background-color: white; 
	opacity: 0.9;
	width: 350px; 
	
	display:none;
	background-color: white; 
	border: 1px #d6d6d6 solid; 
	border-radius:5px;  
	box-shadow: rgb(191, 191, 191) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
   }
  
  .img_size{
	display:block;
  	width: 50px;
  	height: 50px;
  	max-width: 65px;
    max-height: 65px;
  	background-color: white; 
	border: 2px #66B9E3 solid; 
	border-radius:45px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
  }
  
   .img_user{
	display:block;
  	width: 200px;
  	height: 200px;
  	max-width: 300px;
    max-height: 300px;
  	background-color: white; 
	border: 2px #efefef solid; 
	border-radius:200px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
  }
  .img_user_tend{
	display:block;
  	width: 45px;
  	height: 45px;
  	max-width: 50px;
    max-height: 50px;
  	background-color: white; 
	border: 2px #efefef solid; 
	border-radius:100px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
	margin: 5px;
  }
  
  .lb_size{
  	width:50px;
  	background-color: white; 
	border: 2px #66B9E3 solid; 
	border-radius:5px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
	margin-top: 5px;
	text-align: center;
  }
  
  
  
  .tri{
	border-top: 20px solid transparent;
	border-right: 20px solid transparent;
	border-bottom: 20px solid transparent;
	border-left: 20px solid #FF8000;
	margin-left: 24px;
	margin-top: 11px;
  }
  #mask {  
  position:absolute;  
  left:0;
  top:0;
  z-index:9000;  
  background-color:#000;  
  display:none;  
}
 #tgModal{
      display: none;
      position:absolute;  
      width:900px;
      height:800px;
      left:50%;
      top:50%;
      margin-left:-450px;
      margin-top:-100px;
      z-index:10000;
      background-color: white;
      
    }
   .close{
   	position: relative;
    text-align: right;
   }
   .myborder{
	  	background-color: white; 
		border: 2px #efefef solid;
		padding:20px; 
		border-radius:20px;  
		box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
		background-color: rgb(255, 255, 255);
   }
   .myoverlay{
		float:left; 
		height:350px; 
		width:800px;  
		background-color: black; 
		opacity: 0.2;
		border-radius:5px;  
		margin-left: -60px;
		margin-top: -260px;
   }
   
    .infoWindow{
      display: none;
      position:absolute;  
      width:300px;     
      left:50%;
      top:70%;
      margin-left:-100x;
      margin-top:-150px;
      z-index:10003;
      background-color: white;
      text-align:center; 
     
    }
    .infoText{
    	font-size: 1.2em;
    	font-weight: bold;
    }
    
    #createERFORM{
    /*   display: none; */
      position:absolute;  
      width:900px;
      height:800px;
      left:50%;
      top:50%;
      margin-left:-450px;
      margin-top:-100px;
      z-index:10000;
      background-color: white;
      overflow-y:auto;
    }
    
    .storeOverlay{
		margin-top:-280px;
		width:300px;
		background-color: white; 
		border: 2px #7FD2F4 solid;
		border-radius:10px;  
		box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
		background-color: rgb(255, 255, 255);
		
		
   }
   .storeOverlay div{
		padding: 2px;
		margin: 2px;
   }
   .OverlayImg_size{
	  	width: 120px;
	  	height: 120px;
	  	background-color: white; 
		border: 2px #D8D8D8 solid; 
		border-radius:10px;  
		box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
		background-color: rgb(255, 255, 255);
	  }
	 p {white-space: normal ;}
</style>
 
</head>
<body>





<!-- 커스텀모달 -->
<div id="mask"></div>
<div class="container-fluid" id="tgModal" style=' overflow-y:auto; display: none; ' class="lb_size" >
	<div class="container" style="margin-top: 20px;width: 800px;">
		<div class="row"style="margin-bottom:20px;"> 
			<div class="col-md-1 col-md-offset-11" >
				 <span class="close glyphicon glyphicon-remove"></span>
			</div>
		</div>
		 <div class="row"> 
		<!-- 	 <div style="width:800px; height:300px;opacity:0.3;"></div> -->
			<%--  <div class="jumbotron" style="z-index:100; background-color: gray; text-align:center; width:800px; height:350px; background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');filter: brightness(80%);  margin-bottom:20px;">			  
			  <h1 style="z-index:1000; filter: brightness(100%); color: white; font-weight: bold;">같이 먹을 사람들을 찾아보세요!</h1>
			  <p style="filter: brightness(100%); color: white; font-weight: bold;">같이 먹으면 재미가 두 배, 맛도 두 배!</p>
			  <p><a style="filter: brightness(100%); color: white; ont-weight: bold; "class="btn btn-info">모임개설</a></p>
		
			</div> --%>
	<section class="hero-wrap hero-wrap-2"
      style="width: 800px; margin-bottom: 20px; background-image: url('<c:url value='/resources/menu_IMG/together.jpg'/>');"
      >
      <div class="overlay"style="width: 800px;"></div>
      <div class="container" style="width: 800px;">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center" style="margin-left:-100px; width: 800px;">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread" style="width: 800px; margin-bottom: 10px;margin-top: 5px;">같이 먹을 사람들을 찾아보세요!</h1>
               <h3 class="mb-2 bread" style="width: 800px; margin-bottom: 10px;margin-top: 5px;">같이 먹으면 재미가 두 배, 맛도 두 배!</h3>
                <sec:authorize access="isAuthenticated()">
					<p><a id="createER" style=" margin-top:20px; margin-left:200px; color: #5C5C5C; font-weight: bold; "class="btn btn-default btn-lg ">모임개설</a></p>
               </sec:authorize>
            </div>
         </div>
      </div>
   </section>
			
			<div class="col-md-12" id="modal_content">
				
				
			</div>
		</div>	
		
		<div class="row" style="margin-bottom:20px;"> 	
			<div class="col-md-1 col-md-offset-11">
				 <a class="close btn btn-default ">닫기</a>
			</div>
		</div>	
	</div>
</div>


  <!-- 검색결과 테스트창 -->

<section class="hero-wrap hero-wrap-2"
      style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread" style="margin-bottom: 10px;margin-top: 5px;">내 취향에 맞게 음식을 골라보세요!</h1>
             <!--   <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.html">Home <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>Search Gollamukja<i
                     class="ion-ios-arrow-forward"></i></span>
               </p> -->
               <!-- 검색창 -->
                 
               <form id="frm">
               <h2 class="bread">골라먹을 음식점 찾기 </h2>
						<div class="row">			 
						  <div class="col-md-12">
						    <div class="input-group" style="margin-bottom: 10px;margin-top: 10px;">
						      <input id="dong" name ="dong" type="text" class="form-control" placeholder="원하는 동을 검색하세요."  >
						       <input type="text" style="display: none;" />
						      <span class="input-group-btn">
						       
						        <button class="btn btn-default" type="button" id ="searchButton" >검색</button>
						         
						      </span>
						    </div><!-- /input-group -->
						  </div><!-- /.col-lg-6 -->
						</div><!-- /.row -->
						
				 	  </form>	
               
               
            </div>
         </div>
        						 <!-- 검색팝업-->
							      <div id="popupSearch" style="text-align: center;" >  
										<!-- 검색및 페이징 -->
										<div class="row" style='margin-top: 10px;display: inline-block;'>		
											<div class="col-md-12">
												<span id="x_clicker" class="glyphicon glyphicon-remove" style="position: relative; left: 140px;"></span>
											<!-- 검색 결과 출력 위치 -->
												<div id="searchWindow"></div>
											</div>						
										</div>
										<br>
										   <!-- 버튼 페이징 출력 위치 -->
										<div class="row" style="display: inline-block;">	
											<div class="col-md-12" >
												<div id="selecter"> </div>
											</div>
										</div>
									</div>
         
      </div>
      
    
      
   </section>
<div class="container-fluid" >
		<div class="row wrapper">
				
			
				 <div style="display: none;">		
					<form id="frm3" >
						
					</form>
				 	 <form id="frm2" >
					    <div class="col-md-12">
							<input id ="namsualat" name ="namsualat" type="hidden">
							<input id ="namsualng" name ="namsualng" type="hidden">
							<input id ="bukdonglat" name ="bukdonglat" type="hidden">
							<input id ="bukdonglng" name ="bukdonglng" type="hidden">
						  	<div id="addr"></div>
				   			<div id="stores"></div>
				   			
				   			
				   		
							<input id ="H_FS" name ="FS" type="hidden" value="">
							<input id ="H_SF" name ="SF" type="hidden"value="">
							<input id ="H_EG" name ="EG" type="hidden"value="">
							<input id ="H_MK" name ="MK" type="hidden"value="">
							<input id ="H_DP" name ="DP" type="hidden"value="">
							<input id ="H_BD" name ="BD" type="hidden"value="">
							<input id ="H_PK" name ="PK" type="hidden"value="">
				   			
				   			<input id ="H_CW" name ="CW" type="hidden"value="">
							<input id ="H_SB" name ="SB" type="hidden"value="">
							<input id ="H_FL" name ="FL" type="hidden"value="">
							<input id ="H_PE" name ="PE" type="hidden"value="">
							<input id ="H_SF" name ="SF" type="hidden"value="">
							
							<input id ="H_CS" name ="CS" type="hidden"value="CS">
							<input id ="H_JS" name ="JS" type="hidden"value="JS">
							<input id ="H_HS" name ="HS" type="hidden"value="HS">							
							<input id ="H_BS" name ="BS" type="hidden"value="BS">
							<input id ="H_YS" name ="YS" type="hidden" value="YS">
				   			
			   			  </div>
					</form>
			   		
			    </div>
			  
			
			<div class="col-md-12" >
		
				<div id='extendMap' class="row"style="height:900px" >
				
				
					 <div id='mapWrap'class="col-md-12"style="position:absolute; height:900px; margin-top:50px; margin-bottom:30px;">
					 
					 
			
						   <div class="row no-gutters slider-text align-items-center justify-content-center">				     
				            <div class="col-md-9 ftco-animate text-center">
					 
						 <!-- 맵이 뜨는 곳 -->
						<div id="map" style=" position:absolute;  z-index: 1;width:100%;height:800px;; 
						background-color: white; border: 1px #d6d6d6 solid; border-radius:10px; 
						 box-shadow: rgb(191, 191, 191) 5px 5px 20px -6px; background-color: rgb(255, 255, 255);
						 "></div>
						 
						  <!-- 마커 검색버튼 -->
						<div style="position: relative; z-index: 2; margin-top: 20px;" id="allFilter" >							
						
							<!-- 필터 -->
							<div class="row  align-items-center justify-content-center" id='prefer' style="z-index: 2; margin-top:5px; ">
								<div class="col-xs-2"></div>
								<div class="col-xs-7">
									 <div class="row">
								  	  <div class="col-xs-1">
								  	 		   <!-- 중화요리-->
								  	  <img id='CS' src="<c:url value="/resources/tend_IMG/chi_c.JPG"/>" alt="J" class="img-circle img_size">
								  	  		 <div class="lb_size">중식</div>						  	 	
								  	 	</div>
								  	 	
								  	 	<div class="col-xs-1">
								  	 		    <!-- 일식-->
								  	  <img id='JS' src="<c:url value="/resources/tend_IMG/j_c.png"/>" alt="JP" class="img-circle img_size">
								  	  		 <div class="lb_size">일식</div>						  	 	
								  	 	</div>
								  	 	
								  	 	<div class="col-xs-1">
								  	 		    <!-- 양식-->
								  	 		 <img id='HS' src="<c:url value="/resources/tend_IMG/k_c.png"/>" alt="H" class="img-circle img_size">
								  	  		 <div class="lb_size">한식</div>						  	 	
								  	 	</div>
								  	 	
								  	 	<div class="col-xs-1">
								  	 		   <!-- 분식-->
								  		  	<img id='BS' src="<c:url value="/resources/tend_IMG/bs_c.JPG"/>" alt="BS" class="img-circle img_size">
								  	  		 <div class="lb_size">분식</div>						  	 	
								  	 	</div>
								  	 	 <div class="col-xs-1">
								  	 		   <!-- 분식-->
								  		  	<img id='YS' src="<c:url value="/resources/tend_IMG/y_c.jpg"/>" alt="Y" class="img-circle img_size">
								  	  		 <div class="lb_size">양식</div>						  	 	
								  	 	</div>
								  	 <%-- 	<div class="col-xs-1">
								  	 		    <!-- 비건-->
								  		  <img id='VS' src="<c:url value="/resources/tend_IMG/vegan_c.png"/>" alt="V" class="img-circle img_size">
								  	  		 <div class="lb_size">비건식</div>						  	 	
								  	 	</div> --%>
								  	 	
								  	 	<div class="col-xs-1">
								  	 		 <img  id="plus" src="<c:url value="/resources/tend_IMG/tri_ex.jpg"/>" alt="V" class="img-circle img_size max-small">
								  	  		 <div class="lb_size">더보기</div>						  	 	
								  	 	</div>
								  	 	<div class="col-xs-1" >
								  	 		<!-- 현위치 -->
								  	  		<img id='getMarker' src="<c:url value="/resources/tend_IMG/searchbtn.jpg"/>" alt="FL" class="img-circle img_size">
								  	  		 <div class="lb_size">검색</div>						  	 	
								  	 	</div>
								  	<%--  	<div class="col-xs-1" >
								  	 		<!-- 현위치 -->
								  	  		<img id='mode' src="<c:url value="/resources/tend_IMG/mode-gol.jpg"/>" alt="FL" class="img-circle img_size">
								  	  		 <div class="lb_size">모드</div>	
								  	 	</div> --%>
								  	 	
								  	  
								  	 </div>
								</div>
							</div>
							
							<div id='avoid' style=" z-index:3; margin-top:10px; display: none; " class="row align-items-center justify-content-center" >
								
								<div class="col-xs-6 ">
										<div class="row">
									  	 	<div class="col-xs-1"><!-- 물고기 -->
										  	  	<img id='FS' src="<c:url value="/resources/tend_IMG/pesco_b.png"/>" alt="F" class="img-circle img_size" >
										  	  	 <div class="lb_size">생선</div>
									  	  </div>
									  	 	<div class="col-xs-1">
										  	 	<!-- 달걀-->
										  	  	<img id='EG' src="<c:url value="/resources/tend_IMG/ovo_b.png"/>" alt="E" class="img-circle img_size">
										  	  	<div class="lb_size">달걀</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 		 <!-- 우유-->
									  	  		<img id='MK' src="<c:url value="/resources/tend_IMG/dairy_b.png"/>" alt="M" class="img-circle img_size">
									  	  		<div class="lb_size">우유</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 		<!-- 가금류-->
									  	  		<img id='BD' src="<c:url value="/resources/tend_IMG/chicken_b.png"/>" alt="B" class="img-circle img_size" >
									  	  		<div class="lb_size">가금류</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 		<!-- 돼지고기-->
									  	  		<img id='PK' src="<c:url value="/resources/tend_IMG/pig_b.png"/>" alt="P" class="img-circle img_size">
									  	  		<div class="lb_size">돼지</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 	  <!-- 소고기-->
									  	 	 <img id='CW' src="<c:url value="/resources/tend_IMG/cow2_b.png"/>" alt="C" class="img-circle img_size">
									  	 	 <div class="lb_size">소</div>
									  	 	</div>
									  	 	<div class="col-xs-1">						  	 	
										  	   <!-- 땅콩-->
										  	  <img id='PE' src="<c:url value="/resources/tend_IMG/nuts_b.png"/>" alt="PE" class="img-circle img_size">
										  	  <div class="lb_size">땅콩</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
										  	 	 <!-- 각갑류-->
										  	  <img id='SF' src="<c:url value="/resources/tend_IMG/shrimp_b.png"/>" alt="SF" class="img-circle img_size">
										  	  <div class="lb_size">갑각류</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 		 <!-- 치즈-->
									  	  		<img id='DP' src="<c:url value="/resources/tend_IMG/dp_b.JPG"/>" alt="DP" class="img-circle img_size">
									  	  		<div class="lb_size">유제품</div>
									  	 	</div>
									  	 	<div class="col-xs-1">
									  	 		 <!-- 콩-->
									  	 		 <img id='SB' src="<c:url value="/resources/tend_IMG/s_b.png"/>" alt="SB" class="img-circle img_size">
									  	 		 <div class="lb_size">대두</div>
									  	 	</div>
									  	 	<div class="col-xs-1" style="margin-bottom: 10px;">
									  	 		<!-- 밀가루 -->
									  	  		<img id='FL' src="<c:url value="/resources/tend_IMG/gluten_b.png"/>" alt="FL" class="img-circle img_size">
									  	  		 <div class="lb_size">글루텐</div>						  	 	
									  	 	</div>
									  	 	
								  	 	
									  	 	   
										  </div>
								
								</div>	
						  	 </div>
						  	 
						  	
						  	<!--  <div style="position: relative; z-index: 2; margin-top:550px;">		
								<button  type="button" class="btn btn-danger btn-lg" id ="getMarker" style="opacity: 0.8; ">
								
										<span class="glyphicon glyphicon-search"></span>
										<span style="font-size: 0.5em; "><br>현위치 검색</span>
								</button> 	
							</div> -->
						  	 
						</div>
						
					</div>
				</div>
				
						
				 </div>
				 
				 
			</div>
				
				
		</div>
		
	</div>
</div>
   
    
  





  
  <!-- 섬머노트 다이브 -->
<div  id="createERFORM"  class="lb_size"  style="display: none;">
	<div class="container" style="margin-top: 20px;width: 800px;">
		<div class="row"style="margin-bottom:20px;"> 
			<div class="col-md-1 col-md-offset-11" >
				 <span class="closeERFORM glyphicon glyphicon-remove"></span>
			</div>
		</div>
		 <div class="row"> 
			<section class="hero-wrap hero-wrap-2"
		      style="width: 800px; margin-bottom: 20px; background-image: url('<c:url value='/resources/menu_IMG/together.jpg'/>');"
		      >
		      <div class="overlay"style="width: 800px;"></div>
		      <div class="container" style="width: 800px;">
		         <div
		            class="row no-gutters slider-text align-items-center justify-content-center" style="margin-left:-100px; width: 800px;">
		            <div class="col-md-9 ftco-animate text-center">
		               <h1 class="mb-2 bread" style="width: 800px; margin-bottom: 10px;margin-top: 5px;">같이먹자 모임 개설!</h1>
		               <h3 class="mb-2 bread" style="width: 800px; margin-bottom: 10px;margin-top: 5px;">재미있는 모임을 만들어보세요!</h3>
		            </div>
		         </div>
		      </div>
		   </section>
	   </div>
	    <div class="row">
	    	<form method="post" id='frmER'>
	    		<input id ="ER_FS" name ="ER_FS" type="hidden" value="">
				<input id ="ER_SF" name ="ER_SF" type="hidden" value="">
				<input id ="ER_EG" name ="ER_EG" type="hidden" value="">
				<input id ="ER_MK" name ="ER_MK" type="hidden" value="">
				<input id ="ER_DP" name ="ER_DP" type="hidden" value="">
				<input id ="ER_BD" name ="ER_BD" type="hidden" value="">
				<input id ="ER_PK" name ="ER_PK" type="hidden" value="">
	   			<input id ="ER_CW" name ="ER_CW" type="hidden" value="">
				<input id ="ER_SB" name ="ER_SB" type="hidden" value="">
				<input id ="ER_FL" name ="ER_FL" type="hidden" value="">
				<input id ="ER_PE" name ="ER_PE" type="hidden" value="">
				<input id ="ER_SF" name ="ER_SF" type="hidden" value="">
				<input id ="store_id" name ="store_id" type="hidden" value="">
				
		
			  <div class="form-group">
			    <input type="text" id="ERtitle" class="form-control" name="ERtitle" placeholder="모임 제목을 입력하세요">
			  </div>
			  <div class="form-group">
			  <textarea id="summernote" name="ERcontent"></textarea>
			  <script>
				$('#summernote').summernote({
				  placeholder: '모임 소개글을 입력해주세요',
				  tabsize: 2,
				  height: 300
				});
					
				
				</script>  
				
				<!-- 데이트 피커 -->
				
				<script>
					$( function() {
					    $( "#datepicker" ).datepicker({
					      changeMonth: true,
					      changeYear: true,
					      dateFormat: "yy년 mm월 dd일",
					      minDate: new Date(),
					      showOn:"both",
					      //buttonText:"날짜선택",//showOn과 함께 써야한다. 그래야 버튼이 생김
					      buttonImage:"<c:url value='/Images/calendar.png'/>",
					      buttonImageOnly:"true",
					      onSelect:function(dateText){
					    	  console.log('사용자가 선택한 날짜:',dateText);
					    	  $('#display').html(dateText);
					      }
					    });
						//$('.ui-datepicker-trigger').prop('style','width:40px;height:40px;vertival-align:middle;');
						//$('.ui-datepicker-trigger > img').prop('style','width:40px;height:40px;vertival-align:middle;margin-top:-4px;margin-left:-40px;');
						
					    $('.ui-datepicker-trigger').prop('style','width:40px;height:40px;vertical-align:middle;');
					
					});
					</script>
				   	<div class="col-xs-2"></div>
			   	 	<div class="col-xs-3">
					   <h3>최대인원</h3>
					   <input id="ERmax" type="text" class="form-control" type="text" name="ERmax" >
					</div>
				   	<div class="col-xs-3">
						<h3>모임일</h3>
						<input  type="text" class="form-control" type="text" name="ERdate" id="datepicker">
						<span id="display" style="color:red;font-size: 1.5em; "></span>
					</div>
				   	<div class="col-xs-3">
					<h3>모임시간</h3>
						<div style="position: relative; z-index: 3000; ">
							<div id="clickTime"class="input-group clockpicker">
								<input id="ERtime"type="text" class="form-control" name="ERtime" value="23:30" readonly>
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
							</span>
							</div>
						</div>
					</div>
					<div class="col-xs-1"></div>
				</div>
				
				
					<div class="col-xs-12" style="margin: 10px;">
					 <h3>안먹는 음식을 골라주세요</h3>
				  	 	<div class="col-xs-1"><!-- 물고기 -->
					  	  	<img id='T_FS' src="<c:url value="/resources/tend_IMG/pesco_b.png"/>" alt="F" class="img-circle img_size" >
					  	  	 <div class="lb_size">생선</div>
				  	  </div>
				  	 	<div class="col-xs-1">
					  	 	<!-- 달걀-->
					  	  	<img id='T_EG' src="<c:url value="/resources/tend_IMG/ovo_b.png"/>" alt="E" class="img-circle img_size">
					  	  	<div class="lb_size">달걀</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 		 <!-- 우유-->
				  	  		<img id='T_MK' src="<c:url value="/resources/tend_IMG/dairy_b.png"/>" alt="M" class="img-circle img_size">
				  	  		<div class="lb_size">우유</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 		<!-- 가금류-->
				  	  		<img id='T_BD' src="<c:url value="/resources/tend_IMG/chicken_b.png"/>" alt="B" class="img-circle img_size" >
				  	  		<div class="lb_size">가금류</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 		<!-- 돼지고기-->
				  	  		<img id='T_PK' src="<c:url value="/resources/tend_IMG/pig_b.png"/>" alt="P" class="img-circle img_size">
				  	  		<div class="lb_size">돼지</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 	  <!-- 소고기-->
				  	 	 <img id='T_CW' src="<c:url value="/resources/tend_IMG/cow2_b.png"/>" alt="C" class="img-circle img_size">
				  	 	 <div class="lb_size">소</div>
				  	 	</div>
				  	 	<div class="col-xs-1">						  	 	
					  	   <!-- 땅콩-->
					  	  <img id='T_PE' src="<c:url value="/resources/tend_IMG/nuts_b.png"/>" alt="PE" class="img-circle img_size">
					  	  <div class="lb_size">땅콩</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
					  	 	 <!-- 각갑류-->
					  	  <img id='T_SF' src="<c:url value="/resources/tend_IMG/shrimp_b.png"/>" alt="SF" class="img-circle img_size">
					  	  <div class="lb_size">갑각류</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 		 <!-- 치즈-->
				  	  		<img id='T_DP' src="<c:url value="/resources/tend_IMG/dp_b.JPG"/>" alt="DP" class="img-circle img_size">
				  	  		<div class="lb_size">유제품</div>
				  	 	</div>
				  	 	<div class="col-xs-1">
				  	 		 <!-- 콩-->
				  	 		 <img id='T_SB' src="<c:url value="/resources/tend_IMG/s_b.png"/>" alt="SB" class="img-circle img_size">
				  	 		 <div class="lb_size">대두</div>
				  	 	</div>
				  	 	<div class="col-xs-1" style="margin-bottom: 10px;">
				  	 		<!-- 밀가루 -->
				  	  		<img id='T_FL' src="<c:url value="/resources/tend_IMG/gluten_b.png"/>" alt="FL" class="img-circle img_size">
				  	  		 <div class="lb_size">글루텐</div>						  	 	
				  	 	</div>
				  	 </div>	   
				  	  <div class="col-xs-5" >
					 </div>
					  <div class="col-xs-1"  style="margin-top: 20px; margin-bottom: 30px;">
					 	<a id="submitER" class="btn btn-default">제출</a>
					 </div>
					 <div  class="col-xs-1"style="margin-top: 20px;  margin-bottom: 30px;">
						 <a class="closeERFORM btn btn-default ">닫기</a>
					</div>
					 <div class="col-xs-5" >
					 </div>
			</form>	
	    	</div>
	    </div>
	    
		
   </div>


<!-- 섬머노트 -->
 			



<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(37.498825, 126.722265), // 지도의 중심좌표 37.498825, 126.722265 부평시장역
        level: 2 // 지도의 확대 레벨
    }; 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var bounds = map.getBounds();  
console.log("맵생성시 바운즈 초기화");
//인풋타입 히든에 위경도 바운더리 주는 함수
latLngSendInput(bounds);
function latLngSendInput(bounds){
	 //남서 위경도
	  namsua= bounds.getSouthWest();
	  //북동 위경도
	  bukdong = bounds.getNorthEast();
	  //lat 최소
	  $("#namsualat").val(namsua.getLat());
	  //lng 최소
	  $("#namsualng").val(namsua.getLng());
	  //lat 최대
	  $("#bukdonglat").val(bukdong.getLat());
	  //lng 최대
	  $("#bukdonglng").val(bukdong.getLng());
	 var latlng = map.getCenter(); 
}  
var namsua;
var bukdong;
var bnksua;
var namdong;
//드래그시 바운즈 설정
kakao.maps.event.addListener(map, 'dragend', function() {
	  var bounds = map.getBounds();    
	  console.log("드래그 진입:");
	  
	  //인풋타입 히든에 위경도 바운더리 주는 함수
	  latLngSendInput(bounds);
	 
});
//바운더리 변경시  바운즈 설정
kakao.maps.event.addListener(map, 'bounds_changed', function() {
	 var bounds = map.getBounds();     
	//인풋타입 히든에 위경도 바운더리 주는 함수
	  latLngSendInput(bounds);
});
//중앙점 잡아서 이동하는 메소드
function setCenter() {            
    var moveLatLon = new kakao.maps.LatLng(lat, lng);    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}
function panTo(lat,lan) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);   
    var bounds = map.getBounds();   
    var namsua = bounds.getSouthWest();
    var bukdong = bounds.getNorthEast();
	$('#popupSearch').fadeOut();
  
}        
</script>


<script>
var s_name='';
$('#x_clicker').click(function (){
	$('#popupSearch').fadeOut();
	
});
$('.container-fluid').click(function (){
	$('#popupSearch').fadeOut();
	
});
$('.container-fluid').click(function (){
	$('#popupSearch').fadeOut();
	
});
function request_ERList_Ajax(store_id){
	//----------------------생성한 동적 다이브에 에이젝스 송출
    $.ajax({
		url:"<c:url value='/eat_together_list.do'/>",
		data:store_id,
		dataType:'json',
		success:function(data){
			$('#modal_content').empty();
			console.log('같이먹자 방목록 진입');
			console.log(data);
			
			for(var i=0;i<data.length;i++){
				var tend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
			    var user_tend = data[i].er_tend.split(',');	
			    
			   
			    
			    
				$('#showuser'+i).remove();
				 var together_list = 
					 '<div class="row" style="margin-bottom:50px" >'+
				     '	<div class="col-md-4">'+
				     '	<div class="myborder">'+
				     '     <a id="prof'+i+'">'+
				     '		<h4>모임 기피재료</h4>'+
				     '     </a>'+
				     '	</div>'+
				     '   </div>'+
				     '   <div class="myborder col-md-8 ">'+
				     '     <h2>'+data[i].er_title+'</h2>'+
				     '     <hr>'+
				     '     <p>내용 : '+data[i].er_content+'</p>'+
				     '     <h4>인원 : '+data[i].er_max+'명/'+data[i].er_curr+'명</h4>'+
				     '     <h4>모임날 : '+data[i].er_time+'</h4>'+
				     '     <hr>'+
				     '     <a id="btn_show'+i+'" class="btn btn-default" >모임장 정보보기</a>'+
				     '	   <sec:authorize access="isAuthenticated()">'+
				     '   	  <a id="btn_erjoin'+data[i].er_no+'" class="all_erjoin btn btn-default">'+
				     '				참가신청하기'+
				     '			</a>'+
				     '	   </sec:authorize>'+
				     ' </div>';
				     var er_no={"er_no":data[i].er_no};
				     console.log("[er_no]" );
				     console.log(er_no);
				 	
				    
						
				     
				     
				 
				     
				     
			    
			    var tend_img = ''
			    
				var prof=
				     '<div id="showuser'+i+'"class="myborder infoWindow" style=" display:none;">'+
				     ' <img style="margin-bottom:20px; display:inline;" src="/mukja'+data[i].u_img+'" alt="H" class="img_user">'+
				     ' <div class="infoText">닉네임 : '+data[i].u_nick+'</div>'+
				     ' <div class="infoText">나이:'+data[i].u_age+'대</div>'+
				     ' <div class="infoText">성향 </div>'+
				     ' <div id="tend'+i+'"></div>'+
				     ' <div id="masterClose'+i+'" class="btn btn-default">닫기</a>'+
				     '</div>';
			
				$('#modal_content').append(together_list);
				
				 var tendIMG="";
				    for(var ti=0; ti<tend_codes.length;ti++){
				    	for(var ut=0; ut<user_tend.length;ut++){
					    	if(tend_codes[ti]==user_tend[ut]){
					    		console.log(data[i].u_nick+'의 성향이미지:'+user_tend[ut]);
					    		 tendIMG='<img style="margin-bottom:20px; display:inline;" src="/mukja/resources/usertend_IMG/'+user_tend[ut]+'.jpg" alt="tend" class="img_user_tend">';
					    		  $('#prof'+i).append(tendIMG);
					    	}
				    	}
				    	
				    }
				    
				    
				$('body').append(prof);
			
															 
			    console.log('user_tend');
			    console.log(user_tend);
			    tendIMG="";
			    for(var ti=0; ti<tend_codes.length;ti++){
			    	for(var ut=0; ut<user_tend.length;ut++){
				    	if(tend_codes[ti]==user_tend[ut]){
				    		console.log(data[i].u_nick+'의 성향이미지:'+user_tend[ut]);
				    		 tendIMG='<img style="margin-bottom:20px; display:inline;" src="/mukja/resources/usertend_IMG/'+user_tend[ut]+'.jpg" alt="tend" class="img_size">';
				    		  $('#tend'+i).append(tendIMG);
				    	}
			    	}
			    	
			    }
			  
			 //방장정보보기
				var infoWindow = document.querySelectorAll('.infoWindow'); 
				infoWindow.forEach(function(ele,i){
					$('#btn_show'+i).click(function(){
						console.log('방장정정보 돌입');
						$('#showuser'+i).hide();
						$('#showuser'+i).fadeIn();
						
							
					});
					$('#masterClose'+i).click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
							
					});
					
					
					$('#mask').click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
							
					});
					
					$('.close').click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
					  
					});
					
				});
			
				
				$('#btn_master').click(function(){
					var maskHeight = $(document).height();  
			   		 var maskWidth = $(window).width(); 
			   		
			   		 $('#masterMask').fadeTo(500,0.6);    
					  $("#masterModal").show() ;
					  
					  
						$('#mask').click(function(){
							$("#masterModal").fadeOut();
						    $('#masterMask').fadeOut();    
						  
						});
						$('.close').click(function(){
							$("#masterModal").fadeOut();
						    $('#mask').fadeOut();  
						  
						});
					
					  
				    
					
				    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
				    $('#mask').css({'width':maskWidth,'height':maskHeight});  
				});
			}
			
			
		    //모임 참여신청하기
			   var all_erjoin = document.querySelectorAll('.all_erjoin'); 
			    
			 /*   $(document).on("click","#btn_erjoin0",function(){ 
				   console.log("<<<참가 시도 >>>")
				 });
			     */
			     
			     
			   all_erjoin.forEach(function(ele,i){
				   Object.assign(er_no, store_id);
				   console.log("[ele]");
				   console.log(er_no);
					console.log(ele.getAttribute('id'));
					var id="#"+ele.getAttribute('id');
					$(document).on("click",id,function(){ 
					   console.log("<<<참가 시도 >>>")
					   $.ajax({
					 		url:"<c:url value='/requestERjoin.do'/>",
					 		data:er_no,
					 		dataType:'json',
					 		success:function(data){
					 			var joinERC_result = data.joinERC;
					 			var joinER_result = data.joinER;
					 			console.log("joinERC_result:",joinERC_result);
					 			console.log("joinER_result:",joinER_result);
					 		},
					 		error:function(){
					 			console.log("<<<<<방참가 실패>>>>>")
					 		}
					 	});	
					   
				   });  
			   })   
			     //모임 참여신청하기 끝
			     
		},
		error:function(request,status,error){
			console.log('동적 할당 모달에 데이터 오류 코드:%s,에러메시지:%s,error:%s,status:%s',
					request.status,request.responseText,error,status);
		}
	});
		    
     //----------------------생성한 동적 다이브에 에이젝스 송출
	
}
function requets_maker_Ajax(){
	  $.ajax({
			url:"<c:url value='/getMarker.pbs'/>",
			data:$('#frm2').serialize(),
			dataType:'json',
			success: function (data){		
				
		
				 console.log(all_img.length);
				 console.log("겟마켓 안의 겟바운즈");
				 console.log(bounds);
				 
				function closeOverlay(){
					console.log("레이아웃 닫기이벤트메스도 click");
					console.log(coustomLayouts);
					  for (var i = 0; i < coustomLayouts.length; i++) {
				    	coustomLayouts[i].setMap(null)
					  }
					  coustomLayouts=new Array();
				}
				
				closeOverlay();
				/* kakao.maps.event.addListener(map, 'click', function() {
					 closeOverlay();
				});
				 */
				
				
				
				
				//마커상태를 세팅하는 함수	
			  function setMarkers(markers) {
				  for (var i = 0; i < markers.length; i++) {
				        markers[i].setMap(null);
				    }            
				
				}//setMarkers
				
				//coustomLayouts를 세팅하는 함수	선언
				  function setcustomOverlays(coustomLayout,data) {
					console.log("setcustomOverlays의 내부의 data");
					console.log(data);
					console.log("coustomLayout");
					console.log(coustomLayout);								
					
					
						          
					
					}//setcustomOverlays
				
				//음식점 마커 요청시 기존에 마커가 있을경우 전부 삭제				
				setMarkers(markers);
				markers=new Array();
				
				var list_html="";
			
				
				// 마커를 생성하고 지도위에 표시하는 함수입니다
				function addMarker(position) {
					var imageSrc = '<c:url value="/resources/markers/custom_marker.png"/>', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(37, 60), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(19,58)}; 
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				   
				    
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        position: position,
				        image: markerImage 
				    });
				
				    // 마커가 지도 위에 표시되도록 설정합니다
				    marker.setMap(map);
				    markers.push(marker);
				    console.log(marker.getPosition());
				    
				    
					
				
				}//addMarker
				
				function addOverlay(data,marker){
					
					//클릭이벤트 리스너 :마커가 생성되면 마커에 클릭 이벤트 생성
					//배열에 추가된 마커에 이벤트 리스너 부착하기
					console.log("marker의 포지션");
					console.log(marker.getPosition());
					
					kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
						// 커스텀 오버레이에 표시할 컨텐츠 입니다
						// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
						// 별도의 이벤트 메소드를 제공하지 않습니다 
						//오버레이아웃 컨텐츠
					    closeOverlay();
						 var content =  
							'<div id ="div_'+data.store_id+'" class="storeOverlay">' +
							'  <div class="row">'+
							'		<div  class="col-xs-12">'+
							'			<div class="row" style="margin-top:-20px;">'+
							'				<h3>'+data.store_name+'</h3>'+
							'			</div>'+
							'			<hr style="margin: 0; padding: 0;">'+
							'			<div class="row">'+
							'				<p>'+data.store_intro+'</p>'+
							'			</div>'+
							'			<div class="row">'+
							'				<p>'+data.store_phonenumber+'</p>'+
							'			</div>'+
							'			<div class="row">'+
							'				<p>'+data.store_time+'</p>'+
							'			</div>'+
							'			<div class="row">'+
							'		        <a id="btn_'+data.store_id+'" class="btn btn-default">모임리스트</a>'+
							'      			<a id="closeOver" class="btn btn-default">닫기</a>'+
							'			</div>'+
							'		</div>'+
							'	  </div>'+
							'</div>'; 
							 
							 
							 /* '<div id ="div_'+data.store_id+'" class="overlayDiv">' +
							'    <div><a href="<c:url value="Store/StoreDetail.do"/>"></a></div>' +
							'    <div>' +
							'        <div>'+data.store_intro+'</div>' +
							'        <div>'+data.store_phonenumber+'</div>' +
							'        <div>'+data.store_time+'</div>' +
							'        <a id="closeOver" class="btn btn-info">닫기</a>'+
							'        <a id="btn_'+data.store_id+'" class="btn btn-success">모임리스트</a>'+
							'    </div>'; */
							
							
			
						//마커 클릭시
					    // 마커가 추가될 시점에
						//커스텀 오버레이를 생성한다.
						
						// 커스텀 오버레이가 표시될 랫랭 정보받기
						var overlayPosition = new kakao.maps.LatLng(data.store_lat, data.store_lng);  
						console.log(overlayPosition.toString());
						
						// 표시 위치 정보로 커스텀 오버레이를 생성합니다
						var customOverlay = new kakao.maps.CustomOverlay({
						    position: overlayPosition,
						    content: content,
						   
						});
						
						// 커스텀 오버레이를 지도에 표시합니다
				    	customOverlay.setMap(map);		
					    
						//오버레이 디버깅
						/* 
						console.log(customOverlay);
						console.log(customOverlay.getPosition());
						console.log(coustomLayouts); */
						
						//오버레이들을 배열에 넣어줌
						coustomLayouts.push(customOverlay);
						 $("#closeOver").click(function(){
							  console.log("[closeOver 메소드 내부]");
								closeOverlay();
							});	
						 
						 
						//------------커스텀모달--------------------------------------
							$(document).on("click","#btn_"+data.store_id,function(){
								console.log('클릭');
								console.log( $("#tgModal").html());
								 //화면의 높이와 너비를 구한다.
							    var maskHeight = $(document).height();  
							    var maskWidth = $(window).width();  
								
							    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
							    $('#mask').css({'width':maskWidth,'height':maskHeight});  
								
							    
							 var store_id={"store_id":data.store_id};
							 console.log("store_id:");
							 console.log(store_id);
							
							 $('#store_id').val(data.store_id);
							 console.log('store_id'+ $('#store_id').val());
							 $("#submitER").click(function(){
								 console.log('방만들기 재출');
								 //유효성 
								 //0.유효성 조건 변수
								 	//공백
									var trimExp = /\s/g;
								 	//숫자
									var intExp = /^[0-9]*$/;
								 
								 //1.ertitle 체크
								 if($('#ERtitle').val()==""){
									alert("제목을 입력하세요"); 
									$('#ERtitle').focus();
									return;
								 }
								 //2.er섬머노트 cpzm
								 if( $('#summernote').val()==""){
									 console.log("내용길이"+$('.note-editable').val().length);
									 alert("내용을 입력하세요");
									 $('.note-editable').focus();
									 return;
								 }
								 //최대인원 유효성검사
								 if($('#ERmax').val()==""){
										console.log(trimExp);
										console.log(trimExp.test($('#ERtitle').val()));
										 alert("최대인원을 입력하세요");
										 $('#ERmax').focus();
										 return;
								 }
								 if(trimExp.test($('#ERmax').val())){
									 alert("최대인원에 공백을 제거하세요");
									 $('#ERmax').focus();
									 return;
								 } 
								 if(!intExp.test($('#ERmax').val())){
									 alert("최대인원은 숫자만 입력하세요");
									 $('#ERmax').focus();
									 return;
								 } 
								 //최대인원 유효성검사끝
								 
								 
								  //모임일 유효성검사
								 if($('#datepicker').val()==""){
									 alert("모임일을 선택하세요");
									 $('#datepicker').focus();
									 return;
								 }
								 if(trimExp.test($('#datepicker').val())){
									 alert("공백을 제거하세요");
									 $('#datepicker').focus();
									 return;
								 }
								//모임일 유효성검사 끝
								
								//모임시간 유효성검사
								 if($('#ERtime').val()==""){
									 alert("모임시간을 선택하세요");
									 $('#ERtime').focus();
									 return;
								 }
								 if(trimExp.test($('#ERtime').val())){
									 alert("공백을 제거하세요");
									 $('#ERtime').focus();
									 return;
								 } 
								
								//모임시간 유효성검사 끝
											
								//같이먹자 모임 만들기
								 $.ajax({
										url:"<c:url value='/submitER.do'/>",
										data:$('#frmER').serialize(),
										dataType:'json',
										success: function (data){
											console.log("성공");
											console.log("data");
											console.log(data);
											console.log("store_id:"+store_id);
											 console.log('같이먹자 작성하기 닫기')
											 $('.note-editable').empty();
											 $('#ERtitle').val("");
											 $(':text').val("");
											 $('#createERFORM').fadeOut();
											 request_ERList_Ajax(store_id);
									 
										},
										error:function(){
											console.log("애러");
											 $('.note-editable').empty();
											 $('#ERtitle').val("");
											 $(':text').val("");
											$('#createERFORM').fadeOut();
											
											 request_ERList_Ajax(store_id);
										}
							 	});
							 });
							 
							 
							 
								 request_ERList_Ajax(store_id);
							    //애니메이션 효과						
							    $('#mask').fadeTo(500,0.6);    
							    $("#tgModal").show() ;
							    
							    
								
							}); 
							
							$('#mask').click(function(){
								$("#tgModal").fadeOut();
							    $('#mask').fadeOut();    
							  
							});
							$('.close').click(function(){
								$("#tgModal").fadeOut();
							    $('#mask').fadeOut();  
							  
							});
							//------------커스텀모달--------------------------------------
					    
					});//addListener
					
				}//addOverlay
				
				 for(var i in data){
					 /*list_html+=data[i].store_name+" "+data[i].store_intro+" "+data[i].store_lng;
					console.log(list_html) ;  */
						//마커 포지션 객체에 포지션 입력
						console.log(data[i] );
						//마커를 생성하교 맵에 표시하며 동시에 마커배열에 해당마커를 추가함
						addMarker(new kakao.maps.LatLng(data[i].store_lat, data[i].store_lng));
						addOverlay(data[i],markers[i]);
				   }//for
				   console.log('data.length');
					console.log(data.length);
					   console.log('----------[data.]------');
						console.log(data);
				 console.log('markers.length');
					console.log(markers.length);
					 console.log('markers');
						console.log(markers);
						
			
		},
			error:function(request,status,error){
				console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
						request.status,request.responseText,error,status);
			}
			
		});
	 
	
}
function request_Ajax(){
	  var dong=document.getElementById('dong').value;
	  if(!dong){
		 alert('동 검색어를 입력해주세요');
		 return;
	  }
	  console.log("빈문자 리턴확인용");
	  
	  $('#searchWindow').html('');   
	
	  $.ajax({
			url:"<c:url value='/Search/Place.do'/>",
			data:$('#frm').serialize(),
			dataType:'json',
			success: function (data){
				
				$('#selecter').html('');;
				console.log('data length:'+data.length );
				var list_html="";
				var list_length = data.length;
				var paging_count=4;
				var total_page = parseInt(data.length/paging_count)+1;
				var data_array=new Array();
				var inner_array=new Array();
				var page_button='';
				//페이지번호
				var page_no=0;
				//블락 관련
				var block_no=0;
				var button_count_max=4;
		
				 for(var i in data){		
					//json배열에서 각 방의  데이터를 시 군구 동으로 파싱하여 다이브에 삽입
					   	list_html+=data[i].sido+" "+data[i].si_goon_go+" "+data[i].dong;
					   	//삽입
					   	var insert_div=
					   		'<div id='+i
					   		+' class="shadow p-4 mb-4 bg-white" style="float:left; clear:both; height:65px; display:none; background-color: white; border: 1px #d6d6d6 solid; border-radius:5px;  box-shadow: rgb(191, 191, 191) 2px 5px 8px -6px; background-color: rgb(255, 255, 255);padding-right:20px; padding-left: 20px;margin-bottom:10px; "'
					   		+'onclick="fnToaddr('+i+','+data[i].lat+','+data[i].lng+');panTo('+data[i].lat+','+data[i].lng+')"'
					   		+'><h5 style="color:#6E6E6E;">'+list_html+'</h5></div>'
					   		$('#searchWindow').append(insert_div);
					  // $('#searchWindow').append("<div id='div"+i+"' style='background-color: gray; display:none;' onclick='fnToaddr("+i+","+data[i].lat+","+data[i].lng+");panTo("+data[i].lat+","+data[i].lng+")'>"+list_html+"</div>");
						inner_array.push(insert_div);
						if(inner_array.length==paging_count){
							data_array.push(inner_array);
							inner_array= new Array();
							
						}else if(i==data.length-1){
							data_array.push(inner_array);
						}
					  
					 /*  for(var i=0;i<$('#searchWindow div').length;i++){
						  $('#searchWindow div').eq(i).fadeIn();
						  
					  } */
					   list_html='';
					  
					  
					   
				   }//datafor
				  
				
			
					
				   
				   
				   
				 page_button+='</br><div id="pagegroup" class="btn-group" role="group">'+
				 '<button id="prev" type="button" class="btn btn-default">이전</button>';
				 
				  for(var pageloop=0;pageloop<data_array.length;pageloop++){						  
					  page_button+='  <button id="page_button_no'+pageloop+'" type="button" class="btn btn-default" style="display:none">'+parseInt(pageloop+1)+'</button>';
				  }
				  
				  page_button+= '<button id="next" type="button" class="btn btn-default">다음</button>'+'</div>';
				  
				
				  
				$('#selecter').append(page_button);
				$('#page_button_no0').attr( 'class','btn btn-danger' );
				
				function show_page_btn(){	
				
					var start= block_no;
					var end = block_no+button_count_max;
					console.log('[show_page_btn]');
					console.log('start,end:'+start+'/'+end);
					  for(var viewloop=start;viewloop<end;viewloop++){
							  console.log("viewloop:"+viewloop);
							  console.log($('#page_button_no'+viewloop).html());
							  $('#page_button_no'+viewloop).show();
					  }
					  
				}
				show_page_btn();
				
				console.log('data_array:');
				console.log(data_array);
				/* console.log('inner_array:');
				console.log(inner_array);
				 */
				
				var liList = document.querySelectorAll("#pagegroup button");
				/* console.log('liList:');
				console.log(liList); */
				liList.forEach(function(li, index){ 
					/* console.log("$('#pagegroup button')");
					console.log($('#pagegroup button')); */
					/* console.log('index');
					console.log(index);
					console.log("$('.pagegroup button').length");
					console.log($('.pagegroup button').length); */
					function button_color_init() {
						for(var bc=0; bc<total_page;bc++){
							$('#page_button_no'+bc).attr( 'class','btn btn-defualt' );
						}
						
					}
					
					$('#pagegroup button').eq(index).click(function(){
						console.log('[prev]');
						console.log("block_no"+block_no);			
							if($('#pagegroup button').eq(index).attr('id')=='prev'){
							
								if(block_no-1<0){
									alert('이전으로 갈 수 없습니다.');
									return;
								}
							
								$('#searchWindow').html('');
								//이전 누를시 이전 페이지 블럭의 end값 배열 출력
								
								var end=block_no-1;
								
								//버튼색 초기화
								button_color_init();
								
								for(var j=0;j< data_array[end].length;j++){	
									 console.log("data_array["+end+"][j]");
									 console.log(data_array[end][j]);
									 $('#searchWindow').append(data_array[end][j]);	
									var add =  parseInt($('#searchWindow div').eq(0).attr('id'))+j;
								
									console.log(' 증가번호 출력 : '+add);
									console.log("$('#"+parseInt(j+add)+"')");
									console.log($('#'+parseInt(j+add)));
									$('#'+add).fadeIn();
								 }//출력포문
								
							
								 console.log("[버튼색변경 	$('#page_button_no'+end) ] ");
								 console.log($('#page_button_no'+end));
								//버튼색 변경
								$('#page_button_no'+end).attr( 'class','btn btn-danger' );
								 
							}else if($('#pagegroup button').eq(index).attr('id')=='next'){
								console.log('[next]');
								console.log('block_no:'+block_no);
								console.log('button_count_max:'+button_count_max);
								console.log('total_page:'+total_page);
								
								if(block_no+button_count_max>=total_page){
									alert('다음에 표시할 내용없습니다');
									return;
								}
							
							
								$('#searchWindow').html('');
								
								
								
								
								//다음 누를시 다음 페이지 블럭의 star값 배열 출력									
								var start = block_no+button_count_max;
								
								//버튼 누를 시 색칠 초기화
								button_color_init();
								
								for(var j=0;j< data_array[start].length;j++){	
									 console.log("data_array["+start+"][j]");
									 console.log(data_array[start][j]);
									 $('#searchWindow').append(data_array[start][j]);	
									var add =  parseInt($('#searchWindow div').eq(0).attr('id'))+j;
								
									console.log(' 증가번호 출력 : '+add);
									console.log("$('#"+parseInt(j+add)+"')");
									console.log($('#'+parseInt(j+add)));
									$('#'+add).fadeIn();
								 }//출력포문
								 
								 //버튼색 변경
								 console.log("[버튼색변경 	$('#page_button_no'+end) ] ");
								 console.log($('#page_button_no'+start));
								 
								//버튼색 변경
								$('#page_button_no'+start).attr( 'class','btn btn-danger' );
								
							}else{
								//버튼색 초기화
								button_color_init();
								var bci=index-1;
								//버튼색 변경
								$('#page_button_no'+bci).attr( 'class','btn btn-danger' );
								
							$('#searchWindow').html('');
								
							console.log('index-1:'+index-1);
							console.log('page_no:'+page_no);
							// 중간 페이징 숫자들
							if(index-1!=page_no) page_no=index-1;
							console.log(data_array);
							
					   		  console.log('addr_init in page_no:');
					   		  console.log(page_no)								
							  
							  console.log('[data_array[page_no].length]')
							  console.log(data_array[page_no].length);
					   		  
							  console.log('[data_array[page_no]]')
							  console.log(data_array[page_no]);
							  
							  for(var j=0;j< data_array[page_no].length;j++){	
									 console.log("data_array[page_no][j]");
									 console.log(data_array[page_no][j]);
									 $('#searchWindow').append(data_array[page_no][j]);	
									var add =  parseInt($('#searchWindow div').eq(0).attr('id'))+j;
								
									console.log(' 증가번호 출력 : '+add);
									console.log("$('#"+parseInt(j+add)+"')");
									console.log($('#'+parseInt(j+add)));
									$('#'+add).fadeIn();
								 }//출력포문
							
								
							}
					});//번호클릭				
				});//번호 모음
				 for(var j in  data_array[page_no]){						
					 //console.log(data_array[page_no][j]);
					 $('#searchWindow').append(data_array[page_no][j]);
					 $('#'+j).fadeIn();
				 }//출력포문 
				//페이지번호 함수
				
				
				
			//다음누를경우 버튼 페이징
			$('#next').click(function(){
				console.log("[next]");
				console.log("block_no : "+block_no);
				console.log("total_page:"+total_page);
				if(block_no+button_count_max>=total_page){						
					console.log("total_page:"+total_page);
					console.log("[리턴 조건진입]");
					return;
				}
				console.log("block_no : "+block_no);
				block_no=block_no+button_count_max;
				
				show_page_btn();
				
				for(var out=block_no-1; out>=0;out--){	
					console.log("out"+out);
					  $('#page_button_no'+out).hide();
				}					
			});
		
			$('#prev').click(function(){
				if(block_no<=0){
					return;
				}
				console.log("[prev]");
				console.log("block_nout:"+block_no);
				for(var out=block_no; out<=block_no+button_count_max;out++){	
					console.log("out"+out);
					console.log("  $('#page_button_no"+out+"')");
					console.log($('#page_button_no'+out));
					  $('#page_button_no'+out).hide();
				}	
				
				console.log("block_nout:"+block_no);
				block_no=block_no-button_count_max;	
				console.log("block_nout:"+block_no);
				
				show_page_btn();
				
			});
	 
				
		},
			error:function(request,status,error){
				 console.log('검색결과없는경우')
				 $('#selecter').html('');
				var insert_div=
				  		'<div id="error" class="shadow p-4 mb-4 bg-white" style="color:#FA5882;float:left; clear:both; height:60px; display:none; background-color: white; border: 1px #d6d6d6 solid; border-radius:5px;  box-shadow: rgb(191, 191, 191) 2px 5px 8px -6px; background-color: rgb(255, 255, 255);padding-right:20px; padding-left: 20px;margin-bottom:10px; "'
				  		+'><h5>검색결과가 없습니다</h5></div>';
				 $('#searchWindow').append(insert_div);
				 $('#error').fadeIn();
				
			}
			
		}); 
	  }
  var lat,lng;
	
  $('#dong').keydown(function(e){
	 
	   if(e.key=='Enter'){
		  console.log('엔터');
		  request_Ajax();
		  $('#dong').val('');
		  $('#popupSearch').fadeIn();
	  }
	 
  });
  
  function fnToaddr(index,fnlat,fnlng){	
	  console.log("lat"+fnlat);
	  console.log("lng"+fnlng);
	  console.log("index"+index);
	  lat = fnlat;
	  lng = fnlng;
  }  
  
  var all_img = document.querySelectorAll(".img_size");	
  
	  $('.wrapper').hide();
	  $('.wrapper').fadeIn();
		//마커들이 들어가는 배열
		var markers = new Array();
	  	
	  	//레이아웃들이 들어가는 배열
	 	var coustomLayouts = new Array();
	
	  	//동검색
		$("#searchButton").click(function(){
			$('#popupSearch').fadeIn();
			request_Ajax();	
		});
	  
		
	  	//마커 받기
		$("#getMarker").click(function(){
			requets_maker_Ajax();
		});
	  	
	 
  
  
  //성향 클릭
  	var tend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB','CS','JS','HS','BS','VS','YS'];
	tend_codes.forEach(function(ele,index){
		$('#'+ele).click(function(){
			console.log("default value : "+$('#H_'+ele).attr('value'));
			if($('#'+ele).attr('src').includes('_b')){
				//이미지토글
				console.log('토글 to after');
				$('#'+ele).attr('src',$('#'+ele).attr('src').toString().replace("_b","_c"));
				
				//히든타입에 값넣기
				$('#H_'+ele).attr('value',ele);
				console.log("value : "+$('#H_'+ele).attr('value'));
			 	//모든 필터에 마커 받기
				 requets_maker_Ajax();
			}else{
				//이미지토글
				console.log('토글 to befor');
				$('#'+ele).attr('src',$('#'+ele).attr('src').toString().replace("_c","_b"));
				
				//히든타입에 값 빼기
				$('#H_'+ele).attr('value',"");
				console.log("value : "+$('#H_'+ele).attr('value'));
			 	//모든 필터에 마커 받기
				 requets_maker_Ajax();
			}
		});
		
	});				   
	var my_anime=0;
	$('#plus').click(function(){
		console.log('삼각형 클릭하기');
		var plus = document.querySelector("#plus");
		if(my_anime==0){
			anime({
				   targets: plus,
				   rotate: 90,
				});
			my_anime=1;
			console.log("[my_anime]"+my_anime)
		}else{
	
			anime({
				   targets: plus,
				   rotate: 0,
				});
			my_anime=0;
			console.log("[my_anime]"+my_anime)
		}
		
		$('#avoid').slideToggle();
	});
	
	$('#mode').click(function(){
		if($(this).attr('src').includes('gol')){
			$(this).attr('src',$(this).attr('src').toString().replace("gol","tg"));
		}else{
			$(this).attr('src',$(this).attr('src').toString().replace("tg","gol"));
		}
	});
	
	
	
		
	
	 var ertend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
	 ertend_codes.forEach(function(ele,index){
			$('#T_'+ele).click(function(){
				console.log($('#ER_'+ele).attr('value'));
				console.log("default value : "+$('#ER_'+ele).attr('value'));
				if($('#T_'+ele).attr('src').includes('_b')){
					//이미지토글
					console.log('토글 to after');
					$('#T_'+ele).attr('src',$('#'+ele).attr('src').toString().replace("_b","_c"));
					
					//히든타입에 값넣기
					$('#ER_'+ele).attr('value',ele);
					console.log("value : "+$('#ER_'+ele).attr('value'));
				 	//모든 필터에 마커 받기
					
				}else{
					//이미지토글
					console.log('토글 to befor');
					$('#T_'+ele).attr('src',$('#'+ele).attr('src').toString().replace("_c","_b"));
					
					//히든타입에 값 빼기
					$('#ER_'+ele).attr('value',"");
					console.log("value : "+$('#ER_'+ele).attr('value'));
				 	//모든 필터에 마커 받기
				
				}
			});
	  });
	 $(".closeERFORM").click(function(){
		 console.log('같이먹자 작성하기 닫기')
		 $('#createERFORM').fadeOut();
		 $('.note-editable').empty();
		 $('#ERtitle').val("");
		 $('#createERFORM input').val("");
		/*  $('#ERmax').val("");
		 $('#datepicker').val("");
		 $('#ERtime').val(""); */
	 });
	  
	 $('#createER').click(function(){
			console.log("작성하기돌입");
			$('#createERFORM').fadeIn();
			
	});
	 
	 
  </script>
  
 <script type="text/javascript" src="<c:url value="/resources/Time-Pic/assets/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/Time-Pic/assets/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/Time-Pic/dist/bootstrap-clockpicker.min.js"/>"></script>
<script type="text/javascript">
$('.clockpicker').clockpicker()
.find('input').change(function(){
	console.log(this.value);
});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'left',
	autoclose: true,
	'default': 'now'
});
// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
}
$(".input-group-addon").click(function(){
	console.log("시계버튼클릭")
	$('#timepic').css('z-index','999999');
	$('#timepic').css('position','absolute');
	$('#timepic').css('background-color','#FAFAFA');
	
});
$("#ERtime").click(function(){
	console.log("시계버튼클릭")
	$('#timepic').css('z-index','999999');
	$('#timepic').css('position','absolute');
	$('#timepic').css('background-color','#FAFAFA');
	
});
</script>