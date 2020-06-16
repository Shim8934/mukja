<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="app-header header-shadow">
	<div class="app-header__logo">
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box">
						<span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> <i
					class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="app-header__content">
		<div class="app-header-right">
			<div class="header-btn-lg pr-0">
				<div class="widget-content p-0">
					<div class="widget-content-wrapper">
						<div class="widget-content-right header-user-info ml-3">
							<a href="<c:url value="/"/>"><button type="button"
									class="btn btn-danger active ">LogOut</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 상단 nav바 끝 -->


<!-- 좌측 사이드바 시작 -->
<div class="app-main">
	<div class="app-sidebar sidebar-shadow">
		<div class="app-header__logo">
			<div class="logo-src"></div>
			<div class="header__pane ml-auto">
				<div>
					<button type="button"
						class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
		</div>
		<div class="app-header__mobile-menu">
			<div>
				<button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
					<span class="hamburger-box">
						<span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
		<div class="app-header__menu">
			<span>
				<button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
					<span class="btn-icon-wrapper">
						<i class="fa fa-ellipsis-v fa-w-6"></i>
					</span>
				</button>
			</span>
		</div>
		<div class="scrollbar-sidebar">
			<div class="app-sidebar__inner">
				<ul class="vertical-nav-menu">
					<!-- 공지사항 -->
					<li class="app-sidebar__heading">공지사항</li>
					<li>
						<a href="<c:url value="/NoticeList.bbs"/>">
							<i class="metismenu-icon pe-7s-display2"></i>
							공지사항 목록
						</a>
					</li>
					<li>
						<a href="<c:url value="/WriteNotice.bbs"/>">
							<i class="metismenu-icon pe-7s-display2"></i>
							공지사항 등록
						</a>
						</li>
					<!-- 가게 관리 -->
					<li class="app-sidebar__heading">가게 관리</li>
					<li>
						<a href="<c:url value="/NewFile.bbs"/>">
							<i class="metismenu-icon pe-7s-display2"></i>
							가게 정보 관리
						</a>
					</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							가게 메뉴 관리
						</a>
					</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							가게 리뷰 관리
						</a>
					</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							가게 신고 관리
						</a>
					</li>
					<!-- 이용자 -->
					<li class="app-sidebar__heading">이용자 관리</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							이용자 정보 관리
						</a>
					</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							같이 먹자 관리
						</a>
					</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							채팅 내역 관리
						</a>
					</li>
					<!-- 신고 관리 -->
					<li class="app-sidebar__heading">신고 관리</li>
					<li>
						<a href="#">
							<i class="metismenu-icon pe-7s-display2"></i>
							신고 내용
							<i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
						</a>
						<ul>
							<li>
								<a href="<c:url value="/UserReportList.bbs"/>">
									<i class="metismenu-icon"></i>유저 신고 목록
								</a>
							</li>
						
							<li>
								<a href="<c:url value="/StoreReportList.bbs"/>">
									<i class="metismenu-icon"></i>스토어 신고 목록
								</a>
							</li>						
						</ul>
					</li>
					
					<li>
						<a href="<c:url value="/AdminReportManage.bbs"/>">
							<i class="metismenu-icon pe-7s-display2"></i>
							신고 처리 여부
							<i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
						</a>
						<ul>
							<li>
								<a href="<c:url value="/UserAdminReportManage.bbs"/>">
									<i class="metismenu-icon"></i>유저 신고 처리
								</a>
							</li>
						
							<li>
								<a href="<c:url value="/StoreAdminReportManage.bbs"/>">
									<i class="metismenu-icon"></i>스토어 신고 처리
								</a>
							</li>						
						</ul>
					</li>	
				</ul>
			</div>
		</div>
	</div>