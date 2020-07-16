<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	          	<div class="text mt-md-5" style="text-align: center">
		            <h1 class="mb-4" style="font-size: 2.5em;color:#5A5A5A;">추천 순위 1위 </h1>
		             <h1 class="mb-4" style="font-size: 1.8em;color:#5A5A5A;">
		          
		           		 종합<c:if test="${item.good == 0}" var="ifZero"> <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" />점!</c:if>	
		           		        
			            <c:if test="${not ifZero }">   <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" /> 점! </c:if><br>
			            <a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>"  style="font-size: 4.0em;color:#2A2A2A;">${item.store_name}</a>
		            </h1>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_intro}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_addr}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_time}</p>
		            <br>
		            <p style="font-size: 1.8em;color:#5A5A5A; margin-bottom: 40px;">대표 메뉴</p>
		            <div class="thumb mt-4 mb-3 d-flex">
		            	<c:forEach items="${rank1FoodImg}" var="imgPath1" varStatus="loop">
		            		<a href="#" class="thumb-menu pr-md-4 text-center">
		            			<div class="img" style=" background-image: url(<c:url value="${imgPath1.fm_path}"/>);"></div>
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
	          	<div class="text mt-md-5" style="text-align: center">
		           <h1 class="mb-4" style="font-size: 2.5em;color:#5A5A5A;">
		            	추천 순위 2위 		            	
		            </h1> 
		            <h1 class="mb-4" style="font-size: 1.8em;color:#5A5A5A;">
		            	종합<c:if test="${item.good == 0}" var="ifZero">  <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" />점!</c:if>
		            	<c:if test="${not ifZero }">  <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" />점! </c:if><br> 
		         	   <a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>" style="font-size: 4.0em;color:#2A2A2A;">${item.store_name}</a>
		          </h1>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_intro}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_addr}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_time}</p>
		            <br>
		            <p style="font-size: 1.8em;color:#5A5A5A; margin-bottom: 40px;"> 대표 메뉴</p>
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
	          	<div class="text mt-md-5" style="text-align: center">
		            <h1 class="mb-4" style="font-size: 2.5em;color:#5A5A5A;">
		            	추천 순위 3위
		            </h1>
                    <h1 class="mb-4"  style="font-size: 1.8em;color:#5A5A5A;">
		            	 종합 <c:if test="${item.good == 0}" var="ifZero">  <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" />점!</c:if>
						<c:if test="${not ifZero }"> <fmt:formatNumber value="${item.sa_avg*item.good}" pattern=".00" />점! </c:if><br>
    					<a href = "<c:url value="/Store/DetailView.do?username=${item.username}"/>" style="font-size: 3.0em;color:#2A2A2A;">${item.store_name}</a>
    				</h1>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_intro}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_addr}</p>
		            <p style="font-size: 1.8em;color:#5A5A5A;">${item.store_time}</p>
		            <br>
		            
		            <p style="font-size: 1.8em;color:#5A5A5A; margin-bottom: 40px;">대표 메뉴</p>
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
	
		
		<c:forEach items="${reviewList}" var="item">
			<div class=" ftco-animate row" style="margin: 30px;">
				
				<div class="col-md-6" style=" display: inline-block; text-align: right;" >
					<img alt="리뷰 사진" 
					style="border-radius:50%;border: 1px #d6d6d6 solid; 
					box-shadow: rgb(100, 100, 100) 5px 5px 8px -6px;  
					width: inherit;width: 400px;height: 400px;margin-right: 10px;" 
					src="<c:url value='${item.rf_path}'/>">
					
				</div>
				<div class="col-md-6" style ="display: inline-block;" >
					<div style="margin-left:20px; margin-top: 20px;">					
						<span id="rvMenu"  style="font-size: 2.5em;color:#5A5A5A; margin-right: 10px; "> ${item.menu_name}</span>
						<span class="glyphicon glyphicon-heart" style="color: #FA5A2A;margin-top:10px;font-size: 2.5em;"></span>
						<div id="rvGood"  style="margin-top:8px; font-size: 2.0em;color:#FA5A2A; margin-right: 10px; display: inline-block; vertical-align:top; "> ${item.good}</div><br>
						<a style="color:#FA5A2A; font-size: 1.5em;" href="<c:url value='/Store/DetailView.do?username=${item.username}'/>">${item.store_name}</a><br/>
						<hr>
						<span id="rvTitle" style=" margin-left:20px; margin-bottom: 30px; font-size: 1.5em;color:#5A5A5A;margin-right: 5px;">${item.rv_title}</span>
						<span id="rvNick" style="margin-left:20px;font-size: 1.2em;color:#939393;"> ${item.u_nick}</span>
						<div id="rvContent" style=" margin-left:40px;margin-top:10px; font-size: 1.0em;color:#5A5A5A;">${item.rv_content}</div>
						
					</div>					
				</div>
				
			</div>
			<hr style="margin-bottom: 100px;">
		</c:forEach>
		
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
				<h1 class="mb-2 bread" style="margin-bottom: 10px; margin-top: 5px;">
				<c:if test="${u_nick!=null}" var="result">
					${u_nick}
				</c:if>
				 <c:if test="${not result}">
					회원
				</c:if>
				님을 위한 맞춤 매뉴</h1>
			</div>
		</div>
	</div>
</section>


<!-- 추천매뉴 -->
<section class="ftco-section">
	<div class="container">
		<c:forEach items="${recommend_menu}" var="item">
			<div class=" ftco-animate row" style="margin: 30px;">
				
				<div class="col-md-6" style=" display: inline-block;text-align: right;" >
					<img alt="리뷰 사진" 
					style="border-radius:50%;border: 1px #d6d6d6 solid; 
					box-shadow: rgb(100, 100, 100) 5px 5px 8px -6px;  
					width: inherit;width:400px;height: 400px;margin-right: 10px;" 
					src="<c:url value='${item.fm_path}'/>">
					
				</div>
				<div class="col-md-6" style ="display: inline-block;" >
					<div class="row" style="margin-left:20px; margin-top: 20px;">			
						<div class='col-md-12'>		
							<a style="color:#FA5A2A;  font-size: 2.2em;" href="<c:url value='/Store/DetailView.do?username=${item.username}'/>">${item.menu_name}</a><br/>
							<span id="rvMenu"  style="font-size: 1.0em;color:#939393; margin-left: 10px; ">${item.store_name}</span><br>
							<span id="rvNick" style="margin-left:10px;font-size: 1.0em;color:#939393;"> ${item.menu_tend}</span><br>
							
						</div>
							
					</div>
					<hr>
					<div class="row">
						<div class='col-md-12'>		
							<span id="rvTitle" style=" margin-left:40px; margin-bottom: 30px; font-size: 1.2em;color:#5A5A5A;margin-right: 5px;">${item.menu_price}원</span>
							<div id="rvContent" style=" margin-left:40px;margin-top:10px; font-size: 1.0em;color:#5A5A5A;">${item.menu_info}</div>
						</div>
					</div>
									
				</div>
				
			</div>
			<hr style="margin-bottom: 100px;">
		</c:forEach>
		
	</div>
</section>