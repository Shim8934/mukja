<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


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

.lb_size {
	width: 50px;
	background-color: white;
	border: 2px #66B9E3 solid;
	border-radius: 5px;
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px;
	background-color: rgb(255, 255, 255);
	margin-top: 5px;
	text-align: center;
}

.wrapper {
	padding-top: 10px;
	padding-left: 10px;
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
		<div class="container" id='signup2'>
			<div class="row d-flex">
				<div class="col-md-12 ftco-animate makereservation p-4 p-md-5">
					<form id="frm" action="<c:url value='/StoreSignUp.bbs'/>"
						method="post" onsubmit="return false;">
						<input hidden="hidden" />
						<!-- 카라셀 -->
						<div id="carousel-g" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<div class="row">
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group" id="input">
												<label for="">아이디</label> <input type="text"
													class="form-control" id="username" name="username"
													placeholder="아이디">
												<div class="check_font" id="id_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">비밀번호</label> <input type="password"
													class="form-control" id="password" name="password"
													placeholder="비밀번호">
												<div class="check_font" id="password_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">비밀번호확인</label> <input type="password"
													class="form-control" id="passwordok" name="passwordok"
													placeholder="비밀번호">
												<div class="check_font" id="passwordok_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">이메일</label> <input type="email"
													class="form-control" id="store_email" name="store_email"
													placeholder="이메일">
												<div class="check_font" id="email_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">사업자 등록번호</label> <input type="text"
													class="form-control" id="store_reginum"
													name="store_reginum" placeholder="사업자 등록번호">
												<div class="check_font" id="reginum_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">매장 명</label> <input type="text"
													class="form-control" id="store_name" name="store_name"
													placeholder="매장 명">
												<div class="check_font" id="name_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6"
											style="padding-top: 10px;">
											<div class="form-group">
												<label for="">매장 전화번호</label> <input type="text"
													class="form-control" id="store_phnum" name="store_phnum"
													placeholder="매장 전화번호">
												<div class="check_font" id="phnum_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">매장 주소</label> <a onclick="addr();"><input
													type="text" class="form-control" id="store_addr"
													name="store_addr" placeholder="매장주소를 등록해주세요"></a> 
													<input type="text" id="store_lat" name="store_lat" value=""/> 
													<input type="text" id="store_lng" name="store_lng" value=""/>
												<div class="check_font" id="addr_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<a class="btn btn-primary py-3 px-5"
												data-slide="next" id="btnright" onclick="nullval()"
												style="color: white; float: right; cursor: pointer;">다음 &gt;&gt;</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="container" id='signup3'>
										<div class="row d-flex">
											<div
												class="col-md-11 ftco-animate makereservation p-4 p-md-5">
												<div class="row">
													<div class="form-group">
														<div class="cal-md-offset-4 cal-md-8">
															<label for="">매장 홍보글</label>
															<textarea id="summernote" name="store_intro"></textarea>
															<div class="check_font" id="intro_check"></div>
														</div>
													</div>
													<div class="form-group" style="width: 100%">
														<div class="cal-md-offset-4 cal-md-8">
															<label for="">매장 영업시간</label> <span
																class="ion-ios-arrow-down" id="img"></span>
															<textarea id="summernote1" name="store_time"></textarea>
															<div class="check_font" id="time_check"></div>
														</div>
													</div>
													<div class="form-group" style="width: 100%">
														<div class="cal-md-offset-4 cal-md-8">
															<label for="">메뉴 등록하기</label> <span
																class="ion-ios-arrow-down" id="img"></span> <input
																type="hidden" id="menu_tend" name="menu_tend" />


															<div class="col-xs-12">

																<div class="col-xs-1">
																	<!-- 물고기 -->
																	<img id='T_FS'
																		src='<c:url value="/resources/tend_IMG/sutend/pesco_x.png"/>'
																		alt="F" class="img-circle img_size">
																	<div class="lb_size">생선</div>
																</div>
																<div class="col-xs-1">
																	<!-- 달걀-->
																	<img id='T_EG'
																		src="<c:url value="/resources/tend_IMG/sutend/ovo_x.png"/>"
																		alt="E" class="img-circle img_size">
																	<div class="lb_size">달걀</div>
																</div>
																<div class="col-xs-1">
																	<!-- 우유-->
																	<img id='T_MK'
																		src="<c:url value="/resources/tend_IMG/sutend/dairy_x.png"/>"
																		alt="M" class="img-circle img_size">
																	<div class="lb_size">우유</div>
																</div>
																<div class="col-xs-1">
																	<!-- 가금류-->
																	<img id='T_BD'
																		src="<c:url value="/resources/tend_IMG/sutend/chicken_x.png"/>"
																		alt="B" class="img-circle img_size">
																	<div class="lb_size">가금류</div>
																</div>
																<div class="col-xs-1">
																	<!-- 돼지고기-->
																	<img id='T_PK'
																		src="<c:url value="/resources/tend_IMG/sutend/pig_x.png"/>"
																		alt="P" class="img-circle img_size">
																	<div class="lb_size">돼지</div>
																</div>
																<div class="col-xs-1">
																	<!-- 소고기-->
																	<img id='T_CW'
																		src="<c:url value="/resources/tend_IMG/sutend/cow_x.png"/>"
																		alt="C" class="img-circle img_size">
																	<div class="lb_size">소</div>
																</div>
																<div class="col-xs-1">
																	<!-- 땅콩-->
																	<img id='T_PE'
																		src="<c:url value="/resources/tend_IMG/sutend/nuts_x.png"/>"
																		alt="PE" class="img-circle img_size">
																	<div class="lb_size">땅콩</div>
																</div>
																<div class="col-xs-1">
																	<!-- 각갑류-->
																	<img id='T_SF'
																		src="<c:url value="/resources/tend_IMG/sutend/shrimp_x.png"/>"
																		alt="SF" class="img-circle img_size">
																	<div class="lb_size">갑각류</div>
																</div>
																<div class="col-xs-1">
																	<!-- 치즈-->
																	<img id='T_DP'
																		src="<c:url value="/resources/tend_IMG/sutend/dairy_x.png"/>"
																		alt="DP" class="img-circle img_size">
																	<div class="lb_size">유제품</div>
																</div>
																<div class="col-xs-1">
																	<!-- 콩-->
																	<img id='T_SB'
																		src="<c:url value="/resources/tend_IMG/sutend/s_x.png"/>"
																		alt="SB" class="img-circle img_size">
																	<div class="lb_size">대두</div>
																</div>
																<div class="col-xs-1" style="margin-bottom: 10px;">
																	<!-- 밀가루 -->
																	<img id='T_FL'
																		src="<c:url value="/resources/tend_IMG/sutend/gluten_x.png"/>"
																		alt="FL" class="img-circle img_size">
																	<div class="lb_size">글루텐</div>
																</div>
															</div>
														</div>
														<div class="form-group" style="width: 100%">

															<div>
																<label>메뉴 이름</label> <input class="form-control"
																	type="text" id="menu_name" name="menu_name">
																<div class="check_font" id="mn_check"></div>
															</div>
															<div>
																<label>메뉴 소개글</label> <input class="form-control"
																	type="text" id="menu_info" name="menu_info">
																<div class="check_font" id="mi_check"></div>
															</div>
															<div>
																<label>메뉴 가격</label> <input class="form-control"
																	type="text" id="menu_price" name="MENU_price">
																<div class="check_font" id="mp_check"></div>
															</div>

														</div>
														<div class="form-group">
															<a class="btn btn-primary py-3 px-5" href="#carousel-g"
																data-slide="prev" id="btnleft" style="color: white">&lt;&lt;
																이전</a> <input type="submit" value="회원가입"
																class="btn btn-primary py-3 px-5"
																style="font-size: 20px; float: right;">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8b4c494b923442e4a549fa1dd7f645&libraries=services"></script>
	<script><!--섬머노트 생성 js-->
	$('#summernote').summernote({
		placeholder: '가게 소개를 적어주세요',
		tabsize: 2,
		height: 300
	})
		$('#summernote1').summernote({
			placeholder: '영업시간을 적어주세요',
			tabsize: 2,
			height: 150
		})		
	</script>
	<script type="text/javascript">
$(".note-insert").empty();
$(".note-view").empty();
</script>
	<script><!--주소를 좌표로 변환하는 js-->
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
                document.getElementById("store_addr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        document.getElementById("store_lat").value = result.y;
                        document.getElementById("store_lng").value = result.x;
                    }
                });
            }
        }).open({
	        left: (window.screen.width/2)-(width / 2),
	        top: (window.screen.height/2)-(height / 2)
	    });
    }
