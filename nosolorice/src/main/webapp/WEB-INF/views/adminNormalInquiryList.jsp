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
			            <li class="my-5"><a href="adminNormalInquiryList" class="textColor"  style="color:#C93C3C">일반회원 문의</a></li>
			            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor">사업자회원 문의</a></li>
			            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
			            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
			            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제요청</a></li>
			            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
			            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
			            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
			            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
					</ul>
				</div>

				<div class="col mt-5">
					<div class="mt-3 fs-2 fw-bold" style="color: #C93C3C">1:1 답변처리</div>
					<br>
					<div
						class="row text-center align-items-center border-top border-bottom py-3">
						<div class="col-2">번호</div>
						<div class="col-2">문의구분</div>
						<div class="col-3">제목</div>
						<div class="col-2">요청아이디</div>
						<div class="col-3">요청일</div>
					</div>

					    <c:if test="${empty adminNormalInquiryList}">
       				<div class="text-center py-3">
       					문의내역이 없습니다.
       				</div>
       					</c:if> 
					<div class="row">
					
						<div class="col" id="inquiryCol">

						<c:if test="${not empty adminNormalInquiryList}">
				        <c:forEach var="i" items="${adminNormalInquiryList}">
				            <div class="col-2 my-3">${i.userInquiryNo}</div>
				            <div class="col-2 my-3">${i.inquiryDivision}</div>
				            <div class="col-3 my-3">${i.inquiryTitle}</div>
				            <div class="col-3 my-3">${i.normalId}</div>
				            <div class="col-2 my-3">${i.inquiryRegDate}</div> 
				        </c:forEach>
				    	</c:if>	
						</div>
					</div>

					<c:if test="${not empty adminNormalInquiryList}">
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
	
	
	
    	
    	
    	

    
    </script>

</body>
</html>