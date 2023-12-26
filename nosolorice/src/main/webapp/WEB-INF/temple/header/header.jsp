<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<nav class="navbar navbar-expand-lg">

    <div class="container-fluid">
    

    
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    
    <!-- admin_header -->
    <c:if test="${sessionScope.root eq '0'}">
		<!-- nav_logo -->
		<a class="logo" href="main.jsp"><img src="./logo/nosolorice_logo_s.png"></a>
      

	      <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0 p-4">
	    
	          <!-- nav_content -->
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 문의 </a>
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
	        	<div>${sessionScope.rootName}</div>
	          <!-- who_login -->
	          <a class="nav-link" href="#">로그아웃</a>
	        </div>
	    
	      </div>
    </c:if>
    
    <!-- normal_user -->
    <c:if test="${sessionScope.root eq '2'}">
    
    	<!-- nav_logo -->
		<a class="logo" href="main.jsp"><img src="./logo/nosolorice_logo.png"></a>
		
	      <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0 p-4">
	    
	          <!-- nav_content -->
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 문의 </a>
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
	        	<div>${sessionScope.rootName}</div>
	          <!-- who_login -->
	          <a class="nav-link" href="#">로그아웃</a>
	        </div>
	    
	      </div>
    </c:if>
    
    </div>
  
  </nav>