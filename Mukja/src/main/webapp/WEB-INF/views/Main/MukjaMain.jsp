<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
thead th{
	text-align:center;
}
tr td{
	text-align:center;
}
</style>


<!-- 상단 이미지 및 텍스트 -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/mukja/resources/bootstrap/images/bg_4.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">내 취향에 맞게 음식을 골라보세요!</h1>
			</div>
		</div>
	</div>
</section>


<!-- 좋아요 추천 수에 따른 음식점 띄워줄 캐러셀 시작   / 추천수 상위 랭킹 6개만 띄울 예정 -->
 
<section class="home-slider js-fullheight owl-carousel bg-white">
	<c:forEach items="${rank1}" var="item" varStatus="loop"> 
      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container-fluid p-0">
          <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank1Img[0].sf_path }"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 1위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br> ${item.store_name}</h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank1Img}" var="rank1Img" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${rank1Img.sf_path}"/>);"></div>
		            		</a>
		            	</c:forEach>
		            </div>
	            </div>
	          </div>
        	</div>
        </div>
      </div>
	</c:forEach>
	
	<c:forEach items="${rank2}" var="item" varStatus="loop"> 
      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container-fluid p-0">
          <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank2Img[0].sf_path}"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 2위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br> ${item.store_name}</h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank2Img}" var="rank2Img" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${rank2Img.sf_path}"/>);"></div>
		            		</a>
		            	</c:forEach>
		            </div>
	            </div>
	          </div>
        	</div>
        </div>
      </div>
	</c:forEach>
	<c:forEach items="${rank3}" var="item" varStatus="loop"> 
      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container-fluid p-0">
          <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank3Img[0].sf_path}"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 3위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br> ${item.store_name}</h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank3Img}" var="rank3Img" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${rank3Img.sf_path}"/>);"></div>
		            		</a>
		            	</c:forEach>
		            </div>
	            </div>
	          </div>
        	</div>
        </div>
      </div>
	</c:forEach>
</section>
<!-- 랭킹수 수정 완료 -->
<div class="divider"></div>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Best Review</span>
				<h2 class="mb-4">리 뷰</h2>
			</div>
		</div>
		<div class="row">
		<c:forEach items="${reviewList}" var="item">
			<div class="col-md-6 col-lg-3 ftco-animate">
				<div class="staff">
					<div class="col-md-12"/> <img alt="리뷰 사진" style="width: inherit;max-width: 100%;height: auto;" src="<c:url value='${item.rf_path}'/>"> </div>
					<div class="text px-4 pt-4">
						<h3>${item.store_name}<br/><br/>
						${item.rv_title}
						</h3>						
						<div class="faded">
							<p>${item.rv_content}</p>
						</div>
						<span class="position mb-2">작성자 : ${item.u_nick}</span><br/>
						<span class="position mb-2">좋아요 : ${item.good}</span><br/>
						<span class="position mb-2">메뉴 : ${item.menu_name}</span>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<!-- row -->
	</div>
</section>


<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-2">
			<div class="col-md-7 text-center heading-section ftco-animate">
				<span class="subheading">Notify</span>
				<h2 class="mb-4">공지</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 table-responsive">
				<table class="table table-hover table-bordered" >
					<thead>
						<th></th>
						<th colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								제 목
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</th>
						<th >작성일</th>
					</thead>
					<tbody>
						<c:if test="${empty list}" var="isEmpty">
							<tr>
								<td colspan="7">등록된 게시물이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty}">
							<c:forEach items="${list}" var="item" varStatus="loop">
							<tbody>
								<tr>
									<td >${totalRecordCount - (((nowPage-1)*pageSize)+loop.index)}</td>
									<td colspan="5">
										<a href='<c:url value="/MainNoticeList.bbs"/>' target="_blank">${item.NT_TITLE}</a></td>
									<td >${item.NT_REGITDATE}</td>
								</tr>
							</tbody>
							</c:forEach>
						</c:if>			
					</tbody>
				</table>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12 text-right heading-section ftco-animate">
				<h4><a href="<c:url value='/MainNoticeList.bbs'/>" target="_blank">공지 더보기-></a></h4>
			</div>
		</div>
	</div>
</section>