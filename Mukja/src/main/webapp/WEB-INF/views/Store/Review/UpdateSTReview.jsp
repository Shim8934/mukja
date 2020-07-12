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
               <span class="mr-2"><a href="index.html">Store<i class="ion-ios-arrow-forward"></i></a></span> 
               <span>Update My Review <i class="ion-ios-arrow-forward"></i></span>
            </p>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 

	<div class="container" id='signup'>
		<div class="row d-flex">
			<div class="col-md-12 ftco-animate makereservation p-4 p-md-5">
				<form action="<c:url value='/updateSTReviewOk.bbs'/>" method="post">
					<div class="row">
					
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">닉네임  :  ${stRV4up.u_nick}</label> 
								
							 </div>
						</div>
						
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">리뷰 작성 날짜  :  ${stRV4up.rv_postdate}</label> 
							 	
							 </div>
						</div>
						
						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">가게 이름  :  ${stRV4up.store_name2}</label> 
							</div>
						</div>

						<div class="col-md-offset-3 col-md-6">
							<div class="form-group" id="input">
								<label for="">메뉴</label> 
								<select id="menu_no" name="menu_no" class="form-control">
									<c:forEach items="${menuSTs}" var="menus" varStatus="loop">
										<option value="${menus.menu_no}">${menus.menu_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">리뷰 제목</label> 
								<input type="text" class="form-control" id="rv_title" name="rv_title" placeholder="제목" value="${stRV4up.rv_title}">
							</div>
						</div>

						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">내용</label>
								<textarea name="rv_content" cols="30" rows="7" class="form-control" placeholder="내용을 입력하세요" style="margin-bottom: 10px;">${stRV4up.rv_content} </textarea>
							</div>
						</div>

						<div class="col-md-offset-3 col-md-6">
							<div class="form-group">
								<label for="">리뷰 이미지</label> 
								<input type="text" class="form-control" id="rf_path" name="rf_path" placeholder="리뷰 이미지" value="${stRV4up.rf_path}">
							</div>
						</div>
						<div class="col-md-12">
							<input type="hidden" name="rv_no" value="${stRV4up.rv_no}">	
							<input type="hidden" name="store_id" value="${stRV4up.store_name}">	
							<div class="form-group col-md-offset-5">
								<input type="submit" value="리뷰 수정" class="btn btn-primary py-3 px-5">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>