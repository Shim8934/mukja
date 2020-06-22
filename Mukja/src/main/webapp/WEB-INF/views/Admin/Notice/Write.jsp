<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$('#BF_PATH').change(function(){
        const target = document.getElementsByName('BF_PATH');
        
        var html = '';
        $.each(target[0].files, function(index, file){
            const fileName = file.name;
            html += '<div class="file">';
            html += '<img src="'+URL.createObjectURL(file)+'">'
            html += '<span>&nbsp;&nbsp;'+fileName+'</span>';
            html += '<a href="#" id="removeImg">╳</a>';
            html += '</div>';
            const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
            if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "jpeg"){
                alert("파일은 (jpg, jpeg, png, gif, bmp) 형식만 등록 가능합니다.");
                resetFile();
                return false;
            }
            $('.fileList').html(html);
        });
 
    });


})

</script>
<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성 -->
		<!-- app-main__inner 본내용 시작 -->
		<div class="row">
			<div class="col-md-12">
				<div class="main-card card">
					<div class="card-body">
						<h5 class="card-title">글 등록</h5>
				 <form class="" id="noticeForm" action="<c:url value='/WriteNotice.bbs'/>" enctype="multipart/form-data" method="post">
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
								<label for="BF_PATH" class="col-sm-2 col-form-label">이미지</label>
								<div class="col-sm-10">
									<input multiple="multiple" name="BF_PATH" id="BF_PATH" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp"
									 class="form-control-file" multiple="multiple">
									<small class="form-text text-muted">업로드 이미지를 등록해 주세요.</small>
								</div>
								<div class="fileList">
								</div>
							</div>
							<div class="position-relative row form-group">
								<div class="col-sm-10 offset-sm-2">
									<button class="mt-2 btn btn-primary" id="btnEnroll">등록</button>
									<button class="mt-2 btn btn-warning" id="btnCancel" type="button">취소</button>
								</div>		
							</div>
							<input name="username" id="username" value="${username}" type="hidden" class="form-control">
						</form>
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
</div>
<!-- app-main__outer 끝 -->