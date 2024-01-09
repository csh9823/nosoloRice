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
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<style>

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
		
		<div class="col-md-3">
          <ul class="my-3 fs-5">
             <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">관리자 페이지</li>
            <li class="my-5"><a href="userInquiryList" class="textColor">일반회원 문의</a></li>
            <li class="my-5"><a href="businessInquiryList" class="textColor">사업자회원 문의</a></li>
            <li class="my-5"><a href="adminReportList" class="textColor">신고내역</a></li>
            <li class="my-5"><a href="joinApprove" class="textColor">가입승인</a></li>
            <li class="my-5"><a href="adminReviewList" class="textColor">리뷰삭제 요청</a></li>
            <li class="my-5"><a href="businessDeleteList" class="textColor">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="adminSales" class="textColor" style="color:#C93C3C">매출현황</a></li>
            <li class="my-5"><a href="noticeList" class="textColor">공지관리</a></li>
          </ul>
        </div>
		
			<div class="col">
				<!-- 여기서부터 작업 시작 -->
				
				<div class="row">
					<div class="col bg-white" style="min-height:100vh;">
					
						<div class="row mx-2 mt-5">
							<div class="col">
								<span class="fw-bold fs-3">일별 매출현황</span>
							</div>
						</div>
						
						<div class="row mx-2 mt-5">
							<div class="col">
								<input type="button" class="btn btn-success" value="일별매출">
								<input type="button" class="btn btn-outline-success" value="월별매출" onclick="location.href='adminSalesMonth'">
							</div>
							<div class="col text-end">
								<input type="button" class="btn btn-danger" value="그래프로 보기" data-bs-toggle="modal" data-bs-target="#adminSalesDailyChartView">
							</div>
						</div>
						
						<div class="row mx-2 mt-3 text-center border-top border-bottom border-dark py-3">
							<div class="col">
								<span class="fs-5">번호</span>
							</div>
							<div class="col">
								<span class="fs-5">예약번호</span>
								
							</div>
							<div class="col">
								<span class="fs-5">예약일자</span>
							</div>
							<div class="col">
								<span class="fs-5">업체명</span>
							</div>
							<div class="col">
								<span class="fs-5">업체수수료</span>
							</div>
						</div>
						
						<c:if test="${not empty salesList}">
						<!-- 반복문 시작 -->
						<c:forEach var="s" items="${salesList}">
						<div class="row mx-2 text-center border-bottom py-3">
							<div class="col">
								<span class="fs-5">${s.bookingOkNo}</span>
							</div>
							<div class="col">
								<span class="fs-5">${s.bookingNo}</span>
								
							</div>
							<div class="col">
								<span class="fs-5 salesLabel">${s.bookingOkTime}</span>
							</div>
							<div class="col">
								<span class="fs-5">${s.businessName}</span>
							</div>
							<div class="col">
								<span class="fs-5 salesValue">${s.deposit}</span>
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
									      <a class="page-link" href="adminSales?pageNum=${ startPage - pageGroup }">이전</a>
									    </li>
								    </c:if>
				
								    <c:forEach var="i" begin="${startPage}" end="${endPage}">
								    	<c:if test="${i == currentPage }">
								    	<li class="page-item active" aria-current="page">
								    		<span class="page-link">${i}</span>
								    	</li>
								    	</c:if>
								    	<c:if test="${i != currentPage }">
									    	<li class="page-item"><a class="page-link" href="adminSales?pageNum=${ i }">${i}</a></li>
									    </c:if>					    
								    </c:forEach>
			
									<c:if test="${ endPage < pageCount }">
									    <li class="page-item">
									      <a class="page-link" href="adminSales?pageNum=${ startPage + pageGroup }">다음</a>
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
				<div class="modal fade" id="adminSalesDailyChartView" tabindex="-1" aria-labelledby="adminSalesDailyChartViewLabel" aria-hidden="true">
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