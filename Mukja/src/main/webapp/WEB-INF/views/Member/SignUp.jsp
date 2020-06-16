<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function(){
  $('#img').click(function() {
		console.log('여기')
	  $('.trs').slideToggle(300)
})
});
</script>

<style type="text/css">
section {
	font-family: "나눔고딕", NanumGothic, "Nanum Gothic", 돋움, dotum,
		Apple SD Gothic Neo, sans-serif;
}
/* 	성별 라디오 버튼 삭제 */
.box-radio-input input[type="radio"] {
	display: none;
}
/* 	성별 클릭버튼 생성*/
.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	cursor: pointer;
	width: 100%;
	height: 100%;
	padding-top: 15px;
}
/* 	성별 클릭시 배경 */
.box-radio-input input[type="radio"]:checked+span {
	border: 1px red solid;
	background: white;
	color: red;
}

.trs {
	clear: both;
	float: left;
	width: 100%;
	height: 200px;
	border: 1px solid skyblue;
	border-radius: 10px;
}

.img_size {
	display: block;
	width: 50px;
	height: 50px;
	max-width: 65px;
	max-height: 65px;
	background-color: white;
	border: 2px #66B9E3 solid;
	border-radius: 45px;
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px;
	background-color: rgb(255, 255, 255);
	
}

  .lb_size{
  	width:50px;
  	background-color: white; 
	border: 2px #66B9E3 solid; 
	border-radius:5px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	background-color: rgb(255, 255, 255);
	margin-top: 5px;
	text-align: center;
  }
.wrapper {
  padding-top:10px;
  padding-left:10px;
  display: grid;
  grid-template-columns: 16% 16% 16% 16% 16% 16%;
}
</style>



