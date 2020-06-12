<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<section class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">My Page</h1>
            <p class="breadcrumbs">
               <span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> 
               <span class="mr-2"><a href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> 
               <span>Blog Single <i class="ion-ios-arrow-forward"></i> </span>
            </p>
         </div>
      </div>
   </div>
</section>



<section class="ftco-section mypage ">
   <div class="container-fluid" style="width: 100%">
   <!-- 마이페이지 타이틀 -->
      <div class="row justify-content-center" style="width: 100%">
         <div class="text-center " style="width: 100%">
            <span class="subheading">My Page</span>
            <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">마이페이지</h2>
         </div>
      </div>

   <!-- MT & ET시작 -->
      <div class=" ftco-animate justify-content-center">
         <div class="text-center mtNet">
            <!-- 골라먹자 타이틀 -->
            <div class="col-md-4 mt text-center heading-section ftco-animate">
               <div class="text-center">
                  <span class="subheading" style="display: inline;">M.T</span>
                  <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">골라먹자</h2>
               </div>
               <!-- 골라먹자 시작 -->
               <!-- 성향 시작 -->
               <div class="mt_taste mgtb10">
                  <div class="sub-title">
                     <h4 class="title">user님의 MyType 성향</h4>
                     <button>수정</button>
                  </div>

                  <div class="jNs">
                     <div class="joa col-md-5">
                        <div>
                           <span class="title">LIKE! </span>
                        </div>
                        <div class="mypage-box">
                           <img class="mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                        </div>
                        <div class="mypage-box">
                           <img class="mypage-img" src='<c:url value="/resources/tend_IMG/dp_b.JPG"/>'>
                        </div>
                     </div>
                     <div class="siro col-md-5">
                        <div>
                           <span class="title">DISLIKE!</span>
                        </div>
                        <div class="mypage-box">
                           <img class="mypage-img" src='<c:url value="/resources/tend_IMG/pig_c.png"/>'>
                        </div>
                        <div class="mypage-box">
                           <img class="mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_c.png"/>'>
                        </div>
                        <div class="mypage-box">
                           <img class="mypage-img" src='<c:url value="/resources/tend_IMG/gluten_c.png"/>'>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- 찜 시작 -->
               <div class="jjimm mgtb10">
                  <div class="sub-title">
                     <h4 class="title">찜보기</h4>
                  </div>
                  <div class="foodjjim">
                     <h5 class="title">메뉴찜보기 / 내가 누른 좋아요 보기</h5>
                     <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green; padding-right: 0;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름 ${store_name}</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green;padding-right: 0px;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green;padding-right: 0px;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="storejjim">
                     <h5 class="title">가게찜보기</h5>
                     <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green; padding-right: 0;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름 ${store_name}</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green;padding-right: 0px;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green;padding-right: 0px;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate text-center" style="border: 1px solid light-green;padding-right: 0px;">
                           <div class=mpjjim>
                              <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                              <div class="text " style="padding-top: 0rem; display:display; ">
                                 <p class="mn-name overflow">메뉴이름</p>
                                 <span class="st-name overflow">가게이름</span>
                                 <p class="pref-icon overflow">아이콘</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
               <!-- 리뷰 시작 -->
               <div class="reviews mgtb10 mplist">
                  <div class="sub-title">
                     <h4 class="title">내가 쓴 리뷰 보기</h4>
                  </div>
                  <table class="mplist table table-bordered table-hover text-center">
                     <tr>
                        <th style="width:15%">가게이름</th>
                        <th style="width:15%">날짜</th>
                        <th style="width:10%">별점</th>
                        <th style="width:45%">내용</th>
                        <th style="width:15%">사진</th>
                     </tr>
                     <tr>
                        <td>팔람까오</td>
                        <td>20-06-11</td>
                        <td>4.0</td>
                        <td>얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고  </td>
                        <td>픽쳐 픽쳐</td>
                     </tr>
                     <tr>
                        <td>토마토김밥</td>
                        <td>20-06-11</td>
                        <td>4.0</td>
                        <td>순두부라면 먹어봤는가...</td>
                        <td>픽쳐有표시</td>
                     </tr>                     
                     <!-- paging needed -->                  
                  </table>
                  <!-- 
                  <table class="table table-bordered table-hover text-center">
                  <tr>
                     <th style="width:20%">가게이름</th>
                     <th style="width:10%">날짜</th>
                     <th style="width:10%">별점</th>
                     <th style="width:45%">내용</th>
                     <th style="width:15%">사진</th>
                  </tr>
                  <c:if test="${empty rv_list}" var="isEmpty">
                     <tr>
                        <td colspan="4">등록된 게시물이 없습니다.</td>
                     </tr>
                  </c:if>
                  <c:if test="${not isEmpty}">
                     <c:forEach items="${rv_list}" var="item" varStatus="loop">
                        <tr>
                           <td>${rv_list.store_name}</td>
                           <td>${rv_list.store_postDate}</td>
                           <td> </td>
                           <td>${RV_CONTENT}</td>
                           <td style="width:15%">사진</th>
                        </tr>
                     </c:forEach>
                  </c:if>
               </table>
                  -->
               </div>
               <div class="row">
                  <div class="col-md-12 text-center">${pagingString}</div>
               </div>
            </div>


            <div class="col-md-4 et text-center heading-section ftco-animate">
               <div class="text-center">
                  <span class="subheading">E.T</span>
                  <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">같이먹자</h2>
               </div>
               <div class="groups mgtb10">
                  <div class="sub-title">
                     <h4 class="title">user님의 같이먹자 기록</h4>
                  </div>
                  <div class="recent_group">
                     <h5 class="title">신청 온 ET 목록</h5>
                     <div class="reviews mgtb10 mplist" style="padding: 0; margin: 0;">
                        <table
                           class="mplist table table-bordered table-hover text-center">
                           <tr>
                              <th style="width: 10%">번호</th>
                              <th style="width: 20%">가게이름</th>
                              <th style="width: 20%">성향</th>
                              <th style="width: 20%">날짜</th>
                              <th style="width: 20%">시간</th>
                              <th style="width: 10%">인원</th>
                           </tr>
                           <tr>
                              <td>er_no</td>
                              <td>store_name</td>
                              <td>er_tend</td>
                              <td>er_date</td>
                              <td>er_time</td>
                              <td>er_max</td>
                           </tr>
                           <tr>
                              <td>2</td>
                              <td>팔람까오</td>
                              <td>F, B, SF  </td>
                              <td>20-06-11</td>
                              <td>1:20 - 2:30</td>
                              <td>4명</td>
                           </tr>
                           <!-- paging needed -->
                        </table>
                     </div>
                     <div class="row">
                        <div class="col-md-12 text-center">${pagingString}</div>
                     </div>
                  </div>
               </div>
                  <div class="im_group">
                     <h5 class="title">내가 연 같이 먹자</h5>
                     <div class="row ftco-animate justify-content-center">
                        <div class="item col-md-3" >
                           <div class="mypage-wrap text-center ">
                              <div class="user-img"
                                 style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
                                 <span class="quote d-flex align-items-center justify-content-center">
                                    <i class="icon-quote-left"></i>
                                 </span>
                              </div>
                              <div class="text">
                                 <p class="overflow" style="margin-bottom: 0rem;"> 메뉴이름 메뉴이름</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 가게이름 가게이름</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 참여자 리스트 참여자 </p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 날짜(시간) 날짜</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 안먹는거 안먹는거</p>
                              </div>
                           </div>
                        </div>
                        <div class="item col-md-3" >
                           <div class="mypage-wrap text-center ">
                              <div class="user-img"
                                 style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
                                 <span class="quote d-flex align-items-center justify-content-center">
                                    <i class="icon-quote-left"></i>
                                 </span>
                              </div>
                              <div class="text">
                                 <p class="overflow" style="margin-bottom: 0rem;"> 메뉴이름 메뉴이름</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 가게이름 가게이름</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 참여자 리스트 참여자 </p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 날짜(시간) 날짜</p>
                                 <p class="overflow" style="margin-bottom: 0rem;"> 안먹는거 안먹는거</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>         
            </div>
         </div>
      </div>
   
</section>

