<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<section class="ftco-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-9 ftco-animate"> -->

         <!-- INFROMATION -->
            <section class="ftco-section ftco-wrap-about ftco-no-pb ftco-no-pt">
               <div class="container">
                  <div class="row no-gutters">
                     <!-- left-side picture -->
                     <div class="col-sm-5 img img-2 d-flex align-items-center justify-content-center justify-content-md-end"
                        style="background-image: url(<c:url value="/resources/bootstrap/images/about.jpg"/>); food-type: relative">
                        <a href="https://vimeo.com/45830194"
                           class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
                           <span class="ion-ios-play"></span>
                        </a>
                     </div>
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
                           <div>
                              <!-- 가게 정보 -->
                              <div class="restInfo col-md-8">
                                 <ul>
                                    <li class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/subway_logo.jpg"/>); width: 100px;"></li>
                                    <li style="font-family: 'Black Han Sans', sans-serif;"><h3
                                          class="mt-5" style="display: inline; font-family: 'Gugi'">
                                          주소 :</h3> 서울특별시 금천구 가산동 가산디지털1로 165 가산비즈니스센터 102호</li>
                                    <li style="font-family: 'Black Han Sans', sans-serif;"><h3
                                          class="mt-5" style="display: inline; font-family: 'Gugi'">
                                          평점 :</h3> 4.1</li>
                                    <li style="font-family: 'Black Han Sans', sans-serif;"><h3
                                          class="mt-5" style="display: inline; font-family: 'Gugi'">
                                          가게 전화번호 :</h3> 02-1544-1852</li>
                                    <li style="font-family: 'Black Han Sans', sans-serif;"><h3
                                          class="mt-5" style="display: inline; font-family: 'Gugi'">
                                          가게 영업시간 :</h3>
                                       <ul style="font-family: 'Black Han Sans', sans-serif;">
                                          <li style="font-family: 'Gugi', sans-serif;">월-금요일 오전
                                             8:00~오후 11:00</li>
                                          <li style="font-family: 'Gugi', sans-serif;">토요일 오전
                                             8:00~오후 11:00</li>
                                          <li style="font-family: 'Gugi', sans-serif;">일요일 오전
                                             8:00~오후 11:00</li>
                                       </ul>                                    
                                    <li style="font-family: 'Black Han Sans', sans-serif;">
                                       <h3 class="mt-5" style="display: inline; font-family: 'Gugi'"> 가게 이메일 :</h3> subway@gmail.com
                                    </li>
                                 </ul>
                              </div>
                              <!-- 
                              <div class="col-md-3 sidebar-box ftco-animate">
                                 <h3>Category</h3>
                                 <ul class="categories">
                                    <li><a href="#">Vegan <span>(6)</span></a></li>
                                    <li><a href="#">Lacto <span>(8)</span></a></li>
                                    <li><a href="#">Ovo <span>(2)</span></a></li>
                                    <li><a href="#">Pesc <span>(2)</span></a></li>
                                    <li><a href="#">Pork-free <span>(2)</span></a></li>
                                    <li><a href="#">Gluten-free <span>(2)</span></a></li>
                                 </ul>
                              </div>
                               -->
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
                           <div class="thumb my-4 d-flex">
                              <a href="#" class="thumb-menu pr-md-4 text-center">
                                 <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/Italy_bmt.jpg"/>);"></div>
                                 <h5>Italian BMT</h5>
                                 <h4>Chicken, XBeef, XNuts</h4>
                              </a> <a href="#" class="thumb-menu pr-md-4 text-center">
                                 <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/eggmayo.jpg"/>);"></div>
                                 <h5>Egg-Mayo</h5>
                                 <h4>Lacto, XChicken, XBeef, XPork, XNuts</h4>
                              </a> <a href="#" class="thumb-menu pr-md-4 text-center">
                                 <div class="img" style="background-image: url(<c:url value="/resources/bootstrap/images/subway/tuna.jpg"/>);"></div>
                                 <h5>Tuna</h5>
                                 <h4>Lacto, Ovo, Pesco, XChicken, XBeef, XPork, XNuts</h4>
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>


         <!-- COUNTING -->
            <section class="ftco-section ftco-counter img" id="section-counter"
               style="background-image: url(<c:url value="/resources/bootstrap/images/bg_4.jpg"/>);"
               data-stellar-background-ratio="0.5">
               <div class="container">
                  <div class="row d-md-flex align-items-center justify-content-center">
                     <div class="col-lg-10">
                        <div class="row d-md-flex align-items-center">
                           <div
                              class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                              <div class="block-18">
                                 <div class="text">
                                    <strong class="number" data-number="18">0</strong> <span
                                       style="font-family: 'Gugi', sans-serif;">가게 추천 수</span>
                                 </div>
                              </div>
                           </div>
                           <div
                              class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                              <div class="block-18">
                                 <div class="text">
                                    <strong class="number" data-number="750">0</strong> <span
                                       style="font-family: 'Do Hyeon', sans-serif;">가게 ♥ 수</span>
                                 </div>
                              </div>
                           </div>
                           <div
                              class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                              <div class="block-18">
                                 <div class="text">
                                    <strong class="number" data-number="564">0</strong> <span>리뷰
                                       수</span>
                                 </div>
                              </div>
                           </div>
                           <div
                              class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                              <div class="block-18">
                                 <div class="text">
                                    <strong class="number" data-number="10">0</strong> <span>가게
                                       랭킹</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            
         <!-- SUGGESTION -->         
            <section class="ftco-section ">
               <div class="container">
                  <div class="row justify-content-center mb-5 pb-2">
                     <div class="col-md-10 text-center heading-section ftco-animate">
                        <span class="subheading">Menu</span>
                        <h2 class="mb-4">Someone's Recommandations</h2>
                     </div>
                     <div>
                        <a class="menuplus" href="<c:url value='/MenuList.bbs'/>">+메뉴 더 보기</a>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/vegi.jpg"/>);"></div>
                           <div class="text px-4 pt-4" style="padding-top: 0rem">
                              <div class="preference">
                                 <p>Vegan's Choice</p>
                              </div>
                              <h3>Veggie Veggie Delite Veggie</h3>
                              <span class="food-type mb-2 overflow">Vegan,Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/Italy_bmt.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>XChicken's Choice XChicken's Choice</p>
                              </div>
                              <h3>Italian B.M.T Italian B.M.T Italian B.M.T</h3>
                              <span class="food-type mb-2 overflow">Vegan,Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>

                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/steak.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>XPork's choice</p>
                              </div>
                              <h3>Steak, Egg & Cheese</h3>
                              <span class="food-type mb-2 overflow">XChicken,XPork,Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/tuna.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>Pesco's Choice</p>
                              </div>
                              <h3>Tuna Sandwich</h3>
                              <span class="food-type mb-2  overflow">Pesco,XChicken,XPork,XBeef,Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/eggmayo.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>Lacto & Ovo's Choice</p>
                              </div>
                              <h3>Egg Mayo</h3>
                              <span class="food-type mb-2 overflow overflow">Lacto,Ovo,Pesco,XChicken,XPork,XBeef,Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/chickenTeriyaki.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>XBeef's Choice</p>
                              </div>
                              <h3>Chicken Teriyaki</h3>
                              <span class="food-type mb-2 overflow">XPork,XBeef,Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/subwayclub.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>All fine's Choice</p>
                              </div>
                              <h3>Subway Club</h3>
                              <span class="food-type mb-2">Xnuts</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="suggestion">
                           <div class="img"
                              style="background-image: url(<c:url value="/resources/bootstrap/images/subway/blt.jpg"/>);"></div>
                           <div class="text px-4 pt-4">
                              <div class="preference">
                                 <p>XChicken's Choice</p>
                              </div>
                              <h3>B.L.T</h3>
                              <span class="food-type mb-2">XChicken,XBeef,Xnuts</span>
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
                        <span class="subheading">Specialties</span>
                        <h2 class="mb-4">Our Menu</h2>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Breakfast</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/breakfast-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/breakfast-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/breakfast-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
            
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Lunch</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/lunch-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/lunch-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/lunch-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
            
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Dinner</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dinner-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dinner-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dinner-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
            
                     <!--  -->
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Desserts</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dessert-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dessert-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/dessert-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
            
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Wine Card</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/wine-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/wine-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/wine-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
            
                     <div class="col-md-6 col-lg-4 menu-wrap">
                        <div class="heading-menu text-center ftco-animate">
                           <h3>Drinks</h3>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/drink-1.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Beef with potatoes</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/drink-2.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                        <div class="menus d-flex ftco-animate">
                           <div class="menu-img img"
                              style="background-image: url(images/drink-3.jpg);"></div>
                           <div class="text">
                              <div class="d-flex">
                                 <div class="one-half">
                                    <h3>Grilled Crab with Onion</h3>
                                 </div>
                                 <div class="one-forth">
                                    <span class="price">$29</span>
                                 </div>
                              </div>
                              <p>
                                 <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoe</span>
                              </p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 text-center ftco-animate">
                        <p>
                           <a href="<c:url value="MenuList.bbs"/>" class="btn btn-black py-3 px-5">View All Menu</a>
                        </p>
                     </div>
                  </div>
               </div>
            
            </section>


         <!-- REVIEW -->
