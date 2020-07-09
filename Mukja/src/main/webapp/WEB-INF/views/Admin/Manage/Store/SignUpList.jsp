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
<!-- kokomap -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a45e344f16919a36280686197bec35c&libraries=services"></script>
<script>
$(function(){
	var lat;
	var lng;
	var store_ADDR;
	var store_NAME;

	// 지도를 표시하는 div 크기를 변경하는 함수입니다
	var resizeMap = function() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.position = 'relative';
	    mapContainer.style.width = '100%';
	    mapContainer.style.height = '400px'; 
	}

	var relayout;
	
	$('td button:first-child').click(function(){
		var latlng = $(this).attr('value').split(",");
		// 위도, 경도, 주소, 가게 이름
		lat = latlng[0];
		lng = latlng[1];
		store_ADDR = latlng[2];
		store_NAME = latlng[3];
		console.log(lat+'   lat 출력')
		console.log(lng+'   lng 출력')
		console.log(store_ADDR +' 가게 주소 출력')
		console.log(store_NAME+'  가게 이름 출력')
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		relayout = function() {    
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map.relayout();
		}

		/*---------------------------------지도 중심 이동------------------------------------------*/
		var panTo = function () {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(lat, lng);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}        
		
		
		/*---------------------------------마커 표시------------------------------------------*/
				
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(lat, lng); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		
		/*--------------------------------- 인포 윈도우 표시 ------------------------------------------*/
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var iwContent = '<div style="padding:5px;">' + store_NAME +
						'<br><a href="https://map.kakao.com/link/map/' + store_NAME +
						',' + lat + ',' + lng +
						'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/' + store_NAME+
						',' + lat + ',' + lng + '" style="color:blue" target="_blank">길찾기</a></div>',
		    iwPosition = new kakao.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
		    iwRemoveable = true; // 닫기 버튼
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			map: map, // 인포윈도우가 표시될 지도
		    position : iwPosition, 
		    content : iwContent,
		    removable : iwRemoveable
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		
		/*---------------------------------커스텀 오버레이 표시------------------------------------------
		// 커스텀 오버레이에 표시할 내용입니다     
		// HTML 문자열 또는 Dom Element 입니다 
		var content = '<div style="padding:5px;">' + store_NAME +
						'<br><a href="https://map.kakao.com/link/map/' + store_NAME +
						',' + lat + ',' + lng +
						'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/' + store_NAME+
						',' + lat + ',' + lng + '" style="color:blue" target="_blank">길찾기</a></div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(lat, lng);  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    position: position,
		    content: content,
		    xAnchor: 0.3,
		    yAnchor: 0.91
		});

		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map,marker);
		*/
		/*-----------------------------------------------------------------지도 관련 스크립트 끝-----------------------------------------------------------------*/
		setTimeout(function(){
			relayout();
			panTo();
			
			
		},200 )
	})


		


/* -------------------------클래스 변경 감시자 세팅 -----------------------------

이거 안 씀

// 대상 node 선택
	
	var target = document.getElementById('map');
	 
	// 감시자 인스턴스 만들기
	var observer = new MutationObserver(function(mutations) {
	  mutations.forEach(function(mutation) {
	    console.log(mutation.type);
	    setTimeout(function(){
	    	resizeMap();
	    },0);
	  });    
	});
	 
	// 감시자의 설정:
	var config = {
			attributes: true,
			childList: true,
			characterData: true
	};
	 
	// 감시자 옵션 포함, 대상 노드에 전달
	observer.observe(target, config);
	 
	$('#btnCheck').click(function(){
		// 나중에, 감시를 중지 가능
		observer.disconnect();
	})

	*/

		var username;
		var nowPage=$('#nowPage').val();
		
		$('td button:last-child').click(function() {
			username = $(this).attr('value');
			console.log(username);
		})

		$('#signCheck')
				.click(
						function() {
							console.log(username + '   가게아이디 체크');
							$
									.ajax({
										url : "<c:url value='/StSignUpdate.bbs'/>",
										data : {
											"username" : username,
											"nowPage":nowPage
										},
										dataType : 'json',
										success : function(data) {
											console.log('성공..?:', data);
											alert('승인 완료!');
											window.location = "<c:url value='/SignUpList.bbs?nowPage="+nowPage+"'/>";
										},
										error : function(request, status, error) {
											console
													.log(
															'응답코드:%s,에러메시지:%s,error:%s,status:%s',
															request.status,
															request.responseText,
															error, status);
										}
									});
						})
	})
</script>

<div class="app-main__outer">
	<div class="app-main__inner">
	<!-- app-main__inner 본내용 시작 -->
	<div class="row">
	<div class="col-md-12">
		<div class="main-card card">
			<div class="card-body">
		<h3 class="card-title">가입관리</h3>
		
				<div class="table-responsive">
					<table class="table table-hover" style="font-family: baedal;">
						<thead>
							<th></th>
							<th>가게ID</th>
                    	    <th>가게명</th>
	                        <th>사업자등록번호</th>
	                        <th>가게 전화번호</th>
	                        <th>Email</th>
	                        <th>위치</th>
	                        <th>승인</th>
						</thead>
						<c:if test="${empty list}" var="isEmpty">
							<tr>
								<td colspan="8" >제휴 신청이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty}">
						<c:forEach items="${list}" var="item" varStatus="loop">
						
						<tbody>
							<tr>
								<td >${totalRecordCount - (((nowPage-1)*pageSize)+loop.index)}</td>
								<td >${item.username }</td>
								<td >${item.store_NAME }</td>
								<td >${item.store_REGINUM}</td>
								<td >${item.store_PHNUM}</td>
								<td >${item.store_EMAIL}</td>
								<td >
									<button type="button" value="${item.store_LAT},${item.store_LNG},${item.store_ADDR},${item.store_NAME}" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#modalMap">
										위치 확인
									</button>
								</td>
								<td >
									<button type="button" value="${item.username}" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#signConfirm">
										가입 승인
									</button>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:if>
					</table>
					<input type="hidden" id="nowPage" value="${nowPage}">
				</div>
				<!-- table 다이브 끝 -->
				
				<!-- 페이징 -->
				<div class="d-block text-center card-footer">
					<div class="text-center" style="display:inline-block; text-align:center;">${pagingString}</div>
				</div>
					
					<!-- 검색 -->
				</div>
				</div>
			</div>
			<!-- 처음 row 끝 -->
			
			</div>
		</div>
	
	</div>
	<!-- app-main__inner끝 -->
</div>
	
	
<div class="modal fade bd-example-modal-lg" id="signConfirm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-exclamation icon-gradient bg-deep-blue"></i>&nbsp;&nbsp;주의</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
				<p>확인을 누르시면 가입승인 됩니다.</p>
				<p>정말 진행하시겠습니까?</p>
			</div>
            <div class="modal-footer">
               <a class="btn btn-primary" style="cursor:pointer;" id="signCheck" href="javascript:click()">확인</a>
       		   <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="modalMap" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-exclamation icon-gradient bg-deep-blue"></i>&nbsp;&nbsp;위치</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
				<div class="col-md-12">
					<div class="main-card mb-3 card">
						<div class="card-body">
							<div class="col-md-12" style="height: 400px;position:rel" id="map1">
								<div id="map" style="width:100%;height:100%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
            <div class="modal-footer">               
       		   <button type="button" class="btn btn-secondary" id="btnCheck" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
