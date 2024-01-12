<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
      color : white;
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
    
    .note-editable img {
  max-width: 100%; /* 이미지 최대 너비 설정 */
  height: auto; /* 이미지 높이 자동 조절 */
}
    .note-editable {
    
    text-align : left;
    }
  
</style>
</head>
<body>
	
  <div class="container">
    <div class="row">
        <div class="col-md-3">
          <ul class="my-3 fs-5">
            <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
            <li class="my-5"><a href="adminNormalInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor" style="color:#C93C3C">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제요청</a></li>
            <li class="my-5"><a href="businessList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="businessSales" class="textColor">매출현황</a></li>
            <li class="my-5"><input type="button" class="btn" value="로그아웃" onclick="location.href='logout'">
          </ul>
        </div> 
         
        <div class="col p-5">
        	<div class="my-3 fs-2 fw-bold" style="color: #C93C3C">문의상세</div>
        	<div class="row py-4 fs-5 border-bottom">
        		<div class="col-1">
					     제 목   
        		</div>
        		<div class="col">
        				${businessInquiry.businessTitle}
        		</div>
        		
        		<div class="col-1">
        			 번호
        		</div>
        		
        		<div class="col">
        			${businessInquiry.businessInquiryNo}
        		</div>
        	</div>
        	
        	<div class="row py-4 fs-5 border-bottom">
        	
        		<div class="col-auto">
					     작성자
        		</div>
        		
        		<div class="col">
        				${businessInquiry.businessId}
        		</div>
        		
        		<div class="col-auto fs-5">
        				작성일 
        		</div>

        		<div class="col fs-5">
        			<fmt:formatDate value="${businessInquiry.businessInquiryRegDate}" pattern="yyyy-MM-dd" />
        		</div>
        			
        	</div>
        	<div class="row py-4 fs-5 border-bottom">
        		<div class="col-auto">
					      내용
        		</div>
        		<div class="col fs-5" style="min-height:300px;">
					<pre>${businessInquiry.businessContent}</pre> 
					<br>
					<c:if test="${not empty businessInquiry.businessPicture}">
						<img src="resources/upload/${businessInquiry.businessPicture}" style="max-width:100%;">
					</c:if>    		
        		</div>
        	</div>
        	
        	<div class="row py-4 fs-5">
        		<div class="col text-end">
					<input type="button" value="답변하기" class="btn" id="answerBtn">
        		</div>
        	</div>
        	
        	<form action="answerInquiryProcess" name="answerForm" id="answerForm" method="post">
        	<input type="hidden" value="${businessInquiry.businessInquiryNo}" id="inquiryNo" name="userInquiryNo">
        	<div class="row" id="answerRow">
        		<div class="form-group d-flex align-items-center justify-content-end">
				    <textarea name="inquiryComment" id="answerContent" class="form-control mx-2" rows="4" style="resize:none; flex: 1;"></textarea>
				    <div class="ml-2">
				        <input type="submit" value="답변완료" class="btn" id="submitBtn" style="height:100px; background-color:#3DB78B">
				        <input type="button" value="취소하기" class="btn" id="cancelBtn" style="height:100px; background-color:#C93C3C;">
				    </div>
				</div>
        	</div>
        	</form>

        </div>
	</div>
</div>
    <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    
    <script>
    
    $("#answerRow").hide();
    
    $("#answerBtn").on('click',function(){
    	
    	$("#answerBtn").hide();
    	
    	$("#answerRow").slideDown(300);
	
    });
    
    $("#answerForm").on('submit',function(){   	
    	if($("#answerContent").val().length == 0){
    		
    		alert("내용을 작성해주세요.");
    		return false;
    	}
    });
    
  
    $("#cancelBtn").on('click',function(){
    	
    	
    	$("#answerRow").slideUp(300);
    	
    	setTimeout(function(){
    		
    		$("#answerContent").val("");
    		
    	$("#answerBtn").show();

		}, 300);	

    });
    
    </script>
    
</body>
</html>