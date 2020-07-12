<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script>

$(function(){
	var signCount, rpCount;
	signCount = '${getStSignRecord}';
	signUpTotalCount = '${signUpTotalCount}';
	rpCount = '${reportCount}';
	rpTotalCount = '${UsRpTotalCount}'
	
	var ctx = $("#allTaskChart");
	
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['미처리분 제휴신청','전체 회원수', '미처리분 신고','전체 신고수'],
	        datasets: [{
	        	label : '#Task',
	            data: [signUpTotalCount,signCount,  rpTotalCount,rpCount],
	            backgroundColor: [
	            	'rgba(255, 99, 132, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(75, 192, 192, 0.2)'
	            	
	            ],
	            borderColor: [
	            	'rgba(255, 99, 132, 1)',
	            	'rgba(75, 192, 192, 1)',
	            	'rgba(255, 99, 132, 1)',
	            	'rgba(75, 192, 192, 1)'
	            	
	                
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	document.getElementById("allTaskChart").onclick = function(evt)	{
		console.log('차트 클릭함')
	    console.log("this 클릭? = "+this)
	    console.log(this.data.labels)
	}
})

</script>

<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- 여기까지는 항상 고정!!! 아래에 내용 작성 -->
		<div class="app-page-title">
			<div class="page-title-wrapper">
				<div class="page-title-heading">
					<div class="page-title-icon">
						<i class="pe-7s-bandaid icon-gradient bg-amy-crisp"></i>
					</div>
					<div>
						Management Summary
						<div class="page-title-subheading">각종 새로운 업무를 한 눈에!</div>
					</div>
				</div>
			</div>
		</div>


		<div class="tab-content">
			<div class="tab-pane tabs-animation fade active show"
				id="tab-content-1" role="tabpanel">
				<div class="row">
				<div class="col-md-12">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<h5 class="card-title">Today's Task</h5>
								<canvas id="allTaskChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- app-main__inner 끝 -->