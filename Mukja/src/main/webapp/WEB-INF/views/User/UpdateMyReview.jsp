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
               <span class="mr-2"><a href="index.html">My Page <i class="ion-ios-arrow-forward"></i></a></span> 
               <span class="mr-2"><a href="blog.html">My Review <i class="ion-ios-arrow-forward"></i></a></span> 
               <span>Update My Review <i class="ion-ios-arrow-forward"></i></span>
            </p>
         </div>
      </div>
   </div>
</section>
<!-- REVIEW -->
<section class="ftco-section testimony-section ">

	<div class="container">

		<sec:authorize access="hasRole('ROLE_USER')">
			<div class="comment-form-wrap col-md-12" style="background: orange; border-radius: 1%;">
				<input type="hidden" name="rv_no" value="${rvcnt.rv_no}">
				<h3 class="h4 font-weight-bold gugi pt-5 pb-5" style="text-align: center;">리뷰 남기기 </h3>
				
				<form name="form1" method="post" action="/updateMyReview.bbs?">
						<div class="form-group poor">
							<div class="col-md-12">
								<label class="col-md-2" for="message" style="text-align: right;">Menu</label>
								<div class="col-md-9" style="padding-bottom: 15px;">
									<select id="menu_name">
										<option>메뉴 이름</option>
											<!-- <c:forEach items="${menus}" var="menus" varStatus="loop">
												<c:if test="${rvcnt4up.store_name == menus.username}">
													<option>${menus.menu_name}</option>
												</c:if>
											</c:forEach> -->
										<option>${rvcnt4up.menu_no}</option>
									</select>
								</div>
							</div>
							<div class="col-md-12">
								<label class="col-md-2" for="message"
									style="text-align: right; padding-top: 15px;">title</label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="title" value="" placeholder="제목을 입력하세요" style="margin-bottom: 10px;">
								</div>
							</div>
							<div class="col-md-12">
								<label class="col-md-2" for="message" style="text-align: right; padding-top: 15px;">Contents</label>
								<div class="col-md-9 poor">
									<textarea name="rv_content" cols="30" rows="7"
										class="form-control" placeholder="내용을 입력하세요"
										style="margin-bottom: 10px;">${rvcnt4up.rv_content}</textarea>
								</div>
							</div>
							<div class="col-md-12">
								<label class="col-md-2" for="message" style="text-align: right; padding-top: 15px;">Images</label>
								<div class="col-md-9 poor">
									<c:if test="${empty rvimgs4up.rf_path}"> 
										<input name="rf_path" class="form-control" placeholder="파일업로드용" style="margin-bottom: 30px;">
									</c:if>
									<c:if test="${not empty rvimgs4up.rf_path}">
										<input name="rf_path" class="form-control" placeholder="파일업로드용" style="margin-bottom: 30px;" value="${rvimgs4up.rf_path}">									
									</c:if>	
												
								</div>
							</div>
	
						</div>
						<div class="col-md-12">
							<div class="form-group col-md-offset-5" style="align-content: center; align-items: center;">
								<input type="submit" value="회원정보 수정" class="btn btn-primary py-3 px-5">
							</div>
						</div>
				</form>
				
			</div>
		</sec:authorize>
	</div>



</section>