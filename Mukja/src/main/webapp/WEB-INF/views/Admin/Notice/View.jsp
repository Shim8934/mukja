<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성 -->

		<!-- app-main__inner 본내용 시작 -->
		<div class="row">
		<div class="col-md-12">
			<div class="main-card card">
				<div class="card-header">
					${record.NT_TITLE}
					<div class="btn-actions-pane-right">
						<div role="group" class="btn-group-sm btn-group">
						<c:if test="${empty prev}" var="isPrev">
							<a href="#"><button class="btn btn-transition btn-outline-light">이전 글</button></a>
						</c:if>
						<c:if test="${not isPrev}">
							<a href="<c:url value="/OneNoticeView.bbs?NT_NO=${prev.NT_NO}"/>"><button class="btn btn-transition btn-outline-light">이전 글</button></a>
						</c:if>
						<c:if test="${empty next}" var="isNext">
							<a href="#"><button class="btn btn-transition btn-outline-light">다음 글</button></a>
						</c:if>
						<c:if test="${not isNext}">
							<a href="<c:url value="/OneNoticeView.bbs?NT_NO=${next.NT_NO}"/>"><button class="btn btn-transition btn-outline-light">다음 글</button></a>
						</c:if>						
						</div>
					</div>
				</div>
				<!-- card-header -->
				<div class="card-body">
					<div class="tab-content">
						<div class="text-right"><h6 class="text-uppercase font-size-md font-weight-normal">작성자 : ${record.username}</h6></div>
						<div class="text-right"><h6 class="text-uppercase font-size-md font-weight-normal">${record.NT_REGITDATE}</h6></div>
							<c:if test="${empty record.BF_PATH}" var="isEmpty">
								<div class="scroll-container ps--active-yps text-center">
									등록된 이미지가 없습니다.
								</div>
							</c:if>
							<c:if test="${not isEmpty}">
									<div class="text-center">
											<img src="<c:url value="${record.BF_PATH}"/>">
									</div>		
							</c:if>
						<div class="scroll-area-md">
							<div class="scroll-container ps--active-yps">
								${record.NT_CONTENT}
							</div>
						</div>
						
													
						<div>
						</div>
						<div class="d-block text-center card-footer">
							<a href="<c:url value="/EditNotice.bbs?NT_NO=${record.NT_NO}"/>">
								<button class="btn btn-transition btn-outline-light">수정</button>
							</a>
							&nbsp;
							<a href="<c:url value="/DeleteNotice.bbs?NT_NO=${record.NT_NO}"/>">
								<button class="btn btn-transition btn-outline-danger">
								삭제</button>
							</a>
							&nbsp;
							<a href="<c:url value="/NoticeList.bbs"/>">
								<button class="btn btn-transition btn-outline-light">돌아가기</button>
							</a>
						</div>
						</div>
						<!-- tab-content -->
						</div>
						<!-- card-body -->
					</div>
					<!-- -->
				</div>
				<!-- main-card -->
			</div>
			<!-- col-md-12끝 -->
		</div>
		<!-- 처음 row 끝 -->



	</div>
	<!-- app-main__inner 끝 -->
</div>
<!-- app-main__outer 끝 -->