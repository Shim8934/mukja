<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg'); height: 200px" id='signup' data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-2 bread">회원 신고하기</h1>
				<p class="breadcrumbs"> </p>
			</div>
		</div>
	</div>
	
</section>
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container" id='signup'>
			<div class="row d-flex">
				<div class="col-md-12 ftco-animate makereservation p-4 p-md-5">
					<form action="<c:url value='/userReport.bbs'/>" method="POST" enctype="multipart/form-data">
						<div class="row">
						

							 <div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="ur_title">신고자</label> ${user_id}
									<input type="text" class="form-control" id="ur_reporter" name="ur_reporter" value="${user_id}" readonly="readonly">
									<div class="check_font" id="password_check"></div>
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="message" style="text-align: right;">신고할 회원</label><div style="padding-bottom: 15px;">
										<select id="ur_target" name="ur_target" style="padding: 10px; boder-radius: 3%;">
											<option>신고할 회원을 골라주세요</option>
											<c:forEach items="${urns}" var="urn" varStatus="loop">
												<option value="${urn.username}">${urn.u_nick}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							
							
							
							
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="ur_title">신고 제목</label>
									<input type="text" class="form-control" id="ur_title" name="ur_title" placeholder="신고 사유">
								</div>
							</div>
							<div class="col-md-offset-3 col-md-6">
								<div class="form-group">
									<label for="ur_content">신고 내용</label>
									<textarea class="form-control" rows="5" id="ur_content" name="ur_content" placeholder="신고 내용을 입력해주세요."></textarea>
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
								<input type="submit" value="신고 접수" class="btn btn-primary py-3 px-5"
									style="width: 100%; height: 100%; font-size: 20px;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>