</script>
	<script><!--첨가된 음식종류 js-->
var ertend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
ertend_codes.forEach(function(ele,index){
		$('#T_'+ele).click(function() {
			var eles = document.getElementById('menu_tend').value
			if($('#T_'+ele).attr('src').includes('_x')){
				console.log('여기')
				$('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_x","_o"));
					
					if(eles.indexOf(ele)==-1){
						eles+=ele;
					    $('#MENU_TEND').attr('value',eles+',');
					}
					else{
						eles+='';
						$('#MENU_TEND').attr('value',eles);
					}
			}
			else {
				$('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_o","_x"));
				
				if(eles.indexOf(ele)==-1){
					console.log('여기1')
				}
				else{
					console.log('여기2')
					var a=eles.replace(ele+',','')
					$('#MENU_TEND').attr('value',a);
				}
			}
		})
});
</script>
	<script><!-- 캐러셀-->
	$('.carousel').carousel({
		  interval:false,
		  wrap:false
		})
	</script>

<script><!--유효성 검사 하기-->
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/;
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{6,12}$/; 
		// 이메일 검사 정규식
		var mailJ = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		// 사업자 등록번호 정규식
		var regJ = /^[0-9]{1,10}$/;
		// 전화번호 정규식
		var numJ = /^[0-9]{1,12}$/;
		
	
	
		
		
		
// 		id 유효성 검사 하기
var username = $('#username').val();
		$('#username').keyup(function() {
		username = $('#username').val();
		$.ajax({
			url : "<c:url value='/idCheck.bbs'/>",
			data:  {"username":username},
			dataType: 'json',
			success : function(data) {			
				if (data==1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
					} 
				else {
						if(idJ.test(username)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
						} 
						else {
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$('#id_check').css('color', 'red');	
						}
					}
				}, error : function() {console.log("실패");}
		});
	});
$("#username").blur(function() {	
if (username==""){
	$('#id_check').text('아이디를 입력해주세요')
	$('#id_check').css('color', 'red');
}
});	
// 비밀번호 검사 하기
var password=$("#password").val();
$("#password").keyup(function() {
	password=$("#password").val();
		if(pwJ.test(password)){
			$('#password_check').text("")
		} 
		else{
			$('#password_check').text('숫자나 문자로 6~12자리  입력해주세요')
			$('#password_check').css('color', 'red');
		}	
});
$("#password").blur(function() {
	if (password==""){
		$('#password_check').text('비밀번호를 입력해주세요')
		$('#password_check').css('color', 'red');
	}
});
var passwordok= $('#passwordok').val();
$("#passwordok").keyup(function() {	
	passwordok = $(this).val();
		if(password == passwordok){ 
			$('#passwordok_check').text("") 
			} 
		else{
			$('#passwordok_check').text('비밀번호가 일치 하지 않습니다.')
			$('#passwordok_check').css('color', 'red');
		}	
});

// 이메일 검사 하기
var email = $("#store_email").val();
$("#store_email").keyup(function() {
		email = $("#store_email").val();
		if(mailJ.test(email)){
			$('#email_check').text("") 
		}
		else{
			$('#email_check').text('이메일 형식이 아닙니다.');
			$('#email_check').css('color', 'red');
		}	
});
$("#store_email").blur(function() {	
	if (email==""){
		$('#email_check').text('이메일을 입력해주세요');
		$('#email_check').css('color', 'red');
	}else{
		$('#email_check').text("") 
	}
});


//사업자 등록번호 검사 하기
var reginum=$("#store_reginum").val();
$("#store_reginum").keyup(function() {
	reginum=$("#store_reginum").val();
		if(regJ.test(reginum)){ 
			$('#reginum_check').text("")
		}
		else{
			$('#reginum_check').text('숫자를 입력해주세요');
			$('#reginum_check').css('color', 'red');
		}
		
		if(reginum.length>10){
			console.log("여기")
			var result = reginum.substring(0, 10)
			$("#store_reginum").val(result);
			$('#reginum_check').text('사업자 등록번호는 10자리입니다.');
			$('#reginum_check').css('color', 'red');
		}		
});

$("#store_reginum").blur(function() {	
	if(reginum==""){
		$('#reginum_check').text('사업자 등록번호를 입력해주세요');
		$('#reginum_check').css('color', 'red');
	}
	else if(reginum.length<10){
		$('#reginum_check').text('사업자 등록번호는 10자리입니다.');
		$('#reginum_check').css('color', 'red');
	}
	else{
		$('#reginum_check').text("")
	}
	
});

//가게이름 검사하기
var store_name=$("#store_name").val();
$("#store_name").keyup(function() {
	store_name=$("#store_name").val();
	if (store_name==""){
		$('#name_check').text('매장 명을 입력해주세요')
		$('#name_check').css('color', 'red');
	}
	else{
		$('#name_check').text("")
	}
});
$("#store_name").blur(function() {
	if (store_name==""){
		$('#name_check').text('매장 명을 입력해주세요')
		$('#name_check').css('color', 'red');
	}
});

//매장연락처 검사하기
var store_phnum=$("#store_phnum").val();
$("#store_phnum").keyup(function() {
	store_phnum=$("#store_phnum").val();
	if (numJ.test(store_phnum)){
		$('#phnum_check').text('')
	}
	else if(store_phnum==""){
		$('#phnum_check').text('매장 전화번호를 입력해주세요')
		$('#phnum_check').css('color', 'red');
	}
	else if(store_phnum.length>12){
		$('#phnum_check').text("전화번호 형식이 아닙니다.")
		$('#phnum_check').css('color', 'red');
		}
	else{
		$('#phnum_check').text("숫자만 입력해주세요")
		$('#phnum_check').css('color', 'red');
	}
});
$("#store_phnum").blur(function() {
	if (store_phnum==""){
		$('#phnum_check').text('매장 전화번호을 입력해주세요')
		$('#phnum_check').css('color', 'red');
	}
	else if (store_phnum.length<12){
		$('#phnum_check').text("전화번호 형식이 아닙니다.")
		$('#phnum_check').css('color', 'red');
	}
});

function nullval() {
	if(username=='' || password=='' || email=='' || reginum=='' || store_name=='' || store_phnum=='' || store_addr=='' || passwordok==''){
		console.log('여기')
	}
	else{
		$('#btnright').attr('href','#carousel-g');
	}
}	
</script>





<script>
	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	}, true);
</script>
</body>
</html>