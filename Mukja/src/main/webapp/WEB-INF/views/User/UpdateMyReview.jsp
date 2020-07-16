<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<section class="hero-wrap hero-wrap-2 align-items-center" style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">리뷰 수정하기</h1>
            <p class="breadcrumbs">
               <span class="mr-2"><a href="<c:url value='MyPage.bbs'/>">My Page <i class="ion-ios-arrow-forward"></i></a></span> 
               
               <span>Update My Review <i class="ion-ios-arrow-forward"></i></span>
            </p>
         </div>
      </div>
   </div>
</section>

<script>
/* 미리보기 스크립트 */
	var imgIndex;

	$(document).on("change","#rf_path",function() {
               console.log("this 찍어봄   " + this);
               console.log("this.id 찍어봄   " + this.id);
               console.log("this.name 찍어봄   " + this.name);
               
               readInputFile(this);
               //등록 이미지 등록 미리보기
               function readInputFile(input) {
                  console.log('음식하단 쪽 readInputFile메소드 안에 들어옴  ')
                  if (input.files && input.files[0]) {
                     var reader = new FileReader();
                     console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
                     console.log('id 찍어봄    ' + input.id);
                     console.log('name 찌거봄    ' + input.name);
                     reader.onload = function(e) {
                    	$("#preview").html("");
                    	 
                        $("#preview").html(
                        		"<h4>등록 이미지 미리보기</h4>"+
      "<a href='javascript:void(0);' onclick='deleteImage()' id='previewImg'>"+
      "<img src= " + e.target.result + " class='w-100 d-block img-thumbnail' style='height:80%;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
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
	      $preview.html(
	 			 "<h4>등록 이미지 미리보기</h4>"
	 			 + "<img alt='등록된 이미지가 없습니다.' src=''/>")
	   }
	}

	var deleteImage = function() {	   
	   var img_id = "#previewImg";
	   $(img_id).remove();
	   var $input = $("#rf_path");
	   var $preview = $("#preview");
	   console.log("지운 사진 id?  " + img_id)
	   console.log("지운 사진 input?  " + $input)
	   console.log("지운 사진 preview?  " + $preview)
	   resetInputFile($input, $preview);
	}
</script>

<section class="ftco-section ftco-no-pt ftco-no-pb">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 

	<div class="container" id='signup'>
		<div class="row d-flex">
			<div class="col-md-12 ftco-animate makereservation p-4 p-md-5">
				<form action="<c:url value='/updateMyReviewOk.bbs'/>" enctype="multipart/form-data" method="post">
					<div class="row">
						<input type="hidden" name="user_id" value="${userInfo.username}">
						<div class="col-md-6">
							<div id="orinImg" class="d-inline-block w-100" style="width: 100%;height: 50%;">
								<div class="col-md-12">
									<div class="col-md-10">
									<h4>기존 리뷰 이미지</h4>
										<c:if test="${empty rvimgs4up.rf_path}" var="imgEmpty">
											<p>기존 등록 이미지가 없습니다.</p>
										</c:if>
										<c:if test="${not imgEmpty}">
											<img alt="" class="w-100 d-block img-thumbnail" style="height:80%;"src="<c:url value="${rvimgs4up.rf_path}"/>">
										</c:if>
									</div>
								</div>
							</div>
							<div id="preview" class="d-inline-block w-100" style="width: 100%;height: 50%;">
								<div class="col-md-12" style="width: 100%;height: 50%;">
									<h4>등록 이미지 미리보기</h4>
									<div class="col-md-10">
										<img alt="등록된 이미지가 없습니다." src=""/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="col-md-12">
								<div class="form-group">
									<label for="">닉네임  :  ${rvcnt4up.u_nick}</label> 
								 </div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label for="">리뷰 작성 날짜  :  ${rvcnt4up.rv_postdate}</label> 
								 	
								 </div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label for="">가게 이름  :  ${rvcnt4up.store_name2}</label> 
								</div>
							</div>
	
							<div class="col-md-12">
								<div class="form-group" id="input">
									<label for="">메뉴</label> 
									<select id="menu_no" name="menu_no" class="form-control">
										<option value="${rvcnt4up.menu_no}">${rvcnt4up.menu_name}</option>
										<c:forEach items="${menus}" var="menus" varStatus="loop">
											<c:if test="${rvcnt4up.store_name == menus.username}">
												<option value="${menus.menu_no}">${menus.menu_name}</option>
											</c:if>											<
										</c:forEach>
									</select>
								</div>
							</div>
	
							<div class="col-md-12">
								<div class="form-group">
									<label for="">리뷰 제목</label> 
									<input type="text" class="form-control" id="rv_title" name="rv_title" placeholder="제목" value="${rvcnt4up.rv_title}">
								</div>
							</div>
	
							<div class="col-md-12">
								<div class="form-group">
									<label for="">내용</label>
									<textarea name="rv_content" cols="30" rows="15" class="form-control" placeholder="내용을 입력하세요" style="margin-bottom: 10px;">${rvcnt4up.rv_content} </textarea>
								</div>
							</div>
	
	
	
	
							<div class="col-md-12">
								<div class="form-group">
									<label for="rf_path">리뷰 이미지</label>
									<input type="file" class="form-control" id="rf_path" name="rf_path" placeholder="리뷰 이미지" value="${rvimgs4up.rf_path}" accept='.jpg,.jpeg,.png,.gif,.bmp'>
								</div>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="form-group">
								<input type="hidden" name="rv_no" id="rv_no" value="${rvcnt4up.rv_no}">	
								<input type="submit" value="리뷰 수정" class="btn btn-primary py-3 px-5">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>