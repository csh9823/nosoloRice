<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid">
    
    <!-- 관리자헤더_아직 관리자회원 로그인 성공 시 세션저장 기능 없음 -->
    <c:if test="${not empty sessionScope.RootUser}">
      <!-- nav_logo -->
      <a class="logo" href="main.jsp"><img src="./logo/nosolorice_logo_s.png"></a>
      

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
       
           <ul class="navbar-nav me-auto mb-2 mb-lg-0 p-4">
       
             <!-- nav_content -->
             <li class="nav-item dropdown">
               <button class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 문의 </button>
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="#">일반회원 문의</a></li>
                 <li><a class="dropdown-item" href="#">사업자회원 문의</a></li>
               </ul>
             </li>
   
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">신고내역</a>
             </li>
       
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">가입승인</a>
             </li>
   
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">리뷰삭제 요청</a>
             </li>
   
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">업체삭제</a>
             </li>
             
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">회원정지</a>
             </li>
   
             <li class="nav-item">
               <a class="nav-link " aria-current="page" href="#">매출현황</a>
             </li>
             
             <li class="nav-item">
               <a class="nav-link  " aria-current="page" href="#">공지관리</a>
             </li>
       
           </ul>
       
           <!-- login -->
           <div class="d-flex">
                <!-- who_login -->
                <a class="nav-link" href='${ not empty sessionScope.BusinessUser ? "logout" : "loginForm" }'>
                     ${ not empty sessionScope.BusinessUser ? "로그아웃" : "로그인" }
              </a>
           </div>
       
         </div>
    </c:if>
        
    
    <c:if test="${not empty sessionScope.NormalUser}">
       
            <!-- nav_logo -->
      
            <a class="logo" href="mainPage"><img src="resources/img/logo/nosolorice_logo_s.png"></a>
          
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
          
              <ul class="navbar-nav me-auto mb-2 mb-lg-0 p-4">
          
                <!-- nav_content -->
                <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="mainPage?introduce=true">서비스 소개</a>
                </li>
      
                <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="matching">매칭하기</a>
                </li>
          
                <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="normalUserInfoUpdate">마이페이지</a>
                </li>
      
                <li class="nav-item">
                  <a class="nav-link " aria-current="page" href="question">고객센터</a>
                </li>
          
              </ul>
          
              <!-- login -->
              <div class="d-flex justify-content-evenly align-items-center">
      
                <!-- search_bar -->
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="가게명/음식메뉴" aria-label="Search">
                  <button class="btn me-2" type="submit"><i class="bi bi-search"></i></button>
                </form>
      
                <!-- 유저_프로필 -->
                <a href="#"><img src="${sessionScope.NormalUser.profile}" class="rounded-circle me-2 "/></a>
      
                <!-- 포인트 -->          
                <div class="d-flex flex-column mb-2 ">
                  <p class="me-2 mb-2 fs-6 align-items-end">보유 포인트</p>
                  <p class="me-2 mb-2 align-items-start fw-bold">${ sessionScope.NormalUser.myPoint }</p>
                </div>  
                
      
                <!-- 버튼들 -->
                <button type="button" class="btn btn-danger me-2">충전</button>
                <a class="nav-link" class="btn btn-primary" href='${  not empty sessionScope.NormalUser  ? "logout" : "login" }'>
                  ${ not empty sessionScope.NormalUser  ? "로그아웃" : "로그인" }
              </a>

      
              </div>  
          
            </div>
         </c:if>
      </div>
     </nav>