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
								<div class="owl-dots"></div>
							</div>
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
														<td>
															<a href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>' style="text-decoration: none;">
																${storetxt.store_name} 
															</a>
															<br/>
																<c:forEach items="${menus}" var="menus" varStatus="loop">
																	<c:if test="${rvcnt.menu_no == menus.menu_no}">
																		${menus.menu_name}
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
														<td>
															<input type="hidden" name="rv_no" value="${rvcnt.rv_no}">														 	
															<a href="<c:url value='/updateMyReview.bbs?rv_no=${rvcnt.rv_no}'/>" class="btn btn-warning" style="font-size: 12px; padding: 3px 6px;">수정</a>	
																								 	
															<a href="<c:url value='/deletMyReview.bbs?rv_no=${rvcnt.rv_no}'/>" class="btn btn-danger" style="font-size: 12px; padding: 3px 6px;">삭제</a>	
															
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
												<c:if test="${ET0.username == storetxt.username}">
													<tr>
														<td>
														<input type="hidden" name="er_no" value="${ET0.er_no}" id="er_no">
															<button type="button" class="btn mr-2 mb-2 btn-primary" id="erjoin_role" value="${ET0.erjoin_role}" data-toggle="modal" data-target="#etAccept">
																수락
															</button>
														</td>
														<td style="font-weight: bold;"><a
															href='<c:url value="/Store/DetailView.do?username=${storetxt.username}"/>'>${storetxt.store_name}</a>
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
																	<a href='<c:url value="/Member/MyPage.do?username=${Nick.username}"/>'>
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
					
					<script>
						function getValue(){
							
							var checks = Document.getElementsByClassName('checks');
							
							var str = '';
							for(int i=0; i< ; i++){
								if(.checks[i].checked === true){
									str += checks[i].vales + " ";
								}
								
							}
							alert(str);
						}
					
					</script>
					<!-- ET 신청 끝 -->

					<!-- ET 기록 보기  -->
					<div class="groups border3bc col-md-12">
						<div class="sub-title">
							<h4 class="title">내가 참가한 ET 보기</h4>
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

													<% int count = 0; %>
													<c:forEach items="${storeimgs}" var="storeimgs"
														varStatus="loop">

														<c:if test="${storetxt.username == storeimgs.username}">

															<c:if test="${empty storeimgs}">
																<div class="img rv_list_img col-md-12" style="border: 1px solid red; float: left;">
																	<span>no Image</span>
																</div>
															</c:if>

															<c:if test="${not empty storeimgs}">
																<% if(count == 0) {%>
																<div class="img rv_list_img col-md-12" style="background-image: url(<c:url value="${storeimgs.sf_path}"/>);"> </div>
																<% }count = count + 1; %>
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
															<div class="etlist-box" style="display: inline-block; padding-bottom: 0px;">
																<img class="etlist-img" src='<c:url value="${ertend}"/>' style="width: 30px; height: 30px;">
															</div>
														</c:forTokens>
													</div>
												</div>
												<c:if test="${myET1.user_id == myET1.er_master}" var="deleteHist">
													<div class="col-md-12 pt-3">
														<input type="button" class="btn btn-danger" value="삭제" >	
													</div>
												</c:if>
												<c:if test="${not deleteHist}">
													<div class="col-md-12 pt-3">
														<input type="button" class="btn btn-danger" value="삭제" >	
													</div>
												</c:if>
											</div>
											
																				
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<script>
						$(document).ready(
							function() {
								$('.owl-carousel').owlCarousel(
									{items :4,
									loop : true
								});
						});
					</script>					
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade bd-example-modal-lg" id="etAccept" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-exclamation icon-gradient bg-deep-blue"></i>&nbsp;&nbsp;주의</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            	<P>${ET0.er_no}</P>
				<p>해당 같이먹기를 수락하시겠습니까? DSF</p>
			</div>
            <div class="modal-footer">
               <a class="btn btn-primary" style="cursor:pointer;" id="signCheck" href="javascript:click()">확인</a>
       		   <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>


