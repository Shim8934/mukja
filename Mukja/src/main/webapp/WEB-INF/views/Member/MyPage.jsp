<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<section class="hero-wrap hero-wrap-2"
	style="background-image: url('images/bg_4.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
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

<!-- 레스토랑꺼 -->
<section class="ftco-section testimony-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-10 text-center heading-section heading-section-white ftco-animate"
				style="display: inline">
				<span class="subheading">Review</span>
				<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">베스트
					메뉴 후기</h2>
			</div>
			<div>
				<a class="menuplus" href="<c:url value='/ReviewList.bbs'/>"> +후기
					더 보기</a>
			</div>
		</div>
		<div class="row ftco-animate justify-content-center">
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
					<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);">
						<span class="quote d-flex align-items-center justify-content-center">
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
		</div>
	</div>
</section>

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
					<div class="img" tyle="background-image: url(<c:url value="/resources/bootstrap/images/subway/Italy_bmt.jpg"/>);"></div>
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
					<div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/blt.jpg"/>);"></div>
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
</section>

				









<section class="ftco-section mypage">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-10 text-center ">
				<span class="subheading">My Page</span>
				<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">마이페이지</h2>
			</div>
		</div>
		
		<!-- MT & ET시작 -->
		<div class="row ftco-animate justify-content-center">
		<!-- 골라먹자 타이틀 -->
			<div class="col-md-5 mt text-center heading-section ftco-animate">
				<div class="text-center">
					<span class="subheading" style="display: inline;">M.T</span>
					<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">골라먹자</h2>
				</div>
				<!-- 골라먹자 시작 -->
				<div class="mt_taste">
					<div>
						<h4> user님의 MyType 성향 </h4>
						<button> 수정 </button>
					</div>
					<div class="jNs">
						<div>
							<span>조으다! </span>
							<div class="suggestion">
								<div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/blt.jpg"/>);"></div>
								
								<div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/blt.jpg"/>);"></div>
								
							</div>
						</div>
						<div class="siro col-md-5">
							<span>싫으다! </span>
							<div>
								<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);"></div>
								<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);"></div>
								<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);"></div>							
							</div>
						</div>
					</div>
				</div>
				<div class="likes">
					<div class="foodlikes">						
						<div class="row ftco-animate justify-content-center">
							<div class="item col-md-3">
								<div class="mypage-wrap text-center py-4 pb-5">
									<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
										<span class="quote d-flex align-items-center justify-content-center">
											<i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text px-3 pt-3 ">
										<p class="name overflow">MenuName</p>
										<span class="food-type overflow">Type</span>
										<p class="mb-4 overflow">Review</p>
									</div>
								</div>
							</div>
							<div class="item col-md-3">
								<div class="mypage-wrap text-center py-4 pb-5">
									<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
										<span class="quote d-flex align-items-center justify-content-center">
											<i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text px-3 pt-3 ">
										<p class="name overflow">MenuName</p>
										<span class="food-type overflow">Type</span>
										<p class="mb-4 overflow">Review</p>
									</div>
								</div>
							</div>
						</div>
					</div>
 
					<div class="storelikes">
						<div class="row ftco-animate justify-content-center">
							<div class="item col-md-3">
								<div class="mypage-wrap text-center py-4 pb-5">
									<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
										<span class="quote d-flex align-items-center justify-content-center">
											<i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text px-3 pt-3 ">
										<p class="name overflow">MenuName</p>
										<span class="food-type overflow">Type</span>
										<p class="mb-4 overflow">Review</p>
									</div>
								</div>
							</div>
							<div class="item col-md-3">
								<div class="mypage-wrap text-center py-4 pb-5">
									<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
										<span class="quote d-flex align-items-center justify-content-center">
											<i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text px-3 pt-3 ">
										<p class="name overflow">MenuName</p>
										<span class="food-type overflow">Type</span>
										<p class="mb-4 overflow">Review</p>
									</div>
								</div>
							</div>
							<div class="item col-md-3">
								<div class="mypage-wrap text-center py-4 pb-5">
									<div class="user-img mb-4" style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
										<span class="quote d-flex align-items-center justify-content-center">
											<i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text px-3 pt-3 ">
										<p class="name overflow">MenuName</p>
										<span class="food-type overflow">Type</span>
										<p class="mb-4 overflow">Review</p>
									</div>
								</div>
							</div>
						</div> 
					</div>

				</div>
				<div class="reviews"></div>
			</div>
			<div class="col-md-5 et text-center heading-section ftco-animate">
				<div class="text-center">
					<span class="subheading">E.T</span>
					<h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">같이먹자</h2>
				</div>
				<div class="et_taste">
					<h4>user님의 ET 성향</h4>
					<button>수정</button>

					<div class="jNs">
						<div class="joa col-md-5">
							<span>조으다! </span>
							<div></div>
						</div>
						<div class="siro col-md-5">
							<span>싫으다! </span>
							<div></div>
						</div>
					</div>
				</div>
				<div class="groups">
					<div style="height: 150px; border: 1px pink solid;"></div>
					<div style="height: 150px; border: 1px purple solid;"></div>
				</div>
			</div>
		</div>
	</div>
</section>