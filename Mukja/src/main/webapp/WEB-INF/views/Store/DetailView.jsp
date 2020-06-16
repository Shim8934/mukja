<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 ftco-animate"> -->

<!-- INFROMATION -->
<section class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt">
	<div class="container" style="width: 1400px;">
		<div class="row no-gutters">

			<!-- left-side picture -->
			<!-- 카라셀 -->
			<div id="carousel-example-generic" class="carousel slide casize"
				data-ride="carousel">
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
						<h2 class="mb-4" style="font-size: 3.0em; display: inline">${list[0].store_name}</h2>
					</div>
				</div>
				<div class="pl-lg-5 ml-md-5" style="margin-top: 15px;">
					<!-- 가게 정보 -->
					<div>
						<!-- 가게 정보 -->
						<div class="restInfo col-md-12" style="font-size: 1.2em;">
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
									평점
								</div>
								<div style="margin-left: 15px; margin-bottom: 5px">
									<p class="star_rating">
									    <a class="on">★</a>
									    <a class="on">★</a>
									    <a class="on">★</a>
									    <a>★</a>
									    <a>★</a>
									</p>
								      

								</div>
							</div>
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
								<strong class="number" data-number="${list[0].store_avg}">0</strong>
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
					<div
						class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="${reviewCount}">0</strong> <span>리뷰수</span>
							</div>
						</div>
					</div>
					<div
						class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="10">0</strong> <span>가게랭킹</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%-- 		
			<!-- SUGGESTION -->			
				<section class="ftco-section ">
					<div class="container">
						<div class="row justify-content-center mb-5 pb-2">
							<div class="col-md-10 text-center heading-section ftco-animate">
								<span class="subheading">Menu</span>
								<h2 class="mb-4">Someone's Recommandations</h2>
							</div>
							<div>
								<a class="menuplus" href="<c:url value='/MenuList.bbs'/>">+메뉴 더 보기</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
									<div class="text px-4 pt-4" style="padding-top: 0rem">
										<div class="preference">
											<p>Vegan's Choice</p>
										</div>
										<h3>Veggie Veggie Delite Veggie</h3>
										<span class="food-type mb-2 overflow">Vegan,Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/Italy_bmt.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>XChicken's Choice XChicken's Choice</p>
										</div>
										<h3>Italian B.M.T Italian B.M.T Italian B.M.T</h3>
										<span class="food-type mb-2 overflow">Vegan,Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>

									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/steak.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>XPork's choice</p>
										</div>
										<h3>Steak, Egg & Cheese</h3>
										<span class="food-type mb-2 overflow">XChicken,XPork,Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/tuna.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>Pesco's Choice</p>
										</div>
										<h3>Tuna Sandwich</h3>
										<span class="food-type mb-2  overflow">Pesco,XChicken,XPork,XBeef,Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/eggmayo.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>Lacto & Ovo's Choice</p>
										</div>
										<h3>Egg Mayo</h3>
										<span class="food-type mb-2 overflow overflow">Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/chickenTeriyaki.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>XBeef's Choice</p>
										</div>
										<h3>Chicken Teriyaki</h3>
										<span class="food-type mb-2 overflow">XPork,XBeef,Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/subwayclub.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>All fine's Choice</p>
										</div>
										<h3>Subway Club</h3>
										<span class="food-type mb-2">Xnuts</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="suggestion">
									<div class="img"
										style="background-image: url(<c:url value="/resources/bootstrap/images/subway/blt.jpg"/>);"></div>
									<div class="text px-4 pt-4">
										<div class="preference">
											<p>XChicken's Choice</p>
										</div>
										<h3>B.L.T</h3>
										<span class="food-type mb-2">XChicken,XBeef,Xnuts</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section> --%>

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
											<c:forEach items="${foodimglist}" var="foodimgDTO"
												varStatus="status">
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



			<!--  -->
		</div>
		<div style="text-align: center;">
			<a style="font-size: 1.2em; display: inline-block;"
				href="<c:url value='/MenuList.bbs'/>">+ 메뉴 더 보기</a>
		</div>
	</div>

