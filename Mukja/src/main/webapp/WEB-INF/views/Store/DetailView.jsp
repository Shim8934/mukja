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
									<div class="col-xs-3" style="text-align: right;">주소 :</div>
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
							<div style="margin-bottom: 30px">
								<div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
									추천하기 
								</div>
								<c:if test="${is_Thumb==0}" >
									<span id="thumbs-up" style="font-size: 2em" class="glyphicon glyphicon-thumbs-up thumbNomal"></span>
								</c:if>
								<c:if test="${is_Thumb==1}" >
									<span id="thumbs-up" style="font-size: 2em" class="glyphicon glyphicon-thumbs-up thumbClick"></span>
								</c:if>
								
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
								<strong class="number" data-number="${store_Thumb}">0</strong>
								<span>가게 추천 수</span>
							</div>
						</div>
					</div>
					<!-- 	<div
										class="col-md d-flex justify-content-center counter-wrap ftco-animate">
										<div class="block-18">
											<div class="text">
												<strong class="number" data-number="750">0</strong> 
												<span>가게 ♥ 수</span>
											</div>
										</div>
									</div> -->
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${reviewCount}">200</strong> <span>리뷰수</span>
							</div>
						</div>
					</div>
				
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${store_avg }">200</strong> <span>평점</span>
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
		<div style="text-align: center;">
			<a style="font-size: 1.2em; display: inline-block;" href="<c:url value='/MenuList.bbs'/>">+ 메뉴 더 보기</a>
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
		<div class="row ftco-animate justify-content-center">
			<!-- <div class=" col-md-7"> <div class="carousel-testimony owl-carousel ftco-owl">CAROUSEL 적용 -->
			
			<!-- 
			<c:if test="${empty rvThumb}">
				<div class="item col-md-2">	
					<span>베스트 리뷰가 없습니다.</span>
				</div>
			</c:if>
			<c:if test="${not empty rvThumb}">
				<c:forEach items="${rvThumb}" var="BestRV" varStatus="loop">
					<c:forEach items="${strvcnts}" var="rvCnt" varStatus="loop">
						<c:if test="${BestRV.rv_no == rvCnt.rv_no}">
						
							<div class="item col-md-3">
								<div class="testimony-wrap text-center py-4 pb-5">	
																			
									<c:forEach items="${strvimgs}" var="rvImg" varStatus="loop">
										<c:if test="${BestRV.rv_no == rvImg.rv_no}">
											<c:if test=" ${empty rvImg.rf_path}" var="noRvImg">
												<div class="user-img mb-4">
													
												</div>
											</c:if>
											<c:if test=" ${not noRvImg}">
												<div class="user-img mb-4" style="background-image: url(<c:url value="${rvImg.rf_path}"/>);">
													<span class="quote d-flex align-items-center justify-content-center">
														<i class="icon-quote-left"></i>
													</span>
												</div>
											</c:if>
										</c:if>
									</c:forEach>
									<c:forEach items="${usersnks}" var="usernk" varStatus="loop">
										<c:if test="${rvCnt.user_email == usernk.username}">
											<div class="text px-3 pt-3">
												<p class="name overflow">${usernk.u_nick}</p>
												<span class="food-type overflow">${rvCnt.rv_postdate}</span>
												<p class="mb-4 overflow">${rvCnt.rv_content}</p>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>	
			 -->
						
		</div>			
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
								<div class="col-md-8">
									<div style="color:gray; font-weight: bold; padding-bottom: 10px;">${strvcnt.rv_postdate}</div>
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
								<!-- 수정 삭제 -->
								<div class="col-md-1">
									<!--<c:if test="${user_id == strvcnt.user_email}">-->
									<ul style="list-style: none;">
										<li><a href="<c:url value='/Store/UpdateReview.do?rv_no=${strvcnt.rv_no}'/>" class="btn btn-success">수정</a></li>
										<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
									</ul>
									<!--</c:if>			-->				
								</div>
								<!-- 좋아요 -->
								<div class="col-md-1">
									<!--<c:if test="${user_id == strvcnt.user_email}">-->
									<ul style="list-style: none;">
										<li><a href="<c:url value='/Store/UpdateReview.do?rv_no=${strvcnt.rv_no}'/>" class="btn btn-success">수정</a></li>
										<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
									</ul>
									<!--</c:if>			-->				
								</div>
																				
							</div>
						</li>
					</c:forEach>
				</c:if>				
			</ul>
		</div>
		
		<sec:authorize access="hasRole('ROLE_USER')">
		<div class="comment-form-wrap col-md-12"
			style="background: orange; border-radius: 1%;">
			<input name="username" id="username" value="${username}" type="hidden" class="form-control">
			<h3 class="h4 font-weight-bold gugi pt-5 pb-5" style="text-align: center;">리뷰 남기기</h3>
			<form name="form1" method="post">
				<div class="form-group poor">
					<div class="col-md-12">
						<label class="col-md-2" for="message" style="text-align:right;">Menu</label>
						<div class="col-md-9" style="padding-bottom: 15px;">
							<select id="menu_name">
								<option>메뉴 이름</option>
								<c:forEach items="${foodMenuList}" var="foodMenuDto" varStatus="loop">
									<option>${foodMenuDto.menu_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-12">
						<label class="col-md-2" for="message" style="text-align: right; padding-top: 15px;">title</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" style="margin-bottom: 10px;">
						</div>
					</div>
					<div class="col-md-12">
						<label class="col-md-2" for="message"
							style="text-align: right; padding-top: 15px;">Contents</label>
						<div class="col-md-9 poor">
							<textarea name="rv_content" cols="30" rows="7" class="form-control" placeholder="내용을 입력하세요"
								style="margin-bottom: 10px;"></textarea>
						</div>
					</div>
					<div class="col-md-12">
						<label class="col-md-2" for="message"
							style="text-align: right; padding-top: 15px;">Images</label>
						<div class="col-md-9 poor">
							<input name="rf_path" class="form-control" placeholder="파일업로드용"
								style="margin-bottom: 30px;"></input>
						</div>
					</div>

				</div>
				<div class="col-md-12">
					<div class="form-group col-md-offset-5" style="align-content: center; align-items: center;">
						<input type="submit" value="리뷰 작성" id="btnInsert" class="btn py-3 px-4 btn-primary gugi">
					</div>
				</div>

			</form>
		</div>
	</sec:authorize> 
     </div>
     
     
     <div class="row"  style="margin-right: 0px; margin-left: 0px;">
		<div class="col-md-12 text-center">${strvPagingString}
		</div>
		
	 </div>
	 
	 <!-- -------------------------------------------리뷰쓰기 -->
	


	<div id="myModal" class="modal fade" style="opacity: 1; ">
		<div class="modal-dialog modal-lg" style="padding: 0;border:none; margin-top:200px; ">
			<!-- Modal content -->
			<div class="modal-content" style=" background: orange;">
				<!-- modal-header -->
				<div>
					<h3 class="pb-4 pt-4 text-center gugi col-md-10 col-md-offset-1"> 내 리뷰 남기기</h3>
					<span class="close" style="margin-right: 20px; margin-top:20px; color: black;">&times;</span>							
				</div>
				<!-- modal-body -->
				<form id="reviewWriteForm" action="/insertReview.bbs" >
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
							<label class="col-md-2" for="message"
								style="text-align: right; padding-top: 15px;">title</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="title"
									placeholder="제목을 입력하세요" style="margin-bottom: 10px;">
							</div>
						</div>
						<div class="col-md-12">
							<label class="col-md-2" for="message"
								style="text-align: right; padding-top: 15px;">Contents</label>
							<div class="col-md-9 poor">
								<textarea name="rv_content" cols="30" rows="7"
									class="form-control" placeholder="내용을 입력하세요"
									style="margin-bottom: 10px;"></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<label class="col-md-2" for="message"
								style="text-align: right; padding-top: 15px;">Images</label>
							<div class="col-md-9 poor">
								<input name="rf_path" class="form-control" placeholder="파일업로드용"
									style="margin-bottom: 30px;"></input>
							</div>
						</div>
					</div>
					<!-- modal-footer -->
					<div class="modal-footer col-md-12 text-center" style="background: orange;">
						<input type="button" id="btnInsert" value="작성" class="btn py-3 px-4 btn-default" > 
						<button class="btn py-2 px-1 btn-primary" data-dismiss="modal">
							<span class="close" style="height: 28px; width:20; font-size: 14px; padding: 10px 15px; ">취소</span>
						</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	
	$(function(){
		$("#btnInsert").click(function(){
			$("#reviewWriteForm").serialize();
			$.ajax({
				type:"post",
				url:"<c:url value='/insertReview.bbs'/>",
			    data: {rv_title:"rv_title",rv_content:"rv_content",user_email:"user_id",store_name:"store_id",menu_no:"menu_no"},		    
		        dataType: 'json',
		        success : function(data){
					console.log('성공..?:',data);
					alert('리뷰 작성 완료!');
					window.location = "<c:url value='/Store/DetailView.tiles'/>";		
				}
			})
		})
	});
	$(function(){
	   // Get the modal
	    var modal = document.getElementById('myModal');
	
	    // Get the button that opens the modal
	    var btn = document.getElementById("myBtn");
	
	    // Get the <span> element that closes the modal
	    var span = document.getElementsByClassName("close")[0];                                      
	
	    // When the user clicks on the button, open the modal 
	    btn.onclick = function() {
	        modal.style.display = "block";
	    }
	
	    // When the user clicks on <span> (x), close the modal
	    span.onclick = function() {
	        modal.style.display = "none";
	    }
	
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	});
	</script>	

</section>

	