<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
  <!-- 섬머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
   #editShopImg, #myBtn{
      margin-top : 5px;
   }
   
    .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
   
</style>

<script>
$(function(){
   var innerHTMLTest = function(){
      var randValNode = document.getElementById("tableExplain");
      randValNode.innerHTML = "<b>좌석 수만큼 칸을 클릭하면 바로 적용됩니다.</b>";
   }
   
   $("#create").click(function(){
         var row=$("#row").val();
         var col=$("#col").val();
         $("#tableWrap").html("");
         innerHTMLTest();
         
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
})

$(function(){
   // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];                                          

    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
})

    
</script>

 <!-- The Modal -->
<div id="myModal" class="modal">
   <div class="container">
      <!-- Modal content -->
         <div class="row">
         <div class="modal-content">
            <h3>가게 좌석 정보<span class="close">&times;</span></h3>                                                               
         <form class="">
            <div class="form-group col-md-12">
               <h4>행</h4>
                  <input type="text" class="form-control" id="row" >
               <h4>열</h4>
                  <input type="text" class="form-control" id="col" >
             </div>
             <div class="form-group col-md-12 text-center">
                <input type="button" id="create" value="좌석생성" class="btn btn-info btn-lg">
            </div>
                   <div id="tableWrap" class="text-center">
      
                  </div>
                  <div id="tableExplain" class="text-center">
                     <p >가게 좌석 수만큼 행렬을 입력 후, 좌석 생성을 누르면 좌석 정보가 바로 적용됩니다.</p>
                  </div>
         </form>
        </div>
      </div>
 </div>
    </div>

<!-- INFROMATION -->
<section class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt">
   <div class="container" style="width: 1400px;">
      <div class="row no-gutters" style="margin-top: -50px;">

         <!-- left-side picture -->
         <!-- 카라셀 -->
         <div id="carousel-example-generic" class="carousel slide casize text-center" data-ride="carousel" style="margin-top: 100px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
               <c:forEach items="${imglist}" var="imgDTO" varStatus="status">
                  <c:if test="${status.first}" var="isisFirst">
                     <li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="active"></li>
                  </c:if>
                  <c:if test="${not isisFirst}">
                     <li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
                  </c:if>
               </c:forEach>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner casize" role="listbox">
               <c:forEach items="${imglist}" var="imgDTO" varStatus="status">
                  <c:if test="${status.first}" var="result">
                     <div class="item active">
                        <img src="<c:url value='${imgDTO.sf_path}'/>" alt="..."
                           style="width: 400px; height: 700px;">
                     </div>
                  </c:if>
                  <c:if test="${!result}">
                     <div class="item">
                        <img src="<c:url value='${imgDTO.sf_path}'/>" alt="..."
                           style="width: 400px; height: 700px;">
                     </div>
                  </c:if>
               </c:forEach>
            </div>
            
            <a href="<c:url value='/StoreMypage/ImgPop.do'/>" target="_blank" id="editShopImg" class="btn btn-info">가게사진 수정하기</a>
            <!-- <a href="<c:url value='/Resevation/CreateStoreTableMap.do'/>" class="btn btn-info">매장 좌석 수정/생성</a> -->
            <a href="#"  id="myBtn" class="btn btn-info">매장 좌석 수정/생성</a>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
            </a>
         </div>
         <!-- 카라셀 엔드-->


         <div class="col-sm-7 wrap-about py-5 ftco-animate">
            <div class="heading-section mt-5 mb-4">
               <div class="pl-lg-5 ml-md-5">
                  <span class="subheading">About</span>
                  <h2 class="mb-4" style="font-size: 3.0em; display: inline">${list[0].store_name}
                     
                  </h2>
               </div>
            </div>
            <div class="pl-lg-5 ml-md-5" style="margin-top: 15px;">
               <!-- 가게 정보 -->
               <div>
               <form class="form-horizontal">
                     <!-- 가게 정보 -->
                     <div class=" col-md-12" style="font-size: 1.2em;">
                        <div style="margin-bottom: 30px">
                           <div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: -20px;">정보수정</div>
                        </div>
                        
                        <div style="margin-bottom: 5px;">
                         <div class="form-group">
                            <label style="vertical-align:middle;" class="col-sm-3 control-label">비밀번호:</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="store_addr"  >
                            </div>
                          </div>
                        </div>
                        
                        <div style="margin-bottom: 5px;">
                         <div class="form-group">
                            <label style="vertical-align:middle;" class="col-sm-3 control-label">비밀번호 확인:</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="store_addr"  >
                            </div>
                          </div>
                        </div>
                     
                        
                        <div style="margin-bottom: 5px;">
                         <div class="form-group">
                            <label style="vertical-align:middle;" class="col-sm-3 control-label">주소:</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="store_addr"  value="${list[0].store_addr}">
                            </div>
                          </div>
                        </div>
                        
                        <div style="margin-bottom: 5px;">
                         <div class="form-group">
                            <label style="vertical-align:middle;" class="col-sm-3 control-label">영업번호:</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" name="store_phnum"  value= "${list[0].store_phnum}">
                            </div>
                          </div>
                        </div>
                        
                        <div style="margin-bottom: 5px;">
                            <div class="form-group">
                            <label style="vertical-align:middle;" class="col-sm-3 control-label">이메일:</label>
                            <div class="col-sm-9">
                              <input type="email" class="form-control" name="store_email"  value= "${list[0].store_email}">
                            </div>
                          </div>
                        </div>
                        <hr>
   
                        <div style="margin-bottom: 30px">
                           <div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
                              가게영업시간
                           </div>
                           <textarea class="form-control" rows="3" name="store_time">${list[0].store_time}
                           </textarea>
                     
                        
                            
                           
                        </div>
                        <hr>
                        <div style="margin-bottom: 30px">
                           <div style="font-weight: bold; color: #404040; font-size: 1.5em; margin-bottom: 10px; margin-top: 30px;">
                              음식점소개
                           </div>
                            <textarea id="editor2" name="store_intro">
                              ${list[0].store_intro}
                           </textarea>
                           <script src="https://cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
                           <script>
                               CKEDITOR.replace( 'editor2' );
                           </script>
                        </div>
                        <hr>
                        
                        
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>


<!-- COUNTING -->
<section class="ftco-section ftco-counter img" id="section-counter"
   style="margin-top:30px; background-image: url(<c:url value="/resources/bootstrap/images/bg_4.jpg"/>);"
   data-stellar-background-ratio="0.5">
   <div class="container">
      <div class="row d-md-flex align-items-center justify-content-center">
         <div class="col-lg-10">
            <div class="row d-md-flex align-items-center">
               <div
                  class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="text">
                        <strong class="number" data-number="${store_Thumb}">0</strong>
                        <span>가게 추천 수</span>
                     </div>
                  </div>
               </div>
               
               <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="text">
                        <strong class="number" data-number="${reviewCount}">200</strong> <span>리뷰수</span>
                     </div>
                  </div>
               </div>
            
               <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="text">
                        <strong class="number" data-number="${store_avg }">200</strong> <span>평점</span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>



<section class="ftco-section">
   <div class="container">
      <div class="row justify-content-center mb-5 pb-2">
         <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">Gollamukja</span>
            <h1 class="mb-4" style="font-weight: bold; color: #404040;">${list[0].store_name} Menu</h1>
         </div>
      </div>
      <div class="row" style="text-align: center;">
         <div class="col-md-12  menu-wrap" style="display: inline-block;">
            <div class="heading-menu text-center ftco-animate">
               <h2 style="font-weight: bold; color: #404040; margin-bottom: 30px;">매뉴관리</h2>
            </div>
            <div class="row">
               <c:forEach items="${foodMenuList}" var="foodMenuDto">

                  <!-- 메뉴반복-->

                  <div class="col-xs-6 menus d-flex ftco-animate">

                     <!-- 메뉴이미지 카라셀 컨테이너 -->
                     <div style="display: inline-block; ">
                        <!-- 카라셀 -->
                        <div id="carousel-example-generic"
                           class="carousel slide menucasize" data-ride="carousel">
                           <!-- Indicators -->
                           <ol class="carousel-indicators">
                              <c:forEach items="${allFoodImgList}" var="foodimglist">
                                 <c:forEach items="${foodimglist}" var="foodimgDTO"
                                    varStatus="status">
                                    <c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
                                       <c:if test="${status.index==0}" var="result">
                                          <li data-target="#carousel-example-generic"
                                             data-slide-to="${status.index}" class="active"></li>
                                       </c:if>
                                       <c:if test="${!result}">
                                          <li data-target="#carousel-example-generic"
                                             data-slide-to="${status.index}"></li>
                                       </c:if>
                                    </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </ol>

                           <!-- Wrapper for slides -->
                           <div class="carousel-inner" role="listbox">
                              <c:forEach items="${allFoodImgList}" var="foodimglist">
                                 <c:forEach items="${foodimglist}" var="foodimgDTO" varStatus="status">
                                    <c:if test="${status.first}" var="isFirst">
                                       <c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
                                          <div class="item active">
                                             <img src="<c:url value='${foodimgDTO.fm_path}'/>"
                                                style="width: 300px; height: 250px;">
                                          </div>
                                       </c:if>
                                    </c:if>
                                    <c:if test="${not isFirst}">
                                       <c:if test="${foodimgDTO.menu_no==foodMenuDto.menu_no}">
                                          <div class="item">
                                             <img src="<c:url value='${foodimgDTO.fm_path}'/>"
                                                style="width: 300px; height: 250px;">
                                          </div>
                                       </c:if>
                                    </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </div>

                           <!-- Controls -->
                           <a class="left carousel-control"
                              href="#carousel-example-generic" role="button"
                              data-slide="prev"> <span
                              class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                           </a> <a class="right carousel-control"
                              href="#carousel-example-generic" role="button"
                              data-slide="next"> <span
                              class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                           </a>
                        </div>
                        <!-- 카라셀 엔드-->
                     </div>
                     <!-- 메뉴이미지카라셀 컨테이너엔드 -->
                     <div class="text">
                        <div style="text-align: center;">
                           <div style="display: inline-block;">
                              <h2 style="font-weight: bold; color: #404040;">${foodMenuDto.menu_name}</h2>
                           </div>
                        </div>
                        <div style="text-align: center;">
                           <div>재료 : ${foodMenuDto.menu_tend}</div>
                           <div class="price">설명 : ${foodMenuDto.menu_info}</div>
                           <div style="display: inline-block;" class="one-forth">
                              <span class="price">${foodMenuDto.menu_price}원</span>
                           </div>
                        </div>

                     </div>
                  </div>

                  <!-- 메뉴반복끝 -->
               </c:forEach>
            </div>
         </div>



         <!--  -->
      </div>
   
   </div>

</section>


<!-- REVIEW -->

