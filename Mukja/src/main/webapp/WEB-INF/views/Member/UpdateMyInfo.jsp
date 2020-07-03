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
					<h1 class="mb-2 bread">내 정보 수정</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home<i
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
										placeholder="이메일" value="${userInfo.username}" />
									<div></div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">비밀번호</label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="비밀번호" value="${userInfo.password}" />
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
										placeholder="닉네임" value="${userInfo.u_nick}">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group" style="width: 100%; height: 70%">
									<label>성별</label>
									<div style="width: 100%; height: 100%; margin-bottom: 10px;">
										<label class="box-radio-input"
											style="width: 49%; height: 100%;"> <input
											type="radio" name="gender" value="man"
											checked>
											<span style="">남자</span>
										</label> <label class="box-radio-input"
											style="width: 49%; height: 100%;"> <input
											type="radio" name="gender" value="woman"> <span
											style="width: 100%; height: 100%;"
											>여자</span>
										</label>
									</div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6" style="padding-top: 10px;">
								<div class="form-group">
									<label for="">연락처</label> <input type="text"
										class="form-control" id="u_ph" name="u_ph" placeholder="연락처"
										value="${userInfo.u_ph}">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="">연령대</label>
									<div class="select-wrap one-third">
										<select name="u_age" id="u_age" class="form-control">
											<option value=${myInfo.u_age}>연령대를 선택하세요</option>
											<option value="10"
												<c:if test="${userInfo.u_age=='10'}">selected</c:if>>10~19세</option>
											<option value="20"
												<c:if test="${userInfo.u_age=='20'}">selected</c:if>>20~29세</option>
											<option value="30"
												<c:if test="${userInfo.u_age=='30'}">selected</c:if>>30~39세</option>
											<option value="40"
												<c:if test="${userInfo.u_age=='40'}">selected</c:if>>40~49세</option>
											<option value="50"
												<c:if test="${userInfo.u_age=='50'}">selected</c:if>>50~59세</option>
											<option value="60"
												<c:if test="${userInfo.u_age=='60'}">selected</c:if>>60~69세</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
                        <div class="form-group">
                           <label for="">골라먹자 필터 지정하기</label> <span
                              class="ion-ios-arrow-down" id="img"></span>

                        </div>
                        <div class="col-md-12 trs" style="display: none;">
                           <div class="wrapper" style="text-align: center;">
                              <div>
                                 <!-- 물고기 -->
                                 <img id='T_FS'
                                    src='<c:url value="/resources/tend_IMG/sutend/pesco_o.png"/>'
                                    alt="F" class="img-circle img_size">
                                 <div class="lb_size">생선</div>
                              </div>
                              <div>
                                 <!-- 달걀-->
                                 <img id='T_EG'
                                    src="<c:url value="/resources/tend_IMG/sutend/ovo_o.png"/>"
                                    alt="E" class="img-circle img_size">
                                 <div class="lb_size">달걀</div>
                              </div>
                              <div>
                                 <!-- 우유-->
                                 <img id='T_MK'
                                    src="<c:url value="/resources/tend_IMG/sutend/dairy_o.png"/>"
                                    alt="M" class="img-circle img_size">
                                 <div class="lb_size">우유</div>
                              </div>
                              <div>
                                 <!-- 가금류-->
                                 <img id='T_BD'
                                    src="<c:url value="/resources/tend_IMG/sutend/chicken_o.png"/>"
                                    alt="B" class="img-circle img_size">
                                 <div class="lb_size">가금류</div>
                              </div>

                              <div>
                                 <!-- 돼지고기-->
                                 <img id='T_PK'
                                    src="<c:url value="/resources/tend_IMG/sutend/pig_o.png"/>"
                                    alt="P" class="img-circle img_size">
                                 <div class="lb_size">돼지</div>
                              </div>

                              <div>
                                 <!-- 소고기-->
                                 <img id='T_CW'
                                    src="<c:url value="/resources/tend_IMG/sutend/cow_o.png"/>"
                                    alt="C" class="img-circle img_size">
                                 <div class="lb_size">소</div>
                              </div>
                           </div>
                           <div class="wrapper" style="text-align: center;">
                              <div>
                                 <!-- 땅콩-->
                                 <img id='T_PE'
                                    src="<c:url value="/resources/tend_IMG/sutend/nuts_o.png"/>"
                                    alt="PE" class="img-circle img_size">
                                 <div class="lb_size">땅콩</div>
                              </div>
                              <div>
                                 <!-- 각갑류-->
                                 <img id='T_SF'
                                    src="<c:url value="/resources/tend_IMG/sutend/shrimp_o.png"/>"
                                    alt="SF" class="img-circle img_size">
                                 <div class="lb_size">갑각류</div>
                              </div>
                              <div>
                                 <!-- 치즈-->
                                 <img id='T_DP'
                                    src="<c:url value="/resources/tend_IMG/sutend/dairy_o.png"/>"
                                    alt="DP" class="img-circle img_size">
                                 <div class="lb_size">유제품</div>
                              </div>
                              <div>
                                 <!-- 콩-->
                                 <img id='T_SB'
                                    src="<c:url value="/resources/tend_IMG/sutend/s_o.png"/>"
                                    alt="SB" class="img-circle img_size">
                                 <div class="lb_size">대두</div>
                              </div>
                              <div>
                                 <!-- 밀가루 -->
                                 <img id='T_FL'
                                    src="<c:url value="/resources/tend_IMG/sutend/gluten_o.png"/>"
                                    alt="FL" class="img-circle img_size">
                                 <div class="lb_size">글루텐</div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-offset-3 col-md-6">
                     <div class="form-group">
                        <div>
                           <input type="hidden" id="menu_tend" name="menu_tend" />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-offset-3 col-md-6">
                     <div class="form-group">
                        <input type="submit" value="회원정보 수정" class="btn btn-primary py-3 px-5"
                           style="width: 100%; height: 100%; font-size: 20px;">
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
                document.getElementById("u_addr").value = addr;
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
	<script><!--첨가된 음식종류 js-->
		var ertend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
		ertend_codes.forEach(function(ele,index){
		      $('#T_'+ele).click(function() {
		         var eles = document.getElementById('menu_tend').value
		         if($('#T_'+ele).attr('src').includes('_o')){
		            console.log('여기') $('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_o","_x"));
		               
		               if(eles.indexOf(ele)==-1){
		                  eles+=ele;
		                   $('#menu_tend').attr('value',eles+',');
		               }
		               else{
		                  eles+='';
		                  $('#menu_tend').attr('value',eles);
		               }
		         }
		         else {
		            $('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_x","_o"));
		            
		            if(eles.indexOf(ele)==-1){
		               console.log('여기1')
		            }
		            else{
		               console.log('여기2')
		               var a=eles.replace(ele+',','')
		               $('#menu_tend').attr('value',a);
		            }
		         }
		      })
		});
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
      
   
   
      
      
      
//       id 유효성 검사 하기
var username = $('#username').val();
      $('#username').keyup(function() {
      username = $('#username').val();
      $.ajax({
         url : "",
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
<script>
var dice;
var sss;
function mail() {
   
   var username = $("#username").val();
   console.log(username)
   $.ajax({
      url : "<c:url value='/mailCheck.bbs'/>",
      type: "POST",
      data:  {"username":username},
      dataType: 'json',
      success : function(data) {
         alert("인증메일이 전송되었습니다!")
         dice = data.dice;
         var mm=1;
         var ss=2;
      var conter=setInterval(function(){
            
            var time_text = mm+':'+ss+'초';
            $("#dice_check").text(time_text);
            $("#dice_check").css('color','red');
            ss--;
            if(ss==0){
               
               if(mm < 1){
                  mm=0;
                  if(ss==0){
                     
                     $("#dice_check").text("");
                     if($("#dice_check").val()==""){
                        clearInterval(conter);
                     }
                     
                  }
               }
               else{
                  mm--;
               }
               
               ss=5;
            }
            if(ss<=9){
               ss = '0'+ss;
            }
            
         },1000);
      }, error : function() {console.log("실패");}      
})
}


var suc;
$("#btn_dice").click(function(){
   console.log("인증번호 확인버튼 누름");
   if(dice==$("#dice").val()){
      alert('성공');
      suc =1;
   }
});


</script>
</body>
</html>