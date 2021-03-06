<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
thead th{
	text-align:center;
}
tr td{
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
			<div class="text-right">
				<a href="<c:url value='/WriteNotice.bbs'/>" class="btn btn-success" style="margin-bottom: 1em;">등록 </a>
			</div>
					<div class="table-responsive">
						<table class="table table-hover" style="font-family: baedal;">
							<thead>
								<th></th>
								<th >제목</th>
								<th >작성자</th>
								<th >작성일</th>
							</thead>
							<c:if test="${empty list}" var="isEmpty">
								<tr>
									<td colspan="5" >등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
							<c:forEach items="${list}" var="item" varStatus="loop">
							<tbody>
								<tr>
									<td >${totalRecordCount - (((nowPage-1)*pageSize)+loop.index)}</td>
									<td >
										<a href='<c:url value="/OneNoticeView.bbs?NT_NO=${item.NT_NO}"/>'>${item.NT_TITLE}</a></td>
									<td >${item.username}</td>
									<td >${item.NT_REGITDATE}</td>
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
							<form action="<c:url value="/NoticeList.bbs"/>" method="get">
								<div class="input-group">
									<div class="input-group-prepend">
										<select class="form-control-mb-2" name="searchColumn">
											<option value="NT_TITLE">제목</option>
											<option value="username">작성자</option>
											<option value="NT_CONTENT">내용</option>
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