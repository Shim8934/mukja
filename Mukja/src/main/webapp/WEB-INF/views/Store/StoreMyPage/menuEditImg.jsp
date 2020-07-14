<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/mukja/resources/bootstrap/images/dessert-2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">메뉴 정보 수정!</h1>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Edit FoodMenu</span>
				<h2 class="mb-4">음식 정보 수정</h2>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row justify-content-center"  style="border: 1px solid gray;">
				<div class="col-md-11 ftco-animate makereservation p-4 p-md-5 fadeInUp ftco-animated">
				<form action="<c:url value='/StoreMypage/editImgPop2.do'/>" id="editFoodMenuSt" enctype="multipart/form-data" method="post">
				<div id="editMenu">
				<c:forEach items="${editFoodMenu}" var="menuList" varStatus="loop">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top: 10px;">
							<div class="form-group" style="width: 100%" >
								<label style="margin-top: 20px;">${loop.index+1}번 메뉴 수정하기</label>
								<input type="hidden" id="menu_no${loop.index}" name="menu_no${loop.index }" value="${menuList.menu_no}">
								<input type="hidden" id="orimenu_tend${loop.index}" class="tendMust" name="orimenu_tend${loop.index }" value="${menuList.menu_tend}">
								<input type="hidden" id="menu_tend${loop.index}" class="tendMust" name="menu_tend${loop.index }">								
								<div>
									<span>&nbsp;</span>
								</div>
								<div class=""></div>
								<div class="col-xs-12">
									<div class="col-xs-12"><p style="color:red">필터를 설정해 주세요.</p></div>
									<div class="col-xs-3"></div>
									<div class="col-xs-1">
										<!-- 중화요리-->
										<img id="H_CS${loop.index}" src="/mukja/resources/tend_IMG/chi_b.JPG" alt="J" class="img-circle img_size">
										<div class="lb_size">중식</div>
									</div>

									<div class="col-xs-1">
										<!-- 일식-->
										<img id="H_JS${loop.index}" src="/mukja/resources/tend_IMG/j_b.png" alt="JP" class="img-circle img_size">
										<div class="lb_size">일식</div>
									</div>

									<div class="col-xs-1">
										<!-- 양식-->
										<img id="H_HS${loop.index}" src="/mukja/resources/tend_IMG/k_b.png" alt="H" class="img-circle img_size">
										<div class="lb_size">한식</div>
									</div>

									<div class="col-xs-1">
										<!-- 분식-->
										<img id="H_BS${loop.index}" src="/mukja/resources/tend_IMG/bs_b.JPG" alt="BS" class="img-circle img_size">
										<div class="lb_size">분식</div>
									</div>
									<div class="col-xs-1">
										<!-- 분식-->
										<img id="H_YS${loop.index}" src="/mukja/resources/tend_IMG/y_b.jpg" alt="Y" class="img-circle img_size">
										<div class="lb_size">양식</div>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="col-xs-1">
										<!-- 물고기 -->
										<img id="T_FS${loop.index}" src="/mukja/resources/tend_IMG/sutend/pesco_o.png" alt="F" class="img-circle img_size">
										<div class="lb_size">생선</div>
									</div>
									<div class="col-xs-1">
										<!-- 달걀-->
										<img id="T_EG${loop.index}" src="/mukja/resources/tend_IMG/sutend/ovo_o.png" alt="E" class="img-circle img_size">
										<div class="lb_size">달걀</div>
									</div>
									<div class="col-xs-1">
										<!-- 우유-->
										<img id="T_MK${loop.index}" src="/mukja/resources/tend_IMG/sutend/dairy_o.png" alt="M" class="img-circle img_size">
										<div class="lb_size">우유</div>
									</div>
									<div class="col-xs-1">
										<!-- 가금류-->
										<img id="T_BD${loop.index}" src="/mukja/resources/tend_IMG/sutend/chicken_o.png" alt="B" class="img-circle img_size">
										<div class="lb_size">가금류</div>
									</div>
									<div class="col-xs-1">
										<!-- 돼지고기-->
										<img id="T_PK${loop.index}" src="/mukja/resources/tend_IMG/sutend/pig_o.png" alt="P" class="img-circle img_size">
										<div class="lb_size">돼지</div>
									</div>
									<div class="col-xs-1">
										<!-- 소고기-->
										<img id="T_CW${loop.index}" src="/mukja/resources/tend_IMG/sutend/cow_o.png" alt="C" class="img-circle img_size">
										<div class="lb_size">소</div>
									</div>
									<div class="col-xs-1">
										<!-- 땅콩-->
										<img id="T_PE${loop.index}" src="/mukja/resources/tend_IMG/sutend/nuts_o.png" alt="PE" class="img-circle img_size">
										<div class="lb_size">땅콩</div>
									</div>
									<div class="col-xs-1">
										<!-- 각갑류-->
										<img id="T_SF${loop.index}" src="/mukja/resources/tend_IMG/sutend/shrimp_o.png" alt="SF" class="img-circle img_size">
										<div class="lb_size">갑각류</div>
									</div>
									<div class="col-xs-1">
										<!-- 치즈-->
										<img id="T_DP${loop.index}" src="/mukja/resources/tend_IMG/sutend/dairy_o.png" alt="DP" class="img-circle img_size">
										<div class="lb_size">유제품</div>
									</div>
									<div class="col-xs-1">
										<!-- 콩-->
										<img id="T_SB${loop.index}" src="/mukja/resources/tend_IMG/sutend/s_o.png" alt="SB" class="img-circle img_size">
										<div class="lb_size">대두</div>
									</div>
									<div class="col-xs-1" style="margin-bottom: 10px;">
										<!-- 밀가루 -->
										<img id="T_FL${loop.index}" src="/mukja/resources/tend_IMG/sutend/gluten_o.png" alt="FL" class="img-circle img_size">
										<div class="lb_size">글루텐</div>
									</div>
								</div>

								<div class="form-group" style="width: 100%">
									<div class="col-xs-12" style="margin-top: 10px">
										<div class="col-xs-6" id="imageLoader">
												<div id="originImage${loop.index}">
													<label for="orginImg${loop.index }">기존 등록 이미지</label>
													<img id="orginImg${loop.index }" class="img-thumbnail" alt="" src='<c:url value='${menuList.fm_path}'/>'>
												</div>
											<div id="menuPreview${loop.index }"></div>
										</div>
										<div class="col-xs-6">
											<div>
												<label for="fm_path${loop.index}">메뉴 사진 등록</label>
												<input name="fm_path${loop.index}" id="fm_path${loop.index}" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" class="form-control-file inp-menu">
												<input type="hidden" id="originImg${loop.index}" name="originImg${loop.index}" value="${menuList.fm_path}"/>
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 이름</label>
												<input class="form-control" type="text" id="menu_name${loop.index }" name="menu_name${loop.index}" value="${menuList.menu_name}">
												<div class="check_font" id="mn_check"></div>
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 소개글</label>
												<textarea class="form-control" id="menu_info${loop.index }" rows="5" name="menu_info${loop.index }">${menuList.menu_info }</textarea>
												<!-- <input class="form-control" type="text" id="menu_info0" name="menu_info0"> -->
												<div class="check_font" id="mi_check"></div>
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 가격</label>
												<input class="form-control" placeholder="숫자만 입력해 주세요." type="text" id="menu_price${loop.index }" name="menu_price${loop.index }" value="${menuList.menu_price }">
												<div class="check_font" id="mp_check"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
							<!-- 메뉴 1개 formGroup 끝 -->
						</div>
					</c:forEach>
					</div>
					<div class="col-md-12" style="margin-top: 5px;">
						<div class="col-md-2 col-md-offset-5">
							<button type="submit" id="formSubmit" class="btn btn-default form-control">수정</button>
						</div>
					</div>
					</form>
				
				</div>
			</div>
			
		</div>
