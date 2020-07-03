<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
</style>

<script>
   var indexFile = 1;

   $(function() {
      console.log('htmlfile 밑')
      $('#inputPlus')
            .click(
                  function() {
                     var innerHtml = "<input name='sf_path" + indexFile + "' id='sf_path" + indexFile +
      "' type='file' style='margin-top:5px;' accept='.jpg,.jpeg,.png,.gif,.bmp' class='form-control-file'>";

                     if (indexFile == 1) {
                        console.log("2번쨰 태그 보여짐")
                        $("#fileList").append(innerHtml);
                        indexFile++;
                        return;
                     } else if (indexFile == 2) {
                        console.log("마지막 태그 보여짐")
                        $("#fileList").append(innerHtml);
                        indexFile++;

                     } else if (indexFile >= 3) {
                        console.log("이미 다 보여짐 파일태그들")
                        return;
                     }
                  }) /* 인풋박스 끝 */

      //등록 이미지 등록 미리보기
      function readInputFile(input) {
         console.log('readInputFile메소드 안에 들어옴  ')
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
            console.log('id 찍어봄    ' + input.id);
            console.log('name 찌거봄    ' + input.name);
            reader.onload = function(e) {
               $("#preview")
                     .html(
                           "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction()\" id=\"img_id\"><img src="
                                 + e.target.result
                                 + " style='width:100%;margin-left:5px;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
            }
            reader.readAsDataURL(input.files[0]);
         }
      }

      function readInputFile1(input1) {
         console.log('readInputFile1메소드 안에 들어옴  ')
         if (input1.files && input1.files[0]) {
            var reader = new FileReader();
            console.log('파일 배열 찍어봄[0]   ' + input1.files[0]);
            console.log('id 찍어봄    ' + input1.id);
            console.log('name 찌거봄    ' + input1.name);
            reader.onload = function(e) {
               $("#preview1")
                     .html(
                           "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction1()\" id=\"img_id1\"><img src="
                                 + e.target.result
                                 + " style='border-bottom: 1px solid gray;width:100%;margin-left:5px;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
            }
            reader.readAsDataURL(input1.files[0]);
         } else {
            console.log('if 안에 못 들어감')
         }
      }

      function readInputFile2(input2) {
         console.log('readInputFile2메소드 안에 들어옴  ')
         if (input2.files && input2.files[0]) {
            var reader = new FileReader();
            console.log('파일 배열 찍어봄[0]   ' + input2.files[0]);
            console.log('id 찍어봄2    ' + input2.id);
            console.log('name 찌거봄2    ' + input2.name);
            reader.onload = function(e) {
               $("#preview2")
                     .html(
                           "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction2()\" id=\"img_id2\"><img src="
                                 + e.target.result
                                 + " style='border-bottom: 1px solid gray;width:100%;margin-left:5px;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
            }
            reader.readAsDataURL(input2.files[0]);
         } else {
            console.log('if 안에 못 들어감')
         }
      }

      $("#sf_path").on('change', function() {
         console.log('this 찍어봄 0  ' + this)
         readInputFile(this);
      });
      $(document).on("change", "#sf_path1", function() {
         console.log("동적 sf_path1에 이벤트 바인딩")
         console.log('this 찍어봄 1  ' + this)
         readInputFile1(this);
      })
      $(document).on("change", "#sf_path2", function() {
         console.log("동적 sf_path2에 이벤트 바인딩")
         console.log('this 찍어봄 2  ' + this)
         readInputFile2(this);
      })

   })

   // 등록 이미지 삭제 ( input file reset )
   var resetInputFile = function($input, $preview) {
      var agent = navigator.userAgent.toLowerCase();
      if ((navigator.appName == 'Netscape' && navigator.userAgent
            .search('Trident') != -1)
            || (agent.indexOf("msie") != -1)) {
         // ie 일때
         $input.replaceWith($input.clone(true));
         $preview.empty();
      } else {
         //other
         $input.val("");
         $preview.empty();
      }
   }

   var deleteImageAction = function() {
      var img_id = "#img_id";
      $(img_id).remove();
      var $input = $("#sf_path");
      var $preview = $('#preview');
      resetInputFile($input, $preview);
   }

   var deleteImageAction1 = function() {
      var img_id = "#img_id1";
      $(img_id).remove();
      var $input = $("#sf_path1");
      var $preview = $('#preview1');
      resetInputFile($input, $preview);
   }
   var deleteImageAction2 = function() {
      var img_id = "#img_id2";
      $(img_id).remove();
      var $input = $("#sf_path2");
      var $preview = $('#preview2');
      resetInputFile($input, $preview);
   }
   /* 가게 이미지 수정 끝 */
</script>

<section class="ftco-section ftco-counter img" id="section-counter"
   style="margin-top:30px; background-image: url(<c:url value="/resources/bootstrap/images/bg_4.jpg"/>);"
   data-stellar-background-ratio="0.5">
   <div class="container">
      <div class="row d-md-flex align-items-center justify-content-center">
         <div class="col-lg-10">
            <div class="row d-md-flex align-items-center">
               <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18">
                     <div class="text">
                        <h1 style="font-size: 3.0em; color: white; font-weight: bold;">Edit
                           Photo</h1>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<script>
</script>

<section class="ftco-section ftco-counter">
   <div class="container">
      <div class="row justify-content-center mb-5 pb-2">
         <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">Edit Store Photo</span>
            <h2 class="mb-4">가게 사진</h2>
         </div>
      </div>
      <div class="col-md-6">
      <!-- 캐러셀 시작 -->
      <div id="demo" class="carousel slide" data-ride="carousel">
         <div class="carousel-inner">
            <!-- 슬라이드 쇼 -->
            <c:forEach items="${storeImg}" var="storeImg" varStatus="stImgList">
               <c:if test="${stImgList.first}" var="listIf">
                  <div class="carousel-item active">
                     <!--가로-->
                     <img class="d-block w-100" style="height: 400px;"
                     src="<c:url value="${storeImg.sf_path}"/>"
                     alt="${stImgList.index} slide">
                  </div>   
               </c:if>
               <c:if test="${not listIf}">
                  <div class="carousel-item">
                     <!--가로-->
                     <img class="d-block w-100" style="height: 400px;"
                     src="<c:url value="${storeImg.sf_path}"/>"
                     alt="${stImgList.index} slide">
                  </div>
               </c:if>
            </c:forEach>
            <!-- / 슬라이드 쇼 끝 -->
            <!-- 왼쪽 오른쪽 화살표 버튼 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <!-- <span>Previous</span> -->
            </a> <a class="carousel-control-next" href="#demo" data-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
               <!-- <span>Next</span> -->
            </a>
            <!-- / 화살표 버튼 끝 -->
            <!-- 인디케이터 -->
            <ul class="carousel-indicators">
               <c:forEach items="${storeImg}" var="forIndi" varStatus="indiList">
                  <c:if test="${indiList.first }" var="isIndi">
                     <li data-target="#demo" data-slide-to="${indiList.index}" class="active"></li>
                  </c:if>
                  <c:if test="${not isIndi}">
                     <li data-target="#demo" data-slide-to="${indiList.index}"></li>
                  </c:if>
               </c:forEach>
            </ul>
            <!-- 인디케이터 끝 -->
            </div>
         </div>
      </div>
      <!-- 캐러셀 row 끝 -->
      <div class="col-md-6 ftco-animate fadeInUp ftco-animated">
            <!-- 파일 업로드 쪽 -->
            <div style="text-align: center; height: auto; margin-top: 30px;">
            <form enctype="multipart/form-data">
               <label for="BF_PATH" class="col-sm-2 col-form-label">After Edit</label>
               <div id="fileList" class="col-sm-10" style="background-color:fffff0;">
                  <span id="inputPlus" class="glyphicon glyphicon-plus" aria-hidden="true"></span><span> 이미지 추가(최대 3개)</span>
                  <small class="form-text text-muted">수정할 이미지를 등록해 주세요.</small>
                  <input style="border-bottom: 1px solid gray;" name="sf_path" id="sf_path" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" class="form-control-file inp-img">
               </div>
               <button type="submit" class="btn btn-default">제출</button>
            </form>
            </div>
              <div style="text-align: left; margin-top: 10px;">
            <div id="preview" class="col-md-4"></div>
            <div id="preview1" class="col-md-4"></div>
            <div id="preview2" class="col-md-4"></div>
              </div>
      </div>
   </div>
   <!-- container 끝 -->
</section>


<!-- 음식 메뉴쪽 수정 -->
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
                        <h1 style="font-size: 3.0em; color: white; font-weight: bold;">음식
                           사진 수정</h1>
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
            <span class="subheading">Edit FoodMenu Photo</span>
            <h2 class="mb-4">음식 사진</h2>
         </div>
      </div>
      <form id="foomImgEdit" enctype="multipart/form-data">
         <c:forEach items="${fmImg}" var="item" varStatus="loop">
            <div class="row" style="margin-bottom: 10px;">
               <div class="col-md-12 ftco-animate fadeInUp ftco-animated">
                  <div class="col-md-6">
                     <!-- 이미지 다이브 -->
                     <label for="#beforeEdit" class="col-md-2 col-form-label">수정
                        전</label> <img src="<c:url value='${item.fm_path}'/>" id="beforeEdit"
                        style="width: 100%; vertical-align: center">
                  </div>
                  <div id="foodPreview${loop.index}" class="col-md-6">
                     <label for="#afterEdit" class="col-md-2 col-form-label">수정
                        후</label>
                  </div>
                  <div
                     style="text-align: center; height: auto; margin-top: 30px; border: 1px solid gray;"
                     class="col-md-12">
                     <label for="#fm_path_${loop.index}"
                        class="col-md-2 col-form-label">사진 등록</label>
                     <div id="fileList${loop.index}" class="col-md-6"
                        style="background-color: fffff0;">
                        <small class="form-text text-muted">수정할 이미지를 등록해 주세요.</small> <input
                           name="fm_path_${loop.index}" id="fm_path_${loop.index}"
                           type="file" accept=".jpg,.jpeg,.png,.gif,.bmp"
                           class="form-control-file inp-img">
                     </div>
                  </div>
               </div>
               <!-- 이미지 다이브 끝 -->
            </div>
            <!-- row 끝 -->
         </c:forEach>
         <div class="text-center">
            <button type="submit" class="btn btn-default">수정</button>
         </div>
      </form>
   </div>
   <!-- container 끝 -->
</section>

<script>
   $(function() {
      $('#foomImgEdit').submit(function(data) {
         console.log("data 데이터 찍어보기  " + data)
         console.log("this 찍기  " + this)
         console.log("$(this) 찍기  " + $(this))
         $.ajax({
            type : 'POST',
            url : "/StoreMypage/foodEdit.do",
            data : $(this).serialize()
         })

      });
   });

   var foodIndex;

   $(document).on("change",".inp-img",function() {
                  console.log("this 찍어봄   " + this);
                  console.log("this.id 찍어봄   " + this.id);
                  console.log("this.name 찍어봄   " + this.name);
                  foodIndex = this.id.split('_')[2];
                  console.log("foodIndex는? " + foodIndex)
                  readInputFile(this);
                  //등록 이미지 등록 미리보기
                  function readInputFile(input) {
                     console.log('음식하단 쪽 readInputFile메소드 안에 들어옴  ')
                     if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        console.log('파일 배열 찍어봄[0]   ' + input.files[0]);
                        console.log('id 찍어봄    ' + input.id);
                        console.log('name 찌거봄    ' + input.name);
                        reader.onload = function(e) {
                           $("#foodPreview" + foodIndex)
                                 .html(
                                       "<a href=\"javascript:void(0);\" onclick=\"deleteImage()\" id=\"'foodimg_id"
                                             + foodIndex
                                             + "\"'><img src="
                                             + e.target.result
                                             + " style='width:100%;vertical-align:center' title='이미지를 클릭하시면 제거됩니다.'></a>");
                        }
                        reader.readAsDataURL(input.files[0]);
                     }
                  }

               })

   // 등록 이미지 삭제 ( input file reset )
   var resetInputFile = function($input, $preview) {
      console.log('사진 클릭해서 지움')

      var agent = navigator.userAgent.toLowerCase();
      if ((navigator.appName == 'Netscape' && navigator.userAgent
            .search('Trident') != -1)
            || (agent.indexOf("msie") != -1)) {
         // ie 일때
         $input.replaceWith($input.clone(true));
         $preview.empty();
      } else {
         //other
         $input.val("");
         $preview.empty();
      }
   }

   var deleteImage = function() {
      console.log(foodIndex + "콘솔로 인덱스 찍기")
      var img_id = "#foodimg_id" + foodIndex;
      $(img_id).remove();
      var $input = $("#fm_path" + foodIndex);
      var $preview = $("#foodPreview" + foodIndex);
      console.log("지운 사진 id?  " + img_id)
      console.log("지운 사진 input?  " + $input)
      console.log("지운 사진 preview?  " + $preview)
      resetInputFile($input, $preview);
   }
</script>