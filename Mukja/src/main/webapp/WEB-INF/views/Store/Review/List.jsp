<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->


<!-- GRAY THING -->
<script>

function request_ERList_Ajax(store_id){
	
	//----------------------생성한 동적 다이브에 에이젝스 송출
    $.ajax({
		url:"<c:url value='/eat_together_list.do'/>",
		data:store_id,
		dataType:'json',
		success:function(data){
			$('#modal_content').empty();
			console.log('같이먹자 방목록 진입');
			console.log(data);
			var empty_div;
			if(data.length==0){
				empty_div = 
				     '<div class="myborder col-md-8 " style="text-align:center;">'+
				     ' <h3>생성된 방이 없어요!..</h3>'+
				     '</div>';
			}
			$('#modal_content').append(empty_div);
			
			console.log("방리스트크기:"+data.length);
			for(var i=0;i<data.length;i++){
				var tend_codes=['FS','EG','MK','BD','PK','CW','PE','SF','DP','FL','SB'];
			    var user_tend = data[i].u_tend.split(',');	
			    var er_tend = data[i].er_tend.split(',');	
			  
			    
				$('#showuser'+i).remove();
				 var together_list;
				if(data[i].er_max!=data[i].er_curr){
					 together_list = 
						 '<div class="row" style="margin-bottom:50px" >'+
					     '	<div class="col-md-4">'+
					     '		<div class="myborder">'+
					     '   	  <a id="prof'+i+'">'+
					     '		<h4>모임 기피재료</h4>'+
					     '     </a>'+
					     '	</div>'+
					     '</div>'+
					     '<div class="myborder col-md-8 ">'+
					     '     <h2>'+data[i].er_title+'</h2>'+
					     '     <hr>'+
					     '     <p>내용 : '+data[i].er_content+'</p>'+
					     '     <h4>인원 : '+data[i].er_max+'명/'+data[i].er_curr+'명</h4>'+
					     '     <h4>모임날 : '+data[i].er_time+'</h4>'+
					     '     <hr>'+
					     '     <a id="btn_show'+i+'" class="btn btn-default" >모임장 정보보기</a>'+
					     '	   <sec:authorize access="isAuthenticated()">'+
					     '   	  <a id="btn_erjoin'+data[i].er_no+'" class="all_erjoin btn btn-default">'+
					     '				참가신청하기'+
					     '			</a>'+
					     '	   </sec:authorize>'+
					     '</div>';
			    }else{
			    	 together_list = 
						 '<div class="row" style="margin-bottom:50px" >'+
					     '	<div class="col-md-4">'+
					     '		<div class="myborder">'+
					     '  	   <a id="prof'+i+'">'+
					     '			 <h4>모임 기피재료</h4>'+
					     ' 	   	   </a>'+
					     '		</div>'+
					     '  </div>'+
					     '  <div class="myborder col-md-8 ">'+
					     '     <h2>'+data[i].er_title+'</h2>'+
					     '     <hr>'+
					     '     <p>내용 : '+data[i].er_content+'</p>'+
					     '     <h4>인원 : '+data[i].er_max+'명/'+data[i].er_curr+'명</h4>'+
					     '     <h4>모임날 : '+data[i].er_time+'</h4>'+
					     '     <hr>'+
					     '     <a id="btn_show'+i+'" class="btn btn-default" >모임장 정보보기</a>'+
					     '  </div>'+
					     '</div>';
			    }
				
				 
				
				    
						
				     
				     
				 
				     
				     
			    
			    var tend_img = ''
			    
				var prof=
				     '<div id="showuser'+i+'"class="myborder infoWindow" style=" display:none;">'+
				     ' <img style="margin-bottom:20px; display:inline;" src="/mukja'+data[i].u_img+'" alt="H" class="img_user">'+
				     ' <div class="infoText">닉네임 : '+data[i].u_nick+'</div>'+
				     ' <div class="infoText">나이:'+data[i].u_age+'대</div>'+
				     ' <div class="infoText">안먹는 음식 </div>'+
				     ' <div id="tend'+i+'"></div>'+
				     ' <div id="masterClose'+i+'" class="btn btn-default">닫기</a>'+
				     '</div>';
			
				$('#modal_content').append(together_list);
				
				
				 var tendIMG="";
				    for(var ti=0; ti<tend_codes.length;ti++){
				    	for(var ut=0; ut<er_tend.length;ut++){
					    	if(tend_codes[ti]==er_tend[ut]){
					    		console.log(data[i].u_nick+'의 성향이미지:'+er_tend[ut]);
					    		 tendIMG='<img style="margin-bottom:20px; display:inline;" src="/mukja/resources/usertend_IMG/'+er_tend[ut]+'.jpg" alt="tend" class="img_user_tend">';
					    		  $('#prof'+i).append(tendIMG);
					    	}
				    	}
				    	
				    }
				    
				    
				$('body').append(prof);
			
															 
			    console.log('user_tend');
			    console.log(user_tend);
			    tendIMG="";
			    for(var ti=0; ti<tend_codes.length;ti++){
			    	for(var ut=0; ut<user_tend.length;ut++){
				    	if(tend_codes[ti]==user_tend[ut]){
				    		console.log(data[i].er_title+'의 성향이미지:'+user_tend[ut]);
				    		 tendIMG='<img style="margin-bottom:20px; display:inline;" src="/mukja/resources/usertend_IMG/'+user_tend[ut]+'.jpg" alt="tend" class="img_size">';
				    		  $('#tend'+i).append(tendIMG);
				    	}
			    	}
			    	
			    }
			  
			 //방장정보보기
				var infoWindow = document.querySelectorAll('.infoWindow'); 
				infoWindow.forEach(function(ele,i){
					$('#btn_show'+i).click(function(){
						console.log('방장정정보 돌입');
						$('#showuser'+i).hide();
						$('#showuser'+i).fadeIn();
						
							
					});
					$('#masterClose'+i).click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
							
					});
					
					
					$('#mask').click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
							
					});
					
					$('.close').click(function(){
						console.log('방ㅈ당정보닫기 돌입')
						$('#showuser'+i).fadeOut();
					  
					});
					
				});
			
				
				$('#btn_master').click(function(){
					var maskHeight = $(document).height();  
			   		 var maskWidth = $(window).width(); 
			   		
			   		 $('#masterMask').fadeTo(500,0.6);    
					  $("#masterModal").show() ;
					  
					  
						
					
					  
				    
					
				    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
				    $('#mask').css({'width':maskWidth,'height':maskHeight});  
				});
			}
			
			
			
			ERjoin()
			    
			 
			     //모임 참여신청하기 끝
			     
			     
			     
			     
		},
		error:function(request,status,error){
			console.log('동적 할당 모달에 데이터 오류 코드:%s,에러메시지:%s,error:%s,status:%s',
					request.status,request.responseText,error,status);
		}
	});

