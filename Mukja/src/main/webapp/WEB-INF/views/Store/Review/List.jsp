<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->


<!-- GRAY THING -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('images/bg_4.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread">Reviews</h1>
				<p class="breadcrumbs">
					<span class="mr-2"> <a href="<c:url value="/"/>"> Home <i class="ion-ios-arrow-forward"></i></a></span> 
					<span><a href="<c:url value="/Restaurants.bbs"/>">Restaurants <i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

<!-- 흰부분 -->
<section class="ftco-section bg-light">
	<div class="container">
		<div class="row">
		<!-- 게시글1 -->
			<div class="col-md-12 ftco-animate">
				<div class="blog-entry">
					<!-- 이미지부분 -->
					<div>					
						<a href="blog-single.html" class="block-20" style="background-image: url(<c:url value="/resources/bootstrap/images/image_1.jpg"/>);"> </a>
					</div>
					<!-- 텍스트부분 -->
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">regidate</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading overflow">
							<a href="#">review-title review-title review-title review-title review-title </a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> 
							<a href="#" class="float-right meta-chat"> <span class="icon-chat"> </span> 3 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 ftco-animate">
				<div class="blog-entry">
					<!-- 이미지부분 -->
					<div style="display: inline">					
						<a href="blog-single.html" class="block-20" style="background-image: url(<c:url value="/resources/bootstrap/images/image_1.jpg"/>);"> </a>
					</div>
					<!-- 텍스트부분 -->
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">regidate</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading overflow">
							<a href="#">review-title review-title review-title review-title review-title </a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> 
							<a href="#" class="float-right meta-chat"> <span class="icon-chat"> </span> 3 </a>
						</p>
					</div>
				</div>
			</div>
			<!-- 
			<div class="col-md-3 ftco-animate">
				<div class="blog-entry">
					<a href="blog-single.html" class="block-20"
						style="background-image: url(<c:url value="/resources/bootstrap/images/image_2.jpg"/>);"> </a>
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">Feb 4, 2019</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading">
							<a href="#">Even the all-powerful Pointing has no control
								about the blind texts</a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> <a href="#"
								class="float-right meta-chat"><span class="icon-chat"></span>
								3</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 ftco-animate">
				<div class="blog-entry">
					<a href="blog-single.html" class="block-20" style="background-image: url(<c:url value="/resources/bootstrap/images/image_3.jpg"/>);"></a>
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div> <a href="#">Feb 4, 2019</a> </div>
							<div> <a href="#">Admin</a> </div>
						</div>
						<h3 class="heading">
							<a href="#">제가 못 먹는 건 손님께 드릴 수 없어요. 내 몸이 피곤해야지, 내 몸이 고단해야지 손님 입이 즐거워요. 내가 편하면 손님 입이 불쾌하죠.</a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> <a href="#"
								class="float-right meta-chat"><span class="icon-chat"></span>
								3</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 ftco-animate">
				<div class="blog-entry">
					<a href="blog-single.html" class="block-20"
						style="background-image: url(<c:url value="/resources/bootstrap/images/image_4.jpg"/>);"> </a>
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">Feb 4, 2019</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading">
							<a href="#">Even the all-powerful Pointing has no control
								about the blind texts</a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> <a href="#"
								class="float-right meta-chat"><span class="icon-chat"></span>
								3</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="blog-entry">
					<a href="blog-single.html" class="block-20"
						style="background-image: url(<c:url value="/resources/bootstrap/images/image_5.jpg"/>);"> </a>
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">Feb 4, 2019</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading">
							<a href="#">Even the all-powerful Pointing has no control
								about the blind texts</a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> <a href="#"
								class="float-right meta-chat"><span class="icon-chat"></span>
								3</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="blog-entry">
					<a href="blog-single.html" class="block-20"
						style="background-image: url(<c:url value="/resources/bootstrap/images/image_6.jpg"/>);"> </a>
					<div class="text px-4 pt-3 pb-4">
						<div class="meta">
							<div>
								<a href="#">Feb 4, 2019</a>
							</div>
							<div>
								<a href="#">Admin</a>
							</div>
						</div>
						<h3 class="heading">
							<a href="#">Even the all-powerful Pointing has no control
								about the blind texts</a>
						</h3>
						<p class="clearfix">
							<a href="#" class="float-left read">Read more</a> <a href="#"
								class="float-right meta-chat"><span class="icon-chat"></span>
								3</a>
						</p>
					</div>
				</div>
			</div> -->
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
	</div>
</section>


