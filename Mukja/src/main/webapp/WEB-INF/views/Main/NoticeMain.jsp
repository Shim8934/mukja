<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 로그인용 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
<!-- 부트스트랩 -->
<link href="<c:url value="/resources/adminbootstrap/main.css"/>"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
</head>
<body>
	<div class="app-container app-theme-white body-tabs-shadow">
		<div class="app-main">
			<div class="app-main__outer">
				<div class="app-main__inner">
					<div class="page-title-heading">
						<div class="page-title-icon">
							<i class="pe-7s-diamond icon-gradient bg-warm-flame"> </i>
						</div>
						<div>
							<h2>공지사항</h2>
						</div>
						<div class="divider"></div>
					</div>
					<div class="col-md-12">
						<div id="accordion" class="accordion-wrapper">

							<c:forEach items="${list}" var="item" varStatus="loop">
								<div class="card">
									<div id="heading${loop.index }" class="card-header">
										<button type="button" data-toggle="collapse"
											data-target="#collapse${loop.index }" aria-expanded="true"
											aria-controls="collapse'+k+'"
											class="text-left m-0 p-0 btn btn-link btn-block">
											<h5 class="m-0 p-0">${item.NT_TITLE}<i class="metismenu-state-icon pe-7s-angle-down"></i>
											</h5>
										</button>
									</div>
									<div data-parent="#accordion" id="collapse${loop.index}"
										aria-labelledby="heading${loop.index}" class="collapse">
										<div class="card-body">
										<c:if test="${empty item.BF_PATH}" var="isEmpty"><span>등록된 이미지가 없습니다.</span></c:if>
										<c:if test="${not isEmpty}">
											<c:forEach items="${item.BF_PATH}" var="img" varStatus="loopSt">
												<img alt="" src="<c:url value='/resources/Upload/AdminNotice/${img}'/>">   
											</c:forEach>
										</c:if>
											
											<br/>
											${item.NT_CONTENT}</div>
										
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- accordion 끝 -->

						<!-- 페이징 -->
						<div class="d-block text-center">
							<div class="text-center" id="pagingString"
								style="display: inline-block; text-align: center;">${pagingString}</div>
						</div>
					</div>
				</div>
				<!-- app-main__inner끝 -->
			</div>
		</div>
	</div>

	<!-- 템플릿 스크립트 -->
	<script type="text/javascript" src="<c:url value="/resources/adminbootstrap/assets/scripts/main.js"/>"></script>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" /></script>
</body>
</html>