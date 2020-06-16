<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 로그인용 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="google-signin-client_id" content="548176436735-1d5a6bdmnjb40n7du817u27omto0341n.apps.googleusercontent.com">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>골라먹자 : 세상의 모든 음식을 골라먹자</title>
   <!-- 템플릿 CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/animate.css'/>">    
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/jquery.timepicker.css'/>">   
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icomoon.css'/>">
    <link rel="stylesheet" href="  <c:url value='/resources/bootstrap/css/style.css'/>">   
 <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
   <!-- 아이콘  css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-common.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/icon-style.css'/>">
   <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/modernizr.custom.79639.js'/>"></script>
   <!-- 메뉴 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-default.css'/>">
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/menu-component.css'/>">
   <script src="<c:url value='/resources/bootstrap/js/modernizr.custom.js'/>"></script>
   <!-- 한글폰트 -->
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" >
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
   <!-- 영어폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lovers+Quarrel" rel="stylesheet">
	
   <!-- 탭형 css -->
   <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/tab-style.css'/>">
   <!-- 로그인용 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
  
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  
   <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
   <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"/></script>
	<!-- anime.js  https://animejs.com/documentation/#duration -->
	<script src="<c:url value="/resources/anime_js/anime.min.js"/>"></script>
	
	
	 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  jQuery( document ).ready(function( $ ) {

    $( "#ERCwindow" ).draggable();
  } );
  </script>
	
   <style>
   body {
   font-family:Verdana;
   overflow-x:hidden; overflow-y:auto;
   }
   
   .img_messenger{
  	position:relative;
  	z-index:90000;
  	width: 80px;
  	height: 80px;
  	max-width: 100px;
    max-height: 100px;
  	background-color: white; 
	border: 2px #54DAFF solid; 
	border-radius:100px;  
	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
	margin: 5px;
  }
 #messenger { 
 z-index:89999;
	 position:absolute; 
	 top:100px; 
	 right:0px; 
	 padding: 3px 10px 
 }
 #messenger_board{
	margin-left:50px;
	margin-top:-50px;
	width:10px;
	height:10px;
 	background-color: #FCFCFC;
 	border: 3px #E8E8E8 solid; 
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 }
  .messenger_content{
	margin-left:10px;
	width:300px;
	height:100px;
 	background-color: white;
 	border: 3px #E8E8E8 solid; 
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 }
 .chat_board{

 	position:relative;
 	z-index:9999999;
 	top:50%;
 	left:50%;
	margin-left:-850px;
	margin-top:-800px;
	width:500px;
	height:800px;
 	background-color: #FCFCFC;
 	border: 3px #E8E8E8 solid; 
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 	display: none;
 }
 .tok_left{
  	max-width:250px;
 	display:inline-block;
	margin-left:20px;
	margin-top:10px;
	padding:10px;
 	background-color: white;
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 	color: #444444;
 	font-weight: bold;
 	 word-break:break-all;
 	 word-wrap:break-word;
 	  float: left;
 	 clear: both;
 }
 .tok_right{
 	max-width:250px;
 	display:inline-block;
	margin-right:20px;
	margin-top:10px;
	padding:10px;
 	background-color: #FFEB33;
 	border-radius:10px;  
 	box-shadow: rgb(84, 84, 84) 2px 5px 8px -6px; 
 	color: #444444;
 	font-weight: bold;
 	 word-break:break-all;
 	 word-wrap:break-word;
 	 float: right;
 	 clear: both;
 }
   </style>

   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
                                            <!-- 로 그 인 용 입 니 다. -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"charset="utf-8"></script>
   <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

  </head>
  
  <body>



  
   <!-- top부분 -->
   <tiles:insertAttribute name="top"/>
    <!-- body부분 -->
    <tiles:insertAttribute name="body"/>  
    
    <!-- footer부분 -->
    <tiles:insertAttribute name="footer"/>  
 
   <!-- 메뉴 js -->
   <script src="<c:url value='/resources/bootstrap/js/toucheffects.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/popper.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.easing.1.3.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.waypoints.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.stellar.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.magnific-popup.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/aos.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.animateNumber.min.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/bootstrap-datepicker.js'/>"></script>
  <script src="<c:url value='/resources/bootstrap/js/jquery.timepicker.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/scrollax.min.js'/>"></script>

  <script src="<c:url value='/resources/bootstrap/js/main.js'/>"></script>
 

					

  <!-- 메신저 창 -->
  
  
 <sec:authorize access="isAuthenticated()">
	<div id="messenger">
		<img class="img_messenger" id='btn_messenger' src="<c:url value="/resources/messenger/f.JPG"/>"  >
		<div id="messenger_board">
			
		
			<div id="messnger_content" style="display: none;margin-left: 65px;">
				<div class="row" >
					<div class="col-xs-4" style="margin-top:10px;">
						<h4 class="content_title" id="content_title0">채팅</h4>
						
					</div>
					<div class="col-xs-4"style="margin-top:10px;">
						<h4 class="content_title" id="content_title1">친구</h4>
						
					</div>
					<div class="col-xs-4"style="margin-top:10px;">
						<h4 class="content_title"id="content_title2">쪽지</h4>
						
					</div>
					
				</div>
				<div class="row">
					<div id="erList">
						<div class="row" id="content0" style="display: none">
							
						</div>
						<div class="row"id="content2" style="display: none">
							쪽지내용
						</div>
						<div class="row" id="content1" style="display: none">
							친구내용
						</div>
					</div>
				</div>
			</div>
				
			
		</div>
		<!-- 시큐리티에서 값 받기 -->
		<sec:authentication var="principal" property="principal" />

		 <!-- ---------------------------------채팅방 다이브--------------------------- -->
		<div id="ERCwindow" class="chat_board ui-widget-content" style ='background-color: #B2C7D9; '>
			<div class='row' style="margin: 0;padding: 0;height: 100%;">
			<div class="col-sm-12" > 
						<span class="hideERC glyphicon glyphicon-remove" style="float: right; clear: both;"></span>
			
				<form>
					<div class="form-group" >
						<div style="margin: 30px; text-align: center;color: white;font-weight: bold; border-bottom: 1px solid white;">
								<h3>즐거운 같이먹자 채팅방</h3>
							
						</div>
						<div id="chatArea">
							<div id="chatMessage"style="height: 600px;  overflow: auto">
							
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<textarea id="message" class="form-control" rows="3"></textarea>
						</div>
						<div class="col-sm-2">
							<input class="btn btn-default " type="button" id="sendBtn" value="보내기">
						</div>
					</div>
				</form>
			</div>
			</div>
		</div> 
		  <!-- ---------------------------------채팅방 다이브끝--------------------------- -->
	</div>
