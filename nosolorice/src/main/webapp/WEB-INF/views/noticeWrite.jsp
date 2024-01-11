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
      <div class="row">
        <div class="col-md-3">
          <ul class="my-3 fs-5">
            <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="adminNormalInquiryList" class="textColor" style="color:#C93C3C">일반회원 문의</a></li>
            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="#" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제 요청</a></li>
            <li class="my-5"><a href="businessList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="#" class="textColor">매출현황</a></li>
            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
          </ul>
        </div> 
         
        <div class="col">
        <div class="row">
        	<div class="col">
      		<h2 class="fs-3 fw-bold my-5">공지작성</h2>
     	</div>
     	<div class="col-auto d-flex align-items-center">
     	 <input type="button" value="목록보기" class="btn" onclick="location.href='noticeList'">
     	</div>
       </div>
  <div class="row align-items-center">
    <div class="col text-end  border-top">
      <form action="noticeWriteProcess" id="noticeWrite" name="noticeWrite" method="post" enctype="multipart/form-data">
        <div class="row my-5">
          <div class="col-md-12" style="display: flex; align-items: center;">
            <input type="radio" name="noticeType" id="normal" class="radio" value="normal">
            <label for="normal">&nbsp;&nbsp;일반 공지사항</label> &nbsp;&nbsp;&nbsp;
            <input type="radio" name="noticeType" id="business" class="radio" value="business">
            <label for="business">&nbsp;&nbsp;업체 공지사항</label>
          </div>
        </div>
        <div class="row my-3">
          <div class="col-md-12">
            <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력해 주세요"/>
          </div>
        </div>
        <div class="row my-5">
          <div class="col">
          	<input type="hidden" name="noticeContent" id="noticeContent" dir="ltr">
            <textarea id="summernote" name="editordata"></textarea>
          </div>  
        </div>
        <div class="row">
          <div class="col text-end">
            <input type="submit" value="등록하기" class="btn">
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
   
    	
    $("#noticeWrite").on("submit", function(e) {
        let content = $(".note-editable").html();
        //console.log(content);
        $("#noticeContent").val(content);
        //console.log($("#noticeContent").val());
        
        if (!$("input[name=noticeType]").is(":checked")) {
            alert("공지 버튼을 선택해주세요.");
            return false;        
        }
        
        if ($("#noticeTitle").val().length <= 0) {
            alert("작성 제목을 입력해주세요.");
            $("#noticeTitle").focus();
            return false;
        }
        
        if ($("#summernote").val().length <= 0) {
            alert("작성 내용을 입력해주세요.");
            $("#noticeContent").focus();
            return false;
        }
    });
    
    	
    	
    	

    	
    	
    
    
    </script>
    
</body>
</html>