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
    
    .reportRow:hover {
      
       	background-color : #FFE5CA;
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
            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
          </ul>
        </div>     
           
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">신고내역</div>
              <br>
              
              <div class="row text-center align-items-center border-top border-bottom py-3">
                <div class="col-1">번호</div>
               	<div class="col-2">신고자아이디</div>
                <div class="col-2">신고대상</div>
                <div class="col-3">신고내용</div>
                <div class="col-3">신고일</div>
                <div class="col-1">사진</div>
            </div>
            
            
				 <c:forEach var="r" items="${adminReportList}">
				    <div class="row align-items-center text-center py-3 reportRow" style="cursor:pointer;">
				        <div class="col-1">${r.reportNo}</div>
				        <div class="col-2">${r.reportReporter}</div>
				        <div class="col-2">${r.reportAttacker}</div>
				        <div class="col-3">
				        	<span class="truncate-text" data-maxlength="25">
				        ${r.reportContent}</span>
				        </div>
				        	<div class="col-3">
				        	<fmt:formatDate value="${r.reportRegDate}" pattern="yyyy-MM-dd" />
				        	</div>
				        <div class="col-1"><input type="button" value="보기" class="viewBtn" data-toggle="modal" data-target="#ReportModal_${r.reportNo}"></div>
				        <!-- 모달 템플릿 -->
				        <div class="modal" id="ReportModal_${r.reportNo}">
				            <div class="modal-dialog">
				                <div class="modal-content">
				                    <!-- 모달 헤더 -->
				                    <div class="modal-header">
				                        <h5 class="modal-title">증거 사진</h5>
				                        <button type="button" class="close btn" data-dismiss="modal">&times;</button>
				                    </div>
				                    <!-- 모달 바디 - 이미지 표시 -->
				                    <div class="modal-body">
				                        <img src="resources/upload/${r.reportPicture}" class="img-fluid" id="modalImage_${r.reportNo}" alt="증거 사진"/>
				                        <!-- 이미지가 없을 경우 대체 내용 -->
				                        <p class="noImageText" style="display: none;">이미지가 없습니다.</p>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				    
				    <div class="row border-bottom reportContentRow d-none">
				    	<div class="col p-5">
				    		${r.reportContent}
				    </div>
				    </div>
				</c:forEach>
         </div>     
       </div>
	</div>
</div>

    <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
   
    	//라디오 버튼 
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
    	
    	$(document).ready(function(){
    	    // 버튼 클릭 시 모달 열기
    	    $("#viewBtn").click(function(){
    	        $('#ReportModal').modal('show');
    	    });
    	    
    	    // 모달 닫기 버튼 클릭 시
    	    $(".close").click(function(){
    	        $('#ReportModal').modal('hide');
    	    });
    	});
    	
    	//content 글자 수
    	 $(document).ready(function() {
    	        $('.truncate-text').each(function() {
    	            const maxLength = $(this).data('maxlength');
    	            const text = $(this).text();

    	            if (text.length > maxLength) {
    	                const truncatedText = text.substring(0, maxLength) + '...';
    	                $(this).text(truncatedText);
    	            }
    	        });
    	    });
    	
    		$(document).on("click",".reportRow",function(){
    	  		
    	 		
    	  		if($(this).next().is(":visible")){
    	  			
    	  		$(this).next().addClass("d-none");
    	  	} else {
    	  		$(".reportContentRow").addClass("d-none");
    	  		$(this).next().removeClass("d-none");
    	  		
    	  	}
    	  	});

    
    </script>
    
</body>
</html>