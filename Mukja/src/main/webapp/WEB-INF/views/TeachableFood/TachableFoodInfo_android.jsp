<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
	<style type="text/css">
	
/*-------------------------------------------
    $ fileUploader start
-------------------------------------------*/

.file-upload {
  background-color: #ffffff;
  width: 300px;
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #F76821;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #F76821;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #F76821;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #F76821;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #F76821;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #158280;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #F76821;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #F76821;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}


/*-------------------------------------------
    $ fileUploader end
-------------------------------------------*/
	
	</style>
</head>
<div class="container-fluid">
	<section class="hero-wrap hero-wrap-2"
      style=" margin-bottom: 20px; background-image: url('<c:url value='/resources/menu_IMG/together.jpg'/>');"
      >
      <div class="overlay"></div>
      <div class="container" >
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <h1 class="mb-2 bread">AI 음식정보 검색</h1>
               <h2 class="mb-2 bread">사진을 입력하면 음식정보를 알려드려요</h2>
            </div>
         </div>
      </div>
   </section>
	<h2 style=" text-align: center;margin-top: 50px;mamargin-bottom:50px;  font-weight: bold;color: #272727;">칼로리 및 음식정보를 알고싶은 사진을 올려주세요</h2>
	<hr>





<!--사진 업로더 -->


<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<div class="file-upload">
 
  <div class="image-upload-wrap"><!-- onchange="readURL(this);" --> 
    <input id ="imgBox"class="file-upload-input" type='file' accept="image/*" />
    <div class="drag-text">
      <h3 style="color: black; ">사진올리기</h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" id='food-img'src="#" alt="your image" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">제거하기 : <span class="image-title">올라간 사진</span></button>
	  <button id="ai_start" class ='remove-image' type="button">AI분석!</button>
    </div>
  </div>
</div>
<!--사진 업로더 끝 -->
<div id="mydiv"></div>
<img id="my" src="#">

<!--티처블머신 -->
<div class="col-xs-4 col-xs-offset-4">
	<div class="innerSNS foodInfo" style="margin-left:-10px; display: none;text-align:center; width: 100%" id="label-container">
		<h3 id='findList' style="font-weight: bold; color: #3C3C3C; text-align: center; margin: 20px;">이 음식이 맞나요? <br>클릭하면 정보를 얻을 수 있어요</h3>
		<hr>
		<div id="inner-label-container" style="font-weight: bold; font-size:1.2em; color: #E34500; text-align: center; margin: 20px;">
		</div>
		
	</div>
</div>
<div id="ingmask" >	

<div class="main-content space-top wrapper" role="main" id="mainContent">
    <div class="loader loader-2"></div>
    <div style="text-align:center; margin-left:-10px; top:20%; font-weight: bold; font-size: 2em; color: #E34711">Searching...<br> Please wait a minute</div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<!--티처블머신 스크립트-->
<script type="text/javascript">
	$("#ai_start").click(function(){
		init();
		$("#mydiv").html("<h2>안녕!</h2>");
	});


	const URL = "/mukja/tm-my-image-model/";
	
    let model, webcam, labelContainer, maxPredictions;

    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();
        predict();
        
    }


    async function predict() {
    	$("#inner-label-container").empty();
    	console.log("model")
        console.log(model)
       
        var image= document.getElementById("my");
        const prediction = await model.predict(image,false);
        
        //변형코드
        var foodInfo = [];
        var sortingField = "value";
        for (let i = 0; i < maxPredictions; i++) {
        	var value = prediction[i].probability.toFixed(2)*100	
        	var innerJson= new Object();
        	console.log(value);
       		innerJson={'className':prediction[i].className,'value':value}
       		foodInfo.push(innerJson);
        }
        
        //솔트 코드
        foodInfo=
        	foodInfo.sort(function(a, b) { // 오름차순
		            return b[sortingField] - a[sortingField];
		    });
     
     
      
      
        console.log(foodInfo[0])
       	var foodName=foodInfo[0].className;
       	var foodValue=foodInfo[0].value;
        console.log(foodName)
     	$("#inner-label-container").append('<div id="foodInfoItem" ><span>'+foodName+'</span> :<span > '+foodValue+"%</span><br></div><hr>");
       		
        
        //내용보여주기
        $("#label-container").show();
        
      	$("#foodInfoItem").click(function(){
      		$.ajax({
      			 url:"http://openapi.foodsafetykorea.go.kr/api/30da2ead96484f7bb7e4/I2790/json/1/5/DESC_KOR="+foodInfo[0].className ,
     	          
      			 dataType:'json',
     	          
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
     	        	 console.log(data);
     	       		 var foodinfoAPI_Div='<div>';
     	       		 var infoName_list=['0','열량(kcal)(1회제공량당)','탄수화물(g)(1회제공량당)','단백질(g)(1회제공량당)','지방(g)(1회제공량당)','당류(g)(1회제공량당)','	나트륨(mg)(1회제공량당)','콜레스테롤(mg)(1회제공량당)','포화지방산(g)(1회제공량당)','트랜스지방(g)(1회제공량당)'];
     	   		    
     	       		 for(var i=1; i<=9;i++){
     	           	  	console.log(data.I2790.row[0]['NUTR_CONT'+i]);
     	           	  	foodinfoAPI_Div+='<div>'+infoName_list[i]+" : "+data.I2790.row[0]['NUTR_CONT'+i]+'</div>' ;	           	  	
     	             }
     	       		 
     	   			foodinfoAPI_Div+='<div>';
     	   			$("#findList").html('<h2 style="font-weight: bold; color: #3C3C3C; text-align: center; margin: 20px;">음식정보</h2>');
     	   			console.log(foodinfoAPI_Div)
     	   			$("#foodInfoItem").html(foodinfoAPI_Div);
     	          },
     	          
     	          error:function(){
     	             console.log("실패");
     	          }
     	        });//ajax
      		}); 		
    	
    }
</script>
<!--티처블머신 스크립트 끝-->

<!-- 파일업로더 스크립트 -->
<script>

$("#imgBox").change(function(e){
	console.log(e);
	var input = document.querySelector("#imgBox"); 
	 readURL(input);
});

function readURL(input) {
	  if (input.files!=null && input.files[0]!=null) {
		
	    var reader = new FileReader();

	    reader.onloadend = function(e) {
	      $('.image-upload-wrap').hide();

	      $('#my').attr('src', e.target.result);
	     
	      $('.file-upload-content').show();

	      $('.image-title').html(input.files[0].name);
	    };

	    reader.readAsDataURL(input.files[0]);

	  } else {
	    removeUpload();
	    
	  }
	}

	function removeUpload() {
	  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
	  $('.file-upload-content').hide();
	  $('.image-upload-wrap').show();
	}
	
	$('.image-upload-wrap').bind('dragover', function () {
			$('.image-upload-wrap').addClass('image-dropping');
		});
	
	$('.image-upload-wrap').bind('dragleave', function () {
		$('.image-upload-wrap').removeClass('image-dropping');
	});

	
</script>
<!-- 파일업로더 스크립트 끝 -->

<!-- 음식정보 api요청 -->
<script>

</script>
<!-- 음식정보 api요청끝 -->
</div><!-- 컨테이너 끝-->