<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- COUNTING -->
<section class="ftco-section ftco-counter img" id="section-counter"
	style="margin-top:30px; background-image: url(<c:url value="/resources/bootstrap/images/bg_4.jpg"/>);"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row d-md-flex align-items-center justify-content-center">
			<div class="col-lg-10">
				<div class="row d-md-flex align-items-center">
			
					
					<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<h1 style="font-size: 4.0em; color: white; font-weight: bold;">이미지 수정</h1>
							</div>
						</div>
					</div>
				
				
				</div>
			</div>
		</div>
	</div>
</section>

<div>

</div>
	<div>
		<!-- 이미지 다이브 -->
		<h1>기존 이미지</h1>
	 	<c:forEach items="${imglist}" var="imgDTO">
			<img src="<c:url value='${imgDTO.}'/>">
		</c:forEach>
		
		<!-- 이미지 다이브 -->
		<div style=" text-align: center; height: 700px; margin-top: 30px;">
			<form>
			  <div style="display: inline-block;" class="form-group">
			    <label for="exampleInputFile">파일 업로드</label>
			    <input type="file" id="exampleInputFile">
			    <p class="help-block">여기에 블록레벨 도움말 예제</p>
			  </div>
			  <button type="submit" class="btn btn-default">제출</button>
			</form>
		</div>
	</div>