<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="form-group">
   <label for="exampleInputEmail1">검색창</label>
   <input type="text" class="form-control" id="searchVal" placeholder="크롤링할 검색어 입력">
 </div>
<a class="btn btn-default" id="searchSNS">맛집크롤링 요청</a>

<div>


</div>

<script>
jQuery( document ).ready(function( $ ) {
	console.log("---------------크롤링--------------");
	$('#searchSNS').click(function(){
		var searchText={'searchVal':$("#searchVal").val()};
		console.log("보내는:");
		console.log(searchText);
		 $.ajax({
				url:"http://192.168.0.18:5000/falsk",
				dataType:'json',
				data: searchText,
				success:function(data){
					console.log("성공");
					console.log("<<<<data>>>>>");
					console.log(data);
					console.log(typeof data);
					
				},
				error:function(){
					console.log("실패");
				}
		    });
	});
	
   
	
});//팩토리함수
</script>