</sec:authorize> 

<!-- 메신저끝-->
<script type="text/javascript">

//----------------웹소켓---------------//
//웹소켓 객체 저장용
var wsocket;
//닉 네임 저장용
var nickname;

//유저아이디 저장
var erc_username='${principal.username}';

//방번호 배열
var erc_noInfo=[];

//현재 방번호 담는 변수
var cur_erc_no;

//다이브 정렬함수
function divAlign(){
		for(var i=0;i<$('#chatMessage div').length;i++){
			var findNick=$('#chatMessage').children().eq(i).text().split(":")[0];
			console.log('1.채팅'+i+"번째의 닉:"+findNick);
			console.log('닉 비교:'+findNick.trim()==nickname.trim());
			console.log('findNick:'+findNick.trim());
			console.log('nickname:'+nickname.trim());
			if(findNick.trim()==nickname.trim()){
				$('#chatMessage').children().eq(i).attr('class','tok_right');
			}else{
				$('#chatMessage').children().eq(i).attr('class','tok_left');
			}
		}
	}

$(function (){
	
		console.log("ws://localhost:8080<c:url value='/chat.do'/>");
		
		wsocket = new WebSocket("ws://192.168.0.18:8080<c:url value='/chat.do'/>");
		console.log("erc_username:"+erc_username);
		//서버와 연결된 소켓에 이벤트 등록
		wsocket.onopen = open;
		/*  wsocket.onclose = function(){
			appendMessage("<div class='tok_right'>"+nickname+"님이 채팅방을 떠나셨어요</div>");
		}; */
		
		//연결이 되면 부착한다 = 연결이 되면 서버로부터 오는 브로드 캐스팅을 받을 수 있다./
		//리시브 메시지
		wsocket.addEventListener('message',function(e){
			//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
			var receiveData=e.data.split("/")[2];
			var receive_erc=e.data.split("/")[1];
			var receive_username=e.data.split("/")[0];
			console.log("receiveData:"+receiveData);
			console.log("receive_erc:"+receive_erc);
			console.log("receive_erc:"+receive_username);
			
			
			//메세지받음
			if(receive_username!=erc_username){	
				if($('#chatMessage').attr('class')==receive_erc){
					if(receiveData.substring(0,4) =='msg:')
						//서버로부터 받은 메시지를 msg:부분을 제외하고 
						//div에 출력
						appendMessage("<div class='tok_left'>"+receiveData.substring(4)+"</div>");
						
				}
			}else{
				wsocket.close();
			}
			//스크롤 하단
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
			//다이브정렬
			divAlign();

		});
		//입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
		
		 //퇴장버튼 클릭시]
		
		/* $('#exitBtn').one('click',function(){
			wsocket.send('msg:'+nickname+'가(이) 퇴장 했어요');
			wsocket.close();
			
		});  */
		//전송버튼 클릭시]
		$('#sendBtn').click(function(){
			sendMessage();
			console.log($('#chatMessage').html());
			console.log(typeof $('#chatMessage').html());
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
			
		});
		
		//메시지 입력후 전송 버튼 클릭이 아닌 엔터키 처리]
		
		$('#message').on('keypress',function(e){
			
			console.log("e.keyCode:%s,e.which:%s",e.keyCode,e.which);
			var keyValue = e.keyCode ? e.keyCode : e.which;
			if(keyValue == 13){//엔터 입력
				sendMessage();
				console.log($('#chatMessage').html());
				console.log(typeof $('#chatMessage').html());
			}
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
		});
	
		
		
		//함수 정의]
		//서버에 연결되었을때 호출되는 콜백함수
		var open =function(){
			//서버로 연결한 사람의 정보(닉네임) 전송
			//msg:kim가(이) 입장했어요
		
			wsocket.send('msg:'+nickname+'가(이) 입장했어요');
			
			appendMessage(ERCConData.erc_content);
		};
		//메시지를 DIV태그에 뿌려주기 위한 함수]
		var appendMessage = function(msg){
			//메시지 출력
			$('#chatMessage').append(msg);
			sendToTable();
		};
		
		//메시지가 추가되면 바로 테이블업데이트 시킴
		function sendToTable(){
		
			var send_erc_data = {'erc_no':cur_erc_no,'erc_content':$('#chatMessage').html()};
			console.log(send_erc_data);
			$.ajax({
				data : send_erc_data,
				url:"<c:url value='/sendToTable.do'/>",
				dataType:'json',
				success:function(data){
					console.log('채팅방 기존 내용 업데이트하기');
					console.log(data);
				
				},
				error:function(request,status,error){
					console.log('채팅방 기존 내용 업데이트하기 실패');
					console.log('동적 할당 모달에 데이터 오류 코드:%s,에러메시지:%s,error:%s,status:%s',
							request.status,request.responseText,error,status);
				}
			});//채팅방에 내용넣기 
			
		}
		
		//서버로 메시지 전송하는 함수]
		function sendMessage(){
			//서버로 메시지 전송
			wsocket.send(erc_username+'/'+cur_erc_no+'/msg:'+nickname+':'+$('#message').val());//msg:Superman:안녕
			
			var classname;
			if(erc_username)
			//DIV(대화영역)에 메시지 출력
			appendMessage("<div class='tok_right'>"+nickname+":"+$('#message').val()+"</div>");
			//기존 메시지 클리어
			$('#message').val('');
			//포커스 주기
			$('#message').focus();
			
		}
		
		$('#chatMessage')
		
		//----------------웹소켓---------------//
	});
