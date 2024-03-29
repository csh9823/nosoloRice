<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<%@ include file="../temple/header/businessMenubar.jsp" %>
					<div class="col p-5 bg-white" style="height:100vh; overflow: auto;">
					
						<div class="row mx-2">
							<div class="col">
								<span class="fw-bold fs-3">매출내역</span>
							</div>
						</div>
						
						<div class="row mx-2 my-3">
							<div class="col">
								<span class="fs-5 text-danger" style="cursor:pointer;">일별매출</span>
								<a href="businessSalesMonth" style="text-decoration: none;" class="ms-5">
									<span class="fs-5 text-secondary">월별매출</span>
								</a>
							</div>
							<div class="col text-end">
								<input type="button" class="btn btn-danger" value="그래프로 보기" data-bs-toggle="modal" data-bs-target="#businessSalesDailyChartView">
							</div>
						</div>
						
						<div class="row mx-2 text-center border-top border-bottom border-dark py-3">
							<div class="col">
								<span class="fs-5">날짜</span>
							</div>
							<div class="col">
								<span class="fs-5">예약번호</span>
								
							</div>
							<div class="col">
								<span class="fs-5">예약금</span>
							</div>
							<div class="col">
								<span class="fs-5">수수료</span>
							</div>
							<div class="col">
								<span class="fs-5">순수익</span>
							</div>
						</div>
						
						<c:if test="${not empty salesList}">
						<!-- 반복문 시작 -->
						<c:forEach var="s" items="${salesList}">
						<div class="row mx-2 text-center border-bottom py-3">
							<div class="col">
								<span class="fs-6 salesLabel">
									<fmt:formatDate value="${s.getBookingOkTime()}" pattern="yyyy년 MM월 dd일"/>
								</span>
							</div>
							<div class="col">
								<span class="fs-5">${s.getBookingNo()}</span>
								
							</div>
							<div class="col">
								<span class="fs-5">${s.deposit * 10}원</span>
							</div>
							<div class="col">
								<span class="fs-5">${s.deposit}원</span>
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
									      <a class="page-link" href="businessSales?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="businessSales?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="businessSales?pageNum=${ startPage + pageGroup }">다음</a>
									    </li>
								  	</c:if>
								  </ul>
								</nav>
							</div>
						</div>
						<!-- 페이지네이션 끝  -->
						</c:if>
						<c:if test="${empty salesList}">
							<div class="row mx-2 text-center border-bottom py-3">
								<div class="col">
									매출 내역이 없습니다
								</div>
							</div>
						</c:if>
						
					</div>
				</div>
				
				<!-- 차트 Modal -->
				<div class="modal fade" id="businessSalesDailyChartView" tabindex="-1" aria-labelledby="businessSalesDailyChartViewLabel" aria-hidden="true">
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