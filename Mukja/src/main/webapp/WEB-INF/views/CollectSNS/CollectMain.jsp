<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="container-fluid">
	<section class="hero-wrap hero-wrap-2"
      style=" margin-bottom: 20px; background-image: url('<c:url value='/resources/menu_IMG/together.jpg'/>');"
      >
      <div class="overlay"></div>
      <div class="container" >
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">SNS검색하기</h1>
                <div style="margin-top: 20px;" >
	                <form class="form-inline">
					   <input style="width: 800px; " type="text" class="form-control" id="searchVal" placeholder="크롤링할 검색어 입력">
					   <a style='height: 54px; display: inline-block; line-height: 38px;' class="btn btn-default" id="searchSNS">검색</a>
					 </form>
				 </div>
				
            </div>
         </div>
      </div>
   </section>


	
	<h2 style=" text-align: center;margin-top: 50px;mamargin-bottom:50px;  font-weight: bold;color: #272727;">SNS크롤링 검색을 통해서 여러분이 원하는 정보를 얻어보세요!</h2>
	<hr>
	<div id='snsWrap' style="text-align: center; margin-top: 50px; margin-bottom: 100px;margin-left:5px; margin-right:5px;">
		
		<div class="innerSNS">
	
			<img class="snsProfile" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/83568813_127979445235215_7724309634575499264_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=ct99S8d5-zMAX-9QEFf&oh=99d44481330ca6e9588c50210feb749d&oe=5F18FC14"/>
			<div class="snsID">GollaMukja</div>
			<hr style="margin-top:10px;" >
			<img class="snsIMG" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/e35/104690886_2949256815194180_3395523583584934971_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=108&_nc_ohc=f53NjqnupiIAX-nHbNI&oh=8c389bbd50cf7dc059993dddb2216fa4&oe=5F1B1006"/>
			<div  id="snsContentWrap" >
				<div class="snsContent">#골라먹자에서 sns크롤링하기<br>#재미있는 골라먹자</div>
			</div>
		</div>
		<div class="innerSNS">
	
			<img class="snsProfile" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/83568813_127979445235215_7724309634575499264_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=ct99S8d5-zMAX-9QEFf&oh=99d44481330ca6e9588c50210feb749d&oe=5F18FC14"/>
			<div class="snsID">GollaMukja</div>
			<hr style="margin-top:10px;" >
			<img class="snsIMG" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/106121758_1201522353525475_574241279335577328_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=107&_nc_ohc=PYjkmHMy7jMAX9QZnlj&oh=b31b5a4426e201fd8bec962189580464&oe=5F2A2545"/>
			<div  id="snsContentWrap" >
				<div class="snsContent">#골라먹자만의 특별한 서비스<br>#여러 태그를 살펴보세요</div>
			</div>
		</div>
		<div class="innerSNS">
	
			<img class="snsProfile" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/83568813_127979445235215_7724309634575499264_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=ct99S8d5-zMAX-9QEFf&oh=99d44481330ca6e9588c50210feb749d&oe=5F18FC14"/>
			<div class="snsID">GollaMukja</div>
			<hr style="margin-top:10px;" >
			<img class="snsIMG" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/97141312_941716859613286_608145851611404083_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=110&_nc_ohc=nJJbleTQg_AAX-SvYlO&oh=1c82dbc00f8231c7fbc072acd102f34b&oe=5F1800DB"/>
			<div  id="snsContentWrap" >
				<div class="snsContent">#맛집을 찾자<br>#맛잘알</div>
			</div>
		</div>
		<div class="innerSNS">
	
			<img class="snsProfile" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/83568813_127979445235215_7724309634575499264_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=ct99S8d5-zMAX-9QEFf&oh=99d44481330ca6e9588c50210feb749d&oe=5F18FC14"/>
			<div class="snsID">GollaMukja</div>
			<hr style="margin-top:10px;" >
			
			<img class="snsIMG" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/104431806_1136765510026754_2886875881302147617_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=102&_nc_ohc=vd194EEHChoAX-uL31g&oh=4fc16508ec73256b2d144339c3342949&oe=5F2BC1B7"/>
			<div  id="snsContentWrap" >
				<div class="snsContent">#오늘은 뭐먹지?<br>#골라먹지</div>
			</div>
		</div>
	</div>

	
	
</div>
<div id="ingmask" >	

<div class="main-content space-top wrapper" role="main" id="mainContent">
    <div class="loader loader-2"></div>
    <div style="text-align:center; margin-left:-10px; font-weight: bold; font-size: 2em; color: #E34711">CRAWLING...<br> Please wait a minute</div>
</div>
</div>
<script>
jQuery( document ).ready(function( $ ) {
   console.log("---------------크롤링--------------");
   $('#searchSNS').click(function(){
      var searchText={'searchVal':$("#searchVal").val()};
      console.log("보내는:");
      console.log(searchText);
       $.ajax({
            url:"http://192.168.0.6:9876/flask",
            dataType:'json',
            data: searchText,
            beforeSend:function(){

           	   	var maskHeight = $(document).height();  
           		var maskWidth = $(window).width(); 
           		$('#ingmask').css('height',maskHeight);
           		$('#ingmask').css('width',maskWidth);
           		$('#ingmask').css('opacity',"0.8");
           		$('#mainContent').css('position',"absolute");
           		$('#mainContent').css('top',"300px");
           		$('#mainContent').css('left',"50%");
           		$('#mainContent').css('margin-left',"-100px");
           	 	$('#ingmask').show();   
           		  
            			
            },
            complete:function(){
    			$('#ingmask').hide();
    			  
    			
            },
            success:function(data){
            	$('#snsWrap').empty();
               console.log("성공");
               console.log("<<<<data>>>>>");
               console.log(data);
               var id;
               var img;
               var tags;
               var profile;
               for(var i=0; i<Object.keys(data).length;i++){
                  id = data[i].id;
                  img = data[i].img;
                  tags = data[i].tags;
                  profile = data[i].profile;
                  
                  var div=
						'<div class="innerSNS">'+
						'	<img class="snsProfile" src="'+profile+'"/>'+
						'	<div class="snsID">'+id+'</div>'+
						'	<hr style="margin-top:10px;" >'+
						'	<img class="snsIMG" src="'+img+'"/>'+
						'	<div style="margin:10px;"><a  class="conWrap" id="contentView'+i+'" >자세히 보기</a></div>'+
						'	<div  id="snsContentWrap'+i+'" style="display:none;">'+
						'		<div class="snsContent'+i+'">'+tags+'</div>'+
						'	</div>'+
						'</div>';
						
				
						
                	  
                	 
                  $('#snsWrap').append(div);
                  
               }
       		allcon = document.querySelectorAll(".conWrap");
			console.log('allcon')
			console.log(allcon);
			allcon.forEach(function(ele,index){
				console.log('ele')
				console.log(ele)
				$('#contentView'+index).click(function(){
					if($("#contentView"+index).text()=="자세히 보기"){
						$("#contentView"+index).text("닫기");
						$('#snsContentWrap'+index).show();
					}else{
						$("#contentView"+index).text("자세히 보기");
						$('#snsContentWrap'+index).hide();
					}
				});    
				
			})
            },
            error:function(){
               console.log("실패");
            }
          });
   });
   

   
});//팩토리함수
</script>
