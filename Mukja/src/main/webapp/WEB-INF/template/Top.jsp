<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
	function isLogin(){//top에있으니 로그인 여부 확인할때는 해당 스크립트함수를 호출하자
		//ajax요청
		$.ajax({
			url:"<c:url value='/isLogin.bbs'/>",
			dataType:'json',
			success:function(data){
				//서버로 받은 데이터는 data에 있다				
				console.log("데이터"+data);
				console.log(JSON.stringify(data));
				if(data.IsLogin=="YES"){
					// 목록페이지로 이동
					location.replace("<c:url value='/'/>");
					
				}else{
					// 비로그인 상태
					alert('로그인후 이용하시오.');
					location.replace("<c:url value='/Signin.bbs'/>");
					
				}
					
			},
			error:function(e){
				//서버로 받은 에러는 e에 있다				
			
			}
			
		});
	}
</script>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light ftco-navbar-light-2" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="<c:url value="/"/>">골라먹자</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="<c:url value="/"/>" class="nav-link">먹자홈</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a href="<c:url value="/SignIn.bbs"/>"  class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="<c:url value="/SignUp.bbs"/>"  class="nav-link">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<li class="nav-item"><a href="javascript:logout();"  class="nav-link">로그아웃</a></li>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/Shim8934/mukja.git
					<li class="nav-item"><a href="<c:url value="/MyPage.bbs"/>"class="nav-link">마이먹자</a></li>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/Shim8934/mukja.git
				</sec:authorize>
				<!-- Admin 페이지 테스트용 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item"><a href="<c:url value="/AdminMain.bbs"/>"class="nav-link">Admin</a></li>
				<li class="nav-item"><a href="javascript:logout();"  class="nav-link">로그아웃</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_STORE')">
				<li class="nav-item"><a href="<c:url value="/StoreMypage/StoreMypageMain.do"/>"class="nav-link">우리가게관리</a></li>
				<li class="nav-item"><a href="javascript:logout();"  class="nav-link">로그아웃</a></li>
				<li class="nav-item"><a href="<c:url value="/reservationInfo.do"/>"class="nav-link">매장좌석 현황관리</a></li>
				</sec:authorize>
				<!-- 맵 임의로 상단 탑 메뉴로 빼둠 -->
			<li class="nav-item"><a href="<c:url value="/Map.bbs"/>"  class="nav-link">골라먹자</a></li>
			<li class="nav-item"><a href="<c:url value="/CollectMain.do"/>"  class="nav-link">긁어먹자</a></li>
			<li class="nav-item"><a href="<c:url value="/Teachable.do"/>"  class="nav-link">알고먹자</a></li>
			</ul>
		</div>
	</div>
	


	<!-- /.container-fluid -->
</nav>
<!--  상단 메뉴 끝 -->
<form id="logoutForm" method="post" action="<c:url value='/Member/Logout.bbs'/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>
	//csrf사용시에만 아래 함수 필요
	function logout(){
		$('#logoutForm').submit();	
	}
</script>