<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->



<section class="ftco-section">
   <div class="container">
      <div class="row justify-content-center mb-5 pb-2">
         <div class="col-md-12 text-center heading-section ftco-animate">
            <span class="subheading">Specialties</span>
            <h2 class="mb-4">Our Menu</h2>
         </div>
         <div class="col-md-12 text-center ftco-animate" >
            <p>
               <a href="<c:url value="MenuList.bbs"/>" class="btn btn-black py-3 px-5">Update My Menu</a>
            </p>
            </div>
        </div>

      <div id='avoid' style="z-index: 3; margin-top: 10px; display: none;"
         class="row align-items-center justify-content-center">
         <div class="col-xs-6 ">
            <div class="row">
               <div class="col-xs-1">
                  <!-- 물고기 -->
                  <img id='FS'
                     src="<c:url value="/resources/tend_IMG/pesco_b.png"/>" alt="F"
                     class="img-circle img_size">
                  <div class="lb_size">생선</div>
               </div>
               <div class="col-xs-1">
                  <!-- 달걀-->
                  <img id='EG' src="<c:url value="/resources/tend_IMG/ovo_b.png"/>"
                     alt="E" class="img-circle img_size">
                  <div class="lb_size">달걀</div>
               </div>
               <div class="col-xs-1">
                  <!-- 우유-->
                  <img id='MK'
                     src="<c:url value="/resources/tend_IMG/dairy_b.png"/>" alt="M"
                     class="img-circle img_size">
                  <div class="lb_size">우유</div>
               </div>
               <div class="col-xs-1">
                  <!-- 가금류-->
                  <img id='BD'
                     src="<c:url value="/resources/tend_IMG/chicken_b.png"/>" alt="B"
                     class="img-circle img_size">
                  <div class="lb_size">가금류</div>
               </div>
               <div class="col-xs-1">
                  <!-- 돼지고기-->
                  <img id='PK' src="<c:url value="/resources/tend_IMG/pig_b.png"/>"
                     alt="P" class="img-circle img_size">
                  <div class="lb_size">돼지</div>
               </div>
               <div class="col-xs-1">
                  <!-- 소고기-->
                  <img id='CW' src="<c:url value="/resources/tend_IMG/cow2_b.png"/>"
                     alt="C" class="img-circle img_size">
                  <div class="lb_size">소</div>
               </div>
               <div class="col-xs-1">
                  <!-- 땅콩-->
                  <img id='PE' src="<c:url value="/resources/tend_IMG/nuts_b.png"/>"
                     alt="PE" class="img-circle img_size">
                  <div class="lb_size">땅콩</div>
               </div>
               <div class="col-xs-1">
                  <!-- 각갑류-->
                  <img id='SF'
                     src="<c:url value="/resources/tend_IMG/shrimp_b.png"/>" alt="SF"
                     class="img-circle img_size">
                  <div class="lb_size">갑각류</div>
               </div>
               <div class="col-xs-1">
                  <!-- 치즈-->
                  <img id='DP' src="<c:url value="/resources/tend_IMG/dp_b.JPG"/>"
                     alt="DP" class="img-circle img_size">
                  <div class="lb_size">유제품</div>
               </div>
               <div class="col-xs-1">
                  <!-- 콩-->
                  <img id='SB' src="<c:url value="/resources/tend_IMG/s_b.png"/>"
                     alt="SB" class="img-circle img_size">
                  <div class="lb_size">대두</div>
               </div>
               <div class="col-xs-1" style="margin-bottom: 10px;">
                  <!-- 밀가루 -->
                  <img id='FL'
                     src="<c:url value="/resources/tend_IMG/gluten_b.png"/>" alt="FL"
                     class="img-circle img_size">
                  <div class="lb_size">글루텐</div>
               </div>
            </div>
         </div>
      </div>


      <div class="row">
         <div class="col-md-6 col-lg-4 menu-wrap">
            <div class="mypage-box " style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/chicken_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>Chicken</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-2.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-2.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-3.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/breakfast-4.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(images/breakfast-5.jpg);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(images/breakfast-6.jpg);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(images/breakfast-7.jpg);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(images/breakfast-8.jpg);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
               </div>
            </div>
         </div>

         <div class="col-md-6 col-lg-4 menu-wrap">
            <div class="mypage-box" style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/dairy_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>Lacto</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-1.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-2.jpg"/>);"></div>
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
                     <span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>, <span>Tomatoes</span>
                  </p>
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-3.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/lunch-4.jpg"/>);"></div>
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
                  style="background-image: url(images/lunch-5.jpg);"></div>
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
                  style="background-image: url(images/lunch-6.jpg);"></div>
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
                  style="background-image: url(images/lunch-7.jpg);"></div>
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
                  style="background-image: url(images/lunch-8.jpg);"></div>
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
            <div class="mypage-box" style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/ovo_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>Ovo</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-2.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-3.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/dinner-4.jpg"/>);"></div>
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
                  style="background-image: url(images/dinner-5.jpg);"></div>
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
                  style="background-image: url(images/dinner-6.jpg);"></div>
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
                  style="background-image: url(images/breakfast-9.jpg);"></div>
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
            <div class="mypage-box" style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/pesco_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>Pesco</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink-2.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink-3.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink-4.jpg"/>);"></div>
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

            <div class="mypage-box" style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/gluten_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>Pollo</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-2.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-3.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-4.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-5.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-6.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-7.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-8.jpg"/>);"></div>
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

            <div class="mypage-box" style="margin-left: 150px">
               <img class = "mypage-img" src='<c:url value="/resources/tend_IMG/cow2_b.png"/>'>
            </div>
            <div class="heading-menu text-center ftco-animate">
               <h3>X Poultry</h3>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  <p>
                     <span>icon</span>, <span>icon</span>, <span>icon</span>, <span>icon</span>
                  </p>
               </div>
            </div>
            <div class="menus d-flex ftco-animate">
               <div class="menu-img img"
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/wine-1.jpg"/>);"></div>
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
                  style="background-image: url(<c:url value="/resources/bootstrap/images/drink_1.jpg"/>);"></div>
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
   </div>

</section>