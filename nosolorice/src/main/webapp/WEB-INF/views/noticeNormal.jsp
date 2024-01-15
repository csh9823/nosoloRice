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
    
      body {
      font-family: 'SUITE Variable', sans-serif;
      }
      
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
                 <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">고객센터</li>
                <li class="my-5 fs-4"><a href="question" class="textColor">자주 묻는 질문</a></li>
                <li class="my-5 fs-4"><a href="userInquiry" class="textColor">1:1 문의</a></li>
                <li class="my-5 fs-4"><a href="userInquiryList" class="textColor">1:1 문의내역</a></li>
                <li class="my-5 fs-4"><a href="noticeNormal" class="textColor">공지사항</a></li>
            </ul>
        </div>
        <div class="col-md-1 d-none d-md-block my-5" style="margin-left: -50px;">
            <div style="border-left: 1px solid #CCC; height: 80vh;"></div>
        </div>
        
        
      	
      <div class="col">
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold my-5 text-danger">일반 공지사항</h2>
            <div class="col"></div> <!-- 공간 확보를 위한 비어있는 컬럼 -->
            <div class="col-auto">
            </div>
          </div>
      </div>


    <div class="row text-center border-bottom border-top py-3">
      <div class="col-1">번호</div>
      <div class="col-6">제목</div>
      <div class="col-3">등록일</div>
      <div class="col-2">작성자</div>
    </div>

  <c:if test="${empty nList}"> 
	<div class="text-center">
  		공지 작성이 없습니다.
  </div>
  </c:if>
  
  <c:if test="${not empty nList}">
    <c:forEach var="n" items="${nList}">
    	<div class="row text-center py-3 noticeRow" style="cursor:pointer;">
      			<div class="col-1">${n.noticeNo}</div>
      			<div class="col-6">${n.noticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${n.noticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-2">관리자</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow">
    	<div class="col">
    		${n.noticeContent}
    	</div>
    </div>
    </c:forEach>
  </c:if>
  
  
  					<c:if test="${not empty nList }">
  				<div class="row my-5">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					
					  	<c:if test="${ startPage > PG }">
						    <li class="page-item">
						      <a class="page-link" href="noticeNormal?pageNum=${ startPage - PG }">Pre</a>
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
						    		<a class="page-link" href="noticeNormal?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
				
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="noticeNormal?pageNum=${ startPage + PG }">Next</a>
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