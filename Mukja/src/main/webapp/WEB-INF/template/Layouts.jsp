<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 로그인용 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="google-signin-client_id" content="548176436735-1d5a6bdmnjb40n7du817u27omto0341n.apps.googleusercontent.com">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>골라먹자 : 세상의 모든 음식을 골라먹자</title>
   <!-- 템플릿 CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/animate.css'/>">    
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/jquery.timepicker.css'/>">   
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icomoon.css'/>">
    <link rel="stylesheet" href="  <c:url value='/resources/bootstrap/css/style.css'/>">   
   <!-- 친구리스트 -->
   <%-- <link rel="stylesheet" href="<c:url value='/resources/adminbootstrap/assets/css/material-dashbooard.css'/>"> --%>
   <!-- 아이콘  css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-common.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-style.css'/>">
   <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/modernizr.custom.79639.js'/>"></script>
   <!-- 메뉴 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-default.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-component.css'/>">
   <script src="<c:url value='/resources/bootstrap/js/modernizr.custom.js'/>"></script>
   <!-- 한글폰트 -->
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" >
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
   <!-- 영어폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lovers+Quarrel" rel="stylesheet">

   <!-- 탭형 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/tab-style.css'/>">
   <!-- 로그인용 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"/></script>
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
                                            <!-- 로 그 인 용 입 니 다. -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"charset="utf-8"></script>
   <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

  </head>
  
  <body>
   <!-- top부분 -->
   <tiles:insertAttribute name="top"/>
    <!-- body부분 -->
    <tiles:insertAttribute name="body"/>  
    
    <!-- footer부분 -->
    <tiles:insertAttribute name="footer"/>  
   <!--  -->
  <!--  <div class="fixed-plugin">
      <div class="dropdown show-dropdown">
         <a class="small" href="#" data-toggle="dropdown"> <span
            class="icon-arrow-circle-o-right middle-icon"></span> <i class="fa fa-cog fa-2x"></i>
         </a>
         <ul class="dropdown-menu" style="transform: trslate(0px 0px);">
            <li class="header-title">친구 리스트</li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
            <li class="adjustments-line">
               <div class="friend-list">
                  <div class="friend-img">
                     <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="friend-info">
                     <div class="meta mb-2" style="padding-left: 1px">NAME</div>
                     <button id="twitter" class="friend-message btn-round btn-twitter">
                        Message</button>
                  </div>
               </div>
            </li>
         </ul>
      </div>
   </div> -->
   <!-- 템플릿js -->
   <script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('cab0340f505e3743996a8af7ba8a84ed'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
		// 카카오 로그인 버튼을 생성합니다.
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							console.log(res.id);//<-- 아이디
							console.log(res.properties['nickname']);//<-- 서비스에서 쓰이는 사용자 닉네임						 
							console.log(res.kakao_account.profile);//<--카카오계정의 프로필 소유 여부
							console.log(res.properties.profile_image);//<--서비스에서 쓰이는 사용자 프로필 이미지 URL
							console.log(res.properties.thumbnail_image);//<--서비스에서 쓰이는 사용자 썸네일 이미지 URL
							console.log(res.kakao_account.email);//<-- 카카오계정의 이메일 소유 여부
							console.log(res.kakao_account.age_range);//<--카카오계정의 연령대 소유 여부, 연령대 값
							console.log(res.kakao_account.birthday);//<--카카오계정의 생일 소유 여부, 생일 값
							console.log(res.kakao_account.gender);//<--카카오계정의 성별 소유 여부, 성별 값
							console.log(authObj.access_token);//<-- 토큰
						}
					})
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		}
	</script>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("IfJIBkPqG5FDZeBEJEdv",
				"http://localhost:9998/mukja/SignIn"); // Client ID, CallBack URL 삽입
		// 단 'localhost'가 포함된 CallBack URL
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 1, 68);
		naver_id_login.setPopup();
		naver_id_login.setDomain("http://localhost:9998/mukja/SignIn");//  URL
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	</script>
	<script type="text/javascript">
var naver_id_login = new naver_id_login("IfJIBkPqG5FDZeBEJEdv", "http://localhost:9998/mukja/SignIn");
        // 접근 토큰 값 출력
        alert(naver_id_login.oauthParams.access_token);
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('email'));
            alert(naver_id_login.getProfileData('nickname'));
            alert(naver_id_login.getProfileData('profileImage'));
            alert(naver_id_login.getProfileData('age'));
            alert(naver_id_login.getProfileData('birthday'));
            alert(naver_id_login.getProfileData('uniqId'));
            
            
        }
    </script>

	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=APPID";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		window.fbAsyncInit = function() {
			FB.init({
				appId : '244161326812625',
				cookie : true,
				xfbml : true,
				version : 'v2.8'
			});

			FB.getLoginStatus(function(response) {

				console.log('statusChangeCallback');
				console.log(response);

				if (response.status === 'connected') {
					$("#result").append("status : connected");
				} else {
					$("#result").append(response);
				}
			});
		};

		function fbLoginAction() {
			FB.login(function(response) {
				var fbname;
				var accessToken = response.authResponse.accessToken;
				FB.api('/me?fields=id,name,age_range,birthday,gender,email',
						function(response) {
							var fb_data = jQuery.parseJSON(JSON
									.stringify(response));
							var data = "<br/>fb_id : " + fb_data.id;
							data += "<br/>email : " + fb_data.email;
							data += "<br/>name : " + fb_data.name;

							$("#result").append(data);

						});
			}, {
				scope : 'public_profile, email'
			});
		}
	</script>
	<script>
		//구글 로그인
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());

			var name = profile.getEmail();

			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);
			if (name !== null) {
				window.location
						.replace("http://localhost:8080/ParkSeongWoong1/Login/GoogleLogin_result.jsp?name="
								+ name);
			} else if (name == null) {

				window.location
						.replace("http://localhost:8080/ParkSeongWoong1/Login/GoogleLogin_result.jsp");
			}

		}
	</script>
   <!-- 메뉴 js -->
   <script src="<c:url value='/resources/bootstrap/js/toucheffects.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/popper.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.easing.1.3.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.waypoints.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.stellar.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.magnific-popup.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/aos.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.animateNumber.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap-datepicker.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.timepicker.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/scrollax.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/main.js'/>"></script>
   
  </body>
</html>