</section>

<script>
// 메뉴 태그 추가 이벤트 스크립트
$(document).on("click",".addMenu",function(){
	 console.log("메뉴등록 태그 추가 이벤트 들어옴")
	 
	 // 만약 메뉴 십자리 단위수 넘어간 경우의 수 따져준 것.
	 if($.isNumeric(Number(this.id.charAt(this.id.length-2)))){
		 var menuFlag = Number(this.id.charAt(this.id.length-1)) + (Number(this.id.charAt(this.id.length-2))*10)
	 }
	 else{
		 var menuFlag = this.id.charAt(this.id.length-1);		 
	 }
	 
	 console.log("id값 왔냐? = " + menuFlag + " / 타입? = "+typeof menuFlag);
	 menuFlag= Number(menuFlag);
	 menuFlag= menuFlag+1;
	 console.log("menuFlag 숫자변환 시도 "+ typeof menuFlag+ " / 값은? =" +menuFlag);
	 
	 var innerHtml = "<div class='row'>"
	 	+ "<div class='col-md-12 text-center' id='"+menuFlag+"' style='margin-top:10px;'>" 
		+ "<label style='margin-top:20px;'>메뉴 등록하기</label>"
		+ "<input type='hidden' id='insmenu_tend"+menuFlag+"' class='tendMust' name='insmenu_tend"+menuFlag+"'/>"
	 	+ "<div id='addMenu"+menuFlag+"'>"
	 	+ "<input type='button' class='btn btn-info addMenu' id='addMenu"+menuFlag+"' value='메뉴 추가+'>"
	 	+ "</div><div><span>&nbsp;</span></div>"
	 	+ "<div class='col-xs-12'>"
	 	+ "<div class='col-xs-12'><p style='color:red'>필터를 설정해 주세요.</p></div>"
	 	+ "<div class='col-xs-3'></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='O_CS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/chi_b.JPG'/>' alt='J' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>중식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='O_JS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/j_b.png'/>' alt='JP' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>일식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='O_HS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/k_b.png'/>' alt='H' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>한식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='O_BS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/bs_b.JPG'/>' alt='BS' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>분식</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='O_YS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/y_b.jpg'/>' alt='Y' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>양식</div></div></div>"
	 	+ "<div class='col-xs-12'>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_FS"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/pesco_x.png'/>' alt='F' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>생선</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_EG"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/ovo_x.png'/>' alt='E' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>달걀</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_MK"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/dairy_x.png'/>' alt='M' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>우유</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_BD"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/chicken_x.png'/>' alt='B' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>가금류</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_PK"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/pig_x.png'/>' alt='P' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>돼지</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_CW"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/cow_x.png'/>' alt='C' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>소</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_PE"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/nuts_x.png'/>' alt='PE' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>땅콩</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_SF"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/shrimp_x.png'/>' alt='SF' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>갑각류</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_DP"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/dairy_x.png'/>' alt='DP' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>유제품</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_SB"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/s_x.png'/>' alt='SB' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>대두</div></div>"
	 	+ "<div class='col-xs-1'>"
	 	+ "<img id='F_FL"+menuFlag+"' src='<c:url value='/resources/tend_IMG/sutend/gluten_x.png'/>' alt='FL' class='img-circle img_size flag'>"
	 	+ "<div class='lb_size'>글루텐</div></div></div>"
	 	+ "<div class'form-group' style='width:100%;'>"
	 	+ "<div class='col-xs-12' style='margin-top:10px'>"
	 	+ "<div class='col-xs-6'>"
	 	+ "<div id='insmenuPreview"+menuFlag+"'></div></div>"
	 	+ "<div class='col-xs-6'><div><label for='insfm_path"+menuFlag+"'>메뉴 사진 등록</label>"
	 	+ "<input name='insfm_path"+menuFlag+"' id='insfm_path"+menuFlag+"' type='file' accept='.jpg,.jpeg,.png,.gif,.bmp' class='form-control-file inpmenu'>"
	 	+ "</div><div><label>메뉴 이름</label>"
	 	+ "<input name='insmenu_name"+menuFlag+"' id='insmenu_name"+menuFlag+"' type='text' class='form-control'>"
	 	+ "<div class='check_font' id='mn_check"+menuFlag+"'></div></div>"
	 	+ "<div><label>메뉴 소개글</label>"
	 	+ "<textarea class='form-control' rows='5' id='insmenu_info"+menuFlag+"' name='insmenu_info"+menuFlag+"'></textarea>"
	 	+ "<div class='check_font' id='mi_check"+menuFlag+"'></div></div>"
	 	+ "<div><label>메뉴 가격</label>"
	 	+ "<input class='form-control' placeholder='숫자만 입력해 주세요.' type='text' id='insmenu_price"+menuFlag+"' name='insmenu_price"+menuFlag+"'>"
	 	+ "<div class='check_font' id='mp_check"+menuFlag+"'></div></div></div></div></div></div></div>"
	 	
	 	console.log(menuFlag+" = menuFlag?")
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
       // 만약 메뉴 십자리 단위수 넘어간 경우의 수 따져준 것.
  	   if($.isNumeric(Number(this.id.charAt(this.id.length-2)))){
  		 menuIndex = Number(this.id.charAt(this.id.length-1)) + (Number(this.id.charAt(this.id.length-2))*10)
  	   }
  	   else{
  		 menuIndex = this.id.charAt(this.id.length-1);		 
  	   }
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
            	 $("#originImage"+menuIndex).html("");
                $("#menuPreview" + menuIndex)
                      .html("<label for='menuPreview"+menuIndex+"'>신규 이미지</label>"
                            + "<a href=\"javascript:void(0);\" onclick=\"deleteImage2()\" id=\"'foodImg_id"
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
         $preview.css("height","100%");
         $preview.css("vertical-align","center");
         $preview.html("<p style='color:red;font-weight:strong;'>새로운 이미지를 등록해 주세요. 메뉴 사진은 필수입니다.</p>");
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


<script><!--첨가된 음식종류 js-->
$(document).on("click",".img-circle",function(){
	console.log(this)
  	console.log("this 찍어봄   " + this);
    console.log("this.id 찍어봄   " + this.id);
    
	var tendFlag = this.id;
	console.log("tendFlag에 아이디 담음 = "+tendFlag);
	console.log("타입 ? = "+typeof tendFlag)
	
	if($.isNumeric(Number(tendFlag.charAt(tendFlag.length-2)))){
		var tendFlag = (Number(tendFlag.charAt(tendFlag.length-2)))*10 + Number(tendFlag.charAt(tendFlag.length-1));
	}
	else{
		tendFlag = tendFlag.charAt(tendFlag.length-1);
	}
	
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
						console.log('여기2')
						var a=eles.replace(ele+',','')
						$('#menu_tend'+tendFlag).attr('value',a);
					
					}
					else{
						console.log('여기2')
						var a=eles.replace(ele+',','')
						$('#menu_tend'+tendFlag).attr('value',a);
						/*
						eles+='';
						$('#menu_tend'+tendFlag).attr('value',eles);
						*/
						
					}
			}
			else {
				$('#T_'+ele).attr('src',$('#T_'+ele).attr('src').toString().replace("_o","_x"));
				
				if(eles.indexOf(ele)==-1){
					eles+=ele;
				    $('#menu_tend'+tendFlag).attr('value',eles+',');
				}
				else{
					console.log('여기1')
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
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/mukja/resources/bootstrap/images/dessert-2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">메뉴 추가!</h1>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Add FoodMenu</span>
				<h2 class="mb-4">메뉴 추가</h2>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row justify-content-center"  style="border: 1px solid gray;">
				<div class="col-md-11 ftco-animate makereservation p-4 p-md-5 fadeInUp ftco-animated">
				<form action="<c:url value='/StoreMypage/addImgPop2.do'/>" id="editFoodMenuSt" enctype="multipart/form-data" method="post">
				<div id="signUpMenu">
					<div class="row">
						<div class="col-md-12 text-center" style="margin-top: 10px;">
							<div class="form-group" style="width: 100%" >
								<label style="margin-top: 20px;">메뉴 등록하기</label>
								<input type="hidden" id="insmenu_tend0" class="tendMust" name="insmenu_tend0">
								<div id="addMenu0">
									<input type="button" class="btn btn-info addMenu" id="moreMenu0" value="메뉴 추가+">
								</div>
								<div>
									<span>&nbsp;</span>
								</div>
								<div class=""></div>
								<div class="col-xs-12">
									<div class="col-xs-12"><p style="color:red">필터를 설정해 주세요.</p></div>
									<div class="col-xs-3"></div>
									<div class="col-xs-1">
										<!-- 중화요리-->
										<img id="O_CS0" src="/mukja/resources/tend_IMG/chi_b.JPG" alt="J" class="img-circle img_size flag">
										<div class="lb_size">중식</div>
									</div>

									<div class="col-xs-1">
										<!-- 일식-->
										<img id="O_JS0" src="/mukja/resources/tend_IMG/j_b.png" alt="JP" class="img-circle img_size flag">
										<div class="lb_size">일식</div>
									</div>

									<div class="col-xs-1">
										<!-- 양식-->
										<img id="O_HS0" src="/mukja/resources/tend_IMG/k_b.png" alt="H" class="img-circle img_size flag">
										<div class="lb_size">한식</div>
									</div>

									<div class="col-xs-1">
										<!-- 분식-->
										<img id="O_BS0" src="/mukja/resources/tend_IMG/bs_b.JPG" alt="BS" class="img-circle img_size flag">
										<div class="lb_size">분식</div>
									</div>
									<div class="col-xs-1">
										<!-- 분식-->
										<img id="O_YS0" src="/mukja/resources/tend_IMG/y_b.jpg" alt="Y" class="img-circle img_size flag">
										<div class="lb_size">양식</div>
									</div>
								</div>
								<div class="col-xs-12">
									<div class="col-xs-1">
										<!-- 물고기 -->
										<img id="F_FS0" src="/mukja/resources/tend_IMG/sutend/pesco_o.png" alt="F" class="img-circle img_size flag">
										<div class="lb_size">생선</div>
									</div>
									<div class="col-xs-1">
										<!-- 달걀-->
										<img id="F_EG0" src="/mukja/resources/tend_IMG/sutend/ovo_o.png" alt="E" class="img-circle img_size flag">
										<div class="lb_size">달걀</div>
									</div>
									<div class="col-xs-1">
										<!-- 우유-->
										<img id="F_MK0" src="/mukja/resources/tend_IMG/sutend/dairy_o.png" alt="M" class="img-circle img_size flag">
										<div class="lb_size">우유</div>
									</div>
									<div class="col-xs-1">
										<!-- 가금류-->
										<img id="F_BD0" src="/mukja/resources/tend_IMG/sutend/chicken_o.png" alt="B" class="img-circle img_size flag">
										<div class="lb_size">가금류</div>
									</div>
									<div class="col-xs-1">
										<!-- 돼지고기-->
										<img id="F_PK0" src="/mukja/resources/tend_IMG/sutend/pig_o.png" alt="P" class="img-circle img_size flag">
										<div class="lb_size">돼지</div>
									</div>
									<div class="col-xs-1">
										<!-- 소고기-->
										<img id="F_CW0" src="/mukja/resources/tend_IMG/sutend/cow_o.png" alt="C" class="img-circle img_size flag">
										<div class="lb_size">소</div>
									</div>
									<div class="col-xs-1">
										<!-- 땅콩-->
										<img id="F_PE0" src="/mukja/resources/tend_IMG/sutend/nuts_o.png" alt="PE" class="img-circle img_size flag">
										<div class="lb_size">땅콩</div>
									</div>
									<div class="col-xs-1">
										<!-- 각갑류-->
										<img id="F_SF0" src="/mukja/resources/tend_IMG/sutend/shrimp_o.png" alt="SF" class="img-circle img_size flag">
										<div class="lb_size">갑각류</div>
									</div>
									<div class="col-xs-1">
										<!-- 치즈-->
										<img id="F_DP0" src="/mukja/resources/tend_IMG/sutend/dairy_o.png" alt="DP" class="img-circle img_size flag">
										<div class="lb_size">유제품</div>
									</div>
									<div class="col-xs-1">
										<!-- 콩-->
										<img id="F_SB0" src="/mukja/resources/tend_IMG/sutend/s_o.png" alt="SB" class="img-circle img_size flag">
										<div class="lb_size">대두</div>
									</div>
									<div class="col-xs-1" style="margin-bottom: 10px;">
										<!-- 밀가루 -->
										<img id="F_FL0" src="/mukja/resources/tend_IMG/sutend/gluten_o.png" alt="FL" class="img-circle img_size flag">
										<div class="lb_size">글루텐</div>
									</div>
								</div>

								<div class="form-group" style="width: 100%">
									<div class="col-xs-12" style="margin-top: 10px">
										<div class="col-xs-6" id="imageLoader">
											<div id="insmenuPreview0"></div>
										</div>
										<div class="col-xs-6">
											<div>
												<label for="insfm_path0">메뉴 사진 등록</label>
												<input name="insfm_path0" id="insfm_path0" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" class="form-control-file inpmenu">
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 이름</label>
												<input class="form-control" type="text" id="insmenu_name0" name="insmenu_name0" placeholder="메뉴 이름을 입력해 주세요.">
												<div class="check_font" id="mn_check"></div>
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 소개글</label>
												<textarea class="form-control" id="insmenu_info0" rows="5" name="insmenu_info0"></textarea>
												<!-- <input class="form-control" type="text" id="menu_info0" name="menu_info0"> -->
												<div class="check_font" id="mi_check"></div>
											</div>
											<div style="margin-bottom: 5px;">
												<label>메뉴 가격</label>
												<input class="form-control" placeholder="숫자만 입력해 주세요." type="text" id="insmenu_price0" name="insmenu_price0">
												<div class="check_font" id="mp_check"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
							<!-- 메뉴 1개 formGroup 끝 -->
						</div>
					</div>
					<div class="col-md-12" style="margin-top: 5px;">
						<div class="col-md-2 col-md-offset-5">
							<button type="submit" id="addformSubmit" class="btn btn-default form-control">등록</button>
						</div>
					</div>
					</form>
				
				</div>
			</div>
			
		</div>
</section>

<script><!--첨가된 음식종류 js-->
$(document).on("click",".flag",function(){
	console.log(this)
  	console.log("this 찍어봄   " + this);
    console.log("this.id 찍어봄   " + this.id);
    
	var tendFlag = this.id;
	console.log("tendFlag에 아이디 담음 = "+tendFlag);
	console.log("타입 ? = "+typeof tendFlag)
	
	if($.isNumeric(Number(tendFlag.charAt(tendFlag.length-2)))){
		var tendFlag = (Number(tendFlag.charAt(tendFlag.length-2)))*10 + Number(tendFlag.charAt(tendFlag.length-1));
	}
	else{
		tendFlag = tendFlag.charAt(tendFlag.length-1);
	}
	
	tendFlag = Number(tendFlag);
	console.log("tendFlag 바꿔봄 = "+tendFlag);	
	
	var ertend_codes=['FS'+tendFlag,'EG'+tendFlag,'MK'+tendFlag,'BD'+tendFlag,'PK'+tendFlag,'CW'+tendFlag,'PE'+tendFlag,
					'SF'+tendFlag,'DP'+tendFlag,'FL'+tendFlag,'SB'+tendFlag,'CS'+tendFlag,'JS'+tendFlag,'HS'+tendFlag,'BS'+tendFlag,'YS'+tendFlag];
	console.log("ertend_codes 찍어봄 = "+ertend_codes);
	
	ertend_codes.forEach(function(ele,index){
		$(document).on("click","#F_"+ele,function(){
			var eles = document.getElementById('insmenu_tend'+tendFlag).value
			// 금지 사진에서 있는 사진으로 바꾸는 경우
			if($('#F_'+ele).attr('src').includes('_x')){
				console.log('여기')
				$('#F_'+ele).attr('src',$('#F_'+ele).attr('src').toString().replace("_x","_o"));
					// value에 값이 없던 경우
					if(eles.indexOf(ele)==-1){
						console.log('여기2')
						var a=eles.replace(ele+',','')
						$('#insmenu_tend'+tendFlag).attr('value',a);
					}
					// value에 값이 있던 경우
					else{
						console.log('여기2')
						var a=eles.replace(ele+',','')
						$('#insmenu_tend'+tendFlag).attr('value',a);
						/*
					    eles+='';
						$('#insmenu_tend'+tendFlag).attr('value',eles);
						*/
					}
			}
			else {
				// 있던 사진에서 금지 사진으로 바꾸는 경우
				$('#F_'+ele).attr('src',$('#F_'+ele).attr('src').toString().replace("_o","_x"));
				if(eles.indexOf(ele)==-1){
					eles+=ele;
				    $('#insmenu_tend'+tendFlag).attr('value',eles+',');
				/*
				    console.log('여기2')
					var a=eles.replace(ele+',','')
					$('#insmenu_tend'+tendFlag).attr('value',a);
				*/
				}
				else{
					console.log('여기1')
				}
			}
		})
		$(document).on("click","#O_"+ele,function(){
			var eles = document.getElementById('insmenu_tend'+tendFlag).value
			if($('#O_'+ele).attr('src').includes('_b')){
				console.log('여기')
				// 없는 사진에서 있는 사진으로 바꾸는 경우
				$('#O_'+ele).attr('src',$('#O_'+ele).attr('src').toString().replace("_b","_c"));
					// menu_tend value에 해당 텐드가 없던 경우
					if(eles.indexOf(ele)==-1){
						eles+=ele;
					    $('#insmenu_tend'+tendFlag).attr('value',eles+',');
					}
					// 텐드가 있는 경우
					else{
						eles+='';
						$('#insmenu_tend'+tendFlag).attr('value',eles);
					}
			}
			else {
				// 있는 그림에서 없는 그림으로 교체하는 경우
				$('#O_'+ele).attr('src',$('#O_'+ele).attr('src').toString().replace("_c","_b"));
				
				if(eles.indexOf(ele)==-1){
					console.log('여기1')
				}
				else{
					console.log('여기2')
					var a=eles.replace(ele+',','')
					$('#insmenu_tend'+tendFlag).attr('value',a);
				}
			}
		})
	});
	
})

	 var menuIndex;

   $(document).on("change",".inpmenu",function() {
       console.log("this 찍어봄   " + this);
       console.log("this.id 찍어봄   " + this.id);
       console.log("this.name 찍어봄   " + this.name);
       // 만약 메뉴 십자리 단위수 넘어간 경우의 수 따져준 것.
  	   if($.isNumeric(Number(this.id.charAt(this.id.length-2)))){
  		 menuIndex = Number(this.id.charAt(this.id.length-1)) + (Number(this.id.charAt(this.id.length-2))*10)
  	   }
  	   else{
  		 menuIndex = this.id.charAt(this.id.length-1);		 
  	   }
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
                $("#insmenuPreview" + menuIndex)
                      .html("<label for='insmenuPreview"+menuIndex+"'>신규 이미지</label>"
                            + "<a href=\"javascript:void(0);\" onclick=\"deleteImage3()\" id=\"'insfoodImg_id"
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
         $preview.css("height","100%");
         $preview.css("vertical-align","center");
         $preview.html("<p style='color:red;font-weight:strong;'>새로운 이미지를 등록해 주세요. 메뉴 사진은 필수입니다.</p>");
      }
   }

   var deleteImage3 = function() {
      console.log(menuIndex + "콘솔로 인덱스 찍기")
      var img_id = "#insfoodImg_id" + menuIndex;
      $(img_id).remove();
      var $input = $("#insfm_path" + menuIndex);
      var $preview = $("#insmenuPreview" + menuIndex);
      console.log("지운 사진 id?  " + img_id)
      console.log("지운 사진 input?  " + $input)
      console.log("지운 사진 preview?  " + $preview)
      resetInputFile($input, $preview);
   }

</script>