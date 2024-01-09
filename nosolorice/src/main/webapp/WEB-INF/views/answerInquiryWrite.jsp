<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    a{
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
      <div class="row">
        <div class="col-md-3">
          <ul class="my-3">
            <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="adminNormalInquiryList">일반회원 문의</a></li>
            <li class="my-5"><a href="adminBusinessInquiryList">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList">신고내역</a></li>
            <li class="my-5"><a href="joinApprove">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList">리뷰삭제 요청</a></li>
            <li class="my-5"><a href="businessDeleteList">업체삭제</a></li>
            <li class="my-5"><a href="deniedList">회원정지</a></li>
            <li class="my-5"><a href="businessSales">매출현황</a></li>
            <li class="my-5"><a href="noticeList">공지작성</a></li>
          </ul>
        </div>     
        <div class="col">
        <div class="row">
        	<div class="col">
      		<h2 class="fs-3 fw-bold my-5">문의답변</h2>
     	</div>
     	<div class="col-auto d-flex align-items-center">
     	 <input type="button" value="목록보기" class="btn" onclick="location.href='noticeList?pageNum=${pageNum}'">
     	</div>
       </div>
  <div class="row align-items-center">
    <div class="col text-end">
      <form action="answerInquiryProcess" id="answerInquiry" name="answerInquiry" method="post">
      		<input type="hidden" name="userInquiryNo" value="${UserInquiry.userInquiryNo}">
			<input type="hidden" name="pageNum" value="${pageNum}" />
        <div class="row my-5">
          <div class="col-md-12">
            <input type="radio" name="answerType" id="normal" class="radio" value="normal"> <%-- ${notice.noticeType == 'normal' ? 'checked' : ''} --%>
            <label for="normal">일반 1:1답변</label> &nbsp; &nbsp;
            <input type="radio" name="answerType" id="business" class="radio" value="business"> <%-- ${businessNotice.businessNoticeType == 'business' ? 'checked' : ''} --%>
            <label for="business">업체 1:1답변</label>
          </div>
        </div>
        <div class="row my-3">
          <div class="col-md-12">
            <input type="text" class="form-control" id="userInquiryTitle" name="userInquiryTitle" placeholder="제목을 입력해 주세요" value="${UserInquiry.inquiryTitle}"/>
          </div>
        </div>
        <div class="row my-5">
          <div class="col">
          	<input type="hidden" name="noticeContent" id="noticeContent">
          </div>  
        </div>
        <div class="row">
          <div class="col text-end">
            <input type="submit" value="답변하기" class="btn">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
</div>
</div>

    <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    
    <script>
   
    	
    $("#answerInquiry").on("submit",function(e){
    	
        let content = $(".note-editable").html();
        
    
        
        $("#noticeContent").val(content);
        
        if (!$("input[name=noticeType]").is(":checked")) {
            alert("버튼을 선택해주세요");
            return false;        
        }
        
        if ($("#noticeTitle").val().length <= 0) {
            alert("작성 제목을 입력해주세요");
            $("#noticeTitle").focus();
            return false;
        }
        
        if ($("#summernote").val().length <= 0) {
            alert("작성 내용을 입력해주세요");
            $("#noticeContent").focus();
            return false;
        }
        
    });
    
    
    </script>
    
</body>
</html>