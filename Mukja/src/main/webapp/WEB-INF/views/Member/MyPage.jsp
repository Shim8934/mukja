<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
 
 
  
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
  .infoWindow{
     display: none;
     position:absolute;  
     width:300px;
     height:450px;    
     left:60%;
     top:100%;
     margin-left:-100x;
     margin-top:-150px;
     z-index:10003;
     background-color: white;
     text-align:center; 
     border: 1px black solid;
     padding-top: 30px;
     
    }
  .infoText{
       font-size: 1.2em;
     font-weight: bold;
    }
    
    
</style>
<section class="hero-wrap hero-wrap-2 align-items-center" style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">My Page</h1>
            <p class="breadcrumbs">
               <span class="mr-2"><a href="index.html">My Page <i class="ion-ios-arrow-forward"></i></a></span> 
            </p>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section mypage">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
   <div class="container-fluid align-items-center justify-content-center">
      <!-- 마이페이지 타이틀 -->
      <div class="row justify-content-center" style="width: 100%">
         <div class="text-center" style="width: 100%">
            <span class="subheading">My Page</span>
            <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">마이페이지</h2>
         </div>
      </div>
      <!-- MT & ET시작 -->
		<div class=" ftco-animate justify-content-center">
			<div class="text-center">
				<!-- 골라먹자 타이틀 -->
				<div class="col-md-5 mt text-center heading-section ftco-animate"
					style="float: none;">
					<div class="text-center">
						<span class="subheading" style="display: inline;">M.T</span>
						<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">골라먹자</h2>
					</div>
					<!-- 골라먹자 시작 -->
					<!-- 성향 시작 -->
					<div class="border3bc">
						<div class="sub-title">
							<h4 class="title col-md-offset-1 col-md-10 ">
								${myInfo.u_nick}님의 MyType 성향</h4>
								<input type="hidden" name="u_nick" id="u_nick" value="${myInfo.u_nick}">		

							<div>
								<a href="<c:url value='/UpdateMyInfo.bbs'/>" class="btn btn-black">수정</a>
							</div>
						</div>
						<div class="jNs">
							<div class="joa col-md-5" style="float: none;">
								<div>
									<span class="sub-title">프로필사진 </span>
								</div>
								<c:if test="${empty myInfo.u_img}">
									<div style="margin-top: 1rem;">
										<div class="col-md-10 col-offset-1" style="background-position: center; background-image: url(<c:url value=""/>);"></div>
									</div>
								</c:if>
								<c:if test="${not empty myInfo.u_img}">
									<div style="margin-top: 1rem;">
										<div class="img"
											style="height:200px; background-image: url(<c:url value="${myInfo.u_img}"/>);"></div>
									</div>
								</c:if>
							</div>
							<div class="siro col-md-5" style="float: none;">
								<div>
									<span class="title">DISLIKE!</span>
								</div>
								<div style="margin-top: 1rem;">
									<c:forTokens var="tend" items="${myInfo.u_tend}" delims=",">
										<div class="stjjim-box" style="background-color: white;">
											<img class="mypage-img" src='<c:url value="${tend}"/>'>
										</div>
									</c:forTokens>
								</div>
							</div>
						</div>
					</div>

					<!-- 찜 시작 -->
					<div class="border3bc">
						<div class="sub-title">
							<h4 class="title">가게 찜보기</h4>
						</div>

						<!-- 가게 찜 -->
						<div class="storejjim" style="margin: 10px;">
							<div class="owl-carousel row justify-content-center"
								style="margin-right: 0px; margin-left: 0px;">

								<c:if test="${empty storetxt}" >
									<div class="mpjjim item-align-center bd2bc" style="padding: 10px; border-radius: 5%;">
										<span style="font-weight: bold;">찜한 가게가 없어요.</span>
									</div>
								</c:if>

								<c:if test="${not empty storetxt}">
									<c:forEach items="${myJjim}" var="myJjim" varStatus="loop">
										<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
											<c:if test="${myJjim.store_name == storetxt.username}">
												<div class="mpjjim item-align-center bd2bc"
													style="padding: 10px; border-radius: 5%;">
													<div style="background-color: white; border-radius: 50%">
														<input type="hidden" id="ms_no" name="ms_no"value="${myJjim.ms_no}">
														<a href='<c:url value="/deleteMyJjim.bbs?ms_no=${myJjim.ms_no}"/>'>
															<span class="glyphicon glyphicon-heart" 
															style="font-size:30px; color: red; border-radius: 70%; float:right; margin:10px;" ></span>
														</a>
													
													</div>
													<c:if test="${empty storeimgs}" var="EmptySP">
														<div class="img">
															<span>이미지 준비 중입니다.</span>
														</div>
													</c:if>
													<c:if test="${not EmptySP}">
														<% int count = 0; %>
														<c:forEach items="${storeimgs}" var="storeimgs"
															varStatus="loop">
															<c:if test="${storetxt.username == storeimgs.username}">
																<% if(count == 0) {%>
																<div class="img d-block w-100"
																	style="background-image: url(<c:url value="${storeimgs.sf_path}"/>);"></div>
																<% }count = count + 1; %>
															</c:if>
														</c:forEach>
													</c:if>	
													
													<div class="text overflow"
														style="padding-top: 0rem; display: inline-block;">
														<div class="pt-3 text-center">
															<p class="mn_name overflow"
																style="font-size: 14px; font-weight: bold;">
																<a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'
																	style="text-decoration: none;">
																	${storetxt.store_name} </a>
															</p>
															<p class="mn_name overflow"
																style="font-size: 12px; color: gray;">${storetxt.store_phnum}
															</p>
															<p class="st_name overflow"
																style="font-size: 12px; color: gray;">${storetxt.store_addr}
															</p>
															<p class="mn_name overflow"
																style="font-size: 12px; color: gray;">${storetxt.store_intro}
															</p>
															<p class="mn_name overflow"
																style="font-size: 12px; color: gray;">${storetxt.store_time}
															</p>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:if>
								<div class="owl-dots"></div>
							</div>
						</div>
						
							<script>
								$(document).ready(
									function() {
										$('.owl-carousel').owlCarousel(
											{items : 2,
											loop : true,
											itemsScaleUp : false
										});
								});
							</script>
					</div>
					
					<!-- 리뷰 시작 -->
					<div id="RVList" class="row reviews border3bc mplist"
						style="margin-right: 0px; margin-left: 0px;">
						<div class="sub-title">
							<h4 class="title">내가 쓴 리뷰 보기</h4>
						</div>
						<div class="container">
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<table
									class="mplist table table-bordered table-hover text-center">
									<tr>
										<th style="width: 13%">가게이름/메뉴</th>
										<th style="width: 12%">날짜</th>
										<th style="width: 8%">별점</th>
										<th style="width: 35%">내용</th>
										<th style="width: 12%">사진</th>
										<th style="width: 15%">수정,삭제</th>
									</tr>
									<c:if test="${empty rvcnt}" var="EmptyRVC">
										<tr>
											<td colspan="5">작성한 리뷰가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${not EmptyRVC}">
										<c:forEach items="${rvcnt}" var="rvcnt" varStatus="loop">
											<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
												<c:if test="${rvcnt.store_name == storetxt.username}">
													<tr>
														<td>
															<a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>' style="text-decoration: none;">
																${storetxt.store_name} 
															</a>
															<br/>
																<c:forEach items="${menus}" var="menus" varStatus="loop">
																	<c:if test="${rvcnt.menu_no == menus.menu_no}">
																		<div class="menu_name">${menus.menu_name}
																			<div class="price">
																				<p>(${menus.menu_price})</p>
																			</div>
																		</div>
																	</c:if>											
																</c:forEach>
														</td>
														<td>${rvcnt.rv_postdate}</td>
														<td>4.0</td>
														<td>${rvcnt.rv_content}</td>
														<td>
															<c:if test="${empty rvimgs}">
																<img class="rv_pics" />
															</c:if>
															<c:if test="${not empty rvimgs}">
			                    								<% int count = 0; %>
																<c:forEach items="${rvimgs}" var="rvimgs"
																	varStatus="loop">
																	<c:if test="${rvcnt.rv_no == rvimgs.rv_no}">
																		<c:forTokens var="myrvpic" items="${rvimgs.rf_path}"
																			delims=",">
																			<% if(count == 0) {%>
																			<img class="rv_pics"
																				src='<c:url value="${myrvpic}"/>' />
																			<% }count = count + 1; %>
																		</c:forTokens>
																	</c:if>
																</c:forEach>
															</c:if>
														</td>
														<td>
															<input type="hidden" name="rv_no" id="rv_no" value="${rvcnt.rv_no}">												 	
															<a href="<c:url value='/updateMyReview.bbs?rv_no=${rvcnt.rv_no}'/>" class="btn btn-warning" style="font-size: 12px; padding: 3px 6px;">수정</a>	
															<a href="#" id="forRvdel" class="btn btn-success" style="font-size: 12px; padding: 3px 6px;">삭제</a>	
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								</table>
							</div>
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<div class="col-md-12 text-center">${rvPagingString}</div>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<!-- 삭제 알람 띄우기 -->				


				<div class="col-md-5 et text-center heading-section ftco-animate" style="float: none;">
					<!-- ET title -->
					<div class="text-center">
						<span class="subheading" style="display: inline;">E.T</span>
						<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">같이먹자</h2>
					</div>
					
					<!-- ET 신청 목록보기 -->
					<div class="row groups border3bc mplist" style="margin-right: 0px; margin-left: 0px;">
						<div class="sub-title">
							<h4 class="title">신청 온 ET 목록</h4>
						</div>
						<div class="container">
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<table class="mplist table table-bordered table-hover text-center item-a">
									<tr class="thead-light ">
										<th style="width: 5%">수락</th>
										<th style="width: 25%">가게이름</th>
										<th style="width: 20%">ET 성향</th>
										<th style="width: 20%">시간</th>
										<th style="width: 20%">참여자</th>
										<th style="width: 10%">인원</th>
									</tr>
									<c:if test="${empty myET0}">
										<tr>
											<td colspan="7">신청 온 ET가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${not empty myET0}">
										<c:forEach items="${myET0}" var="ET0" varStatus="loop">
											<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
												<c:if test="${ET0.store_id == storetxt.username}">
													<tr>
														<td>
															<input type="hidden" name="er_no"  id="er_no" value="${ET0.er_no}" >
															<input type="hidden" name="user_id" id="user_id" value="${ET0.user_id}">						
															
															<input type="button" id="etAccept" class="btn btn-primary" style="font-size: 12px; padding: 2px 4px;" value="수락">	
														
															<a href="#" id="etReject" class="btn btn-warning" style="font-size: 12px; padding: 2px 4px;">거절</a>
								
														</td>
														<td style="font-weight: bold;">
														<a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'>${storetxt.store_name}</a>
														</td>
														<td>
															<div style="padding-bottom: 0px;">
																<c:forTokens var="ertend" items="${ET0.er_tend}" delims=",">
																	<div class="etlist-box"
																		style="display: inline-block; padding-bottom: 0px;">
																		<img class="etlist-img"
																			src='<c:url value="${ertend}"/>'
																			style="width: 30px; height: 30px;">
																	</div>
																</c:forTokens>
															</div>
														</td>
														<td>${ET0.er_time}</td>

														<td style="font-size: 18px;">
															<c:forEach items="${Nicks}" var="Nick" varStatus="loop">
																<c:if test="${ET0.er_no == Nick.er_no}">
																	<span class="overflow"> 
																	
																	<a href='<c:url value="/MyPage.bbs?user_id=${Nick.username}"/>'>
																		${Nick.u_nick} 
																	</a>
																	</span>
																</c:if>
															</c:forEach>
														</td>
														<c:forEach items="${etInCount}" var="etcnt" varStatus="loop">
															<c:if test="${ET0.er_no == etcnt.er_no}">
																<td class="overflow"> ${etcnt.count} / ${ET0.er_max} 명 </td>
															</c:if>
														</c:forEach>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								</table>
								<input type="hidden" id="nowPage" value="${nowPage}">
							</div>
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<div class="col-md-12 text-center">${applPagingString}</div>
							</div>
						</div>
					</div>
									
					<!-- ET 신청 끝 -->

					<!-- ET 기록 보기  -->
					<div class="groups border3bc col-md-12">
						<div class="col-md-12">
							<div class="sub-title">
								<h4 class="title">내가 참가한 ET 보기</h4>
							</div>
						</div>
						<div class="owl-carousel col-md-12 pt-3" style="padding:0px; margin: 0px;">
							<c:if test="${empty myET1}">
								<div class="mpjjim bd2bc col-md-12" style="float: none; background: lightblue;">
									<span>참가한 ET가 없습니다.</span>
								</div>
							</c:if>

							<c:if test="${not empty myET1}">
								<c:forEach items="${myET1}" var="myET1" varStatus="loop">
									<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
										<c:if test="${myET1.username == storetxt.username}">

											<div class="mpjjim bd2bc pb-3 pt-3 col-md-11" style="float: none; background: lightblue; display: inline-block;">
												<div class="img col-md-6" style=" display: inline-block; padding:5px; margin:0px; ">
													<c:forEach items="${storeimgs}" var="storeimgs" varStatus="loop">
														<c:if test="${storeimgs.username == myET1}">
															<c:if test="${empty storeimgs.sf_path}">
																<div class="img rv_list_img col-md-12" style="background:white;float: left;" >
																	<span>no Image</span>
																</div>
															</c:if>
		
															<c:if test="${not empty storeimgs.sf_path}">
																<div class="img rv_list_img col-md-12" style="background-image: url(<c:url value="${storeimgs.sf_path}"/>);"> </div>											
															</c:if>
														</c:if>
													</c:forEach>
												</div>
												<div class="text col-md-6" style="display: inline-block; padding:5px; margin:0px; vertical-align: top; ">
													<div>
														<span class="mn_name overflow" style="font-weight: bold; font-size: 15px; color: black; padding-top: 10px; ">
															<a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'
															style="text-decoration: none;">${storetxt.store_name}</a>
														</span>
													</div>
													<div>
														<span class="st-name overflow">${myET1.er_time}</span>
													</div>
													<c:forEach items="${etInCount}" var="etcnt" varStatus="loop">
														<c:if test="${myET1.er_no == etcnt.er_no}">
															<div class="overflow"> ${etcnt.count} / ${myET1.er_max} 명 </div>
														</c:if>
													</c:forEach>
													<div class="">
														<c:forEach items="${Nicks}" var="Nick" varStatus="loop">
															<c:if test="${myET1.er_no == Nick.er_no}">
				                                                <span class="overflow"> 
				                                                	<c:if test="${myET1.user_id != Nick.username}">
					                                               		<a onclick="addr(this)" style="cursor: pointer; color: blue">${Nick.u_nick}</a>
					                                                    <input type="hidden" id='${Nick.u_nick}' value="${Nick.username}">
				                                                    </c:if>
				                                                </span>
				                                                <div class="col-md-12" id="modal_content"></div>
				                                             </c:if>
														</c:forEach>
													</div>
																										
													<div style="padding-bottom: 0px;">
														<c:forTokens var="ertend" items="${myET1.er_tend}" delims=",">
															<div class="etlist-box" style="display: inline-block; padding-bottom: 0px;">
																<img class="etlist-img" src='<c:url value="${ertend}"/>' style="width: 30px; height: 30px;">
															</div>
														</c:forTokens>
													</div>
												</div>
												<c:if test="${myET1.user_id == myET1.er_master}">
													<div class="col-md-12 pt-3">
														<input type="hidden" value="${myET1.er_no}" id="er_no2">	
														<input type="button" class="btn btn-danger" value="삭제" id="deleteET">	
														<%--<input type="button" class="btn btn-black" value="회원신고" id="userReport">	--%>
														<a href="<c:url value='/userReport.bbs?er_no=${myET1.er_no}'/>" class="btn btn-black">
															회원신고
														</a> 	
													</div>
												</c:if>
												<c:if test="${myET1.user_id != myET1.er_master}">
													<div class="col-md-12 pt-3">
														<input type="button" class="btn btn-warning" value="나가기" id="etReject">
														<input type="hidden" value="${myET1.er_no}" id="er_no2">
														<%--<input type="button" class="btn btn-black" value="회원신고" id="userReport">--%>
														 <a href="<c:url value='/userReport.bbs?er_no=${myET1.er_no}'/>" class="btn btn-black">
															회원신고
														</a> 	
															
													</div>
												</c:if>	
														
											</div>
											
																				
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:if>
						</div>
						<script>
						$(document).ready(
							function() {
								$('.owl-carousel').owlCarousel({
									itemsScaleUp:false,
									autoPlay:4,
									stopOnHover:false,
									navigation:false,
									navigationText : ["prev","next"],
									items :4,
									loop : false,
								});
						});
					</script>
					*아이디를 클릭하면 해당 아이디의 프로필 카드를 볼수 있습니다.*
					</div>
										
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	$(document).on("click","#forRvdel",function(){
		var rv_no = $("#rv_no").val();
		var isDelete = function(){
			if(confirm("정말로 이 리뷰를 삭제 하시겠습니까?"))
				location.replace("<c:url value='/deleteMyReview.bbs?rv_no="+rv_no+"'/>");	
		}
		
		isDelete();
	}),
	$(document).on("click","#deleteET",function(){
		var er_no = $("#er_no2").val();
		var isDelete = function(){
			if(confirm("이 같이먹자 방을 삭제 하시겠습니까?"))
				location.replace("<c:url value='/deleteMyETHist.bbs?er_no="+er_no+"'/>");	
		}
		
		isDelete();
	}),
	/* $(document).on("click","#userReport",function(){
		var er_no = $("#er_no2").val();
		var isDelete = function(){
			if(confirm("이 같이먹자 방의 회원을 신고하시겠습니까?"))
				location.replace("<c:url value='/userReport.bbs?er_no="+er_no+"'/>");	
		}
		
		isDelete();
	}), */
	
	$(document).on("click","#etAccept",function(){
		var er_no = $("#er_no").val();
		
		$.ajax({
			url:"<c:url value='/er_Accept.bbs?er_no="+er_no+"'/>",
		    data: {"er_no":er_no},			    
	        dataType: 'json',
	        success : function(data){
				console.log('성공..?:',data);
				alert('수락 처리 완료!');
				window.location = "<c:url value='/MyPage.bbs'/>";
			},
			error:function(request,status,error){
				console.log('error:%s,status:%s', error,status);
			}
		});
		
		/*
		var isAccept = function(){
			if(confirm("같이 먹기를 수락하시겠습니까?"))
				location.replace("<c:url value='/er_Accept.bbs?er_no="+er_no+"'/>");	
		}
		isAccept();
		*/
	})
	
	$(document).on("click","#etReject",function(){
		var er_no = $("#er_no").val();
		console.log(er_no)
			$.ajax({
				url:"<c:url value='/er_Reject.bbs?er_no="+er_no+"'/>",
			    data: {"er_no":er_no},			    
		        dataType: 'json',
		        success : function(data){
					console.log('성공..?:',data);
					alert('거부 처리 완료!');
					window.location = "<c:url value='/MyPage.bbs'/>";
				},
				error:function(request,status,error){
					console.log('error:%s,status:%s', error, status);
				}
			});
		
		/*
		var isReject = function(){
			if(confirm("같이 먹기를 거절하시겠습니까?"))
				location.replace("<c:url value='/er_Accept.bbs?er_no="+er_no+"'/>");	
		}
		*/
		//isReject();
	})
	
	   function addr(a) {
      var b=$(a).text();
      console.log('성공..?:',b);
      var users=document.getElementById(b).value
      console.log('성공..?:',users);
   
      $.ajax({
         url:"<c:url value='/modal.bbs'/>",
         data:{'users':users},
         dataType:'json',
         success:function(data){
            console.log(data);
            if(data!=null){
               $('#showuser').remove();
               console.log('1');
               var tend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
               console.log('2');
                var user_tend = data.u_tend.split(',');
                console.log('3');
                var tend_img = '';
                console.log('4');
                var prof=
                    '<div id="showuser"class="myborder infoWindow" style=" display:none;">'+
                    ' <img style="margin-bottom:20px; display:inline;" src="/mukja'+data.u_img+'" alt="H" class="img_user">'+
                    ' <div class="infoText">닉네임 : '+data.u_nick+'</div>'+
                    ' <div class="infoText">나이:'+data.u_age+'대</div>'+
                    ' <div class="infoText">안먹는 음식 </div>'+
                    ' <div id="tend"></div>'+
                    ' <div id="masterClose" class="btn btn-default">닫기</a>'+
                    '</div>';         
               console.log('5');                                                  
               $('body').append(prof);
               console.log('6');         
                                                 
                console.log('user_tend');
                console.log(user_tend);
                tendIMG="";
                for(var ti=0; ti<tend_codes.length;ti++){
                   for(var ut=0; ut<user_tend.length;ut++){
                      if(tend_codes[ti]==user_tend[ut]){
                         console.log(data.er_title+'의 성향이미지:'+user_tend[ut]);
                          tendIMG='<img style="margin-bottom:20px; display:inline;" src="/mukja/resources/usertend_IMG/'+user_tend[ut]+'.jpg" alt="tend" class="img_size">';
                           $('#tend').append(tendIMG);
                      }
                   }
                   
                }
                console.log('7');   
               console.log('방장정정보 돌입');
               $('#showuser').fadeIn();
               
               $('#masterClose').click(function() {
                  $('#showuser').hide();
               })
            }                 
         }
         
      });   
   }
</script>


