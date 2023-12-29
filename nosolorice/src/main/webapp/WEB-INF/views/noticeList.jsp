<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="resources/js/jquery-3.2.1.min.js"></script>
  <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
  <style>
      .btn {
        background-color: #FA9884;
      }
      body {font-family: 'SUITE Variable', sans-serif;}
      
      .noticeRow:hover {
      
       	background-color : #FFE5CA;
      }
         ul {
      list-style: none;
    }
    .textColor{
      text-decoration: none;
      color : #616161;
    }
    * {
      font-family: 'SUITE Variable', sans-serif;
    }

  </style>
</head>
<body>

  <div class="container">
	<div class="row">
	
        <div class="col-md-3">
          <ul class="my-3 fs-5">
             <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="userInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="#" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제 요청</a></li>
            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="businessSales" class="textColor">매출현황</a></li>
            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
          </ul>
        </div>  
        
        <div class="col">
       
          
      <div class="row my-5">
      	<div class="col">
      		<input type="button" value="일반공지" class="btn" id="normalNoticeShow">
      		<input type="button" value="사업공지" class="btn" id="businessNoticeShow">
      	</div>
      	<div class="col-auto">
              <input type="button" value="등록하기" class="btn" onclick="location.href='noticeWrite'">
      </div>
      </div>
            
    <div class="row" id="normalNoticeRow">
      <div class="col">
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold my-5">일반 공지관리</h2>
            <div class="col"></div> <!-- 공간 확보를 위한 비어있는 컬럼 -->
            
          </div>
      </div>


    <div class="row text-center border-bottom border-top py-3">
      <div class="col-2">번호</div>
      <div class="col-4">제목</div>
      <div class="col-3">등록일</div>
      <div class="col-3">삭제</div>
    </div>

  <c:if test="${empty nList}"> 
	<div class="text-center">
  		공지 작성이 없습니다.
  </div>
  </c:if>
  
  
  
  <c:if test="${not empty nList}">
    <c:forEach var="n" items="${nList}">
    	<div class="row text-center py-3 noticeRow" style="cursor:pointer;">
      			<div class="col-2">${n.noticeNo}</div>
      			<div class="col-4">${n.noticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${n.noticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-3">
      		<input type="button" value="수정" class="btn " style="background-color:#FA9884;" onclick="location.href='noticeUpdate?noticeNo=${n.noticeNo}&pageNum=${currentPage}&noticeType=normal'">
      		<input type="button" value="삭제" class="btn mx-1" style="background-color:#C93C3C ;" onclick="location.href='noticeDelete?noticeNo=${n.noticeNo}'">
    		</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow">
    	<div class="col">
    		${n.noticeContent}
    	</div>
    </div>
    </c:forEach>
  </c:if>
      </div>
  </div>
  
  <div class="row d-none" id="businessNoticeRow">
      <div class="col">
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold my-5">사업 공지관리</h2>
            <div class="col"></div> <!-- 공간 확보를 위한 비어있는 컬럼 -->
            <div class="col-auto">
              
            </div>
          </div>
      </div>
    </div>
    
     <div class="row text-center border-bottom border-top py-3">
      <div class="col-2">번호</div>
      <div class="col-4">제목</div>
      <div class="col-3">등록일</div>
      <div class="col-3">삭제</div>
    </div>

  <c:if test="${empty bList}"> 
	<div class="text-center">
  		공지 작성이 없습니다.
  </div>
  </c:if>

 
  <c:if test="${not empty bList}">
    <c:forEach var="b" items="${bList}">
    	<div class="row text-center py-3 noticeRow" style="cursor:pointer;">
      			<div class="col-2">${b.businessNoticeNo}</div>
      			<div class="col-4">${b.businessNoticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${b.businessNoticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-3">
      		<input type="button" value="수정" class="btn" style="background-color:#FA9884;" onclick="location.href='businessNoticeUpdate?businessNoticeNo=${b.businessNoticeNo}&pageNum=${currentPage}&noticeType=business'">
      		<input type="button" value="삭제" class="btn mx-1" style="background-color:#C93C3C ;" onclick="location.href='businessNoticeDelete?businessNoticeNo=${b.businessNoticeNo}'">
    		</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow">
    	<div class="col">
    		${b.businessNoticeContent}
    	</div>
    </div>
    </c:forEach>
  </c:if>
  	</div>	
	</div>
 	</div> 
  </div>	  <!-- container end -->


    
    
    
    

   





  
  <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
  <script>
  	
  	$(document).on("click",".noticeRow",function(){
  		
 		
  		if($(this).next().is(":visible")){
  			
  		$(this).next().addClass("d-none");
  	} else {
  		$(".noticeContentRow").addClass("d-none");
  		$(this).next().removeClass("d-none");
  		
  	}
  	});
  	
	$("#normalNoticeShow").on('click',function(){
  		
 		$("#businessNoticeRow").addClass("d-none");
  		
  		$("#normalNoticeRow").removeClass("d-none");
  		
  		
  		
  	});
  	
  	$("#businessNoticeShow").on('click',function(){
  		
  		$("#businessNoticeRow").removeClass("d-none");
  		
  		$("#normalNoticeRow").addClass("d-none");
  		
  	
  	});
  	
  	
  	
  	
  
  </script>
</body>
</html>