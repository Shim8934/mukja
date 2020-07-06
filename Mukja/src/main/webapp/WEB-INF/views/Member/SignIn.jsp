<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	}, true);
</script>


<!-- 인증되지 않은 모든 사용자인 경우:로그인 폼 보여주기 -->
<sec:authorize access="isAnonymous()">
	<div id="signin">
		<section class="hero-wrap hero-wrap-2"
			style="background-image: url(<c:url value='/resources/bootstrap/images/bg_4.jpg'/>);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-2 bread">로그인</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">Home <i
									class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i
								class="ion-ios-arrow-forward"></i></span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<!-- 로그인 -->
					<div class="col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 ftco-animate p-4 p-md-6" style="height:100%;">
						<form action="<c:url value='/LoginProcess.bbs'/>" method="post">
							<div class="col-md-12">
								<div class="form-group">
									<label for="">아이디</label>
									<input type="text" class="form-control" name="username" placeholder="아이디">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="">비밀번호</label>
									<input type="password" id="password" class="form-control" name="password" placeholder="비밀번호">
								</div>
							</div>
							<div class="col-md-12" style="height:auto;">
								<div class="form-group">
									<input type="submit" value="로그인" class="btn btn-primary btn-block py-5 px-4">
								</div>
							</div>
							
							<div class="col-md-12">
								<span><input type="checkbox"> 로그인 상태 유지 </span>
								<div style="display: inline-block; float: right;">
									<a>비밀번호 찾기</a> <span>|</span>
									<a href="<c:url value="/SignUp.bbs"/>" id="su">회 원 가 입</a>
								</div>
							</div>

							<div class="col-md-12">
								<div class="form-group" style="text-align: center">

									<div class="btn-group" role="group" aria-label="..." style="text-align: center; padding: 0 auto; margin: 0 auto">
										<a class="btn" id="btnkakao" onclick="loginWithKakao()" style="border-radius: 1em;">
											<img alt="카카오" src="<c:url value='/resources/bootstrap/images/kakao.png'/>" style="border-radius: 1.2em;">
										</a>
										<a type="button" id="naver_id_login" class="btn" style="border-radius: 1.2em;">Middle</a>
										<a type="button" class="btn" onclick="fbLoginAction();">
											<img alt="카카오" src="<c:url value='/resources/bootstrap/images/facebook.jpg'/>" style="border-radius: 1.2em;">
										</a>
										<a type="button" class="btn " data-onsuccess="onSignIn" data-theme="dark" onclick="onSignIn();">
											<img alt="카카오" src="<c:url value='/resources/bootstrap/images/google.png'/>" style="border-radius: 1.2em;">
										</a>
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</sec:authorize>
