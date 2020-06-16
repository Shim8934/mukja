<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 썸머노트용 -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  
<script>
	$(document).ready(function() {
		$('#Notice').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			callbacks : { //여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				}
			}
		});
		
	$("div.note-editable").on('drop',function(e){
         for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
         	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#Notice")[0]);
         }
        e.preventDefault();
   })
   
   function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	   
	});
	/**
	 * 이미지 파일 업로드
	 */
	
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
						<h5 class="card-title">글 등록</h5>
						<div class="form-group">
							<label for="Notice">내용</label>
							<textarea name="Notice" id="Notice"></textarea>
							<button class="mt-2 btn btn-primary" id="btnEnroll">등록</button>
							<button class="mt-2 btn btn-warning">취소</button>
						</div>

						<!-- <form class="" action="<c:url value='/WriteNotice.bbs'/>" enctype="multipart/form-data" method="post">
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
						 -->
						<!-- 
						컨트롤러에서  MultipartHttpServletRequest 쓰려고 할 때 쓸 버튼
						
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
<!-- app-main__outer 끝 -->
</body>
</html>