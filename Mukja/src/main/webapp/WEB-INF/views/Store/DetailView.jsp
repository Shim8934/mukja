<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 
<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 ftco-animate"> -->

<!-- INFROMATION -->
<section class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt">

	<div class="container" style="width: 1400px;">
		<div class="row no-gutters" style="margin-top: -50px;">
		<!-- left-side picture -->
			<!-- 카라셀 -->
			<div id="carousel-example-generic" class="carousel slide casize"
				data-ride="carousel" style="margin-top: 100px;">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<c:forEach items="${imglist}" var="imgDTO" varStatus="status">
						<li data-target="#carousel-example-generic"
							data-slide-to="${status.index}" class="active"></li>
					</c:forEach>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner casize" role="listbox">


					<c:forEach items="${imglist}" var="imgDTO" varStatus="status">
						<c:if test="${status.index==0}" var="result">
							<div class="item">
								<img src="<c:url value='${imgDTO.sf_path}'/>" alt="..."
									style="width: 400px; height: 700px;">
							</div>
						</c:if>
						<c:if test="${!result}">
							<div class="item active">
								<img src="<c:url value='${imgDTO.sf_path}'/>" alt="..."
									style="width: 400px; height: 700px;">
							</div>
						</c:if>

					</c:forEach>

				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<!-- 카라셀 엔드-->





			<div class="col-sm-7 wrap-about py-5 ftco-animate">
				<div class="heading-section mt-5 mb-4">
					<div class="pl-lg-5 ml-md-5">
						<span class="subheading">About</span>
						<h2 class="mb-4" style="font-size: 3.0em; display: inline">${list[0].store_name}
							
						</h2>
					</div>
				</div>
				<div class="pl-lg-5 ml-md-5" style="margin-top: 15px;">
					<!-- 가게 정보 -->
					<div>
						<!-- 가게 정보 -->
						<div class=" col-md-12" style="font-size: 1.2em;">
							<div class="img"
								style="background-image: url(<c:url value="/resources/bootstrap/images/subway/subway_logo.jpg"/>); width: 100px;"></div>
							<div style="margin-bottom: 30px">
								<div
									style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: -20px;">음식점
									정보</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="row">
									<div class="col-xs-3" style="text-align: right;">주소 : </div>
									<div class="col-xs-9" style="margin-left: -20xp;">${list[0].store_addr}</div>
									<div class="col-xs-3" style="text-align: right;">상세 주소 :</div>
									<div class="col-xs-9" style="margin-left: -20xp;">${list[0].store_addr1}</div>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="row">
									<div class="col-xs-3" style="text-align: right;">영업번호 :</div>
									<div class="col-xs-9" style="margin-left: -100xp;">
										${list[0].store_phnum}</div>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="row">
									<div class="col-xs-3" style="text-align: right;">이메일 :</div>
									<div class="col-xs-9" style="margin-left: -100xp;">
										${list[0].store_email}</div>
								</div>
							</div>
							<hr>

							<div style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
									가게영업시간
								</div>
								<div style="margin-left: 15px; margin-bottom: 5px">${list[0].store_time}</div>
							</div>
							<hr>
							<div style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
									음식점소개
								</div>
								<div style="margin-left: 15px; margin-bottom: 5px">${list[0].store_intro}</div>
							</div>
							<hr>
							<div style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
									평점을 주세요
								</div>
								<div style="font-size:2.3em; margin-left: 15px; margin-bottom: 5px">
									<p id="star_grade">
									    <a class="onStar">★</a>
									    <a class="onStar">★</a>
									    <a class="onStar">★</a>
									    <a>★</a>
									    <a>★</a>
									</p>
								      

								</div>
								<sec:authorize access="isAuthenticated()">
									<sec:authentication var="user" property="principal.username"/>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<c:set var="user" value="anonymousUser" />
								</sec:authorize>

								
								
								 <script>
								  jQuery( document ).ready(function( $ ) {
									 
									var user_id='${user}';
								    $('#star_grade a').click(function(){
								    	if(user_id=='anonymousUser'){
								    		alert('로그인 후 이용하세요');
								   			 return;
								   		 }//로그인여부if
								        $(this).parent().children("a").removeClass("onStar");  /* 별점의 on 클래스 전부 제거 */ 
								        $(this).addClass("onStar").prevAll("a").addClass("onStar"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
								        
								        var allStarts=document.querySelectorAll(".onStar");
								        var starCount = allStarts.length;
								    
								        var store_id='${list[0].username}';
								        console.log("클릭한 별 의 수: "+starCount);
								       	var updateData={'starCount':starCount,'store_id':store_id,'user_id':user_id}; 
								        
								        
								        if(user_id!='anonymousUser'){
									         $.ajax({
												data:updateData ,
												url:"<c:url value='/updateStoreAvg.do'/>",
												dataType:'json',
												success:function(data){
													console.log(data);
													
												},
												error:function(){
													
												}
											}); //ajax
								   		 }
									 });//별클릭
								  } );//제이쿼리
								  </script>
								
							</div>
							<div class="col-md-4" style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px; l">
									추천하기 
								</div>
								<div class="col-md-offset-1 col-md-2">
									<c:if test="${is_Thumb==0}" >
										<span id="thumbs-up" style="font-size: 2em" class="glyphicon glyphicon-thumbs-up thumbNomal"></span>
									</c:if>
									<c:if test="${is_Thumb==1}" >
										<span id="thumbs-up" style="font-size: 2em" class="glyphicon glyphicon-thumbs-up thumbClick"></span>
									</c:if>
								</div>
								
							</div>
							<script >
							    var user_id='${user}';
								$('#thumbs-up').click(function(){
									if(user_id=='anonymousUser'){
							   			 alert('로그인 후 이용하세요');
							   			 return;
							   		}
									if($(this).attr('class')=='glyphicon glyphicon-thumbs-up thumbNomal'){
										$(this).attr('class','glyphicon glyphicon-thumbs-up thumbClick');
										console.log("엄지클래스");
										console.log($(this).attr('class'));
									}else{
										console.log("엄지클래스");
										console.log($(this).attr('class'));
										$(this).attr('class','glyphicon glyphicon-thumbs-up thumbNomal');
									}
									
								 	var store_id='${list[0].username}';
									var thumbData={'store_id':store_id,'user_id':user_id};
								    if(user_id!='anonymousUser'){
								         $.ajax({
											data:thumbData ,
											url:"<c:url value='/updateStoreRecommand.do'/>",
											dataType:'json',
											success:function(data){
												console.log(data);
											},
											error:function(){
											}
										}); //ajax
							   		 }
								});//좋아요클릭
							</script>
							<div  class="col-md-4" style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
									찜하기 
								</div>
								<div class="col-md-2">
									<c:if test="${is_JJim==0}" >
										<span id="is_JJim" style="font-size: 2em" class="glyphicon glyphicon-heart thumbNomal"></span>
									</c:if>
									<c:if test="${is_JJim==1}" >
										<span id="is_JJim" style="font-size: 2em" class="glyphicon glyphicon-heart thumbClick"></span>
									</c:if>
								</div>
								
							</div>
							<script >
							    var user_id='${user}';
								$('#is_JJim').click(function(){
									if(user_id=='anonymousUser'){
							   			 alert('로그인 후 이용하세요');
							   			 return;
							   		}
									if($(this).attr('class')=='glyphicon glyphicon-heart thumbNomal'){
										$(this).attr('class','glyphicon glyphicon-heart thumbClick');
										console.log("찜찜");
										console.log($(this).attr('class'));
									}else{
										console.log("찜찜");
										console.log($(this).attr('class'));
										$(this).attr('class','glyphicon glyphicon-heart thumbNomal');
									}
									
								 	var store_id='${list[0].username}';
									var thumbData={'store_id':store_id,'user_id':user_id};
								    if(user_id!='anonymousUser'){
								         $.ajax({
											data:thumbData ,
											url:"<c:url value='/updateStoreJjim.do'/>",
											dataType:'json',
											success:function(data){
												console.log(data);
											},
											error:function(){
											}
										}); //ajax
							   		 }
								});//좋아요클릭
							</script>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- COUNTING -->
<section class="ftco-section ftco-counter img" id="section-counter"
	style="margin-top:30px; background-image: url(<c:url value="/resources/bootstrap/images/bg_4.jpg"/>);"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row d-md-flex align-items-center justify-content-center">
			<div class="col-lg-10">
				<div class="row d-md-flex align-items-center">
					<div
						class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${store_Thumb}"> </strong>
								<span>가게 추천 수</span>
							</div>
						</div>
					</div>	
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${store_Jjim}"> </strong> 
								<span>가게  ♥ 수</span>
							</div>
						</div>
					</div> 
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${reviewCount}"> </strong> 
								<span>리뷰수</span>
							</div>
						</div>
					</div>
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${store_avg }"> </strong> 
								<span>평점</span>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>



<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Gollamukja</span>
				<h1 class="mb-4" style="font-weight: bold; color: #404040;">${list[0].store_name}
					Menu</h1>
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<div class="col-md-12  menu-wrap" style="display: inline-block;">
				<div class="heading-menu text-center ftco-animate">
					<h2 style="font-weight: bold; color: #404040; margin-bottom: 30px;">메인메뉴</h2>
				</div>
				<div class="row">
					<c:forEach items="${foodMenuList}" var="foodMenuDto">

						<!-- 메뉴반복-->

						<div class="col-xs-6 menus d-flex ftco-animate">

							<!-- 메뉴이미지 카라셀 컨테이너 -->
							<div style="display: inline-block;">
								<!-- 카라셀 -->
								<div id="carousel-example-generic"
									class="carousel slide menucasize" data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<c:forEach items="${allFoodImgList}" var="foodimglist">
											<c:forEach items="${foodimglist}" var="foodimgDTO"
												varStatus="status">
												<c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
													<c:if test="${status.index==0}" var="result">
														<li data-target="#carousel-example-generic"
															data-slide-to="${status.index}" class="active"></li>
													</c:if>
													<c:if test="${!result}">
														<li data-target="#carousel-example-generic"
															data-slide-to="${status.index}"></li>
													</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
									</ol>

									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<c:forEach items="${allFoodImgList}" var="foodimglist">
											<c:forEach items="${foodimglist}" var="foodimgDTO" varStatus="status">
												<c:if test="${status.index==0}">
													<c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
														<div class="item active">
															<img src="<c:url value='${foodimgDTO.fm_path}'/>"
																style="width: 300px; height: 250px;">
														</div>
													</c:if>
												</c:if>
												<c:if test="${status.index!=0}">
													<c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
														<div class="item">
															<img src="<c:url value='${foodimgDTO.fm_path}'/>"
																style="width: 300px; height: 250px;">
														</div>
													</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
									</div>

									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
								<!-- 카라셀 엔드-->
							</div>
							<!-- 메뉴이미지카라셀 컨테이너엔드 -->
							<div class="text">
								<div style="text-align: center;">
									<div style="display: inline-block;">
										<h2 style="font-weight: bold; color: #404040;">${foodMenuDto.menu_name}</h2>
									</div>
								</div>
								<div style="text-align: center;">
									<div>재료 : ${foodMenuDto.menu_tend}</div>
									<div class="price">설명 : ${foodMenuDto.menu_info}</div>
									<div style="display: inline-block;" class="one-forth">
										<span class="price">${foodMenuDto.menu_price}원</span>
									</div>
								</div>

							</div>
						</div>

						<!-- 메뉴반복끝 -->
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>




<!----------------------------------------------------------------------- REVIEW ----------------------------------------------------------------------->



<!-- REVIEW -->
<section class="ftco-section testimony-section ">
	<div class="container">
		<!-- REVIEW TITLE -->
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-10 text-center heading-section heading-section-white ftco-animate" style="display: block;">
				<span class="subheading">Review</span>
				<h2 class="mb-4">베스트 메뉴 후기</h2>
			</div>			
		</div>

		<!-- BEST REVIEW -->
		<div class="owl-carousel ftco-animate justify-content-center">
			<c:if test="${empty bestRv}">
				<div class="item col-md-12">	
					<span>베스트 리뷰가 없습니다.</span>
				</div>
			</c:if>
			<c:if test="${not empty bestRv}">
				<c:forEach items="${bestRv}" var="BestRV" end="3">						
					<div class="row col-md-11" style="background-color:white; margin:0px; padding: 20px;" >
						<div class="img" style="width:auto; " >
							<c:forEach items="${strvimgs}" var="rvImg" varStatus="loop">
								<c:if test="${BestRV.rv_no == rvImg.rv_no}">
									<c:if test=" ${empty rvImg.rf_path}">
										<div style="height: 100px; background-color:  black">
										                                                     
										</div>
									</c:if>
									<c:if test="${not empty rvImg.rf_path}">
										<img src='<c:url value="${rvImg.rf_path}"/>' style="border-radius: 50%"> 
											<span class="quote d-flex align-items-center justify-content-center" 
											>
										<i class="glyphicon glyphicon-heart-empty" style="font-size: 20px;"></i>
								</span>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<div class="text overflow">
							<c:forEach items="${usersnks}" var="usernk" varStatus="loop">
								<c:if test="${BestRV.user_email == usernk.username}">									
									<p class="name" style="text-align: center; font-weight: bold;">${usernk.u_nick}</p>
									<span class="food-type">
										<c:forEach items="${foodMenuList}" var="MenuDto" varStatus="loop">
											<c:if test="${BestRV.menu_no == MenuDto.menu_no}">
											${MenuDto.menu_name}  
											</c:if>
										</c:forEach>
									/  ${BestRV.rv_postdate}</span>
									<p class="mb-4">${BestRV.rv_content}</p>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</c:if>						
		</div>	
		<script>
		$(document).ready(
			function() {
				$('.owl-carousel').owlCarousel(
					{
					items : 3,
					loop : true
				});
		});
	</script>		
	</div>
	
	<div class="container">
		<h3 class="mb-5 h4 font-weight-bold p-4" style="text-align: center; font-family: 'Gugi', sans-serif;">모든 리뷰 보기</h3>
		<div class="btn py-3 px-4 btn-black" id="myBtn" style="float:right" data-target="#layerpop" data-toggle="modal"> 후기 남기기 </div>
	
		<div class="comment-form-wrap pt-5">
			<ul style="list-style: none;">
				<c:if test="${empty strvcnts}">
					<li class="comment">
						<div class="comment-body col-md-12 justify-content-center" style="margin-top:10px; padding:20px 0 30px 0;border: 1px solid #d7d7d7; margin-bottom: 40px;" >
						
							<div class="comment-body col-md-offset-5 justify-content-center" style="margin-top:10px; padding:20px 0 20px 0;">
								<span style="text-align: center;">작성된 리뷰가 없습니다.</span>
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${not empty strvcnts}">
					<c:forEach items="${strvcnts}" var="strvcnt" varStatus="loop">		
						<li class="comment">
							<div class="comment-body col-md-12 justify-content-center" style="margin-top:10px; padding:20px 0 30px 0;border-bottom: 1px solid #d7d7d7; ">
								<div class="col-md-12">
									<div class="col-md-2" style="display: top; text-align: center; align-content: center;" >
										<c:forEach items="${usersnks}" var="usersnks" varStatus="loop">
											<c:if test="${strvcnt.user_email == usersnks.username}">	
												<h3 style="margin-top:10px;" class="overflow">${usersnks.u_nick}</h3>		
												<c:if test="${empty usersnks.u_img}">
													<img src='<c:url value="/resources/user_IMG/default.gif"/>' style="height:80px;width:80px; border-radius: 50%" alt="Profile Default Image">
												</c:if>		
												<c:if test="${not empty usersnks.u_img}">						
													<img src='<c:url value="${usersnks.u_img}"/>' style="height:80px;width:80px; border-radius: 50%" alt="Profile Image">										
												</c:if>
											</c:if>
										</c:forEach>
									</div>
									<div class="col-md-9">
										<c:forEach items="${foodMenuList}" var="menuList" varStatus="loop">
											<c:if test="${menuList.menu_no == strvcnt.menu_no }">
												<div style="color:gray; font-weight: bold; padding-bottom: 10px;">${menuList.menu_name}  /  ${strvcnt.rv_postdate}</div>
											</c:if>
										</c:forEach>
										<p style="color: black;">${strvcnt.rv_content}</p>								
										<c:forEach items="${strvimgs}" var="strvimg" varStatus="loop">
											<c:if test="${strvcnt.rv_no == strvimg.rv_no}" var="norvimg">											
												<c:if test="${empty norvimg}">
													<span>리뷰 이미지가 없어요</span>
												</c:if>
												<c:if test="${not empty norvimg}">
													<div class="vcard bio">												
	                           							<c:forTokens  var="rf_path" items="${strvimg.rf_path}" delims=",">
															<img src='<c:url value="${rf_path}"/>' style="height:180px; width:180px;" alt="Image placeholder">
														</c:forTokens>
													</div>								
												</c:if>
			                           		</c:if>
										</c:forEach>
									</div>
									<!-- 리뷰 좋아요 -->
									<div class="col-md-1" style="text-align: center;">
										<div>
											<c:if test="${IDmeme != strvcnt.user_email}">
												<p style="color: black;">좋아요</p>
												<div>
													<c:if test="${is_rvlike==0}" >
														<span id="is_rvlike" class="glyphicon glyphicon-heart thumbNomal"></span>
													</c:if>
													<c:if test="${is_rvlike==1}" >
														<span id="is_rvlike" class="glyphicon glyphicon-heart thumbClick"></span>
													</c:if>
												</div>
											</c:if>
										</div>				
										<div>
											<c:if test="${IDmeme == strvcnt.user_email}">
												<input type="hidden" name="rv_no" value="${strvcnt.rv_no}">	
												<input type="hidden" name="store_id" id="store_id" value="${list[0].username}"/> 
												<a href="<c:url value='/updateSTReview.bbs?rv_no=${strvcnt.rv_no}'/>" class="btn btn-warning" style="margin-top:40px;font-size: 12px; padding: 3px 6px;">수정</a>																				 	
												<a href="<c:url value='/deleteSTReview.bbs?rv_no=${strvcnt.rv_no}'/>" class="btn btn-danger" style="margin-top:5px;font-size: 12px; padding: 3px 6px;">삭제</a>
											</c:if>
										</div>
									</div>										
								</div>
							</div>	
						</li>
					</c:forEach>
				</c:if>				
			</ul>
		</div>
		
		<div class="col-md-12 col-md-offset-5">
			${strvPagingString}
     	</div>


		<sec:authorize access="hasRole('ROLE_USER')">
			<div class="comment-form-wrap col-md-12"
				style="background: orange; border-radius: 1%;">
				<h3 class="h4 font-weight-bold gugi pt-5 pb-5"
					style="text-align: center;">리뷰 남기기</h3>
				<form id="reviewWriteForm" name="reviewWriteForm" method="post" action="<c:url value="/insertSTReview.do"/>" enctype="multipart/form-data">
					<div class="form-group poor">
						<div class="col-md-12">
							<label class="col-md-2" for="message" style="text-align: right;">Menu</label>
							<div class="col-md-9" style="padding-bottom: 15px;">
								<select id="menu_no" name="menu_no"
									style="padding: 10px; boder-radius: 3%;">
									<option>메뉴 이름</option>
									<c:forEach items="${foodMenuList}" var="Menu" varStatus="loop">
										<option value="${Menu.menu_no}">${Menu.menu_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="col-md-12">
							<label class="col-md-2" style="text-align: right;">리뷰 제목</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="rv_title"
									name="rv_title" placeholder="제목" style="margin-bottom: 10px;">
							</div>
						</div>

						<div class="col-md-12">
							<label class="col-md-2" style="text-align: right;">내용</label>
							<div class="col-md-9">
								<textarea name="rv_content" cols="30" rows="7"
									class="form-control" placeholder="내용을 입력하세요"
									style="margin-bottom: 10px;"></textarea>
							</div>
						</div>

						<div class="col-md-12">
							<label class="col-md-2" style="text-align: right;">리뷰 이미지</label>
							<div class="col-md-9">
								<input type="file" class="form-control" id="rf_path" name="rf_path" placeholder="리뷰 이미지" style="margin-bottom: 10px;">
							</div>
						</div>
							<div class="col-md-12">
							<div id="preview">
							</div>
						</div>
						<div class="col-md-12 mt-4 pb-3">
							<div class="form-group col-md-offset-5">
								<input type="hidden" name="store_id" id="store_id" value="${list[0].username}" />
								<input type="hidden" name="store_id" id="store_id" value="${list[0].username}" />
								<input type="submit" value="작성" class="btn py-3 px-4 btn-default" id="btnInsert">
							</div>
						</div>
					</div>
				</form>
			</div>
		</sec:authorize>




	</div>
</section>	 




<!-- -------------------------------------------리뷰쓰기 모달------------------------------------------- -->
	


	<div id="myModal" class="modal fade" style="opacity: 1; ">
		<div class="modal-dialog modal-lg" style="padding: 0;border:none; margin-top:200px; ">
			<div class="modal-content" style=" background: orange;">
				<div>
					<h3 class="pb-4 pt-4 text-center gugi col-md-10 col-md-offset-1"> 내 리뷰 남기기</h3>
					<span class="close" style="margin-right: 20px; margin-top:20px; color: black;">&times;</span>							
				</div>
				<form id="reviewWriteForm" name="reviewWriteForm" action="<c:url value='/insertSTReview.do'/>" >
					<div style="padding-top: 20px;">
						<div class="col-md-12">
							<label class="col-md-2" for="message" style="text-align: right;">Menu</label>
							<div class="col-md-9" style="padding-bottom: 15px;">
								<select id="menu_name">
									<option>메뉴 이름</option>
									<c:forEach items="${foodMenuList}" var="foodMenuDto"
										varStatus="loop">
										<option>${foodMenuDto.menu_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-12">
							<label class="col-md-2" for="form-control" style="text-align: right; padding-top: 15px;">리뷰 제목</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="rv_title" placeholder="제목을 입력하세요" style="margin-bottom: 10px;">
							</div>
						</div>
						<div class="col-md-12">
							<label class="col-md-2" for="form-control" style="text-align: right; padding-top: 15px;">리뷰 내용</label>
							<div class="col-md-9 poor">
								<textarea name="rv_content" cols="30" rows="5" class="form-control" placeholder="내용을 입력하세요" style="margin-bottom: 10px;"></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<label class="col-md-2" for="form-control" style="text-align: right; padding-top: 15px;">리뷰 이미지</label>
							<div class="col-md-9 poor">
								<input name="rf_path" id="rf_path" class="form-control" placeholder="파일업로드용" style="margin-bottom: 30px;"></input>
							</div>
						</div>
						<!-- <div class="col-md-12">
							<div id="preview">
							</div>
						</div> -->
					</div>
					<div class="modal-footer col-md-12 text-center" style="background: orange;">
						<input type="submit" value="작성" class="btn py-3 px-4 btn-default" id="btnInsert"> 
						<button class="btn py-2 px-1 btn-primary" data-dismiss="modal">
							<span class="close" style="height: 28px; width:20; font-size: 14px; padding: 10px 15px; ">취소</span>
						</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	/*
	    $("#btnInsert").click(function(){
	    	var param = jQuery("#reviewWriteForm").serialize();     
	    	var store_id='${list[0].username}';
	         $.ajax({
	        	type:"POST",
	        	url:"<c:url value='/insertSTReview.do'/>",
				data: param,      
				processData: false,  
			    contentType: false,  
			    enctype: 'multipart/form-data',
	            dataType: 'json',
	            success : function(data){
		              console.log('성공..?:',data);
		              alert('리뷰가 작성 되었습니다!');
		              window.location = "<c:url value='/Store/DetailView.do?username="+store_id +"'/>";
		          },
	              error:function(request,status,error){
	                 console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
	                       request.status,request.responseText,error,status);
	              }	        	 
	        	 
        	});
	    });
	    */
	    $("#rf_path").on('change', function() {
	          console.log('this 찍어봄 0  ' + this)
	          readInputFile(this);
	       });
	      
	      // 등록 이미지 삭제 ( input file reset )
	      var resetInputFile = function($input, $preview) {
	         var agent = navigator.userAgent.toLowerCase();
	         if ((navigator.appName == 'Netscape' && navigator.userAgent
	               .search('Trident') != -1)
	               || (agent.indexOf("msie") != -1)) {
	            // ie 일때
	            $input.replaceWith($input.clone(true));
	            $preview.empty();
	         } else {
	            //other
	            $input.val("");
	            $preview.empty();
	         }
	      }

	      var deleteImageAction = function() {
	         var img_id = "#img_id";
	         $(img_id).remove();
	         var $input = $("#rf_path");
	         var $preview = $('#preview');
	         resetInputFile($input, $preview);
	      }
	    $(function(){
	    	  //등록 이미지 등록 미리보기
		      function readInputFile(input) {
		         console.log('readInputFile메소드 안에 들어옴  ')
		         if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
		            console.log('id 찍어봄    ' + input.id);
		            console.log('name 찌거봄    ' + input.name);
		            reader.onload = function(e) {
		               $("#preview")
		                     .html(
		                           "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction()\" id=\"img_id\"><img class='img-thumbnail' src="
		                                 + e.target.result
		                                 + " style='width:100%;margin-left:5px;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
		            }
		            reader.readAsDataURL(input.files[0]);
		         }
		      }
	    })
    </script>