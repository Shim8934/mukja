<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
thead tr th{
	text-align:center;
}ㅌ
tbody tr td{
	text-align:center;
}
</style>

<div class="app-main__outer">
	<div class="app-main__inner">		
	<!-- app-main__inner 본내용 시작 -->
	<div class="row">
	<div class="col-md-12">
		<div class="main-card card">
			<div class="card-body">
		<h3 class="card-title">공지사항</h3>
					<div class="table-responsive">
						<table class="table table-hover text-center" style="font-family: baedal;">
							<thead>
								<tr>
									<th >신고 번호</th>									
									<th >신고자</th>
									<th >신고 대상자</th>
									<th >신고 제목</th>
									<th >신고 일시</th>
									<th >신고 처리 상태</th>
								</tr>
							</thead>
							<c:if test="${empty list}" var="isEmpty">
								<tr>
									<td colspan="6" >등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
							<c:forEach items="${list}" var="item" varStatus="loop">
							<tbody>
								<tr>
									<td >${totalRecordCount - (((nowPage-1)*pageSize)+loop.index)}</td>
									<td >${item.UR_REPORTER}</td>
									<td >${item.UR_TARGET}</td>
									<td >
										<a href='<c:url value="/UserReportView.bbs?UR_NO=${item.UR_NO}"/>'>${item.UR_TITLE}</a>
										</td>
									<td >${item.UR_REGIDATE}</td>
								<c:if test="${item.UR_TYPE eq 0}" var="confirm">
									<td style="color:red">미처리</td>
								</c:if>
								<c:if test="${not confirm}">
									<td></td>
								</c:if>
								</tr>
							</tbody>
							</c:forEach>
							</c:if>
						</table>
					</div>
					<!-- table 다이브 끝 -->
					
					
					<!-- 페이징 -->
					<div class="d-block text-center card-footer">
						<div class="text-center" style="display:inline-block; text-align:center;">${pagingString}</div>
					</div>
				
						
						<!-- 검색 -->
					</div>
					<!-- main-card -->
					<div class="main-card card">
						<div class="card-body">
							<!-- <div class="text-center">
								<form class="form-inline" method="get" action="<c:url value='/OneMemo/BBS/List.bbs'/>">
									<div class="form-group">
										<select name="searchColumn" class="form-control">
											<option value="title">제목</option>
											<option value="name">작성자</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="form-group">
										<input type="text" name="searchWord" class="form-control" />
									</div>
									<button type="submit" class="btn btn-primary">검색</button>

								</form>
							</div>-->
							<form action="<c:url value="/UserReportList.bbs"/>" method="get">
								<div class="input-group">
									<div class="input-group-prepend">
										<select class="form-control-mb-2" name="searchColumn">
											<option value="UR_REPORTER">신고자</option>
											<option value="UR_TARGET">신고 대상자</option>
											<option value="UR_TITLE">제목</option>
											<option value="UR_CONTENT">내용</option>
										</select>
									</div>
									<input type="text" class="form-control" name="searchWord">
									<div class="input-group-prepend">
										<button class="btn btn-secondary" type="submit">검색</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				</div>
				<!-- 처음 row 끝 -->			
		</div>
	</div>
	<!-- app-main__inner끝 -->