<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section class="hero-wrap hero-wrap-2 align-items-center" style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">My Page</h1>
            <p class="breadcrumbs">
               <span class="mr-2"><a href="index.html">Home <i
                     class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
                  href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
                  Single <i class="ion-ios-arrow-forward"></i>
               </span>
            </p>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section mypage">
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
			<div class="text-center mtNet">
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

							<div>
								<a href="<c:url value='/UpdateMyInfo.bbs'/>"
									class="btn btn-black">수정</a>
							</div>
						</div>
						<div class="jNs">
							<div class="joa col-md-5" style="float: none;">
								<div>
									<span class="sub-title">프로필사진 </span>
								</div>
								<c:if test="${empty myInfo.u_img}">
									<div style="margin-top: 1rem;">
										<div class="img"
											style="height:200px; background-image: url(<c:url value=""/>);"></div>
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

								<c:if test="${empty storetxt}" var="EmptyMS">
									<div class="mpjjim col-md-12 bd2bc" style="float: none;">
										<span style="font-weight: bold;">찜한 가게가 없어요.</span>
									</div>
								</c:if>

								<c:if test="${not EmptyMS}">
									<c:forEach items="${myJjim}" var="myJjim" varStatus="loop">
										<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
											<c:if test="${myJjim.store_name == storetxt.username}">
												<div class="mpjjim item-align-center bd2bc"
													style="padding: 10px; border-radius: 5%;"">
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
																<a
																	href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'
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
							</div>
							<script>
						$(document).ready(
							function() {
								$('.owl-carousel').owlCarousel(
									{items : 2,
									loop : true
								});
						});
					</script>
						</div>
						<div class="row" style="margin-right: 0px; margin-left: 0px;">
							<div class="col-md-12 text-center">${jjimPagingString}</div>
						</div>
					</div>
					<!-- 리뷰 시작 -->
					<div class="row reviews border3bc mplist"
						style="margin-right: 0px; margin-left: 0px;">
						<div class="sub-title">
							<h4 class="title">내가 쓴 리뷰 보기</h4>
						</div>
						<div class="container">
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<table
									class="mplist table table-bordered table-hover text-center">
									<tr>
										<th style="width: 13%">가게이름</th>
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
														<td><a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>' style="text-decoration: none;">
																${storetxt.store_name} </a>
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
														<td>
															<input type="hidden" name="rv_no" value="${rvcnt.rv_no}">														 	
															<a href="<c:url value='/updateMyReview.bbs?rv_no=${rvcnt.rv_no}'/>" class="btn btn-warning" style="font-size: 12px; padding: 3px 6px;">수정</a>	
															<a href="<c:url value='/deleteMyReview.bbs?rv_no=${rvcnt.rv_no}'/>" class="btn btn-danger"  style="font-size: 12px; padding: 3px 6px;">삭제</a>												
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
<!-- -------------------------------------------리뷰수정-------------------------------------------  
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-lg" style="padding: 0;border:none; margin-top:200px; ">
			<div class="modal-content" style=" background: orange;">
				<div>
					<h3 class="pb-4 pt-4 text-center gugi col-md-10 col-md-offset-1"> 내 리뷰 남기기</h3>
					<span class="close" style="margin-right: 20px; margin-top:20px; color: black;">&times;</span>							
				</div>
				<form id="updateRVForm" action="/insertReview.bbs" >
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
					<div class="modal-footer col-md-12 text-center" style="background: orange;">
						<input type="button" id="btnUpdate" value="수정" class="btn py-3 px-4 btn-default" > 
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
		$("#btnUpdate").click(function(){
			$("#updateRVForm").serialize();
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
	</script>-->
	
	
	
	
	


				<div class="col-md-5 et text-center heading-section ftco-animate"
					style="float: none;">
					<!-- ET title -->
					<div class="text-center">
						<span class="subheading" style="display: inline;">E.T</span>
						<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">같이먹자</h2>
					</div>
					<!-- ET 신청 목록보기 -->
					<div class="row groups border3bc mplist"
						style="margin-right: 0px; margin-left: 0px;">
						<div class="sub-title">
							<h4 class="title">신청 온 ET 목록</h4>
						</div>
						<div class="container">
							<div class="row" style="margin-right: 0px; margin-left: 0px;">
								<table class="mplist table table-bordered table-hover text-center item-a">
									<tr class="thead-light ">
										<th>수락</th>
										<th>가게이름</th>
										<th>ET 성향</th>
										<th>시간</th>
										<th>참여자</th>
										<th>인원</th>
									</tr>
									<c:if test="${empty myET0}">
										<tr>
											<td colspan="7">신청 온 ET가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${not empty myET0}">
										<c:forEach items="${myET0}" var="ET0" varStatus="loop">
											<c:forEach items="${storetxt}" var="storetxt"
												varStatus="loop">
												<c:if test="${ET0.username == storetxt.username}">
													<tr>
														<td>
															<label class="customcheckbox"> <input
																	type="checkbox" class="listCheckbox"> <span
																	class="checkmark"></span>
															</label>
														</td>
														<td class="overflow" style="font-weight: bold;"><a
															href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'>${storetxt.store_name}</a>
														</td>
														<td class="overflow">
															<div style="padding-bottom: 0px;">
																<c:forTokens var="ertend" items="${ET0.er_tend}"
																	delims=",">
																	<div class="etlist-box"
																		style="display: inline-block; padding-bottom: 0px;">
																		<img class="etlist-img"
																			src='<c:url value="${ertend}"/>'
																			style="width: 30px; height: 30px;">
																	</div>
																</c:forTokens>
															</div>
														</td>
														<td class="overflow">${ET0.er_time}</td>

														<td class="overflow">
															<c:forEach items="${Nicks}" var="Nick" varStatus="loop">
																<c:if test="${ET0.er_no == Nick.er_no}">
																	<span class="overflow"> <a
																		href='<c:url value="/Member/MyPage.do?username=${Nick.username}"/>'>
																			${Nick.u_nick} </a>
																	</span>
																</c:if>
															</c:forEach>
														</td>
														<td class="overflow">${myET0.er_max}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								</table>
							</div>
						</div>
					</div>

					<!-- ET 기록 보기  -->
					<div class="groups border3bc">
						<div class="sub-title">
							<h4 class="title">내가 참가한 ET 보기</h4>
						</div>
						<div class="row et_records" style="border: 1px solid red; margin: 10px; padding:10px;">
							<c:if test="${empty myET1}">
								<div class="mpjjim bd2bc" style="padding: 10px; margin: 10px; float: none; background: lightblue;">
									<span>참가한 ET가 없습니다.</span>
								</div>
							</c:if>

							<c:if test="${not empty myET1}">
								<c:forEach items="${myET1}" var="myET1" varStatus="loop">
									<c:forEach items="${storetxt}" var="storetxt" varStatus="loop">
										<c:if test="${myET1.username == storetxt.username}">

											<div class="mpjjim bd2bc" style="padding: 10px; margin: 5px; float: none; background: lightblue;">
												<div class="img" style="border: 1px double black; width: 150px; display: inline-block;">

													<% int count = 0; %>
													<c:forEach items="${storeimgs}" var="storeimgs"
														varStatus="loop">

														<c:if test="${storetxt.username == storeimgs.username}">

															<c:if test="${empty storeimgs}">
																<div class="img rv_list_img"
																	style="border: 1px double black; width: 150px; float: left;">
																	<span>no Image</span>
																</div>
															</c:if>

															<c:if test="${not empty storeimgs}">
																<% if(count == 0) {%>
																<div class="img rv_list_img"
																	style="width:150px; float:left; 
															background-image: url(<c:url value="${storeimgs.sf_path}"/>);">

																</div>
																<% }count = count + 1; %>
															</c:if>
														</c:if>
													</c:forEach>
												</div>
												<div class="text" style="padding-top: 0rem; display: inline-block; padding-left: 10px; width: 145px;">
													<div>
														<span class="mn_name overflow"
															style="font-weight: bold; font-size: 15px; color: black; padding-top: 10px;">
															<a
															href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'
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
													<div class="overflow">
														<c:forEach items="${Nicks}" var="Nick" varStatus="loop">
															<c:if test="${myET1.er_no == Nick.er_no}">
																<span class="overflow"> <a
																	href='<c:url value="/Member/MyPage.do?username=${Nick.username}"/>'>
																		${Nick.u_nick} </a>
																</span>
															</c:if>
														</c:forEach>
													</div>
													<div style="padding-bottom: 0px;">
														<c:forTokens var="ertend" items="${myET1.er_tend}"
															delims=",">
															<div class="etlist-box"
																style="display: inline-block; padding-bottom: 0px;">
																<img class="etlist-img" src='<c:url value="${ertend}"/>'
																	style="width: 30px; height: 30px;">
															</div>
														</c:forTokens>
													</div>
												</div>
											</div>
											
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


