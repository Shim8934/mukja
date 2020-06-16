<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<section class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value='/resources/bootstrap/images/bg_4.jpg'/>');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-center justify-content-center">
         <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">My Page</h1>
            <p class="breadcrumbs">
               <span class="mr-2"><a href="index.html">Home <i
                     class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
                  href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
                  Single <i class="ion-ios-arrow-forward"></i>
               </span>
            </p>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section mypage">
   <div class="container-fluid" style="width: 100%">
      <!-- 마이페이지 타이틀 -->
      <div class="row justify-content-center" style="width: 100%">
         <div class="text-center" style="width: 100%">
            <span class="subheading">My Page</span>
            <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">마이페이지</h2>
         </div>
      </div>
      <!-- MT & ET시작 -->
      <div class=" ftco-animate justify-content-center">
         <div class="text-center mtNet">
            <!-- 골라먹자 타이틀 -->
            <div class="col-md-5 mt text-center heading-section ftco-animate">
               <div class="text-center">
                  <span class="subheading" style="display: inline;">M.T</span>
                  <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">골라먹자</h2>
               </div>
               <!-- 골라먹자 시작 -->
               <!-- 성향 시작 -->
               <div class="border3bc">
                  <div class="sub-title">
                     <h4 class="title">user님의 MyType 성향</h4>
                     <button>수정</button>
                  </div>
                  <div class="jNs">
                     <div class="joa col-md-5">
                        <div>
                           <span class="title">LIKE! </span>
                        </div>
                        
                        <div >
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/pig_gc.png"/>'>
                           </div>
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_gc.png"/>'>
                           </div>
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/gluten_gc.png"/>'>
                           </div>
                        </div>
                     </div>
                     <div class="siro col-md-5">
                        <div>
                           <span class="title">DISLIKE!</span>
                        </div>
                        <div>
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/pig_c.png"/>'>
                           </div>
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_c.png"/>'>
                           </div>
                           <div class="stjjim-box">
                              <img class="mypage-img" src='<c:url value="/resources/tend_IMG/gluten_c.png"/>'>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- 찜 시작 -->
               <div class="border3bc">
                  <div class="sub-title">
                     <h4 class="title">찜보기 / 내가 누른 좋아요 보기</h4>
                  </div>
                  <div class="foodjjim bd2bc" style="margin: 10px;">
                     <h5 class="sub-title">메뉴찜보기</h5>
                     <div class="row">
                        <div class="col-md-6 col-lg-3 ftco-animate pb-4" >
                           <div class="suggestion">
                              <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
                              <div class="text" style="padding-top: 0rem">
                                 <div class="preference">
                                    <p>가게이름이랄까..</p>
                                 </div>
                                 <h3 style="margin-bottom:1rem;">메뉴이름이랄까..</h3>
                                 <div>
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                    </div>                                 
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                    </div>                              
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                    </div>
                                 </div>
                                 
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate pb-4" >
                           <div class="suggestion">
                              <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
                              <div class="text" style="padding-top: 0rem">
                                 <div class="preference">
                                    <p>가게이름이랄까..</p>
                                 </div>
                                 <h3 style="margin-bottom:1rem;">메뉴이름이랄까..</h3>
                                 <div>
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                    </div>                                 
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                    </div>                              
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                    </div>
                                 </div>
                                 
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate pb-4" >
                           <div class="suggestion">
                              <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
                              <div class="text" style="padding-top: 0rem">
                                 <div class="preference">
                                    <p>가게이름이랄까..</p>
                                 </div>
                                 <h3 style="margin-bottom:1rem;">메뉴이름이랄까..</h3>
                                 <div>
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                    </div>                                 
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                    </div>                              
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                    </div>
                                 </div>
                                 
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate pb-4">
                           <div class="suggestion">
                              <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
                              <div class="text" style="padding-top: 0rem">
                                 <div class="preference">
                                    <p>가게이름이랄까..</p>
                                 </div>
                                 <h3 style="margin-bottom:1rem;">메뉴이름이랄까..</h3>
                                 <div>
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                    </div>                                 
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                    </div>                              
                                    <div class="mnjjim-box ">
                                       <img class = "mnjjim-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                    </div>
                                 </div>
                                 
                              </div>
                           </div>
                        </div>                        
                     </div>
                  </div>
                  <div class="storejjim" style="margin: 10px;">
                     <h5 class="sub-title">가게찜보기</h5>
                     <div class="row justify-content-center" style="margin-right: 0px;">                     
                        
                        <div class="mpjjim col-md-4 col-xs-5 item-align-center bd2bc" style="padding: 0 10px;border-radius: 5%;">
                           <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div class="pt-3">
                                 <span class="mn_name overflow" style="font-size: 14px; font-weight: bold;">가게이름</span>
                                 <span class="st_name overflow" style="font-size: 12px; color: gray;">대표메뉴이름</span>
                              </div>
                              <div style=" padding-bottom: 0px;">
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>                              
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="mpjjim col-md-4 col-xs-5 item-align-center bd2bc" style="padding: 10px;border-radius: 5%;">
                           <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div class="pt-3">
                                 <span class="mn_name overflow" style="font-size: 14px; font-weight: bold;">가게이름가게이름</span>
                                 <span class="st_name overflow" style="font-size: 12px; color: gray;">대표메뉴이름</span>
                              </div>
                              <div style=" padding-bottom: 0px;">
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>                              
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="mpjjim col-md-4 col-xs-5 item-align-center bd2bc" style="padding: 10px;border-radius: 5%;">
                           <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/insta-2.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div class="pt-3">
                                 <span class="mn_name overflow" style="font-size: 14px; font-weight: bold;">가게이름</span>
                                 <span class="st_name overflow" style="font-size: 12px; color: gray;">대표메뉴이름</span>
                              </div>
                              <div>
                                 <div class="stjjim-box " style="display: inline-block;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="mpjjim col-md-4 col-xs-5 item-align-center bd2bc" style="padding: 10px;border-radius: 5%;">
                           <div class="img" style="background-image: url(<c:url value='/resources/bootstrap/images/wine-1.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div class="pt-3">
                                 <span class="mn_name overflow" style="font-size: 14px; font-weight: bold;">가게이름</span>
                                 <span class="st_name overflow" style="font-size: 12px; color: gray;">대표메뉴이름</span>
                              </div>
                              <div style=" padding-bottom: 0px;">
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>                              
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
               <!-- 리뷰 시작 -->
               <div class="row reviews border3bc mplist" >
                  <div class="sub-title">
                     <h4 class="title">내가 쓴 리뷰 보기</h4>
                  </div>
                  <div class="container">
                     <div class="row">
                        <table class="mplist table table-bordered table-hover text-center" style="padding: 10px;">
                           <tr class="">
                              <th style="width: 15%">가게이름</th>
                              <th style="width: 15%">날짜</th>
                              <th style="width: 10%">별점</th>
                              <th style="width: 45%">내용</th>
                              <th style="width: 15%">사진</th>
                           </tr>
                           <tr style='max-height: 35px'>
                              <td>팔람까오</td>
                              <td>20-06-11</td>
                              <td>4.0</td>
                              <td class="rv_content">얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고
                                 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러
                                 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용 배불러 아이고 얌운센 언젠간 먹는다..길게써보쟈 긴리뷰 내용
                                 배불러 아이고</td>
                              <td><img class="rv_pics" src='<c:url value="/resources/bootstrap/images/dinner-1.jpg"/>'/></td>
                           </tr>
                           <tr style='max-height: 35px'>
                              <td>토마토김밥</td>
                              <td>20-06-11</td>
                              <td>4.0</td>
                              <td class="rv_content">순두부라면 먹어봤는가...</td>
                              <td><img class="rv_pics" src='<c:url value="/resources/bootstrap/images/dinner-1.jpg"/>'/></td>
                           </tr>
                           <!-- paging needed -->
                        </table>
                     </div>
                  </div>
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
                  <div class="row">
                     <div class="col-md-12 text-center">${pagingString}</div>
                  </div>
               </div>
               <!-- 리뷰 페이징 -->

            </div>


            <div class="col-md-5 et text-center heading-section ftco-animate">
               <div class="text-center">
                  <span class="subheading" style="display: inline;">E.T</span>
                  <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">같이먹자</h2>
               </div>
               <div class="groups border3bc">
                  <div class="sub-title">
                     <h4 class="title">신청 온 ET 목록</h4>
                  </div>
                  <div class="recent_group">
                     <div class="reviews mplist" style="padding: 0; margin: 0;">
                        <div class="container">
                           <div class="row">
                              <div class="col-md-12 col-sm-12">
                                       <table class="table table-bordered table-hover" style="padding-top: 10px">
                                          <tr class="thead-light">
                                             <th>수락</th>
                                             <th>가게이름</th>
                                             <th>성향</th>
                                             <th>날짜</th>
                                             <th>시간</th>
                                             <th>참여자</th>
                                             <th>ETs</th>
                                          </tr>
                                          <tr class="customtable">
                                             <td><label class="customcheckbox"> <input
                                                   type="checkbox" class="listCheckbox"> <span
                                                   class="checkmark"></span>
                                             </label></td>
                                             <td class="overflow storeName">원할머니보쌈원할머니보쌈</td>
                                             <td class="overflow">F, P, PE, E</td>
                                             <td class="overflow">20-06-14</td>
                                             <td class="overflow">1:30-2:30</td>
                                             <td class="overflow">kim, park, lee</td>
                                             <td class="overflow">4명</td>
                                          </tr>
                                          <tr class="customtable">
                                             <td><label class="customcheckbox"> <input
                                                   type="checkbox" class="listCheckbox"> <span
                                                   class="checkmark"></span>
                                             </label></td>
                                             <td class="overflow storeName">원할머니보쌈</td>
                                             <td class="overflow">F, P, PE, E</td>
                                             <td class="overflow">20-06-14</td>
                                             <td class="overflow">1:30-2:30</td>
                                             <td class="overflow">cha, pyeon, ong</td>
                                             <td class="overflow">4명</td>
                                          </tr>
                                       </table>
                              </div>
                              <div class="col-md-12 text-center">${pagingString}</div>
                           </div>
                        </div>
                     </div>
                  </div></div>
               
               <div class="groups border3bc">
                  
                  <div class="sub-title">
                     <h4 class="title">내가 참가한 ET 보기</h4>
                  </div>
                  <div class="row et_records">
                     <div class="row ftco-animate text-center align-items-center justify-content-center" style="padding-right: 0;">
                        <div class="mpjjim col-md-7 col-xs-5 bd2bc" style="padding: 10px; marjin: 10px;">
                           <div class="img rv_list_img" style=" width:150px; float:left; display:inline-block; background-image: url(<c:url value='/resources/bootstrap/images/subway/vegi.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div>
                                 <span class="mn_name overflow" style="font-weight: bold;">메뉴이름</span>
                                 <span class="st_name overflow">가게이름</span>
                              </div>
                              <div>
                                 <span class="st-name overflow">20-06-14</span> 
                                 <span class="overflow">12시-13시</span>
                              </div>
                              <p class="overflow">4명</p>
                              <div style=" padding-bottom: 0px;">
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>                              
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                 </div>
                              </div>
                              <p class="overflow">shim, park, pyeon</p>
                           </div>
                        </div>
                        <div class="mpjjim col-md-7 col-xs-5 bd2bc" style="padding: 10px; marjin: 10px;">
                           <div class="img item-align-center" style=" float:left; width:150px; display:inline-block; background-image: url(<c:url value='/resources/bootstrap/images/dinner-1.jpg'/>);"></div>
                           <div class="text" style="padding-top: 0rem; display: inline-block;">
                              <div>
                                 <span class="mn_name overflow" style="font-size: 15px; font-weight: bold;">메뉴이름</span>
                                 <span class="st_name overflow" style="font-size: 12px; color: gray;">가게이름</span>
                              </div>
                              <div>
                                 <span class="st-name overflow">20-06-14</span> 
                                 <span class="overflow">12시-13시</span>
                              </div>
                              <p class="overflow">4명</p>
                              <div style=" padding-bottom: 0px;">
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
                                 </div>                                 
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/shrimp_b.png"/>'>
                                 </div>                              
                                 <div class="stjjim-box " style="display: inline-block; padding-bottom: 0px;"">
                                    <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pig_b.png"/>'>
                                 </div>
                              </div>
                              <p class="overflow">hwang, kim, hwang, shin</p>
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


