<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
	.businessInquiryContent img {
		max-width : 100%;
	}
	.businessInquiryRow:hover {
		cursor:pointer;
		background-color: #f0f0f0;
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
<script>	
	$(function(){	
		
		$(".businessInquiryRow").on("click", function(){
			if($(this).next().is(":visible")){
				$(this).next().addClass("d-none");
				$(this).next().find(".inquiryContentRow").addClass("d-none");
				$(this).next().find(".inquiryCommentRow").addClass("d-none");				
			} else {
				$(this).next().removeClass("d-none");
				$(this).next().find(".inquiryContentRow").removeClass("d-none");
				$(this).next().find(".inquiryCommentRow").addClass("d-none");
			}
		});
		
		$(".showInquiryCommentBtn").on("click", function(){
			if($(this).val() == '답변보기'){
				$(this).val("문의보기");
				$(this).parent().parent().prev().prev().addClass("d-none");//문의글
				$(this).parent().parent().prev().removeClass("d-none");//답글
			} else {
				$(this).val("답변보기");
				$(this).parent().parent().prev().prev().removeClass("d-none");//문의글
				$(this).parent().parent().prev().addClass("d-none");//답글
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
					<%@ include file="../temple/header/businessMenubar.jsp" %>
					<div class="col bg-white">
					
						<div class="row mx-2 mt-5">
							<div class="col">
								<span class="fw-bold fs-3">1:1 문의</span>
							</div>
						</div>
						
						<div class="row mx-2 my-3">
							<div class="col">
								<a href="businessInquiry" style="text-decoration: none;">
									<span class="fs-5 text-secondary">문의하기</span>
								</a>
								<a href="businessInquiryList" style="text-decoration: none;" class="ms-5">
									<span class="fs-5 text-danger">문의내역</span>
								</a>
							</div>
						</div>
						
						<div class="row mx-2 text-center border-top border-bottom border-dark py-3">
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
						<div class="row mx-2 text-center border-bottom py-3 businessInquiryRow">
							<div class="col-2">
								<span class="fs-5">${i.getBusinessInquiryNo()}</span>
							</div>
							<div class="col-2">
								<span class="fs-5">${i.getBusinessDivision()}</span>
								
							</div>
							<div class="col" style="overflow: hidden; white-space: nowrap; text-overflow:ellipsis;">
								<span class="fs-5">${i.getBusinessTitle()}</span>
							</div>
							<div class="col-2">
								<span style="font-size:14px;"><fmt:formatDate value="${i.getBusinessInquiryRegDate()}" pattern="yyyy-MM-dd" /></span>
							</div>
							<div class="col-2">
								<span class="fs-5">${empty i.getBusinessComment() ? "답변대기" : "답변완료"}</span>
							</div>
						</div>
						
						<!-- 본문내용출력 시작 -->						
						<div class="row mx-2 py-3 d-none businessInquiryContent border-bottom">
							<div class="col">

								<div class="row inquiryContentRow">
									<div class="col p-5" style="min-height : 20vh;">
										<pre>${i.getBusinessContent()}</pre>
										<c:if test="${not empty i.getBusinessPicture()}">
											<img src="resources/upload/${i.getBusinessPicture()}">
										</c:if> 
									</div>								
								</div>
								
								<div class="row d-none inquiryCommentRow">
									<div class="col p-5 fs-5" style="min-height : 20vh;">
										<p>답변시간 : <span><fmt:formatDate value="${i.businessCommentRegDate}" pattern="yyyy년 MM월 dd일  HH시 mm분" /></span></p>
										<p>답변내용</p>
										<pre>${i.businessComment}</pre>
										<br>
									</div>								
								</div>
								
								<c:if test="${not empty i.businessComment}">
								<div class="row">
									<div class="col text-end">
										<input type="button" value="답변보기" class="btn btn-lg showInquiryCommentBtn w-100">
									</div>
								</div>
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
									      <a class="page-link" href="businessInquiryList?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="businessInquiryList?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="businessInquiryList?pageNum=${ startPage + pageGroup }">다음</a>
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