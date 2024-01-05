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
            <ul class="my-3 fs-5">
                <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">마이페이지</li>
                <li class="my-5 fs-4"><a href="#">내 정보</a></li>
                <li class="my-5 fs-4"><a href="#">내 예약이력</a></li>
                <li class="my-5 fs-4"><a href="#">작성한 리뷰</a></li>
                <li class="my-5 fs-4"><a href="#">포인트 충전내역</a></li>
                <li class="my-5 fs-4"><a href="userReportList">신고내역</a></li>
                <li class="my-5 fs-4"><a href="blockList">차단목록</a></li>

            </ul>
        </div>
       
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">차단내역</div>
              <br>
              
              <div class="row text-center align-items-center border-top border-bottom py-3">
                <div class="col-3">번호</div>
                <div class="col-3">차단대상</div>
                <div class="col-3">차단일</div>
                <div class="col-3">차단해제</div>
            </div>
           <c:if test="${not empty blockList}"> 
          <c:forEach var="b" items="${blockList}">
            <div class="row align-items-center text-center">
                <div class="col-3">${b.blockHistoryNo}</div>
                <div class="col-3">${b.blockAttacker}</div>
                <div class="col-3">${b.blockDate}</div>
                <div class="col-3 py-3">
                  <input type="button" value="해제하기" style="color:#C93C3C" id="blockUnlockBtn">
                </div>    
            </div>
            </c:forEach>
           </c:if>
       </div>

	
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
  
  </div>
</div>
       
 





       
  

<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>