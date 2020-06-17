<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<section class="ftco-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-9 ftco-animate"> -->

         <!-- INFROMATION -->
            <section style="height: 1000px;" class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt">
               <div class="container">
                  <div class="row no-gutters">
                     
                     <div class="col-sm-7 wrap-about py-5 ftco-animate">
                        <div class="heading-section mt-5 mb-4">
                           <div class="pl-lg-5 ml-md-5">
                              <span class="subheading">About</span>
                              <h2 class="mb-4" style="display: inline">SUBWAY</h2>
                              <h4 class="mb-4" style="display: inline; font-family: 'Black Han Sans', sans-serif;">샌드위치 전문점</h4>
                           </div>
                        </div>
                        <div class="pl-lg-5 ml-md-5">
                           <!-- 가게 정보 -->
                           <div id='tableDiv'>
	                        
                           </div>
                           <!-- 3 besties -->
                           <div class="row">
                              <div class="col-md-9">
                                 <h3 class="mt-5" style="display: inline">Best Menus</h3>
                              </div>
                              <div class="best3">
                                 <a class="menuplus" href="<c:url value='/MenuList.bbs'/>"
                                    style="font-family: 'Gugi', sans-serif;"> +메뉴 더 보기</a>
                              </div>
                           </div>
                          
                        </div>
                     </div>
                  </div>
               </div>
            </section>

<script>
var table_info = JSON.parse('${table_Info}');
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

var all_g =  document.querySelectorAll(".tableInfoInner");
console.log("all_g");
console.log(all_g);

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
            
        


