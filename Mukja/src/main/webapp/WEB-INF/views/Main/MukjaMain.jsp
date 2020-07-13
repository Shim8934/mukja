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


<!-- 좋아요 추천 수에 따른 음식점 띄워줄 캐러셀 시작   / 추천수 상위 랭킹 3개만 띄울 예정 -->
<section class="home-slider js-fullheight owl-carousel bg-white">
	<c:forEach items="${rank1}" var="item" varStatus="loop"> 
      <div class="slider-item js-fullheight">
      	<div class="overlay"></div>
        <div class="container-fluid p-0">
          <div class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank1storeImg[0].sf_path }"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 1위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br>
		            				<a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>">${item.store_name}</a></h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank1FoodImg}" var="imgPath1" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${imgPath1.fm_path}"/>);"></div>
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
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank2storeImg[0].sf_path}"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 2위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br> 
		            							<a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>">${item.store_name}</a></h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank2FoodImg}" var="imgPath2" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${imgPath2.fm_path}"/>);"></div>
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
          	<div class="one-third order-md-last img js-fullheight" style="background-image:url(<c:url value="${rank3storeImg[0].sf_path}"/>);">
          		<div class="overlay"></div>
          	</div>
	          <div class="one-forth d-flex js-fullheight align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
	          	<div class="text mt-md-5">
		            <h1 class="mb-4">추천 순위 3위 종합 <c:if test="${item.good == 0}" var="ifZero">${item.sa_avg}점!</c:if>
		            							<c:if test="${not ifZero }"> ${item.sa_avg*item.good}점! </c:if><br>
		            							<a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>">${item.store_name}</a></h1>
		            <p>${item.store_intro}</p>
		            <p>${item.store_addr}</p>
		            <p>${item.store_time}</p>
		            <br>
		            <p>대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank3FoodImg}" var="imgPath3" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style="background-image: url(<c:url value="${imgPath3.fm_path}"/>);"></div>
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
<!-- 상단 이미지 및 텍스트 -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/mukja/resources/bootstrap/images/dessert-2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">고민 중인 당신을 위한 Best Review!</h1>
			</div>
		</div>
	</div>
</section>
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
			<div class="col-md-6 col-lg-4 ftco-animate" style="margin-bottom: 10px;">
				<div class="staff">
					<div class="col-md-12" style="margin-bottom: 5px;">
						<img alt="리뷰 사진" class="img-thumbnail rounded" style="width: inherit;max-width: 100%;height: auto;" src="<c:url value='${item.rf_path}'/>">
					</div>
					<div class="text px-4 pt-4" >
						<h3><a href="<c:url value='/Store/DetailView.do?username=${item.username}'/>">${item.store_name}</a><br/><br/>
						<label for="rvTitle">Title</label>
						<span id="rvTitle">${item.rv_title}</span>
						</h3>						
						<div class="faded">
							<label for="rvContent">내용</label>
							<p id="rvContent">${item.rv_content}</p>
						</div>
						<label for="rvNick">제목</label>
						<span id="rvNick" class="position mb-2"> ${item.u_nick}</span><br/>
						<label for="rvGood">좋아요</label>
						<span id="rvGood" class="position mb-2"> ${item.good}</span><br/>
						<label for="rvMenu">메뉴</label>
						<span id="rvMenu" class="position mb-2"> ${item.menu_name}</span>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<!-- row -->
	</div>
</section>
<!-- 상단 이미지 및 텍스트 -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/mukja/resources/bootstrap/images/image_4.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">새로운 소식은 여기에서!</h1>
			</div>
		</div>
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