<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- FOOTER -->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="margin:10px;">Gollamukja</h2>
						<p>'골라먹자'는 개인 맞춤 음식 추천 서비스입니다. 다양한 취향 어쩌구. 같이먹자를 시작하여 입맛 맞는 식친구들을 만들어보세요.</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="margin:10px;">협업신청</h2>
						<p>골라먹자 협업을 신청해 보세요</p>
						<form action="<c:url value='/StoreSignUp.bbs'/>" class="subscribe-form">
							<div class="form-group">
							<input type="submit" value="협업신청 하러가기!" class="form-control submit px-3">
							</div>
						</form>
					</div>
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="margin:10px;">공지사항</h2>
						<p>새로운 소식을 확인해 보세요</p>
						<form action="<c:url value='/MainNoticeList.bbs'/>" class="subscribe-form">
							<div class="form-group">
								<input type="submit" value="공지를 확인하세요!" class="form-control submit px-3">
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2" style="margin:10px;">Instagram</h2>
						<div class="thumb d-sm-flex">
							<a href="#" class="thumb-menu img" 
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-1.jpg'/>);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-2.jpg'/>);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-3.jpg'/>);"> </a>
						</div>
						<div class="thumb d-flex">
							<a href="#" class="thumb-menu img"
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-4.jpg'/>);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-5.jpg'/>);"> </a> <a
								href="#" class="thumb-menu img"
								style="background-image: url(<c:url value='/resources/bootstrap/images/insta-6.jpg'/>);"> </a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	