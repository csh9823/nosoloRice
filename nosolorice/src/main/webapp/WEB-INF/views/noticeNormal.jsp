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
  </style>
</head>
<body>

  <div class="container">

    <div class="row">
      <div class="col">
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold my-5">일반 공지관리</h2>
            <div class="col"></div> <!-- 공간 확보를 위한 비어있는 컬럼 -->
            <div class="col-auto">
            
            </div>
          </div>
      </div>
    </div>
  </div>

    <div class="row text-center border-bottom border-top py-3">
      <div class="col-2">번호</div>
      <div class="col-4">제목</div>
      <div class="col-4">등록일</div>
      <div class="col-2">삭제</div>
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
      			<div class="col-4"><fmt:formatDate value="${n.noticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-2">
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
  
  </script>
</body>
</html>