</head>
<body>
	<!-- 인증되지 않은 모든 사용자인 경우:로그인 폼 보여주기 -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_4.jpg'); height: 200px"
		id='signup' data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">회원가입</h1>
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
		<div class="container" id='signup'>
			<div class="row d-flex">
				<div class="col-md-12 ftco-animate makereservation p-4 p-md-5">
					<form action="<c:url value='/StoreSignUp.bbs'/>" method="post">
						<div class="row">
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group" id="input">
									<label for="">아이디</label> <input type="text"
										class="form-control" id="username" name="username"
										placeholder="이메일">
									<div></div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">비밀번호</label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="비밀번호">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">비밀번호확인</label> <input type="password"
										class="form-control" id="passwordOk" name="passwordOk"
										placeholder="비밀번호">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">닉네임</label> <input type="text"
										class="form-control" id="u_nick" name="u_nick"
										placeholder="닉네임">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group" style="width: 100%; height: 70%">
									<label>성별</label>
									<div style="width: 100%; height: 100%; margin-bottom: 10px;">
										<label class="box-radio-input"
											style="width: 49%; height: 100%;"><input type="radio"
											name="gender" value="man"><span style="">남자</span></label> <label
											class="box-radio-input" style="width: 49%; height: 100%;"><input
											type="radio" name="gender" value="woman"><span
											style="width: 100%; height: 100%;">여자</span></label>
									</div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6" style="padding-top: 10px;">
								<div class="form-group">
									<label for="">연락처</label> <input type="text"
										class="form-control" id="u_ph" name="u_ph" placeholder="연락처">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">연령대</label>
									<div class="select-wrap one-third">
										<select name="u_age" id="u_age" class="form-control">
											<option value="">연령대를 선택하세요</option>
											<option value="10">10~19세</option>
											<option value="20">20~29세</option>
											<option value="30">30~39세</option>
											<option value="40">40~49세</option>
											<option value="50">50~59세</option>
											<option value="60">60~69세</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">관심지역</label> <a onclick="addr();"><input
										type="text" class="form-control" id="addr" name="addr"
										placeholder="관심지역을 선택하세요"></a> <input type="hidden"
										id="u_lat" name="u_lat" /> <input type="hidden" id="u_lng"
										name="u_lng" />
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">골라먹자 필터 지정하기</label> <span
										class="ion-ios-arrow-down" id="img"></span>
								</div>
								<div class="col-md-12 trs" style="display: none;">
											<div class="wrapper" style="text-align:center;">
											<div >
												<!-- 물고기 -->
												<img id='FS'
													src="<c:url value="/resources/tend_IMG/pesco_b.png"/>"
													alt="F" class="img-circle img_size">
												<div class="lb_size">생선</div>
											</div>
											<div>
												<!-- 달걀-->
												<img id='EG'
													src="<c:url value="/resources/tend_IMG/ovo_b.png"/>"
													alt="E" class="img-circle img_size">
												<div class="lb_size">달걀</div>
											</div>
											<div>
												<!-- 우유-->
												<img id='MK'
													src="<c:url value="/resources/tend_IMG/dairy_b.png"/>"
													alt="M" class="img-circle img_size">
												<div class="lb_size">우유</div>
											</div>
											<div>
												<!-- 가금류-->
												<img id='BD'
													src="<c:url value="/resources/tend_IMG/chicken_b.png"/>"
													alt="B" class="img-circle img_size">
												<div class="lb_size">가금류</div>
											</div>
											<div>
												<!-- 돼지고기-->
												<img id='PK'
													src="<c:url value="/resources/tend_IMG/pig_b.png"/>"
													alt="P" class="img-circle img_size">
												<div class="lb_size">돼지</div>
											</div>
											<div>
												<!-- 소고기-->
												<img id='CW'
													src="<c:url value="/resources/tend_IMG/cow2_b.png"/>"
													alt="C" class="img_size">
												<div class="lb_size">소</div>
											</div>
											</div>
											<div class="wrapper">
											<div class="">
												<!-- 땅콩-->
												<img id='PE'
													src="<c:url value="/resources/tend_IMG/nuts_b.png"/>"
													alt="PE" class="img-circle img_size">
												<div class="lb_size">땅콩</div>
											</div>
											<div class="">
												<!-- 각갑류-->
												<img id='SF'
													src="<c:url value="/resources/tend_IMG/shrimp_b.png"/>"
													alt="SF" class="img-circle img_size">
												<div class="lb_size">갑각류</div>
											</div>
											<div class="">
												<!-- 치즈-->
												<img id='DP'
													src="<c:url value="/resources/tend_IMG/dp_b.JPG"/>"
													alt="DP" class="img-circle img_size">
												<div class="lb_size">유제품</div>
											</div>
											<div class="">
												<!-- 콩-->
												<img id='SB'
													src="<c:url value="/resources/tend_IMG/s_b.png"/>" alt="SB"
													class="img-circle img_size">
												<div class="lb_size">대두</div>
											</div>
											<div>
												<!-- 밀가루 -->
												<img id='FL'
													src="<c:url value="/resources/tend_IMG/gluten_b.png"/>"
													alt="FL" class="img-circle img_size">
												<div class="lb_size">글루텐</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<input type="submit" value="회원가입"
										class="btn btn-primary py-3 px-5"
										style="width: 100%; height: 100%; font-size: 20px;">
								</div>
							</div>
							</form>
						</div>
					
				</div>

			</div>
			<div class="col-md-12">
				<div class="form-group" style="text-align: center">

					<div class="btn-group" role="group" aria-label="..."
						style="text-align: center; padding: 0 auto; margin: 0 auto">

						<a class="btn" onclick="loginWithKakao()"
							style="border-radius: 1em;"> <img alt="카카오"
							src="<c:url value='/resources/bootstrap/images/kakao.png'/>"
							style="border-radius: 1.2em;">
						</a> <a class="btn" id="naver_id_login" style="border-radius: 1.2em;">Middle</a>
						<a class="btn" onclick="fbLoginAction();"> <img alt="페이스북"
							src="<c:url value='/resources/bootstrap/images/facebook.jpg'/>"
							style="border-radius: 1.2em;">
						</a> <a type="button" class="btn " data-onsuccess="onSignIn"
							data-theme="dark" onclick="onSignIn();"> <img alt="구글"
							src="<c:url value='/resources/bootstrap/images/google.png'/>"
							style="border-radius: 1.2em;">
						</a>


					</div>
				</div>

			</div>
	

	</section>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8b4c494b923442e4a549fa1dd7f645&libraries=services"></script>
	<script>
  	$( function() { 
  		$( "#accordion" ).accordion();
  	}
  	);
  </script>
	<script>
    function addr() {
    	var geocoder = new daum.maps.services.Geocoder();
    	var width = 400; 
    	var height = 500;
        new daum.Postcode({
        	 width: width,
 		     height: height,
             oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        document.getElementById("u_lat").value = result.y;
                        document.getElementById("u_lng").value = result.x;
                    }
                });
            }
        }).open({
	        left: (window.screen.width/2)-(width / 2),
	        top: (window.screen.height/2)-(height / 2)
	    });
    }
</script>


</body>
</html>