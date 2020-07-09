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

.text-area{
	width:100%;
	border:1;
	overflow:visible;
	text-overflow:ellipsis;
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
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">회원가입</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span>
						<span>Reservation <i class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container" id='signup2'>
			<div class="row d-flex">
				<div class="col-md-12 ftco-animate makereservation p-4 p-md-5"><!--  onsubmit="return false;"  -->
					<form id="frm" enctype="multipart/form-data" action="<c:url value='/StoreSignUp.bbs'/>" method="post">
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
												<label for="">아이디</label>
												<input type="text" class="form-control" id="username" name="username" placeholder="아이디" maxlength="12">
												<div class="check_font" id="id_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">비밀번호</label> <input type="password"
													class="form-control" id="password" name="password"
													placeholder="비밀번호" maxlength="12">
												<div class="check_font" id="password_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">비밀번호확인</label> <input type="password"
													class="form-control" id="passwordok" name="passwordok"
													placeholder="비밀번호" maxlength="12">
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
													name="store_reginum" placeholder="사업자 등록번호" maxlength="10">
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
													placeholder="매장 전화번호" maxlength="12">
												<div class="check_font" id="phnum_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group">
												<label for="">매장 주소</label>
												<a onclick="addr();">
													<input type="text" class="form-control" id="store_addr" name="store_addr"
												 	placeholder="매장주소를 등록해 주세요">												 	
											 	</a>
											 		<input type="text" class="form-control" id="store_addrDetail" name="store_addrDetail"
												 	placeholder = "나머지 주소를 입력해 주세요.">
												<input type="hidden" id="store_lat" name="store_lat" value="" />
												<input type="hidden" id="store_lng" name="store_lng" value="" />
												<div class="check_font" id="addr_check"></div>
											</div>
										</div>
										<div class="col-md-offset-3 col-md-6">
											<a class="btn btn-primary py-3 px-5" data-slide="next"
												id="btnright" onclick="nullval()"
												style="color: white; float: right; cursor: pointer;">다음
												&gt;&gt;</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="container" id='signup3'>
										<div class="row justify-content-center">
											<div class="col-md-11 ftco-animate makereservation p-4 p-md-5">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<div class=" col-md-6">
																<label for="store_intro">매장 홍보글</label>
																<textarea id="store_intro" class="form-control text-area" name="store_intro" rows="20"></textarea>
																<div class="check_font" id="intro_check"></div>
															</div>
															<div class="col-md-6">
																<label for="">매장 영업시간</label>
																<textarea id="store_time" class="form-control text-area" name="store_time" rows="20"></textarea>
																<div class="check_font" id="time_check"></div>
															</div>
														</div>
													</div>
													
													<div class="col-md-12" id="signUpImg" style="margin-top: 10px;margin-bottom: 20px;">
														<div class="form-group" style="margin-top:10px;">
															<div class="col-md-8">
																<div id="preview0"></div>
															</div>
															<div class="col-md-4">
																<label for="sf_path0">가게 사진 등록</label>
																<input name="sf_path0" id="sf_path0" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" class="form-control-file inp-img">
																<div class="col-md-12 text-center" id="addBtn0">
																	<span class="badge badge-pill badge-info addInput" id="0">
																		사진 추가+
																	</span>
																</div>
															</div>
														</div>
													</div>
													
													<div class="col-md-12 text-center" style="margin-top: 10px;">
														<div class="form-group" style="width: 100%" id="signUpMenu">
															<label style="margin-top: 20px;">메뉴 등록하기</label>
															<input type="hidden" id="menu_tend0" name="menu_tend0" />
															<div id="addMenu0">
																<input type="button" class="btn btn-info addMenu" value="메뉴 추가+">
															</div>
															<div>
															<span>&nbsp;</span>
															</div>
															<div class="col-xs-12">
																<div class="col-xs-3"></div>	
																<div class="col-xs-1">
																	<!-- 중화요리-->
																	<img id='H_CS0' src="<c:url value="/resources/tend_IMG/chi_b.JPG"/>"
																		alt="J" class="img-circle img_size">
																	<div class="lb_size">중식</div>
																</div>

																<div class="col-xs-1">
																	<!-- 일식-->
																	<img id='H_JS0' src="<c:url value="/resources/tend_IMG/j_b.png"/>"
																		alt="JP" class="img-circle img_size">
																	<div class="lb_size">일식</div>
																</div>

																<div class="col-xs-1">
																	<!-- 양식-->
																	<img id='H_HS0'
																		src="<c:url value="/resources/tend_IMG/k_b.png"/>"
																		alt="H" class="img-circle img_size">
																	<div class="lb_size">한식</div>
																</div>

																<div class="col-xs-1">
																	<!-- 분식-->
																	<img id='H_BS0'
																		src="<c:url value="/resources/tend_IMG/bs_b.JPG"/>"
																		alt="BS" class="img-circle img_size">
																	<div class="lb_size">분식</div>
																</div>
																<div class="col-xs-1">
																	<!-- 분식-->
																	<img id='H_YS0'
																		src="<c:url value="/resources/tend_IMG/y_b.jpg"/>"
																		alt="Y" class="img-circle img_size">
																	<div class="lb_size">양식</div>
																</div>
															</div>
															<div class="col-xs-12">
																<div class="col-xs-1">
																	<!-- 물고기 -->
																	<img id='T_FS0'
																		src='<c:url value="/resources/tend_IMG/sutend/pesco_x.png"/>'
																		alt="F" class="img-circle img_size">
																	<div class="lb_size">생선</div>
																</div>
																<div class="col-xs-1">
																	<!-- 달걀-->
																	<img id='T_EG0'
																		src="<c:url value="/resources/tend_IMG/sutend/ovo_x.png"/>"
																		alt="E" class="img-circle img_size">
																	<div class="lb_size">달걀</div>
																</div>
																<div class="col-xs-1">
																	<!-- 우유-->
																	<img id='T_MK0'
																		src="<c:url value="/resources/tend_IMG/sutend/dairy_x.png"/>"
																		alt="M" class="img-circle img_size">
																	<div class="lb_size">우유</div>
																</div>
																<div class="col-xs-1">
																	<!-- 가금류-->
																	<img id='T_BD0'
																		src="<c:url value="/resources/tend_IMG/sutend/chicken_x.png"/>"
																		alt="B" class="img-circle img_size">
																	<div class="lb_size">가금류</div>
																</div>
																<div class="col-xs-1">
																	<!-- 돼지고기-->
																	<img id='T_PK0'
																		src="<c:url value="/resources/tend_IMG/sutend/pig_x.png"/>"
																		alt="P" class="img-circle img_size">
																	<div class="lb_size">돼지</div>
																</div>
																<div class="col-xs-1">
																	<!-- 소고기-->
																	<img id='T_CW0'
																		src="<c:url value="/resources/tend_IMG/sutend/cow_x.png"/>"
																		alt="C" class="img-circle img_size">
																	<div class="lb_size">소</div>
																</div>
																<div class="col-xs-1">
																	<!-- 땅콩-->
																	<img id='T_PE0'
																		src="<c:url value="/resources/tend_IMG/sutend/nuts_x.png"/>"
																		alt="PE" class="img-circle img_size">
																	<div class="lb_size">땅콩</div>
																</div>
																<div class="col-xs-1">
																	<!-- 각갑류-->
																	<img id='T_SF0'
																		src="<c:url value="/resources/tend_IMG/sutend/shrimp_x.png"/>"
																		alt="SF" class="img-circle img_size">
																	<div class="lb_size">갑각류</div>
																</div>
																<div class="col-xs-1">
																	<!-- 치즈-->
																	<img id='T_DP0'
																		src="<c:url value="/resources/tend_IMG/sutend/dairy_x.png"/>"
																		alt="DP" class="img-circle img_size">
																	<div class="lb_size">유제품</div>
																</div>
																<div class="col-xs-1">
																	<!-- 콩-->
																	<img id='T_SB0'
																		src="<c:url value="/resources/tend_IMG/sutend/s_x.png"/>"
																		alt="SB" class="img-circle img_size">
																	<div class="lb_size">대두</div>
																</div>
																<div class="col-xs-1" style="margin-bottom: 10px;">
																	<!-- 밀가루 -->
																	<img id='T_FL0'
																		src="<c:url value="/resources/tend_IMG/sutend/gluten_x.png"/>"
																		alt="FL" class="img-circle img_size">
																	<div class="lb_size">글루텐</div>
																</div>
															</div>
															
															
																<div class="form-group" style="width: 100%">
														<div class="col-xs-12" style="margin-top: 10px">
															<div class="col-xs-6">
																<div id="menuPreview0"></div>
															</div>
															<div class="col-xs-6">
																<div>
																	<label for="fm_path0">메뉴 사진 등록</label>
																	<input name="fm_path0" id="fm_path0" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" class="form-control-file inp-menu">
																</div>
																<div>
																	<label>메뉴 이름</label>
																	<input class="form-control" type="text" id="menu_name0" name="menu_name0">
																	<div class="check_font" id="mn_check"></div>
																</div>
																<div>
																	<label>메뉴 소개글</label>
																	<textarea class="form-control" id="menu_info0" name="menu_info0"></textarea>
																	<!-- <input class="form-control" type="text" id="menu_info0" name="menu_info0"> -->
																	<div class="check_font" id="mi_check"></div>
																</div>
																<div>
																	<label>메뉴 가격</label>
																	<input class="form-control" placeholder="숫자만 입력해 주세요." type="text" id="menu_price0" name="menu_price0">
																	<div class="check_font" id="mp_check"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- 메뉴 1개 formGroup 끝 -->
											</div>
													
													
													<div class="col-md-12 text-right" style="margin-top: 10px;">
														<div class="form-group">
															<a class="btn btn-primary py-3 px-5" href="#carousel-g" data-slide="prev" id="btnleft" style="color: white">
																&lt;&lt;이전
															</a> 
															<input type="button" value="회원가입" id="testFrm" class="btn btn-primary py-3 px-5" style="font-size: 20px;">
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
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8b4c494b923442e4a549fa1dd7f645&libraries=services"></script>

<script>
// 가게 사진 스크립트
	$(function(){
		 console.log('htmlfile 밑')
		 
	  $(document).on("click",".addInput",function(){
		 console.log("태그 추가 이벤트 들어옴")
     	 var strFlag = $(this).attr("id");
     	 console.log("id값 왔냐? = " + strFlag);
     	 if(strFlag==0){
     		 console.log("처음 추가")
     		 var innerHtml = "<div class='form-group' style='margin-top:10px;'>"
     		 	+ "<div class='col-md-8'>"
     		 	+ "<div id='preview1'></div></div>"
     		 	+ "<div class='col-md-4'>"
     		 	+ "<label for = 'sf_path1'>가게 사진 등록</label>"
     		 	+ "<input name = 'sf_path1' id = 'sf_path1' type='file' accept='.jpg,.jpeg,.png,.gif,.bmp' class='form-control-file inp-img'>"
     		 	+ "<div class='col-md-12 text-center' id= 'addBtn1'>"
     		 	+ "<span class='badge badge-pill badge-info addInput' id='1'>"
     		 	+ "사진 추가+"
     		 	+ "</span></div></div></div>"
     			 
     		 $("#signUpImg").append(innerHtml);
     		 $("#addBtn0").html("");
     	 }
     	 else if(strFlag==1){
     		 console.log("2번째 추가 끝")
     		 var innerHtml = "<div class='form-group' style='margin-top:10px;'>"
     		 	+ "<div class='col-md-8'>"
     		 	+ "<div id='preview2'></div></div>"
     		 	+ "<div class='col-md-4'>"
     		 	+ "<label for = 'sf_path2'>가게 사진 등록</label>"
     		 	+ "<input name = 'sf_path2' id = 'sf_path2' type='file' accept='.jpg,.jpeg,.png,.gif,.bmp' class='form-control-file inp-img'>"
     		 	+ "</div></div>"
     		 $("#signUpImg").append(innerHtml);
     		$("#addBtn1").html("");
     	 }  
      })
      // 인풋박스 끝
		
		
	})
	
	 var storeIndex;

   $(document).on("change",".inp-img",function() {
       console.log("this 찍어봄   " + this);
       console.log("this.id 찍어봄   " + this.id);
       console.log("this.name 찍어봄   " + this.name);
       storeIndex = this.id.charAt(this.id.length-1);
       console.log("storeIndex는? " + storeIndex)
       readInputFile(this);
       //등록 이미지 등록 미리보기
       function readInputFile(input) {
          console.log('미리 보기 시작')
          if (input.files && input.files[0]) {
             var reader = new FileReader();
             console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
             console.log('id 찍어봄    ' + input.id);
             console.log('name 찌거봄    ' + input.name);
             reader.onload = function(e) {
                $("#preview" + storeIndex)
                      .html(
                            "<a href=\"javascript:void(0);\" onclick=\"deleteImage3()\" id=\"'storeImg_id"
                                  + storeIndex
                                  + "\"'><img src="
                                  + e.target.result
                                  + " style='width:100%;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
             }
             reader.readAsDataURL(input.files[0]);
          }
       }
   })

   // 등록 이미지 삭제 ( input file reset )
   var resetInputFile = function($input, $preview) {
      console.log('사진 클릭해서 지움')

      var agent = navigator.userAgent.toLowerCase();
      if ((navigator.appName == 'Netscape' && navigator.userAgent
            .search('Trident') != -1)
            || (agent.indexOf("msie") != -1)) {
         // ie 일때
         $input.replaceWith($input.clone(true));
         $preview.empty();
      } else {
         //other
         $input.val("");
         $preview.empty();
      }
   }

   var deleteImage3 = function() {
      console.log(storeIndex + "콘솔로 인덱스 찍기")
      var img_id = "#storeImg_id" + storeIndex;
      $(img_id).remove();
      var $input = $("#sf_path" + storeIndex);
      var $preview = $("#preview" + storeIndex);
      console.log("지운 사진 id?  " + img_id)
      console.log("지운 사진 input?  " + $input)
      console.log("지운 사진 preview?  " + $preview)
      resetInputFile($input, $preview);
   }
   // 가게 사진 추가 스크립트 끝
   
   
   $(document).on("click","#testFrm",function(){
	    var i;
	    var $menuImgId;
	    var $stImgId;
	    var submitCheck = 0;
		console.log("storeIndex 테스트 = "+storeIndex);
		for(i=0;i<3;i++){			
			// var fileCheck1 = document.getElementById("#sf_path"+i);
			 $stImgId = $("#sf_path"+i);
			if($stImgId.val()==""){
				// 파일 등록 X
				alert("가게 사진 등록은 필수입니다!");
				// fileCheck1.focus();
				$stImgId.focus();
				submitCheck=1;
				return;
			}
			else{
				// 파일 등록 O
				console.log("가게쪽 파일 등록 O"+i+"번째")
				continue;
			}
		}
	
		if(submitCheck==1){
			return false;
		}
		else{
			
			$("#frm").submit();	
		}
		
   })
   // 가입 신청 직전 이미지들 null 방지 체크
   
</script>

<script>
// 메뉴 태그 추가 이벤트 스크립트
$(document).on("click",".addMenu",function(){
	 console.log("메뉴등록 태그 추가 이벤트 들어옴")
	 var menuFlag = this.id.charAt(this.id.length-1);
	 console.log("id값 왔냐? = " + menuFlag + " / 타입? = "+typeof menuFlag);
	 menuFlag= Number(menuFlag);
	 menuFlag= menuFlag+1;
	 console.log("menuFlag 숫자변환 시도 "+ typeof menuFlag+ " / 값은? =" +menuFlag);
	 
	 var innerHtml = "<label style='margin-top:20px;'>메뉴 등록하기</label>"
		+ "<input type='hidden' id='menu_tend"+menuFlag+"' name='menu_tend"+menuFlag+"'/>"
	 	+ "<div id='addMenu"+menuFlag+"'>"
	 	+ "<input type='button' class='btn btn-info addMenu' id='addMenu"+menuFlag+"' value='메뉴 추가+'>"
	 	+ "</div><div><span>&nbsp;</span></div>"
	 	+ "<div class='col-xs-12'>"
	 	+ "<div class='col-xs-3'></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='H_CS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/chi_b.JPG'/>' alt='J' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>중식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='H_JS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/j_b.png'/>' alt='JP' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>일식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='H_HS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/k_b.png'/>' alt='H' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>한식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='H_BS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/bs_b.JPG'/>' alt='BS' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>분식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='H_YS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/y_b.jpg'/>' alt='Y' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>양식</div></div></div>"
	 	+ "<div class='col-xs-12'>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_FS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/pesco_x.png'/>' alt='F' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>생선</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_EG"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/ovo_x.png'/>' alt='E' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>달걀</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_MK"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/dairy_x.png'/>' alt='M' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>우유</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_BD"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/chicken_x.png'/>' alt='B' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>가금류</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_PK"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/pig_x.png'/>' alt='P' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>돼지</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_CW"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/cow_x.png'/>' alt='C' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>소</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_PE"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/nuts_x.png'/>' alt='PE' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>땅콩</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_SF"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/shrimp_x.png'/>' alt='SF' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>갑각류</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_DP"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/dairy_x.png'/>' alt='DP' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>유제품</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_SB"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/s_x.png'/>' alt='SB' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>대두</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='T_FL"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/gluten_x.png'/>' alt='FL' class='img-circle img_size'>"
	 	+ "<div class='lb_size'>글루텐</div></div></div>"
	 	+ "<div class'form-group' style='width:100%;'>"
	 	+ "<div class='col-xs-12' style='margin-top:10px'>"
	 	+ "<div class='col-xs-6'>"
	 	+ "<div id='menuPreview"+menuFlag+"'></div></div>"
	 	+ "<div class='col-xs-6'><div><label for='fm_path"+menuFlag+"'>메뉴 사진 등록</label>"
	 	+ "<input name='fm_path"+menuFlag+"' id='fm_path"+menuFlag+"' type='file' accept='.jpg,.jpeg,.png,.gif,.bmp' class='form-control-file inp-menu'>"
	 	+ "</div><div><label>메뉴 이름</label>"
	 	+ "<input name='menu_name"+menuFlag+"' id='menu_name"+menuFlag+"' type='text' class='form-control'>"
	 	+ "<div class='check_font' id='mn_check"+menuFlag+"'></div></div>"
	 	+ "<div><label>메뉴 소개글</label>"
	 	+ "<textarea class='form-control' id='menu_info"+menuFlag+"' name='menu_info"+menuFlag+"'></textarea>"
	 	+ "<div class='check_font' id='mi_check"+menuFlag+"'></div></div>"
	 	+ "<div><label>메뉴 가격</label>"
	 	+ "<input class='form-control' placeholder='숫자만 입력해 주세요.' type='text' id='menu_price"+menuFlag+"' name='menu_price"+menuFlag+"'>"
	 	+ "<div class='check_font' id='mp_check"+menuFlag+"'></div></div></div></div></div>"
	 	
	 $("#signUpMenu").append(innerHtml);
	if(menuFlag==1){
	 	$("#addMenu0").html("");
	}
	else{
		menuFlag = Number(menuFlag);
		menuFlag= menuFlag-1;
		var $addMenu = $("#addMenu" + menuFlag);
		$addMenu.html("");
	}
 	
 	})
 	// 메뉴 인풋박스 끝
	
 	 var menuIndex;

   $(document).on("change",".inp-menu",function() {
       console.log("this 찍어봄   " + this);
       console.log("this.id 찍어봄   " + this.id);
       console.log("this.name 찍어봄   " + this.name);
       menuIndex = this.id.charAt(this.id.length-1);
       console.log("storeIndex는? " + menuIndex)
       readInputFile(this);
       //등록 이미지 등록 미리보기
       function readInputFile(input) {
          console.log('미리 보기 시작')
          if (input.files && input.files[0]) {
             var reader = new FileReader();
             console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
             console.log('id 찍어봄    ' + input.id);
             console.log('name 찌거봄    ' + input.name);
             reader.onload = function(e) {
                $("#menuPreview" + menuIndex)
                      .html(
                            "<a href=\"javascript:void(0);\" onclick=\"deleteImage2()\" id=\"'foodImg_id"
                                  + menuIndex
                                  + "\"'><img src="
                                  + e.target.result
                                  + " style='width:100%;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
             }
             reader.readAsDataURL(input.files[0]);
          }
       }
   })

   // 등록 이미지 삭제 ( input file reset )
   var resetInputFile = function($input, $preview) {
      console.log('사진 클릭해서 지움')

      var agent = navigator.userAgent.toLowerCase();
      if ((navigator.appName == 'Netscape' && navigator.userAgent
            .search('Trident') != -1)
            || (agent.indexOf("msie") != -1)) {
         // ie 일때
         $input.replaceWith($input.clone(true));
         $preview.empty();
      } else {
         //other
         $input.val("");
         $preview.empty();
      }
   }

   var deleteImage2 = function() {
      console.log(menuIndex + "콘솔로 인덱스 찍기")
      var img_id = "#foodImg_id" + menuIndex;
      $(img_id).remove();
      var $input = $("#fm_path" + menuIndex);
      var $preview = $("#menuPreview" + menuIndex);
      console.log("지운 사진 id?  " + img_id)
      console.log("지운 사진 input?  " + $input)
      console.log("지운 사진 preview?  " + $preview)
      resetInputFile($input, $preview);
   }
 	
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
$(document).on("click",".img-circle",function(){
	console.log(this)
  	console.log("this 찍어봄   " + this);
    console.log("this.id 찍어봄   " + this.id);
    
	var tendFlag = this.id;
	console.log("tendFlag에 아이디 담음 = "+tendFlag);
	console.log("타입 ? = "+typeof tendFlag)
	
	tendFlag = tendFlag.charAt(tendFlag.length-1);
	
	tendFlag = Number(tendFlag);
	console.log("tendFlag 바꿔봄 = "+tendFlag);	
	
	var ertend_codes=['FS'+tendFlag,'EG'+tendFlag,'MK'+tendFlag,'BD'+tendFlag,'PK'+tendFlag,'CW'+tendFlag,'PE'+tendFlag,
					'SF'+tendFlag,'DP'+tendFlag,'FL'+tendFlag,'SB'+tendFlag,'CS'+tendFlag,'JS'+tendFlag,'HS'+tendFlag,'BS'+tendFlag,'YS'+tendFlag];
	console.log("ertend_codes 찍어봄 = "+ertend_codes);
	
	ertend_codes.forEach(function(ele,index){
		$(document).on("click","#T_"+ele,function(){
			var eles = document.getElementById('menu_tend'+tendFlag).value
			if($('#T_'+ele).attr('src').includes('_x')){
				console.log('여기')
				$('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_x","_o"));
					
					if(eles.indexOf(ele)==-1){
						eles+=ele;
					    $('#menu_tend'+tendFlag).attr('value',eles+',');
					}
					else{
						eles+='';
						$('#menu_tend'+tendFlag).attr('value',eles);
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
					$('#menu_tend'+tendFlag).attr('value',a);
				}
			}
		})
		$(document).on("click","#H_"+ele,function(){
			var eles = document.getElementById('menu_tend'+tendFlag).value
			if($('#H_'+ele).attr('src').includes('_b')){
				console.log('여기')
				$('#H_'+ele).attr('src',$('#H_'+ele).attr('src').toString().replace("_b","_c"));
					
					if(eles.indexOf(ele)==-1){
						eles+=ele;
					    $('#menu_tend'+tendFlag).attr('value',eles+',');
					}
					else{
						eles+='';
						$('#menu_tend'+tendFlag).attr('value',eles);
					}
			}
			else {
				$('#H_'+ele).attr('src',$('#H_'+ele).attr('src').toString().replace("_c","_b"));
				
				if(eles.indexOf(ele)==-1){
					console.log('여기1')
				}
				else{
					console.log('여기2')
					var a=eles.replace(ele+',','')
					$('#menu_tend'+tendFlag).attr('value',a);
				}
			}
		})
	});
	
})

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
		var idJ =  /^[a-z]+[a-z0-9]{5,12}$/;
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
				console.log(data)
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
							$('#id_check').text("소문자와 숫자 조합 5~12자리까지 가능합니다");
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
$("#passwordok").blur(function() {
	if (passwordok==""){
		$('#passwordok_check').text('비밀번호를 확인해주세요')
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
		else if (email.indexOf('@')==-1){
			$('#email_check').text('이메일 형식이 아닙니다.');
			$('#email_check').css('color', 'red');
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
			$('#reginum_check').text('사업자 등록번호 형식이 아닙니다.');
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
	var addrs=$("#store_addr").val();
	if(username=='' || password==''|| passwordok=='' || email=='' || reginum=='' || store_name=='' || store_phnum=='' || addrs==''){
		if(username==""){$('#username').focus()}
		
		else if(password==""){$('#password').focus()}
		
		else if(passwordok==""){$('#passwordok').focus()}
		
		else if(email==""){$('#store_email').focus()}
		
		else if(reginum==""){$('#store_reginum').focus()}
		
		else if(store_name==""){$('#store_name').focus()}
		
		else if(store_phnum==""){$('#store_phnum').focus()}
		
		else {
			console.log("주소 오류에 들어옴")
			$('#addr_check').text("주소를 등록하세요")
			$('#addr_check').css('color', 'red');
		}		
	}
	
	else{
		console.log("다음 버튼 눌러서 모달 띄우기 직전")
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