<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
  <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
  <script src="resources/js/summernote-lite.js"></script>
  <script src="resources/js/summernote-ko-KR.js"></script>
  <script src="resources//js/summerNote.js"></script>
  <link rel="stylesheet" href="resources/js/summernote-lite.css">
  <style>
    .btn {
      background-color: #3DB78B;
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
      <div class="row">
        <div class="col-md-3">
          <ul class="my-3 fs-5">

            <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
		    <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
            <li class="my-5"><a href="adminNormalInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제요청</a></li>
            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor" style="color:#C93C3C">회원정지</a></li>
            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
            <li class="my-5"><input type="button" class="btn" value="로그아웃" onclick="location.href='logout'" style="background-color:#FA9884; color:white;"></li>
          </ul>
        </div>     
          
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">회원정지</div>
              <br>
              
              <div class="row py-3">
  					<div class="col">
			  		<form action="#" id="idSearchForm" name="idSearchForm" method="post">
				    <div class="col-5 d-flex align-items-center">
				        <input type="text" id="searchId" name="searchId" placeholder="아이디를 입력해주세요" class="form-control">
				        <button type="submit" class="btn col-2 mx-3 searchBtn">검색</button>
				    </div>
					</form>
		  	</div>
		  </div>
		  
		  	
		  	<div class="row py-3 resultRow d-none">
				<div class="col mx-2 fs-5">
						아이디 검색결과
				</div>
			</div>
				<div class="row align-items-center justify-content-end text-end py-3 mx-2 resultRow d-none">
				  	<div class="col text-start">
				  <img style="width:50px; height:50px; border-radius: 50%;" id="searchProfileImg">
				  <span id="resultNickName" class="fs-5"></span>
				  <span class="fs-5">(</span>
				  <span id="resultId" class="fs-5"></span> 
				  <span class="fs-5">)</span>
				  </div>
				  <div class="col-auto">
				  		<select class="form-select" id="deniedReason">
				  			<option value="언어폭력">언어폭력</option>
				  			<option value="계정도용">계정도용</option>
				  			<option value="불건전행위">불건전행위</option>
				  		</select>
				  </div>
					    <div class="col-auto">
				        <button type="button" class="btn me-2 deniedBtn" data-day="10" style="background-color:#FFE5CA;">10일 정지</button>
				        <button type="button" class="btn mx-2 deniedBtn" data-day="30" style="background-color:#FA9884;">30일 정지</button>
				        <button type="button" class="btn mx-2 deniedBtn" data-day="36500" style="background-color:#C93C3C;">영구 정지</button>
				    </div>
				</div>
			
			
			<div class="row py-3 fs-5">
				<div class="col">
					정지 사용자 리스트
				</div>
			</div>

              <div class="row text-center align-items-center border-top border-bottom py-3">
                <div class="col-1">번호</div>
               	<div class="col-2">아이디</div>
                <div class="col-2">제재 사유</div>
                <div class="col-3">제재 일시</div>
                <div class="col-2">제재 결과</div>
                <div class="col-2">해제하기</div>
            </div>
            
           
            <div class="row">
            	<div class="col" id="dListCol">
            	<c:if test="${not empty deniedList}">		
            <c:forEach var="d" items="${deniedList}">
				    <div class="row align-items-center text-center py-3">
				        <div class="col-1">${d.deniedUserNo}</div>
				        <div class="col-2">${d.normalId}</div>
				        <div class="col-2">${d.deniedReason}</div>
				        <div class="col-3"><fmt:formatDate value="${d.deniedRegDate}" pattern="yyyy-MM-dd" /></div>
				        <div class="col-2">${d.resultDate()}</div>
				        <div class="col-2">
				        <form action="deleteDeniedUser" method="post" >
				        	<input type="hidden" name="deniedUserNo" value="${d.deniedUserNo}">
				        	<input type="submit" value="해제하기" class="btn unlockUser">
				  		</form>
				        </div>
				        </div>
				</c:forEach>
				</c:if>
            	</div>
            </div>			
	        		
            <c:if test="${empty deniedList }">
            
            <span class="d-flex justify-content-center align-items-center resultRow" id="emptyList" style="height: 10vh;">정지된 아이디가 없습니다.</span>
            
            </c:if>    

            		<c:if test="${not empty deniedList}">
            		 <div class="row my-5">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					
					  	<c:if test="${ startPage > PG }">
						    <li class="page-item">
						      <a class="page-link" href="deniedList?pageNum=${ startPage - PG }">Pre</a>
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
						    		<a class="page-link" href="deniedList?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
				
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="deniedList?pageNum=${ startPage + PG }">Next</a>
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

  
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script>
 
$("#idSearchForm").on('submit', function(e) {
    e.preventDefault();

    let id = $("#searchId").val();

    $.ajax({
        url: "/app/searchId",
        data: "id=" + id,
        type: "post",
        dataType: "json",
        success: function(resData) {
            if (resData.result) {
                // 성공적인 경우
                console.log(resData);

                let nickName = resData.searchUserInfo.nickName;
                let profile = resData.searchUserInfo.profile;

                $("#resultNickName").text(nickName);
                $("#resultId").text(id);
                $("#searchProfileImg").attr("src", "resources/upload/" + profile);

                $(".resultRow").each(function(i, v) {
                    $(v).removeClass("d-none");
                });
            } else {
            	
            	if($("#searchId").val().trim() == ""){
            		
            		alert("아이디를 입력해 주세요.");
            		return false;
            	}  	
                // 실패한 경우
                alert("이미 정지된 회원이거나 없는 아이디입니다.");

                $("#resultId").text("");
                $(".resultRow").each(function(i, v) {
                    $(v).addClass("d-none");
                });
                
                console.log(resData);

                // deniedList가 비어있는 경우
                if (resData.result == false) {
                    $("#emptyList").removeClass("d-none");
                }
            }
        },
        error: function() {
            console.log("통신에러");
        }
    });
});
 
 
 $(document).on("click", ".unlockUser",function(){
	 
	if(confirm("정지를 해제하시겠습니까?")){
		
		return true;
		
	} else {
		
		return false;
	}
	 
 });
 
 
 $(".deniedBtn").on("click",function(){
	 	
	 const day = $(this).attr("data-day");
	 
	 console.log(day);
	 
	
	 
	 const id = $("#resultId").text();
	 
	 const reason = $("#deniedReason").val();
	 
	 if(confirm("정지하시겠습니까?")){
		 
		
		 
		 $.ajax({
			 
			 url : "/app/addDenied",
			 data : "id=" + id + "&reason=" + reason + "&day=" + day ,
			 type : "post",
			 dataType : "json",
			 success : function(resData){
				 
				 $("#dListCol").empty();
				 
				 console.log(resData);
				 
				 $(resData.deniedList.deniedList).each(function(i,v){
					 console.log(v);

					 let regDate = new Date(v.deniedRegDate);
					 
					 let formatDate = regDate.getFullYear() + '-' + String(regDate.getMonth() + 1).padStart(2,'0') + '-' 
					 
					 + String(regDate.getDate()).padStart(2,'0');
					 
					 let mill = v.deniedUnlock / (24 * 60 * 60 * 1000);
					 const now = regDate.getTime() / (24 * 60 * 60 * 1000);
					 const result = Math.round(mill - now);
					 
					 
					 $("#dListCol").append(`<div class="row align-items-center text-center py-3">
						        <div class="col-1">` + v.deniedUserNo + `</div>
						        <div class="col-2">` + v.normalId + `</div>
						        <div class="col-2">` + v.deniedReason + ` </div>
						        <div class="col-3">` + formatDate + `</div>
						        <div class="col-2">` + (parseInt(result) > 100 ? "영구정지" : result+"일 정지") + `</div>
						        <div class="col-2">
						        <form action="deleteDeniedUser" method="post" >
					        	<input type="hidden" name="deniedUserNo" value=` + parseInt(v.deniedUserNo) + `>
					        	<input type="submit" value="해제하기" class="btn unlockUser">
					  			</form>
						        </div>
						    </div>`);
					 
				 });
				 
			 		$("#resultId").text("");
			 		
			 		$(".resultRow").each(function(i,v){
			 			$(v).addClass("d-none");
			 		});
				 
				 
			 }, error : function(){
				 console.log("통신에러");
			 }
			 
			 
		 });

		 
	 }
	
	 
 });
 

 

 
 

</script>
</body>
</html>