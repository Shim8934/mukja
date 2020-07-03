<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<section class="hero-wrap hero-wrap-2"
			      style=" margin-left:-30px; width: 120%; margin-bottom: 20px; background-image: url('<c:url value='/resources/menu_IMG/together.jpg'/>');"
			      >
			      <div class="overlay"></div>
			      <div class="container" >
			         <div
			            class="row no-gutters slider-text align-items-center justify-content-center" style="margin-left:-100px; width: 800px;">
			            <div class="col-md-9 ftco-animate text-center">
			               <h1 class="mb-2 bread" style="width: 800px; margin-bottom: 20px;margin-top: 5px;">실시간 현황 관리</h1>
			               <h3 class="mb-2 bread" style="width: 800px; margin-bottom: 20px;margin-top: 5px;">매장의 테이블과 웨이팅을 실시간으로 고객에게 전달합니다</h3>
			            </div>
			         </div>
			      </div>
			   </section>
            <section style="height: 1500px;" class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt myCon">
               <div class="container item">
                  <div class="row no-gutters">
                     
                     <div class="col-sm-12 wrap-about py-5 ftco-animate">
                        <div class="heading-section mt-5 mb-4">
                           <div class="pl-lg-5 ml-md-5">
                              <span class="subheading" >Table Info</span>
                              <h2 class="mb-4" >실시간 테이블 관리</h2><br>
                              <h3 class="mb-4" style="margin-top:-20px; color: #595959;">테이블을 클릭하여 실시간 반영</h3>
                           </div>
                        </div>
                        <div class="pl-lg-5 ml-md-5">
                           <!-- 가게 정보 -->
                           <div id='tableDiv'>
	                        
                           </div>
                         
                    	 </div>
                    	 <hr>
                    	 <div class="myCon">
	                    	 <div class="heading-section mt-5 mb-4 item">
	                           <div class="pl-lg-5 ml-md-5">
	                              <span class="subheading" >Wating Info</span>
	                              <h2 class="mb-4" >실시간 웨이팅 관리</h2><br>
	                              <h3 class="mb-4" style=" margin-top:-20px; margin-buttom:20px;color:  #595959;">웨이팅과 대기시간을 입력후 버튼 클릭  반영</h3>
	                           </div>
	                        </div>
	                          <div class="form-group item">
						       
						       <div class="col-xs-offset-4 col-xs-5">
						       		<h3>대기중인 팀 수</h3>
						       		<input type="text" class="form-control" id="wating" >
						       </div>
						      
						       
						     </div>
					     <div class="myCon">
					     <div class="form-group item">
					      
					        <div  class="col-xs-offset-4 col-xs-5 item">
					       		<h3>팀당 평균 대기 시간</h3>
					       		<input type="text" class="form-control" id="avgTime" >
					       </div>
					       
					     </div>
					      <div class="form-group">
					       <div class="col-xs-offset-4 col-xs-5">
					       		<a style="margin-top: 50px; " class="btn btn-default" id="btn_setWating">입력</a>
					       </div>
                      
                        </div>
                           
                  </div>
                
               </div>
                   <hr>
               </div>
               </div></div>
            </section>

<script>
var table_info = JSON.parse('${table_Info}');
var sendJson
console.log(table_info);
var row = table_info["y_boundary"];
var col = table_info["x_boundary"];
console.log("행 : "+row+" / 열 : "+col);
for(var i =0; i<row;i++){
	for(var j=0; j<col;j++){
		console.log(i+"행 "+j+"열 : "+table_info[""+i][j]);
		var innerDiv
		if(table_info[i][j]!="w"){
			    innerDiv= '<div id="'+i+'n'+j+'" class="tableInfoInner '+table_info[i][j]+'">'+
						  ' '
	        			  '</div>';
		}else{
			 innerDiv= '<div id="'+i+'n'+j+'" class="tableInfoInner2 '+table_info[i][j]+'">'+
					   ' '
					   '</div>';
		}
		$("#tableDiv").append(innerDiv);
	}
	$("#tableDiv").append("<div></div>");
}


$('#wating').val("0");
$('#avgTime').val("0");
var wating=$('#wating').val();
var avgTime=$('#avgTime').val();





var all_g =  document.querySelectorAll(".tableInfoInner");
console.log("all_g");
console.log(all_g);


$("#btn_setWating").click(function(){
	wating=$('#wating').val();
	avgTime=$('#avgTime').val();
	console.log("웨이팅버튼 클릭");
	for(var i =0; i<row;i++){
		for(var j=0; j<col;j++){
			var getClassName=$('#'+i+'n'+j).attr('class');
			table_info[i][j]=getClassName.slice(-1);
		}
	}
	 table_info.wating_count=wating;
     table_info.avg_wating_time=avgTime;
     console.log(wating);
     console.log(avgTime);
	 sendJson={'data':JSON.stringify(table_info)}
	
	console.log(sendJson);
	 $.ajax({
			url:"<c:url value='/updateReservation.do'/>",
			data : sendJson,
			dataType:'json',
			success:function(data){
				console.log("성공");
				
				
			},
			error:function(){
				console.log("실패");
			}
		})
});


all_g.forEach(function(inner,index){
	inner.addEventListener('click', function(){
		if(inner.className =='tableInfoInner g'){
			inner.className ='tableInfoInner b';
			for(var i =0; i<row;i++){
				for(var j=0; j<col;j++){
					var getClassName=$('#'+i+'n'+j).attr('class');
					table_info[i][j]=getClassName.slice(-1);
				}
			}
			console.log(table_info);
			
			 table_info.wating_count=wating;
             table_info.avg_wating_time=avgTime;
             console.log(wating);
             console.log(avgTime);
			sendJson={'data':JSON.stringify(table_info)}
			
			console.log(sendJson);

			

			 $.ajax({
				url:"<c:url value='/updateReservation.do'/>",
				data : sendJson,
				dataType:'json',
				success:function(data){
					console.log("성공");
					
					
				},
				error:function(){
					console.log("실패");
				}
			})
			 
		}else{
			inner.className ='tableInfoInner g';
			for(var i =0; i<row;i++){
				for(var j=0; j<col;j++){
					var getClassName=$('#'+i+'n'+j).attr('class');
					table_info[i][j]=getClassName.slice(-1);
				}
			}
			console.log(table_info);
			var sendJson={'data':JSON.stringify(table_info)}
			
			console.log(sendJson);
			 $.ajax({
				url:"<c:url value='/updateReservation.do'/>",
				data : sendJson,
				dataType:'json',
				success:function(data){
					console.log("성공");
					
					
				},
				error:function(){
					console.log("실패");
				}
			})
		}
		
	});
	
	
});


</script>
            
        


