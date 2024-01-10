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
        color:#fff;
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
             <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="noticeList" class="textColor" style="color:#C93C3C">공지관리</a></li>
            <li class="my-5"><a href="adminNormalInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제요청</a></li>
            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
          </ul>
        </div>  
        
        <div class="col">
       
          
      <div class="row my-5">
      	<div class="col">
      		<input type="button" value="일반공지" class="btn" id="normalNoticeShow" style="background-color: #3DB78B; color : white;">
      		<input type="button" value="사업공지" class="btn" id="businessNoticeShow" style="background-color: #3DB78B; color : white;">
      	</div>
      	<div class="col-auto">
              <input type="button" value="등록하기" class="btn" style="background-color: #3DB78B; color : white;" onclick="location.href='noticeWrite'">
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
	<div class="text-center my-3">
  		공지 작성이 없습니다.
  </div>
  </c:if>
  
  
  
  <c:if test="${not empty nList}">
    <c:forEach var="n" items="${nList}">
    	<div class="row text-center py-3 noticeRow" data-type="normal" data-row="${n.noticeNo}" style="cursor:pointer;">
      			<div class="col-2">${n.noticeNo}</div>
      			<div class="col-4">${n.noticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${n.noticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-3">
      		<input type="button" value="수정" class="btn noticeUpdateBtn" data-type="normal" data-no="${n.noticeNo}" style="background-color:#FA9884;">
      		<input type="button" value="삭제" class="btn mx-1 noticeDeleteBtn" style="background-color:#C93C3C ;">
    		</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow" data-content="${n.noticeNo}">
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
						      <a class="page-link" href="noticeList?pageNum=${ startPage - PG }">Pre</a>
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
						    		<a class="page-link" href="noticeList?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
				
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="noticeList?pageNum=${ startPage + PG }">Next</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
  		</c:if>
      </div>
  </div>
  			
			 	
  
  <div class="row d-none" id="businessNoticeRow">
      <div class="col">
      
      
        <div class="row">
          <div class="col d-flex align-items-center">
            <h2 class="fs-3 fw-bold my-5">사업 공지관리</h2>
            </div>
          </div>

    
     <div class="row text-center border-bottom border-top py-3">
	      <div class="col-2">번호</div>
	      <div class="col-4">제목</div>
	      <div class="col-3">등록일</div>
	      <div class="col-3">삭제</div>
    </div>

	  <c:if test="${empty bList}"> 
		<div class="text-center my-3">
	  		공지 작성이 없습니다.
	  </div>
	  </c:if>

 
  <c:if test="${not empty bList}">
    <c:forEach var="b" items="${bList}">
    	<div class="row text-center py-3 noticeRow" data-type="business" data-row="${b.businessNoticeNo}" style="cursor:pointer;">
      			<div class="col-2">${b.businessNoticeNo}</div>
      			<div class="col-4">${b.businessNoticeTitle}</div>
      			<div class="col-3"><fmt:formatDate value="${b.businessNoticeRegDate}" pattern="yyyy-MM-dd" /></div>
      			<div class="col-3">
      		<input type="button" value="수정" class="btn noticeUpdateBtn" data-type="business" data-no="${b.businessNoticeNo}" style="background-color:#FA9884;">
      		<input type="button" value="삭제" class="btn noticeDeleteBtn mx-1" style="background-color:#C93C3C ;">
    		</div>
    	</div>
    <div class="row p-5 border-bottom d-none noticeContentRow" data-content="${b.businessNoticeNo}">
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
	 </div>	
	</div>
</div>	  <!-- container end -->

  <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
  <script>
  	
  	$(document).on("click",".noticeRow",function(e){
  						
  			
  		
  		if($(e.target).hasClass("noticeUpdateBtn") || $(e.target).hasClass("noticeDeleteBtn") ){
			return;
  		}
	
	  		if ($(this).next().is(":visible")){
  	  			
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
  	
  	$(".noticeDeleteBtn").on('click',function(){
  		
  		if(confirm("공지를 삭제하시겠습니까?")){
  	  		
  			let type = $(this).parent().parent().attr("data-type");
  	  		
  	  		let noticeNo = $(this).parent().parent().attr("data-row");
  	  		
  	  		
  	  		let url = "";
  	  		if(type == 'normal'){
  	  			url = "/app/noticeDelete?noticeNo=" + noticeNo;
  	  		} else {
  	  			url = "/app/businessNoticeDelete?businessNoticeNo=" + noticeNo;
  	  		}
  	  		
  	  	  	$.ajax({
  	  	  		
  	  	  		url : url, 
  	  	  		type : "post",
  	  	  		dataType : "json",
  	  	  		success : function(resData){
  	  	  			
  	  	  			$('[data-row="' + noticeNo + '"]').remove();
  	  	  			
  	  	  		$('[data-content="' + noticeNo + '"]').remove();
  	  	  			
  	 

  	  	  		}, error:function(){
  	  	  			
  	  	  		}
  	  	  		
  	  	  		
  	  	  	});
  		} 

  	});
  	
  	
	$(".noticeUpdateBtn").on('click',function(){
  		
  	  		let type = $(this).attr("data-type");
  	  		let noticeNo = $(this).attr("data-no");
  	  		

  	  		if(type == 'normal'){
  	  			location.href='noticeUpdate?noticeNo=' + noticeNo + '&noticeType=' + type;
  	  					
  	  		} else {
  	  			location.href='businessNoticeUpdate?businessNoticeNo=' + noticeNo + '&businessNoticeType=' + type;
  	  			
  	  		}
  		
  	});
  	

  
  	
  	
  	
  
  </script>
</body>
</html>