<section class="ftco-section testimony-section ">
   <div class="container">
      <!-- REVIEW TITLE -->
      <div class="row justify-content-center mb-5 pb-2">
         <div
            class="col-md-10 text-center heading-section heading-section-white ftco-animate"
            style="display: inline">
            <span class="subheading">${review}</span>
            <h2 class="mb-4" style="font-family: 'Gugi', sans-serif;">베스트
               메뉴 후기</h2>
         </div>
         <div>
            <a class="menuplus" href="<c:url value='/ReviewList.bbs'/>"> +후기
               더 보기</a>
         </div>
      </div>

      <!-- BEST REVIEW -->
      <div class="row ftco-animate justify-content-center">
         <!-- <div class=" col-md-7"> <div class="carousel-testimony owl-carousel ftco-owl">CAROUSEL 적용 -->
         <div class="item col-md-2">
            <!-- 1-1 -->
            <div class="testimony-wrap text-center py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3 ">
                  <p class="name overflow">MenuName</p>
                  <span class="food-type overflow">Type</span>
                  <p class="mb-4 overflow">Review</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="item col-md-2">
            <div class="testimony-wrap text-center py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3">
                  <p class="name overflow">연어 스테이크</p>
                  <span class="food-type overflow">TypeTypeTypeType</span>
                  <p class="mb-4 overflow">ReviewReviewReviewReview</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="item col-md-2">
            <div class="testimony-wrap text-center py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3">
                  <p class="name overflow">부드럽고 고소한 크림 소스에 톡톡 튀는 명란이 들어간 크림 파스타</p>
                  <span class="food-type overflow">Type</span>
                  <p class="mb-4 overflow">맛있는팟씨유먹고파....</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="item col-md-2">
            <div class="testimony-wrap text-enter py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3">
                  <p class="name overflow">가나다라마바사아자차카파타하</p>
                  <span class="food-type overflow">Lacto, Pork-free</span>
                  <p class="mb-4 overflow">가나다라마바사아자차카파타하</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="item col-md-2">
            <!-- 5 -->
            <div class="testimony-wrap text-center py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dessert-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3">
                  <p class="name overflow">MenuName</p>
                  <span class="food-type overflow">Type</span>
                  <p class="mb-4 overflow">ReviewReviewReviewReview</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="item col-md-2">
            <!-- 6 -->
            <div class="testimony-wrap text-center py-4 pb-5">
               <div class="user-img mb-4"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);">
                  <span
                     class="quote d-flex align-items-center justify-content-center">
                     <i class="icon-quote-left"></i>
                  </span>
               </div>
               <div class="text px-3 pt-3">
                  <p class="name overflow">MenuName</p>
                  <span class="food-type overflow">Type</span>
                  <p class="mb-4 overflow">Review</p>
                  <ul class="ftco-social d-flex">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-message"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-google-plus"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
         </div>
         <!-- item6 -->
      </div>
   </div>
   <!-- </div> </div> -->
   <div class="container">
      <h3 class="mb-5 h4 font-weight-bold p-4"
         style="font-family: 'Gugi', sans-serif; text-align: center">모든
         리뷰 보기</h3>
      <div>
         <ul class="comment-list">
            <!-- 
            <c:if test="${empty store_review}" var="isEmpty">
               <tr>
                  <td colspan="4">등록된 게시물이 없습니다.</td>
               </tr>
            </c:if>
            <c:if test="${not isEmpty}">
               <c:forEach items="${store_review}" var="item" varStatus="loop"> -->
                  <li class="comment">
                     <div class="vcard bio">
                        <img
                           src='<c:url value="/resources/bootstrap/images/person_1.jpg"/>'
                           alt="Image placeholder">
                     </div>
                     <div class="comment-body">
                        <div class="row">
                           <h3 class="col-md-1">ID</h3>
                           <div class="col-md-10 meta mb-2">| regidate</div>
                           <h3>평점</h3>
                        </div>
                        <p>리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰 review 리뷰
                           review 리뷰 review</p>
                        <div class="menu-img img"
                           style="background-image: url(<c:url value="/resources/bootstrap/images/subway/review/eggmayo.jpg"/>);"></div>
                     </div>
                  </li>

                  <li class="comment">
                     <div class="vcard bio">
                        <img
                           src='<c:url value="/resources/bootstrap/images/person_2.jpg"/>'
                           alt="Image placeholder">
                     </div>
                     <div class="comment-body">
                        <div class="row">
                           <h3 class="col-md-1">ID</h3>
                           <div class="col-md-10 meta mb-2">| regidate</div>
                           <h3>평점</h3>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                           Pariatur quidem laborum necessitatibus, ipsam impedit vitae
                           autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
                           voluptas earum impedit necessitatibus, nihil?</p>
                        <p>
                           <a href="#" class="reply">Reply</a>
                        </p>
                     </div>

                     <ul class="children">
                        <li class="comment">
                           <div class="vcard bio">
                              <img
                                 src='<c:url value="/resources/bootstrap/images/chef-1.jpg"/>'
                                 alt="Image placeholder">
                           </div>
                           <div class="comment-body">
                              <div class="row">
                                 <h3 class="col-md-1">ID</h3>
                                 <div class="col-md-10 meta mb-2">| regidate</div>
                                 <h3>평점</h3>
                              </div>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                 elit. Pariatur quidem laborum necessitatibus, ipsam impedit
                                 vitae autem, eum officia, fugiat saepe enim sapiente iste
                                 iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                              <p>
                                 <a href="#" class="reply">Reply</a>
                              </p>
                           </div>


                           <ul class="children">
                              <li class="comment">
                                 <div class="vcard bio">
                                    <img
                                       src='<c:url value="/resources/bootstrap/images/chef-2.jpg"/>'
                                       alt="Image placeholder">
                                 </div>
                                 <div class="comment-body">
                                    <h3>John Doe</h3>
                                    <div class="meta mb-2">January 03, 2019 at 2:21pm</div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                       elit. Pariatur quidem laborum necessitatibus, ipsam impedit
                                       vitae autem, eum officia, fugiat saepe enim sapiente iste
                                       iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                    <p>
                                       <a href="#" class="reply">Reply</a>
                                    </p>
                                 </div>

                                 <ul class="children">
                                    <li class="comment">
                                       <div class="vcard bio">
                                          <img
                                             src='<c:url value="/resources/bootstrap/images/chef-3.jpg"/>'
                                             alt="Image placeholder">
                                       </div>
                                       <div class="comment-body">
                                          <h3>dk wdksjgksal;dnga;sldgn;sa</h3>
                                          <div class="meta mb-2">January 03, 2019 at 2:21pm</div>
                                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                             elit. Pariatur quidem laborum necessitatibus, ipsam
                                             impedit vitae autem, eum officia, fugiat saepe enim
                                             sapiente iste iure! Quam voluptas earum impedit
                                             necessitatibus, nihil?</p>
                                          <p>
                                             <a href="#" class="reply">Reply</a>
                                          </p>
                                       </div>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </li>
                  <li class="comment">
                     <div class="vcard bio">
                        <img
                           src='<c:url value="/resources/bootstrap/images/chef-4.jpg"/>'
                           alt="Image placeholder">
                     </div>
                     <div class="comment-body">
                        <h3>John Doe</h3>
                        <div class="meta mb-2">January 03, 2019 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                           Pariatur quidem laborum necessitatibus, ipsam impedit vitae
                           autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
                           voluptas earum impedit necessitatibus, nihil?</p>
                        <p>
                           <a href="#" class="reply">Reply</a>
                        </p>
                     </div>
                  </li>
               <!--</c:forEach>
            </c:if>-->
         </ul>
      </div>
      <div class="row no-gutters my-5">
         <div class="col text-center">
            <div class="block-27">
               <ul>
                  <li><a href="#">&lt;</a></li>
                  <li class="active"><span>1</span></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">&gt;</a></li>
               </ul>
            </div>
         </div>
      </div>

      <!-- END comment-list -->
      <div class="comment-form-wrap pt-5">
         <h3 class="mb-5 h4 font-weight-bold p-4 bg-light">리뷰 남기기(비로그인시)</h3>
         <form action="#" class="p-4 p-md-5">
            <div class="form-group">
               <label for="email">ID / Email</label> <input type="email"
                  class="form-control" id="email">
            </div>
            <div class="form-group">
               <label for="email">Password</label> <input type="email"
                  class="form-control" id="email">
            </div>
            <div class="form-group">
               <label for="message">Contents</label>
               <textarea name="" id="message" cols="30" rows="5"
                  class="form-control"></textarea>
            </div>
            <div class="form-group">
               <input type="submit" value="Post Comment"
                  class="btn py-3 px-4 btn-primary">
            </div>

         </form>
      </div>
      <div class="comment-form-wrap pt-5">
         <h3 class="mb-5 h4 font-weight-bold p-4">리뷰 남기기(로그인시)</h3>
         <form action="#" class="p-4 p-md-5">
            <div class="form-group">
               <label for="message">Contents</label>
               <textarea name="" id="message" cols="30" rows="5"
                  class="form-control"></textarea>
            </div>
            <div class="form-group">
               <input type="submit" value="Post Comment"
                  class="btn py-3 px-4 btn-primary">
            </div>
         </form>
      </div>
   </div>
