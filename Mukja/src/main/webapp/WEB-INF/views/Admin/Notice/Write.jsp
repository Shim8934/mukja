<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<div class="app-main__outer">
	<div class="app-main__inner">
   		<div class="app-page-title">
			<div class="page-title-wrapper">
				<div class="page-title-icon">
                    <i class="pe-7s-drawer icon-gradient bg-happy-itmeo">
                    </i>
                </div>
                <!-- page-title-icon끝 -->
			</div>
			<!-- page-title-wrapper끝 -->
		</div>
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성  / app-main__inner 본내용 시작  -->
		<div class="main-card card">
			<div class="card-body">
				<h5 class="card-title">글 등록 페이지</h5>
				<form class="">
					<div class="position-relative form-group">
						<label for="NT_TITLE" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input name="NT_TITLE" id="NT_TITLE" placeholder="제목을 입력하세요." type="text" class="form-control">
						</div>
					</div>
					<div class="position-relative form-group">
						<label for="NT_CONTENT" class="">내용</label>
						<input name="NT_CONTENT" id="NT_CONTENT" placeholder="내용을 입력하세요." type="text" class="form-control">
					</div>
					<div class="position-relative form-group">
						<label for="NT_IMAGE" class="">이미지</label>
						<input name="NT_IMAGE" id="NT_IMAGE" type="file" class="form-control-file">
						<small class="form-text text-muted">이미지는 500mb까지 올릴 수 있습니다.</small> 
					</div>
					<button class="mt-2 btn btn-primary"><i class=""></i></button>
				</form>
			</div>
		</div>
	</div>
	<!-- app-main__inner 끝 -->
</div>
<!-- app-main__outer 끝 -->