<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
		
	$(function(){
		var NT_NO = document.getElementById('NT_NO').value;
		console.log('NT_NO 출력 제이쿼리 안')
		console.log(NT_NO)
		window.onload = FileLoad();		
		var formData = new FormData($('#editForm'));
		// 
		function FileLoad(){
			
			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',
				url: "<c:url value='/selectFiles.bbs'/>",
				data: formData,
				processData: false, 
				contentType: false, 
				cache: false,
				success: function (result) {
					console.log('파일 조회 성공?')
				},
				error: function (e) {
					
				}

			});
		}
	})
	/* 페이지 로드 시점에, 파일 조회해서 input 파일태그 안에 장착 */
	
	
	
	$(function(){
		
	});
</script>

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
						<h5 class="card-title">글 수정</h5>
						<form class="" action="<c:url value='/EditNotice.bbs'/>" id="editForm" enctype="multipart/form-data" method="post">
							<div class="position-relative row form-group">
								<label for="NT_TITLE" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-10">
									<input name="NT_TITLE" id="NT_TITLE" placeholder="제목을 입력하세요." type="text" class="form-control" value="${record.NT_TITLE}">
								</div>
							</div>
							<div class="position-relative row form-group">
								<label for="NT_CONTENT" class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea name="NT_CONTENT" id="NT_CONTENT" class="form-control" rows="15">${record.NT_CONTENT}</textarea>
								</div>
							</div>
							<div class="position-relative row form-group">
								<label for="BF_PATH" class="col-sm-2 col-form-label">이미지</label>
								<div class="col-sm-10">
									<input multiple="multiple" name="BF_PATH" id="BF_PATH" type="file" class="form-control-file"
									 multiple="multiple" value="">
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
							<input name="NT_NO" id="NT_NO" value="${record.NT_NO}" type="text" class="form-control">
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