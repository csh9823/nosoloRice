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
  <style>
      .btn {
        background-color: #FA9884;
      }
      
      .noticeRow:hover {
      
       	background-color : #FFE5CA;
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
  	<%@ include file="../temple/header/businessMenubar.jsp" %>
  	<div class="col p-5" style="height:100vh; overflow: auto;">
  	

  
  <div class="row">
      <div class="col">
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold mb-4">사업 공지사항</h2>
            <div class="col"></div> <!-- 공간 확보를 위한 비어있는 컬럼 -->
            <div class="col-auto">
              
            </div>
          </div>
      </div>
    </div>
  </div>
    
     <div class="row text-center border-bottom border-top py-3">
      <div class="col-1">번호</div>
      <div class="col-6">제목</div>
      <div class="col-3">등록일</div>
      <div class="col-2">작성자</div>
    </div>

  <c:if test="${empty bList}"> 
	<div class="text-center">
  		공지 작성이 없습니다.
  </div>
  </c:if>

 
  <c:if test="${not empty bList}">
    <c:forEach var="b" items="${bList}">
    	<div class="row text-center py-3 noticeRow" style="cursor:pointer;">
      			<div class="col-1">${b.businessNoticeNo}</div>
      			<div class="col-6">${b.businessNoticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${b.businessNoticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-2">관리자</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow">
    	<div class="col">
    		${b.businessNoticeContent}
    	</div>
    </div>
    </c:forEach>
  </c:if>
 
 					
 					<c:if test="${not empty bList}">
  	 <div class="row my-5">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					
					  	<c:if test="${ bstartPage > bPG }">
						    <li class="page-item">
						      <a class="page-link" href="noticeList?pageNum=${ bstartPage - bPG }">Pre</a>
						    </li>
					    </c:if>
							
					    <c:forEach var="i" begin="${bstartPage}" end="${bendPage}">
			   			 
					    	<c:if test="${i == bcurrentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != bcurrentPage }">
						    	<li class="page-item">
						    		<a class="page-link" href="noticeList?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>	    
				
						<c:if test="${ bendPage < bpageCount }">
						    <li class="page-item">
						      <a class="page-link" href="noticeList?pageNum=${ bstartPage + bPG }">Next</a>
						    </li>
					  	</c:if>
					  </ul>
						</nav>
					</div>
				</div>
		</c:if>		
  	</div>	
  </div>				
	</div>  <!-- container end -->

  
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