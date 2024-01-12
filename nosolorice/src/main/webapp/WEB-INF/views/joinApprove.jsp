<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.joinApproveRow:hover {
		cursor:pointer;
		background-color: #f0f0f0;
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
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	
	$(".joinApproveRow").on("click", function(){
		if($(this).next().is(":visible")){
			$(this).next().addClass("d-none");
		} else {
			$(".joinApproveContent").addClass("d-none");
			$(this).next().removeClass("d-none");	
		}
	});
	
	$(".joinApproveBtn").on("click", function(){
		let businessNumber = $(this).attr("data-id");
		let no = $(this).attr("data-no");
		let btn = $(this);
		console.log(no);
		$.ajax({
			url : "joinApproveProcess.ajax",
			type : "post",
			dataType : "json",
			data : "businessNumber=" + businessNumber + "&no=" + no,
			success : function(resData){
				if(resData.result == 'ok'){
					btn.parent().parent().parent().prev().remove();
					btn.parent().parent().parent().remove();
					console.log("통신 성공");
				}
			}
		});
	});
	
	$(".joinRejectBtn").on("click", function(){
		let businessNumber = $(this).attr("data-id");
		let no = $(this).attr("data-no");
		let btn = $(this);
		console.log(no);
		$.ajax({
			url : "joinApproveDeleteProcess.ajax",
			type : "post",
			dataType : "json",
			data : "businessNumber=" + businessNumber + "&no=" + no,
			success : function(resData){
				if(resData.result == 'delete'){
					btn.parent().parent().parent().prev().remove();
					btn.parent().parent().parent().remove();
					console.log("통신 성공");
				}
			}
		});
	});
	
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		
			<div class="col-md-3">
	          <ul class="my-3 fs-5">
	             <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
	            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
	            <li class="my-5"><a href="adminNormalInquiryList" class="textColor">일반회원 문의</a></li>
	            <li class="my-5"><a href="adminBusinessInquiryList" class="textColor">사업자회원 문의</a></li>
	            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
	            <li class="my-5"><a href="joinApprove" class="textColor" style="color:#C93C3C">가입승인</a></li>
	            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제요청</a></li>
	            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
	            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
	            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
	            <li class="my-5"><input type="button" class="btn" value="로그아웃" onclick="location.href='logout'"></li>
	          </ul>
	        </div>  
		
			<div class="col">
				<!-- 여기서부터 작업 시작 -->
				
				<div class="row">
					<div class="col bg-white" style="min-height:100vh;">
					
						<div class="row mt-5">
							<div class="col">
								<span class="fw-bold fs-2 text-danger">가입승인</span>
							</div>
						</div>
						
						<div class="row mt-3 text-center border-top border-bottom border-secondary py-3">
							<div class="col-2">
								<span class="fs-5">번호</span>
							</div>
							<div class="col">
								<span class="fs-5">대표자명</span>
								
							</div>
							<div class="col">
								<span class="fs-5">상호명</span>
							</div>
							<div class="col">
								<span class="fs-5">가입일</span>
							</div>
						</div>
						
						<c:if test="${not empty jList}">
						<!-- 반복문 시작 -->
						<c:forEach var="j" items="${jList}">
						<div class="row text-center joinApproveRow border-bottom py-3">
							<div class="col-2">
								<span class="fs-5">${j.getJoinApproveNo()}</span>
							</div>
							<div class="col">
								<span class="fs-5">${j.getName()}</span>
								
							</div>
							<div class="col">
								<span class="fs-5">${j.getBusinessName()}</span>
							</div>
							<div class="col">
								<span class="fs-5">
									<fmt:formatDate value="${j.getRegDate()}" pattern="yyyy-MM-dd" />								
								</span>
							</div>
						</div>
						
						<!-- 본문내용출력 시작 -->
						<div class="row joinApproveContent p-5 border-bottom d-none">
							<div class="col me-5">
								<table class="table">
									<tr class="row py-2">
										<td class="col-3 fs-5">사업자 등록번호</td>
										<td class="col">${j.getBusinessNumber()}</td>
									</tr>					
									<tr class="row py-2">
										<td class="col-3  fs-5">사업장 주소</td>
										<td class="col">${j.getAddress1()}  ${j.getAddress2()}</td>
									</tr>					
									<tr class="row py-2">
										<td class="col-3  fs-5">대표자 휴대폰</td>
										<td class="col">${j.getMobile()}</td>
									</tr>					
									<tr class="row py-2">
										<td class="col-3  fs-5">사업장 전화번호</td>
										<td class="col">${j.getPhone()}</td>
									</tr>					
									<tr class="row py-2">
										<td class="col-3  fs-5">이메일</td>
										<td class="col">${j.getEmail()}</td>
									</tr>					
								</table>
							</div>
							<div class="col-auto text-center">
								<p>사업자등록증 사본</p>
								<img src="resources/upload/${j.getBusinessPicture()}" style="width : 200px; height : 265px;">
							</div>
							<div class="row pb-5">
							<div class="col text-center">
								<input type="button" value="거절" class="btn btn-danger mx-2 joinRejectBtn" data-no="${j.getJoinApproveNo()}" data-id="${j.getBusinessNumber()}" style="width : 150px; height : 50px;">
								<input type="button" value="승인" class="btn btn-success mx-2 joinApproveBtn" data-no="${j.getJoinApproveNo()}" data-id="${j.getBusinessNumber()}" style="width : 150px; height : 50px;">
							</div>
						</div>
						</div>
						<!-- 본문내용출력 끝 -->

						</c:forEach>
						<!-- 반복문 끝-->
						
						<!-- 페이지네이션 시작  -->
						<div class="row my-5">
							<div class="col">
								<nav aria-label="Page navigation">
								  <ul class="pagination justify-content-center">
			
								  	<c:if test="${ startPage > pageGroup }">
									    <li class="page-item">
									      <a class="page-link" href="joinApprove?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="joinApprove?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="joinApprove?pageNum=${ startPage + pageGroup }">다음</a>
									    </li>
								  	</c:if>
								  </ul>
								</nav>
							</div>
						</div>
						<!-- 페이지네이션 끝  -->
						</c:if>
						<c:if test="${empty jList}">
							<div class="row mx-2 text-center border-bottom py-3">
								<div class="col">
									가입 승인 신청내역이 없습니다
								</div>
							</div>
						</c:if>
						
					</div>
				</div>
				
				<!-- 여기까지 작업 끝 -->
			</div>
		</div>
	</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>