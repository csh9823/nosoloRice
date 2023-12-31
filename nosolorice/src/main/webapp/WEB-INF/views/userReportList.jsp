<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<style>
    ul {
      list-style: none;
    }
    a{
      text-decoration: none;
      color : #616161;
    }
    * {
      font-family: 'SUITE Variable', sans-serif;
    }

  .answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out;
  }

  .btn {
    background-color: #3DB78B;
    color : white;
  }

</style>
</head>
<body>

  <div class="container">
    
      
  
      <div class="row">
        <div class="col-md-3">
            <ul class="my-3">
                <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">마이페이지</li>
                <li class="my-5 fs-4"><a href="#">내 정보</a></li>
                <li class="my-5 fs-4"><a href="#">내 예약이력</a></li>
                <li class="my-5 fs-4"><a href="#">작성한 리뷰</a></li>
                <li class="my-5 fs-4"><a href="#">포인트 충전내역</a></li>
                <li class="my-5 fs-4"><a href="userReportList">신고내역</a></li>
                <li class="my-5 fs-4"><a href="blockList">차단목록</a></li>

            </ul>
        </div>
        <div class="col-md-1 d-none d-md-block my-5" style="margin-left: -50px;">
            <div style="border-left: 1px solid #616161; height: 80vh;"></div>
        </div>
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">신고내역</div>
              <br>
              
              <div class="row text-center align-items-center border-top border-bottom py-3">
                <div class="col-2">번호</div>
                <div class="col-2">신고대상</div>
                <div class="col-3">신고사유</div>
                <div class="col-3">신고일</div>
                <div class="col-2">신고처리</div>
            </div>
            
            
            <c:forEach var="r" items="${userReportList}">
            <div class="row align-items-center text-center py-3"> 
                <div class="col-2">${r.reportNo}</div>
                <div class="col-2">${r.reportAttacker}</div>
                <div class="col-3">${r.reportContent}</div>
                <div class="col-3">${r.reportRegDate}</div>
                <div class="col-2">${r.reportProcess}</div>
            </div>
             </c:forEach>
          
              
       </div>
</div>
</div>
       <div class="text-center">
        페이지네이션 부분
       </div>
 





       
  

<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>