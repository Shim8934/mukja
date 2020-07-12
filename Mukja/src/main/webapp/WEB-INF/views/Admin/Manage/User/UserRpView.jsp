<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<script>
	function click() {		
		var UR_NO = $('#UR_NO').val();
		var username = $('#username').val();
		console.log(UR_NO)
		console.log(username)
			$.ajax({
				url:"<c:url value='/UsReportUpdate.bbs'/>",
			    data: {"username":username,"UR_NO":UR_NO},			    
		        dataType: 'json',
		        success : function(data){
					console.log('성공..?:',data);
					alert('벤 처리 완료!');
					window.location = "<c:url value='/UserReportList.bbs'/>";
				},
				error:function(request,status,error){
					console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
							request.status,request.responseText,error,status);
				}
			});
	};
	</script>
<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성 -->

		<!-- app-main__inner 본내용 시작 -->
		<div class="row">
		<div class="col-md-12">
			<div class="main-card card">
				<div class="card-header">
					${record.UR_TITLE }
					<div class="btn-actions-pane-right">
						<div role="group" class="btn-group-sm btn-group">
						<c:if test="${empty prev}" var="isPrev">
							<a href="#"><button class="btn btn-transition btn-outline-light">이전 글</button></a>
						</c:if>
						<c:if test="${not isPrev}">
							<a href="<c:url value="/UserReportView.bbs?NT_NO=${prev.UR_NO}"/>"><button class="btn btn-transition btn-outline-light">이전 글</button></a>
						</c:if>
						<c:if test="${empty next}" var="isNext">
							<a href="#"><button class="btn btn-transition btn-outline-light">다음 글</button></a>
						</c:if>
						<c:if test="${not isNext}">
							<a href="<c:url value="/UserReportView.bbs?NT_NO=${next.UR_NO}"/>"><button class="btn btn-transition btn-outline-light">다음 글</button></a>
						</c:if>
						</div>
					</div>
				</div>
				<!-- card-header -->
				<div class="card-body">
					<div class="tab-content">
					<input type="hidden" id="username" value="${record.UR_TARGET}">
					<input type="hidden" id="UR_NO" value="${record.UR_NO}">
						<div class="text-right"><h6 class="text-uppercase font-size-md font-weight-normal">${record.UR_REGIDATE}</h6></div>
						<div class="text-left"><h6 class="text-uppercase font-size-md font-weight-normal">신고자 : ${record.UR_REPORTER}</h6></div>
						<div>
							<div class="text-left">
								<h6 class="text-uppercase font-size-md font-weight-normal">대상자 : ${record.UR_TARGET}</h6>
								<div class="text-right">
									 <button type="button" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">대상자 벤</button>
								</div><c:if test="${record.UR_TYPE}"></c:if>
								<div class="text-right">처리 상태 :</div>
							</div>
						</div>
						<div class="scroll-area-md">
							<div class="scroll-container ps--active-yps">
								${record.UR_CONTENT}
							</div>
						</div>
						<div class="d-block text-center card-footer">
							<a href="<c:url value="/DeleteUsRP.bbs?UR_NO=${record.UR_NO}"/>">
								<button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger">
								<i class="pe-7s-trash btn-icon-wrapper"></i></button>
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

<!-- Large modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-exclamation icon-gradient bg-deep-blue"></i>&nbsp;&nbsp;주의</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>확인을 누르시면 해당 유저 계정은 사이트 이용 불가상태가 됩니다.</p>
                <p>정말 진행하시겠습니까?</p>
            </div>
            <div class="modal-footer">
               <a class="btn btn-primary" style="cursor:pointer;" id="benCheck" href="javascript:click()">확인</a>
       		   <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
