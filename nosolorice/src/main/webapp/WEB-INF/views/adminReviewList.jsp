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
<link
	href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>
<script src="resources//js/summerNote.js"></script>
<link rel="stylesheet" href="resources/js/summernote-lite.css">
<style>
.btn {
	background-color: #FA9884;
	color: #fff;
}

ul {
	list-style: none;
}

.textColor {
	text-decoration: none;
	color: #616161;
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

.reviewRow:hover {
        background-color: #FFE5CA;
    }
</style>
</head>
<body>

	<input type="hidden" id="cp" value="${currentPage}">

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
			            <li class="my-5"><a href="adminReviewList" class="textColor" style="color:#C93C3C">리뷰삭제요청</a></li>
			            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
			            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
			            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
			            <li class="my-5"><input type="button" class="btn" value="로그아웃" onclick="location.href='logout'"></li>
					</ul>
				</div>

				<div class="col mt-5">
					<div class="mt-3 fs-2 fw-bold" style="color: #C93C3C">리뷰삭제 요청</div>
					<br>
					<div class="row text-center align-items-center border-top border-bottom py-3">
						<div class="col-2">번호</div>
						<div class="col-2">업체명</div>
						<div class="col-3">사업자 아이디</div>
						<div class="col-2">리뷰번호</div>
						<div class="col-3">요청일</div>
					</div>

					<c:if test="${empty adminReviewList }">
						<span class="d-flex justify-content-center align-items-center"
							style="height: 10vh;">요청 글이 없습니다.</span>
					</c:if>
					<div class="row">
						<div class="col" id="reviewCol">

							<c:if test="${not empty adminReviewList}">
								<c:forEach var="r" items="${adminReviewList}">
									<div class="row align-items-center text-center py-3 reviewRow"
										style="cursor: pointer;" data-no="${r.reviewNo}"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										<div class="col-2 my-3 reviewNo">${r.reviewNo}</div>
										<div class="col-2 my-3 businessName">${r.businessName}</div>
										<div class="col-3 my-3 businessId">${r.businessId}</div>
										<div class="col-2 my-3 bookingOkNo">${r.bookingOkNo}</div>
										<div class="col-3 my-3 reviewRegDate">
										<span><fmt:formatDate value="${r.reviewRequestRegDate}" pattern="yyyy-MM-dd a KK:mm:ss" /></span>
										</div>
										<input type="hidden" class="modalRegDate" value="${r.regDate}">
										<input type="hidden" class="starScore" value="${r.reviewScore}"> 
										<input type="hidden" class="reviewContent" value="${r.reviewContent}"> 
										<input type="hidden" class="reviewPicture" value="${r.reviewPicture}"> 
										<input type="hidden" class="normalId" value="${r.normalId}">
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">
										삭제요청 리뷰 - <span id="shopName">가게이름</span>
									</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="overflow-x: hidden;">

									<div class="row pb-3">
										<div class="col-auto" id="profile"></div>
										<div
											class="col ps-0 d-flex flex-column justify-content-center ">

											<div class="row">
												<div class="col fs-3">
													<span id="nickName">닉네임</span>
												</div>
											</div>
											<div class="row">
												<div class="col">
													<span id="reviewRegDate" style="font-size:12px;">날짜</span>

												</div>
												<div class="col text-end">
													<span id="starScore" class="fs-6">star score</span>
												</div>
											</div>
										</div>
									</div>
									<div class="row p-3">
										<div class="col">
											<span id="reviewContent">리뷰내용</span>
										</div>
									</div>
									<div class="row p-3">
										<div class="col" id="reviewPicture"></div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn" data-bs-dismiss="modal"
										id="DeleteCancel">취소</button>
									<button type="button" class="btn" id="reviewDeleteBtn">삭제하기</button>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${not empty adminReviewList  }">
						<div class="row my-5">
							<div class="col" id="pageCol">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center">

										<c:if test="${ startPage > PG }">
											<li class="page-item"><a class="page-link"
												href="adminReviewList?pageNum=${ startPage - PG }">Pre</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">

											<c:if test="${i == currentPage }">
												<li class="page-item active" aria-current="page"><span
													class="page-link">${i}</span></li>
											</c:if>
											<c:if test="${i != currentPage }">
												<li class="page-item"><a class="page-link"
													href="adminReviewList?pageNum=${i}">${i}</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${ endPage < pageCount }">
											<li class="page-item"><a class="page-link"
												href="adminReviewList?pageNum=${ startPage + PG }">Next</a>
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
	</div> <!-- container end -->


	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>

	<script>
    	
    	let reviewNo = 0;
    	let businessId = "";
    	
    	$(".reviewRow").on('click',function(){
    		
    		reviewNo = $(this).find('.reviewNo').text().trim();
    		
    		businessId = $(this).find('.businessId').text().trim();
    		
    		console.log(reviewNo);
    		
    		let normalId = $(this).find('.normalId').val();
    		
    		let reviewRegDate = $(this).find('.modalRegDate').val();
    		
    		console.log(normalId);
    		
    		let businessName = $(this).find('.businessName').text().trim();
    		
    		let regDate = new Date(reviewRegDate);
    		
    		let formatDate = " ";
    		
    		if(regDate.getHours() < 13){
    			formatDate =  regDate.getFullYear() + '-' + String(regDate.getMonth() + 1).padStart(2,'0') + '-' + 
    			 
        		String(regDate.getDate()).padStart(2,'0') + " AM " + 
    				String(regDate.getHours()).padStart(2,'0') + ":" + 
    				String(regDate.getMinutes()).padStart(2,'0') + ":" + 
    				String(regDate.getSeconds()).padStart(2,'0');
    				
    		} else {
    			formatDate = regDate.getFullYear() + '-' + String(regDate.getMonth() + 1).padStart(2,'0') + '-' + 
    			 
        		String(regDate.getDate()).padStart(2,'0') + " PM " + 
   				String(regDate.getHours()-12).padStart(2,'0') + ":" + 
				String(regDate.getMinutes()).padStart(2,'0') + ":" + 
				String(regDate.getSeconds()).padStart(2,'0');
    		}
    		let starScore = $(this).find('.starScore').val();
    			
    		let reviewContent = $(this).find('.reviewContent').val();
    			
    		let reviewPicture = 	$(this).find('.reviewPicture').val();

    		
    		if(starScore ==5){
    			
    			starScore = `
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    			`;
    			
    		} else if(starScore ==4){
    			
    			starScore = `
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star"></i>
    			`;
    		} else if(starScore ==3){
    			
    			starScore = `
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    			`;
    		} else if(starScore ==2){
    			
    			starScore = `
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    			`;
    		} else if(starScore ==1){
    			
    			starScore = `
    				<i class="bi bi-star-fill text-danger"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    				<i class="bi bi-star"></i>
    			`;
    		}
    		
    		$.ajax({
    			
    			
    			url : "/app/getReviewNormalUser",
    			data : "id=" + normalId,
    			type : "post",
    			dataType : "json",
    			
    			
    			success: function(resData){
    				
    				console.log(resData);
    				
    			let nickName = resData.id.nickName;
    			
    			let profile = resData.id.profile;
    			
      		  $("#reviewRegDate").text(formatDate);
   		   
    		  $("#shopName").text(businessName);
    		   
    		  $("#starScore").html(starScore);
    		   
    		  $("#reviewContent").text(reviewContent);
    		  
    		  if(reviewPicture.length > 0){
    		  $("#reviewPicture").empty().append(`<img src= 'resources/upload/` + reviewPicture + `' style="max-width: 100%;">`);
    		  }
    		  $("#profile").empty().append(`<img src='resources/upload/` + profile + `' class="rounded-circle" style="width:100px;">`);
    		  
    		  $("#nickName").text(nickName);
    			
    				
    			}, error : function(err){
    				
    				console.log("통신에러", err);
    			}
    			
    		});
    		   

    	});
    	
    	
    	$(document).on('click',"#reviewDeleteBtn",function(){
	
    		let pageNum = $("#cp").val();
    		
    		if(confirm("리뷰를 삭제하시겠습니까?")){
				
				
    			$.ajax({
        			
        			url : "/app/reviewDeleteProcess",
        			type : "post",
        			data : "reviewNo=" + reviewNo + "&pageNum=" + pageNum + "&businessId=" + businessId,
        			dataType : "json",			
        			success : function(resData){
		
        				$("#DeleteCancel").click();
							
        				location.href='adminReviewList?pageNum=' + pageNum;
        				
        			}, error : function(error){
        				
        			}
        			
        		});	
				
			} 

    	});
    	
    	
    	

    
    </script>

</body>
</html>