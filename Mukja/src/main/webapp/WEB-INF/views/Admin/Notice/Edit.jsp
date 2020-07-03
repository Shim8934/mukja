<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$('#btnCancel').click(function(){
		window.history.back();
	})

	
	//등록 이미지 등록 미리보기
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#preview').html("<a href=\"javascript:void(0);\" onclick=\"deleteImageAction()\" id=\"img_id\"><img src="+ e.target.result +" title='Click to remove'></a>");
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	$(".inp-img").on('change', function(){
	    readInputFile(this);
	});

});

	// 등록 이미지 삭제 ( input file reset )
	var resetInputFile = function($input, $preview) {
	    var agent = navigator.userAgent.toLowerCase();
	    if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
	        // ie 일때
	        $input.replaceWith($input.clone(true));
	        $preview.empty();
	    } else {
	        //other
	        $input.val("");
	        $preview.empty();
	    }       
	}
	
	var deleteImageAction = function(){
		var img_id = "#img_id";
		$(img_id).remove();
		var $input = $(".inp-img");
	    var $preview = $('#preview');
	    resetInputFile($input, $preview);
	}


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
									<input multiple="multiple" name="BF_PATH" id="BF_PATH" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp"
									 class="form-control-file inp-img" multiple="multiple">
									<small class="form-text text-muted">업로드 이미지를 등록해 주세요.</small>
								</div>
								<div class="col-sm-10 text-center">
									<c:if test="${empty record.BF_PATH }" var="emptyImg">
										<div class="text-center">
											<p>기존 등록 이미지가 존재하지 않습니다.</p>									
										</div>
									</c:if>
									<c:if test="${not emptyImg}">
										<img alt="기존 등록 이미지가 존재하지 않습니다." src="<c:url value="/resources/Upload/AdminNotice/${record.BF_PATH}"/>">
									</c:if>
								</div>
								<div id="preview" class="col-sm-10 offset-sm-2"></div>
							</div>
							<div class="position-relative row form-group">
								<div class="col-sm-10 offset-sm-2">
									<button class="mt-2 btn btn-primary" id="btnEnroll" type="submit">등록</button>
									<button class="mt-2 btn btn-warning" id="btnCancel" type="button">취소</button>
								</div>		
							</div>
							
							<input name="username" id="username" value="${username}" type="hidden" class="form-control">
							<input name="NT_NO" id="NT_NO" value="${record.NT_NO}" type="hidden" class="form-control">
							<c:if test="${empty record.BF_PATH}" var="isNullImg">
								<input name="ori_PATH" id="ori_PATH" value="null" type="hidden" class="form-control">
							</c:if>
							<c:if test="${not isNullImg }">
								<input name="ori_PATH" id="ori_PATH" value="${record.BF_PATH}" type="hidden" class="form-control">
							</c:if>
							
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