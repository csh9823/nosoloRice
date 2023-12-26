<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<!-- 여기서부터 작업 시작 -->
				
				<div class="row">
					<div class="col-3 bg-dark d-flex flex-column justify-content-center align-items-center" style="min-height:100vh;">
						<ul class="text-white ls-none fs-3" style="list-style: none">
							<li>영업시작</li>
							<li>업체정보</li>
							<li>예약관리</li>
							<li>예약이력</li>
							<li>리뷰관리</li>
							<li>메뉴관리</li>
							<li>탈퇴</li>
						</ul>
						<ul class="text-white fs-5" style="list-style: none">
							<li>공지사항</li>
							<li>1:1문의</li>
							<li>내 정보수정</li>
							<li>로그아웃</li>
						</ul>
					</div>
					<div class="col bg-white">
					
						<div class="row mx-2 mt-5">
							<div class="col">
								<span class="fw-bold fs-3">예약이력</span>
							</div>
						</div>
						
						<div class="row mx-2 my-3">
							<div class="col">
								<a href="businessSales" style="text-decoration: none;">
									<span class="fs-5 text-secondary">일별매출</span>
								</a>
								<span class="fs-5 text-danger ms-5" style="cursor:pointer;">월별매출</span>
							</div>
							<div class="col text-end">
								<input type="button" class="btn btn-danger" value="그래프로 보기" data-bs-toggle="modal" data-bs-target="#businessSalesMonthChartView">
							</div>
						</div>
						
						<div class="row mx-2 text-center border-top border-bottom border-dark py-3">
							<div class="col">
								<span class="fs-5">날짜</span>
							</div>
							<div class="col">
								<span class="fs-5">예약건수</span>
								
							</div>
							<div class="col">
								<span class="fs-5">한 달 수익금액</span>
							</div>
						</div>
						
						<c:if test="${not empty mSalesList}">
						<!-- 반복문 시작 -->
						<c:forEach var="s" items="${mSalesList}">
						<div class="row mx-2 text-center border-bottom py-3">
							<div class="col">
								<span class="fs-5 salesLabel">${s.month}</span>
							</div>
							<div class="col">
								<span class="fs-5">${s.count}</span>
								
							</div>
							<div class="col">
								<span class="fs-5 salesValue">${s.deposit*10 - s.deposit}</span>
								<span class="fs-5">원</span>
							</div>
						</div>
						</c:forEach>
						<!-- 반복문 끝-->
						
						<!-- 페이지네이션 시작  -->
						<div class="row my-5">
							<div class="col">
								<nav aria-label="Page navigation">
								  <ul class="pagination justify-content-center">
			
								  	<c:if test="${ startPage > pageGroup }">
									    <li class="page-item">
									      <a class="page-link" href="businessSalesMonth?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="businessSalesMonth?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="businessSalesMonth?pageNum=${ startPage + pageGroup }">다음</a>
									    </li>
								  	</c:if>
								  </ul>
								</nav>
							</div>
						</div>
						<!-- 페이지네이션 끝  -->
						</c:if>
						<c:if test="${empty mSalesList}">
							<div class="row mx-2 text-center border-bottom py-3">
								<div class="col">
									매출 내역이 없습니다
								</div>
							</div>
						</c:if>
						
					</div>
				</div>
				
				<!-- 차트 Modal -->
				<div class="modal fade" id="businessSalesMonthChartView" tabindex="-1" aria-labelledby="businessSalesMonthChartViewLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered modal-lg">
				    <div class="modal-content" style="width:70vw; height: 70vh;">
				      <div class="text-end p-3">
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <canvas id="myChart"></canvas>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- 여기까지 작업 끝 -->
			</div>
		</div>
	</div>
<script src="resources/js/salesChart.js"></script>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>