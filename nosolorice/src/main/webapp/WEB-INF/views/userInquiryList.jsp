<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
	.userInquiryContent img {
		max-width : 100%;
	}
	.userInquiryRow:hover {
		cursor:pointer;
		background-color: #f0f0f0;
	}
	
	    ul {
      list-style: none;
    }
    a{
      text-decoration: none;
      color : #616161;
    }
    a:active {
      color: #C93C3C ;
      
    }
    * {
      font-family: 'SUITE Variable', sans-serif;
    }

  .answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out;
  }
</style>
<script>
	$(function(){
		$(".userInquiryRow").on("click", function(){
			if($(this).next().is(":visible")){
				$(this).next().addClass("d-none");
			} else {
				$(".userInquiryContent").addClass("d-none");
				$(this).next().removeClass("d-none");	
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<!-- 여기서부터 작업 시작 -->
				
				<div class="row">
			        <div class="col-md-3">
			            <ul class="my-3">
			                 <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">고객센터</li>
			                <li class="my-5 fs-4"><a href="question">자주 묻는 질문</a></li>
			                <li class="my-5 fs-4"><a href="userInquiry">1:1 문의</a></li>
			                <li class="my-5 fs-4"><a href="userInquiryList">1:1 문의내역</a></li>
			                <li class="my-5 fs-4"><a href="noticeNormal">공지사항</a></li>
			            </ul>
			        </div>
			        <div class="col-md-1 d-none d-md-block my-5" style="margin-left: -50px;">
			            <div style="border-left: 1px solid #ccc; height: 80vh;"></div>
			        </div>
				
					<div class="col bg-white" style="min-height:100vh;">
					
						<div class="row mx-2 mt-5">
							<div class="col">
								<span class="fw-bold fs-3 text-danger">1:1 문의내역</span>
							</div>
						</div>
						
						<div class="row mx-2 mt-3 text-center border-top border-bottom border-dark py-3">
							<div class="col-2">
								<span class="fs-5">번호</span>
							</div>
							<div class="col-2">
								<span class="fs-5">문의구분</span>
								
							</div>
							<div class="col">
								<span class="fs-5">제목</span>
							</div>
							<div class="col-2">
								<span class="fs-5">등록일</span>
							</div>
							<div class="col-2">
								<span class="fs-5">처리결과</span>
							</div>
						</div>
						
						<c:if test="${not empty inquiryList}">
						<!-- 반복문 시작 -->
						<c:forEach var="i" items="${inquiryList}">
						<div class="row mx-2 text-center border-bottom py-3 userInquiryRow">
							<div class="col-2">
								<span class="fs-5">${i.getUserInquiryNo()}</span>
							</div>
							<div class="col-2">
								<span class="fs-5">${i.getInquiryDivision()}</span>
								
							</div>
							<div class="col">
								<span class="fs-5">${i.getInquiryTitle()}</span>
							</div>
							<div class="col-2">
								<span style="font-size:16px;">${i.getInquiryRegDate()}</span>
							</div>
							<div class="col-2">
								<span class="fs-5">${empty i.getInquiryComment() ? "답변대기" : "답변완료"}</span>
							</div>
						</div>
						<!-- 본문내용출력 시작 -->
						<div class="row mx-2 py-3 d-none userInquiryContent border-bottom">
							<div class="col p-5" style="min-height : 20vh;">
								<pre>${i.getInquiryContent()}</pre>
								<c:if test="${not empty i.getInquiryPicture()}">
									<img src="resources/upload/${i.getInquiryPicture()}">
								</c:if> 
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
									      <a class="page-link" href="userInquiryList?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="userInquiryList?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="userInquiryList?pageNum=${ startPage + pageGroup }">다음</a>
									    </li>
								  	</c:if>
								  </ul>
								</nav>
							</div>
						</div>
						<!-- 페이지네이션 끝  -->
						</c:if>
						<c:if test="${empty inquiryList}">
							<div class="row mx-2 text-center border-bottom py-3">
								<div class="col">
									문의 내역이 없습니다
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