</section>


<!-- REVIEW -->
<section class="ftco-section testimony-section ">
	<div class="container">
		<!-- REVIEW TITLE -->
		<div class="row justify-content-center mb-5 pb-2">
			<div
				class="col-md-10 text-center heading-section heading-section-white ftco-animate"
				style="display: inline">
				<span class="subheading">Review</span>
				<h2 class="mb-4">베스트 메뉴 후기</h2>
			</div>
			<div>
				<a class="menuplus" href="<c:url value='/ReviewList.bbs'/>"> +후기
					더 보기</a>
			</div>
		</div>

		<!-- BEST REVIEW -->
		<div class="row ftco-animate justify-content-center">
			<!-- <div class=" col-md-7"> <div class="carousel-testimony owl-carousel ftco-owl">CAROUSEL 적용 -->
			<div class="item col-md-2">
				<!-- 1-1 -->
				<div class="testimony-wrap text-center py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3 ">
						<p class="name overflow">MenuName</p>
						<span class="food-type overflow">Type</span>
						<p class="mb-4 overflow">Review</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item col-md-2">
				<div class="testimony-wrap text-center py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3">
						<p class="name overflow">연어 스테이크</p>
						<span class="food-type overflow">TypeTypeTypeType</span>
						<p class="mb-4 overflow">ReviewReviewReviewReview</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item col-md-2">
				<div class="testimony-wrap text-center py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3">
						<p class="name overflow">부드럽고 고소한 크림 소스에 톡톡 튀는 명란이 들어간 크림 파스타</p>
						<span class="food-type overflow">Type</span>
						<p class="mb-4 overflow">맛있는팟씨유먹고파....</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item col-md-2">
				<div class="testimony-wrap text-enter py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/drink-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3">
						<p class="name overflow">가나다라마바사아자차카파타하</p>
						<span class="food-type overflow">Lacto, Pork-free</span>
						<p class="mb-4 overflow">가나다라마바사아자차카파타하</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item col-md-2">
				<!-- 5 -->
				<div class="testimony-wrap text-center py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/dessert-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3">
						<p class="name overflow">MenuName</p>
						<span class="food-type overflow">Type</span>
						<p class="mb-4 overflow">ReviewReviewReviewReview</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="item col-md-2">
				<!-- 6 -->
				<div class="testimony-wrap text-center py-4 pb-5">
					<div class="user-img mb-4"
						style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);">
						<span
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span>
					</div>
					<div class="text px-3 pt-3">
						<p class="name overflow">MenuName</p>
						<span class="food-type overflow">Type</span>
						<p class="mb-4 overflow">Review</p>
						<ul class="ftco-social d-flex">
							<li class="ftco-animate"><a href="#"><span
									class="icon-message"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-google-plus"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- item6 -->
		</div>
	</div>
	<!-- </div> </div> -->
	<div class="container">
		<h3 class="mb-5 h4 font-weight-bold p-4" style="text-align: center">모든
			리뷰 보기</h3>
		<div>
			<ul class="comment-list">
				<li class="comment">
					<div class="vcard bio">
						<img
							src='<c:url value="/resources/bootstrap/images/person_1.jpg"/>'
							alt="Image placeholder">
					</div>
					<div class="comment-body">
						<div class="row">
							<h3 class="col-md-1">ID</h3>
							<div class="col-md-10 meta mb-2">| regidate</div>
							<h3>평점</h3>
						</div>
						<p>리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review
							리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
							review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
							review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
							review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
							review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
							review</p>
						<div class="menu-img img"
							style="background-image: url(<c:url value="/resources/bootstrap/images/subway/review/eggmayo.jpg"/>);"></div>
					</div>
				</li>

				<li class="comment">
					<div class="vcard bio">
						<img
							src='<c:url value="/resources/bootstrap/images/person_2.jpg"/>'
							alt="Image placeholder">
					</div>
					<div class="comment-body">
						<div class="row">
							<h3 class="col-md-1">ID</h3>
							<div class="col-md-10 meta mb-2">| regidate</div>
							<h3>평점</h3>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Pariatur quidem laborum necessitatibus, ipsam impedit vitae
							autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
							voluptas earum impedit necessitatibus, nihil?</p>
						<p>
							<a href="#" class="reply">Reply</a>
						</p>
					</div>

					<ul class="children">
						<li class="comment">
							<div class="vcard bio">
								<img
									src='<c:url value="/resources/bootstrap/images/chef-1.jpg"/>'
									alt="Image placeholder">
							</div>
							<div class="comment-body">
								<div class="row">
									<h3 class="col-md-1">ID</h3>
									<div class="col-md-10 meta mb-2">| regidate</div>
									<h3>평점</h3>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Pariatur quidem laborum necessitatibus, ipsam impedit vitae
									autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
									voluptas earum impedit necessitatibus, nihil?</p>
								<p>
									<a href="#" class="reply">Reply</a>
								</p>
							</div>


							<ul class="children">
								<li class="comment">
									<div class="vcard bio">
										<img
											src='<c:url value="/resources/bootstrap/images/chef-2.jpg"/>'
											alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>John Doe</h3>
										<div class="meta mb-2">January 03, 2019 at 2:21pm</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Pariatur quidem laborum necessitatibus, ipsam impedit
											vitae autem, eum officia, fugiat saepe enim sapiente iste
											iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
										<p>
											<a href="#" class="reply">Reply</a>
										</p>
									</div>

									<ul class="children">
										<li class="comment">
											<div class="vcard bio">
												<img
													src='<c:url value="/resources/bootstrap/images/chef-3.jpg"/>'
													alt="Image placeholder">
											</div>
											<div class="comment-body">
												<h3>dk wdksjgksal;dnga;sldgn;sa</h3>
												<div class="meta mb-2">January 03, 2019 at 2:21pm</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Pariatur quidem laborum necessitatibus, ipsam impedit
													vitae autem, eum officia, fugiat saepe enim sapiente iste
													iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
												<p>
													<a href="#" class="reply">Reply</a>
												</p>
											</div>
										</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="comment">
					<div class="vcard bio">
						<img src='<c:url value="/resources/bootstrap/images/chef-4.jpg"/>'
							alt="Image placeholder">
					</div>
					<div class="comment-body">
						<h3>John Doe</h3>
						<div class="meta mb-2">January 03, 2019 at 2:21pm</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Pariatur quidem laborum necessitatibus, ipsam impedit vitae
							autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
							voluptas earum impedit necessitatibus, nihil?</p>
						<p>
							<a href="#" class="reply">Reply</a>
						</p>
					</div>
				</li>
			</ul>
		</div>
		<div class="row no-gutters my-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END comment-list -->
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5 h4 font-weight-bold p-4 bg-light">리뷰 남기기(비로그인시)</h3>
			<form action="#" class="p-4 p-md-5">
				<div class="form-group">
					<label for="email">ID / Email</label> <input type="email"
						class="form-control" id="email">
				</div>
				<div class="form-group">
					<label for="email">Password</label> <input type="email"
						class="form-control" id="email">
				</div>
				<div class="form-group">
					<label for="message">Contents</label>
					<textarea name="" id="message" cols="30" rows="5"
						class="form-control"></textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="Post Comment"
						class="btn py-3 px-4 btn-primary">
				</div>

			</form>
		</div>
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5 h4 font-weight-bold p-4">리뷰 남기기(로그인시)</h3>
			<form action="#" class="p-4 p-md-5">
				<div class="form-group">
					<label for="message">Contents</label>
					<textarea name="" id="message" cols="30" rows="5"
						class="form-control"></textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="Post Comment"
						class="btn py-3 px-4 btn-primary">
				</div>
			</form>
		</div>
	</div>

</section>

