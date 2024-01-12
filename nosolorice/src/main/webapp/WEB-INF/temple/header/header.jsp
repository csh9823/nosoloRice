<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid">        
    
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
      
                <!-- 유저_프로필 -->
                <img src="${sessionScope.NormalUser.profile}" style="width: 80px; height: 80px; border-radius: 50%;"/>
      
                <!-- 포인트 -->          
                <div class="d-flex flex-column mb-2 ">
                  <p class="me-2 mb-2 fs-6 align-items-end">보유 포인트</p>
                  <p class="me-2 mb-2 align-items-start fw-bold">${ sessionScope.NormalUser.myPoint }</p>
                </div>  
                
      
                <!-- 버튼들 -->
                <button type="button" class="btn btn-danger me-2" onclick="location.href='chargePoint'">충전</button>
                <a class="nav-link" class="btn btn-primary" href='${  not empty sessionScope.NormalUser  ? "logout" : "login" }'>
                  ${ not empty sessionScope.NormalUser  ? "로그아웃" : "로그인" }
              </a>

      
              </div>  
          
            </div>
         </c:if>
      </div>
     </nav>