</section>



<!-- 오른쪽 페이지!!!!!!! 
         <div class="col-lg-3 sidebar ftco-animate" style="background: #fff">
            <div class="sidebar-box">
               <form action="#" class="search-form">
                  <div class="form-group">
                     <span class="icon icon-search"></span> <input type="text"
                        class="form-control" placeholder="Type a keyword and hit enter">
                  </div>
               </form>
            </div>
            <div class="sidebar-box ftco-animate">
               <h3>Category</h3>
               <ul class="categories">
                  <li><a href="#">Vegan <span>(6)</span></a></li>
                  <li><a href="#">Lacto <span>(8)</span></a></li>
                  <li><a href="#">Ovo <span>(2)</span></a></li>
                  <li><a href="#">Pesc <span>(2)</span></a></li>
                  <li><a href="#">Pork-free <span>(2)</span></a></li>
                  <li><a href="#">Gluten-free <span>(2)</span></a></li>
               </ul>
            </div>

            <div class="sidebar-box ftco-animate">
               <h3>Best Menu</h3>
               <div class="block-21 mb-4 d-flex">
                  <a class="blog-img mr-4" style="background-image: url(<c:url value="/resources/bootstrap/images/image_1.jpg"/>);"></a>
                  <div class="text">
                     <div class="meta">
                        <div>
                           <a href="#"><span class="icon-calendar"></span> Feb. 04, 2019</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-person"></span> Dave Lewis</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-chat"></span> 19</a>
                        </div>
                     </div>
                     <h3 class="heading">
                        <a href="#">Even the all-powerful Pointing has no control
                           about the blind texts</a>
                     </h3>                     
                  </div>
               </div>
               <div class="block-21 mb-4 d-flex">
                  <a class="blog-img mr-4"
                     style="background-image: url(images/image_2.jpg);"></a>
                  <div class="text">
                     <h3 class="heading">
                        <a href="#">Even the all-powerful Pointing has no control
                           about the blind texts</a>
                     </h3>
                     <div class="meta">
                        <div>
                           <a href="#"><span class="icon-calendar"></span> Feb. 04,
                              2019</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-person"></span> Dave Lewis</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-chat"></span> 19</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="block-21 mb-4 d-flex">
                  <a class="blog-img mr-4"
                     style="background-image: url(images/image_3.jpg);"></a>
                  <div class="text">
                     <h3 class="heading">
                        <a href="#">Even the all-powerful Pointing has no control
                           about the blind texts</a>
                     </h3>
                     <div class="meta">
                        <div>
                           <a href="#"><span class="icon-calendar"></span> Feb. 04,
                              2019</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-person"></span> Dave Lewis</a>
                        </div>
                        <div>
                           <a href="#"><span class="icon-chat"></span> 19</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="sidebar-box ftco-animate">
               <h3>Tag Cloud</h3>
               <ul class="tagcloud m-0 p-0">
                  <a href="#" class="tag-cloud-link">Dish</a>
                  <a href="#" class="tag-cloud-link">Food</a>
                  <a href="#" class="tag-cloud-link">Lunch</a>
                  <a href="#" class="tag-cloud-link">Menu</a>
                  <a href="#" class="tag-cloud-link">Dessert</a>
                  <a href="#" class="tag-cloud-link">Drinks</a>
                  <a href="#" class="tag-cloud-link">Sweets</a>
               </ul>
            </div>

            <div class="sidebar-box ftco-animate">
               <h3>Archives</h3>
               <ul class="categories">
                  <li><a href="#">January 2019 <span>(20)</span></a></li>
                  <li><a href="#">December 2018 <span>(30)</span></a></li>
                  <li><a href="#">Novemmber 2018 <span>(20)</span></a></li>
                  <li><a href="#">September 2018 <span>(6)</span></a></li>
                  <li><a href="#">August 2018 <span>(8)</span></a></li>
               </ul>
            </div>


            <div class="sidebar-box ftco-animate">
               <h3>Paragraph</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                  Ducimus itaque, autem necessitatibus voluptate quod mollitia
                  delectus aut, sunt placeat nam vero culpa sapiente consectetur
                  similique, inventore eos fugit cupiditate numquam!</p>
            </div>
         </div>-->
         <!-- END COL 
      </div>
   </div>
</section>-->