</script>


  
  
  
	<!-- 메신저 스크립트 -->
   <script>
   //함수선언부
   
  
   function request_erc_ajax(){
		  //메신저에 채팅방목록 출력
		  erc_noInfo=new Array();
		 $.ajax({
			url:"<c:url value='/enterERC.do'/>",
			dataType:'json',
			success:function(data){
				console.log("채팅방 목록 서버로 요청 시작");
				console.log("----<채팅방목록data>----");
				console.log(data);
				for(var i=0; i<data.length;i++){
					//데이터확인
					console.log("----<채팅방목록data>----");
					console.log(data);
					var item=
						'<div class=" messenger_content" id="ERCno_'+i+'" style="margin-top:10px;">'+
						' <div class="row" style="margin-left:10px;">'+
						'	<h4>'+
							data[i].er_title+
						'	</h4>'+
						' </div>'+
						' <div class="row" style="margin-left:10px;">'+
							data[i].erMaster+
						' </div>'+
						' <div class="row" style="margin-left:10px;">'+
							data[i].store_name+
						' </div>'+
						'</div>';
						
						//#content0은 채팅방쪽을 뜻함
					$('#content0').append(item);
					$("#content0").fadeIn();
				
					
					
					
					
					erc_noInfo.push(data[i].erc_no);
					console.log("erc_noInfo:"+erc_noInfo);
					nickname = data[i].u_nick;
					console.log("nickname:"+nickname);
					
					
						$('#ERCno_'+i).click(function(){
							//채팅방 배열에 맞게 번호 넣어주기
							
							var iscurNum = $(this).attr('id').split("_")[1];
							cur_erc_no=erc_noInfo[iscurNum];
							console.log("채팅방 클릭시 현재 방번호 알아오기:"+erc_noInfo[i]);
							console.log("채팅방 클릭시 현재 방번호 알아오기(cur)):"+cur_erc_no);
						
							$('#chatMessage').attr('class',cur_erc_no);
							
							
							console.log('채팅방 부르기');
							$('#ERCwindow').hide();
							$('#ERCwindow').fadeIn();
							

							var erc_no={"erc_no":cur_erc_no};
							
							 $.ajax({
								data:erc_no ,
								url:"<c:url value='/getERCcontent.do'/>",
								dataType:'json',
								success:function(ERCConData){
									console.log('채팅방 기존 입력된 내용 부르기');
									console.log(ERCConData.erc_content);
									$("#chatMessage").empty();
									$("#chatMessage").prepend(ERCConData.erc_content);
									console.log('내닉 : '+nickname);
									//채팅내용 좌우정렬
									divAlign();
									
									$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
									
								},
								error:function(){
									console.log('채팅방 기존 입력된 내용 부르기 실패');
								}
							});//채팅방부르기 ajax
					
						});//ERCno  click
					
					
				}//채팅방 목록 처리 for
			},//success
			error:function(){
				console.log("채팅방 목록 서버로 요청 실패");
			}//error
		});//ajax
		  
   }//request_erc_ajax
   
   function clear_content_div(){
	   console.log("다이브클리어");
	   for(var i=0;i<3;i++){
			$("#content"+i).empty();
		}
   }//clear_content_div()
   
   
	//메신져 따라다니기
	var currentPosition = parseInt($("#messenger").css("top")); 
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		$("#messenger").stop().animate({
			"top":position+currentPosition+"px"}
		,500); 
		});
		var f=0;
		$('#btn_messenger').click(function(){
			//모든 컨텐츠 다이브 클리어
			clear_content_div();
			
			
			//채팅방 안보이기
			$('#ERCwindow').hide();
			
			//애니메 토글
			if(f==0){
				/* anime({
					  targets: '#messenger_board',
					  translateX: -250,
					  scaleX: 100,
					  scaleY: 300
					}); */
				anime({
					  targets: '#messenger_board',
					  width: '400px', // -> from '28px' to '100%',
					  height:'700px',
					  easing: 'easeInOutQuad',
					});
					setTimeout(function() {
						$('#messnger_content').fadeIn();
						}, 1000);
					
				f=1;
			}else{
				anime({
					  targets: '#messenger_board',
					  translateX: 0,
					  width: '1px', // -> from '28px' to '100%',
					  height:'1px',
					  easing: 'easeInOutQuad',
					});
					$('#messnger_content').hide();
				f=0;
			}
			//애니메 토글끝
			//첫 시작때는 바로 채팅 에이작스 요청
			request_erc_ajax();
		});//btn_messenger
		
			var content_title = document.querySelectorAll(".content_title");
			console.log(content_title);
			content_title.forEach(function(ele,index){
			console.log($('#content_title'+index));
			$('#content_title'+index).click(function(){
				//모든 컨텐츠 다이브 클리어
				clear_content_div();
				
				if(index==0){//1번째 매뉴일때
					console.log("채팅목록 ajax요청");
					//ajax로 요청
					request_erc_ajax();
					
					
				}else if(index==1){//2번째 매뉴일때
					console.log("친구목록 ajax요청");
				}else{//3번째 매뉴일때
					console.log("쪽지목록 ajax요청");
				}
			});//click
			
	});
		
	
$('.hideERC').click(function(){
	$("#ERCwindow").fadeOut();
});
	</script>
	<!-- 메신저 스크립트 끝-->
  </body>
</html>