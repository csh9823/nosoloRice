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
       .pagination .page-item.active .page-link {
    background-color: #FA9884;
    border-color: #FA9884;
    color: #fff; 
	}

	.pagination .page-link {
    color: #C93C3C;
	}

	.pagination .page-link:hover {
    color: #fff; 
    background-color: #C93C3C;
    border-color: #C93C3C;
	}

</style>
</head>
<body>

  <div class="container">

      <div class="row">
        <div class="col-md-3">
            <ul class="my-3">
                <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">마이페이지</li>
                <li class="my-5 fs-4"><a href="normalUserInfoUpdate?id=${sessionScope.NormalUser.normalId}">내 정보</a></li>
                <li class="my-5 fs-4"><a href="noramlUserBookingList?id=${sessionScope.NormalUser.normalId}">내 예약이력</a></li>
                <li class="my-5 fs-4"><a href="pointList?id=${sessionScope.NormalUser.normalId}">포인트 충전내역</a></li>
                <li class="my-5 fs-4"><a href="userReportList?id=${sessionScope.NormalUser.normalId}">신고내역</a></li>
                <li class="my-5 fs-4"><a href="blockList?id=${sessionScope.NormalUser.normalId}">차단목록</a></li>
				<li class="my-5 fs-4"><a href="normalUsesrSecession?id=${sessionScope.NormalUser.normalId}">탈퇴</a></li>
            </ul>
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
             
             <c:if test="${empty userReportList }">
            	<div class="py-3">신고 내역이 없습니다.</div>
            </c:if>
            
            <c:forEach var="r" items="${userReportList}">
            <div class="row align-items-center text-center py-3"> 
                <div class="col-2">${r.reportNo}</div>
                <div class="col-2">${r.reportAttacker}</div>
                <div class="col-3">${r.reportContent}</div>
                <div class="col-3"><fmt:formatDate value="${r.reportRegDate}" pattern="yyyy-MM-dd" /></div>
                <c:if test="${not empty r.deniedUnlock}">
                <div class="col-2">신고완료</div>
                </c:if>
                
                <c:if test="${empty r.deniedUnlock}">
                <div class="col-2">접수대기</div>
                </c:if>
            </div>
             </c:forEach>

          
          <c:if test="not empty ${userReportList}">
          <div class="row my-5">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					
					  	<c:if test="${ startPage > PG }">
						    <li class="page-item">
						      <a class="page-link" href="blockList?pageNum=${ startPage - PG }">Pre</a>
						    </li>
					    </c:if>
					    
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			   			 
					    	<c:if test="${i == currentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item">
						    		<a class="page-link" href="blockList?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>

						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="blockListt?pageNum=${ startPage + PG }">Next</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div> 
			</c:if>
       </div>
  </div>
</div>
	       
 

  

<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>