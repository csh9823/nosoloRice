<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="resources/js/jquery-3.2.1.min.js"></script>
  <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
  <script src="resources/js/summernote-lite.js"></script>
  <script src="resources/js/summernote-ko-KR.js"></script>
  <script src="resources//js/summerNote.js"></script>
  <link rel="stylesheet" href="resources/js/summernote-lite.css">
  <style>
    .btn {
      background-color: #FA9884;
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
      <div class="row">
        <div class="col-md-3">
          <ul class="my-3 fs-5">
                <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="userInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="#" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="#" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제 요청</a></li>
            <li class="my-5"><a href="businessList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="#" class="textColor">매출현황</a></li>
            <li class="my-5"><a href="noticeWrite" class="textColor">공지작성</a></li>
          </ul>
        </div>     
       
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">리뷰삭제 요청</div>
              <br>
              <div class="row text-center align-items-center border-top border-bottom py-3">
                <div class="col-2">번호</div>
                <div class="col-2">업체명</div>
                <div class="col-3">사업자 아이디</div>
                <div class="col-2">리뷰번호</div>
                <div class="col-3">요청일</div>
            </div>
  
  			
  	   <div class="row align-items-center text-center py-3" style="cursor:pointer;">
    <c:if test="${not empty adminReviewList}">
        <c:forEach var="r" items="${adminReviewList}">
            <div class="col-2 my-3">${r.reviewNo}</div>
            <div class="col-2 my-3"></div>
            <div class="col-3 my-3">${r.businessId}</div>
            <div class="col-2 my-3">${r.bookingOkNo}</div>
            <div class="col-3 my-3"></div> 
            <div class="image-wrapper justify-content-center">
            </div>
        </c:forEach>
    </c:if>	
	</div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
			</div>
		</div>
	</div>
</div>

    <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    
    <script>
   
    	
    	$("#noticeWrite").on("submit",function(e){
    		
    		
    			
    		let content = $(".note-editable").html();
    		console.log(content);
    		$("#noticeContent").val(content);
    		
    		console.log($("#noticeContent").val());
    		
    		if(!$("input[name=noticeType]").is(":checked")){
    			
    			alert("버튼 선택해주세요");
    			return false;
    			
    		}
    	});

    	
    	
    
    
    </script>
    
</body>
</html>