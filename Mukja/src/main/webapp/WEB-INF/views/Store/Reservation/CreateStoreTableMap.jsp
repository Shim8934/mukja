<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div >
   <h1>실시간 테이블 확인을 위한 행과 열 값을 입력해주세요</h1>
   <h1>표가 생성되면 클릭하여 테이블을 만들어주세요</h1>
   
   <form class="form-inline">
     <div class="form-group">
       <h3 >행</h3>
       <input type="text" class="form-control" id="row" >
     </div>
     <div class="form-group">
       <h3 >열</h3>
       <input type="text" class="form-control" id="col" >
     </div>
     
       <a id="create" class="form-control btn btn-default" style="margin-top:53px; height: 52px; text-align: center; line-height: 32px;">좌석생성</a>
       <a id="create" class="form-control btn btn-default" style="margin-top:53px; height: 52px; text-align: center; line-height: 32px;">등록</a>
   </form>
         
   <div id="tableWrap">
   
   </div>           
</div>     

<script>
   $("#create").click(function(){
      var row=$("#row").val();
      var col=$("#col").val();
      $("#tableWrap").html("");
      
      var table_info ={'y_boundary':row,'x_boundary':col};
      
      for(var i=0;i<row;i++){
         
         for(var j=0;j<col;j++){
            var innerDiv=
               '<div id="'+i+'n'+j+'" class="tableInfoInner w">'+
               '</div>';
            
            
            
            $("#tableWrap").append(innerDiv);
         }
         $("#tableWrap").append("<div></div>");
      }
      $("#tableWrap").append();
   
      
      var all = document.querySelectorAll(".tableInfoInner");
      console.log("all");
      console.log(all);
   
      all.forEach(function(inner,index){
         inner.addEventListener('click', function(){
            if(inner.className =='tableInfoInner w'){
               inner.className ='tableInfoInner g';
               for(var i =0; i<row;i++){
                  var jsonArray = new Array();
                  for(var j=0; j<col;j++){
                     var getClassName=$('#'+i+'n'+j).attr('class');
                     jsonArray.push(getClassName.slice(-1));
                     
                  }
                  table_info[i]=jsonArray;
               }
               console.log("<<<<<<발송되는 배열정보>>>>>>");
               console.log(JSON.stringify(table_info));
               
               table_info.wating_count=0;
               table_info.avg_wating_time=0;
               
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
            	inner.className ='tableInfoInner w';
                for(var i =0; i<row;i++){
                   var jsonArray = new Array();
                   for(var j=0; j<col;j++){
                      var getClassName=$('#'+i+'n'+j).attr('class');
                      jsonArray.push(getClassName.slice(-1));
                      
                   }
                   table_info[i]=jsonArray;
                }
                console.log(JSON.stringify(table_info));
                
                table_info.wating_count=0;
                table_info.avg_wating_time=0;
                
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
   });
</script>
            
        

