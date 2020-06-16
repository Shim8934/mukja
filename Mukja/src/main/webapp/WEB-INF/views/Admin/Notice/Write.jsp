<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<script>
$.ajax({ type: "POST",
	enctype: 'multipart/form-data', 
	url: '/WriteNotice.bbs',
	data: formData,
	processData: false, 
	contentType: false,
	cache: false,
	success: function (result) {
		
	},
	error: function (e) {
		
	}});

</script>
 -->

<div class="app-main__outer">
	<div class="app-main__inner">
		<div class="app-page-title">
			<div class="page-title-wrapper">
				<div class="page-title-icon">
					<i class="pe-7s-drawer icon-gradient bg-happy-itmeo"></i>

				</div>
				<!-- page-title-icon끝 -->
			</div>
			<!-- page-title-wrapper끝 -->
		</div>
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성 -->

		<!-- app-main__inner 본내용 시작 -->
		<div class="row">
			<div class="col-md-12">
				<div class="main-card card">
					<div class="card-body">
						<h5 class="card-title">글 등록</h5>
						<form class="" action="<c:url value='/WriteNotice.bbs'/>" enctype="multipart/form-data" method="post">
							<div class="position-relative row form-group">
								<label for="NT_TITLE" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-10">
									<input name="NT_TITLE" id="NT_TITLE" placeholder="제목을 입력하세요." type="text" class="form-control">
								</div>
							</div>
							<div class="position-relative row form-group">
								<label for="NT_CONTENT" class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea name="NT_CONTENT" id="NT_CONTENT" class="form-control" rows="15"></textarea>
								</div>
							</div>
							<div class="position-relative row form-group">
								<label for="NT_IMG" class="col-sm-2 col-form-label">이미지</label>
								<div class="col-sm-10">
									<input multiple="multiple" name="NT_IMG" id="NT_IMG" type="file" class="form-control-file" multiple="multiple">
									<small class="form-text text-muted">업로드 이미지를 등록해 주세요.</small>
								</div>
								<div id="filelist">
								</div>
							</div>
							<div class="position-relative row form-group">
								<div class="col-sm-10 offset-sm-2">
									<button class="mt-2 btn btn-primary" id="btnEnroll">등록</button>
									<button class="mt-2 btn btn-warning">취소</button>
								</div>		
							</div>
							<input name="username" id="username" value="${username}" type="hidden" class="form-control">
						</form>
						
						<!-- 
						컨트롤러에서  MultipartHttpServletRequest 쓰려고 할 때 쓸 버튼
						<button class="mt-2 btn btn-primary" id="btnEnroll">등록</button>
						<button class="mt-2 btn btn-warning">취소</button>
						 -->
					</div>
				</div>
				<!-- main-card -->
			</div>
		</div>
		<!-- col-md-12끝 -->
	</div>
	<!-- 처음 row 끝 -->



</div>
<!-- app-main__inner 끝 -->
</div>
<!-- app-main__outer 끝 -->