$('#mask').click(function(){
	$("#masterModal").fadeOut();
    $('#masterMask').fadeOut();    
	$('#modal_content').html("");
  
});
$('.close').click(function(){
	$("#masterModal").fadeOut();
    $('#mask').fadeOut();  
	$('#modal_content').html("");
});


function ERjoin(){
	//모임 참여신청하기
	var all_erjoin = document.querySelectorAll('.all_erjoin'); 
	console.log("all_erjoin.length:"+all_erjoin.length);
	all_erjoin.forEach(function(ele,erjoin_i){
			
	   var er_no={"er_no":ele.getAttribute('id').substring(10,ele.getAttribute('id').length)}
	   
	   Object.assign(er_no, store_id);
	   console.log("[ele]");
	   console.log(er_no);
	   console.log("[index]");
	   console.log(erjoin_i);
		console.log(ele.getAttribute('id'));
		var id="#"+ele.getAttribute('id');
	
		$(id).on("click",function(){ 
		   
		   console.log("<<<참가 시도 >>>")
		   console.log("id:"+id);
		   $.ajax({
		 		url:"<c:url value='/requestERjoin.do'/>",
		 		data:er_no,
		 		dataType:'json',
		 		success:function(data){
		 			console.log(data);
		 			var joinER_result = data.joinER;
		 			console.log("joinER_result:",joinER_result);
		 			if(joinER_result==1){
		 				alert("참가신청이 완료되었어요! 수락을 기다려주세요~");
		 			}else{
		 				alert("방장이거나 이미 신청하였어요!");		
		 			}
		 		},
		 		error:function(){
		 			console.log("<<<<<방참가 실패>>>>>")
		 		}
		 	});	
		   
	   });  
	}) 
}
</script>


