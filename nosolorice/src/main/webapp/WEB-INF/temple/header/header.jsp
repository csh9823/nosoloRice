<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="navbar navbar-expand-lg px-4">
  <div class="container-fluid">
    <a class="logo navbar-brand" href="mainPage"><img src="resources/img/logo/nosolorice_logo_s.png"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-3" style="margin-left: 80px;">
      
        <li class="nav-item mx-2">
			<a class="nav-link text-secondary" aria-current="page" href="mainPage?introduce=true">서비스 소개</a>
        </li>
        
        <li class="nav-item mx-2">
          <a class="nav-link text-secondary" aria-current="page" href="matching">매칭하기</a>
        </li>
  
        <li class="nav-item mx-2">
          <a class="nav-link text-secondary" aria-current="page" href="normalUserInfoUpdate">마이페이지</a>
        </li>

        <li class="nav-item mx-2">
          <a class="nav-link text-secondary" aria-current="page" href="question">고객센터</a>
        </li>

      </ul>
      
    		<div class="col-auto d-flex align-items-center">
    			<!-- 유저_프로필 -->                
                <div style="background-position:center;background-image:url('resources/upload/${sessionScope.NormalUser.profile}');width:50px;height:50px;background-size:cover;" 
                class="rounded-circle border">
                </div>
                <!-- 포인트 -->          
                <div class="ms-1 me-2">
                  <span class="fw-bold">보유 포인트</span><br>
                  <span>
                  <fmt:formatNumber value="${sessionScope.NormalUser.myPoint}" pattern="#,###" />
                  </span> 포인트
                </div>  
    		</div>
      
    		<div class="col-auto d-flex align-items-center">
               <button type="button" class="btn btn-primary me-3" onclick="location.href='chargePoint'">포인트 충전</button>
               <a class="btn btn-danger" href='${  not empty sessionScope.NormalUser  ? "logout" : "login" }'>
                 ${ not empty sessionScope.NormalUser  ? "로그아웃" : "로그인" }
             	</a>
    		</div>
      
    </div>
  </div>
</nav>