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
  	<input type="hidden" value="${sessionScope.NormalUser.normalId}">
    <div class="row">
      <div class="col">
        <div class="row mb-3">
          <div class="col">
            <h3 class="text-red">포인트 충전이력</h3>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col">
            <table class="table text-center table-borderless">
              <thead class="border-top border-bottom">
                <tr>
                  <th>번호</th>
                  <th>결제수단</th>
                  <th>결제시간</th>
                  <th>충전금액</th>
                  <th>충전포인트</th>
                </tr>
              </thead>
              <tbody>
                <!-- DB 반복 출력 -->
                <c:if test="${not empty chargePointList }">
                	<c:forEach var="cList" items="${chargePointList }">
		                <tr>
		                  <td>${cList.pointRechargeNo }</td>
		                  <td>${cList.paymentMethod }</td>
		                  <td>
		                  	<fmt:formatDate value="${cList.chargeDate }" pattern="yyyy/MM/dd HH:mm:ss" />
		                  </td>
		                  <td>
		                  	<fmt:formatNumber value="${cList.chargeAmount }" pattern="#,###" />
		                  </td>
		                  <td>
		                  	<fmt:formatNumber value="${cList.chargePoint }" pattern="#,###" />
		                  </td>
		                </tr>
	                </c:forEach>
                </c:if>
                <c:if test="${empty chargePointList }">
                	<tr>
                		<td colspan="5">
                			충전 내역이 없습니다.
                		</td>
                	</tr>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <!-- 페이지네이션 -->
        <div class="row mb-3">
          <div class="col">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <c:if test="${chargeStartPage > chargePAGE_GROUP}">
			    	<li class="page-item">
			    		<a class="page-link" 
			    			href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${chargeStartPage - chargePAGE_GROUP}&usePageNum=${usePageNum}">Pre</a>
			    	</li>
			    </c:if>
                <c:forEach var="i" begin="${chargeStartPage}" end="${chargeEndPage}">
			    	<c:if test="${ i == chargePageNum}">
					    <li class="page-item active" aria-current="page">
					    	<span class="page-link">${i}</span>
					    </li>
				    </c:if>
				    <c:if test="${ i != chargePageNum}">
					    <li class="page-item">
					    	<a class="page-link" 
					    		href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${i}&usePageNum=${usePageNum}">${i}</a>
					    </li>
				    </c:if>
			    </c:forEach>
                <c:if test="${chargeEndPage < chargePageCount}">
			    	<li class="page-item">
			    		<a class="page-link" 
			    			href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${chargeEndPage + 1}&usePageNum=${usePageNum}">Next</a>
			    	</li>
			    </c:if>
              </ul>
            </nav>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <h3 class="text-red">포인트 사용내역</h3>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col">
            <table class="table text-center table-borderless">
              <thead class="border-top border-bottom">
                <tr>
                  <th>번호</th>
                  <th>이용매장</th>
                  <th>사용일시</th>
                  <th>사용포인트</th>
                </tr>
              </thead>
              <tbody>
                <!-- DB 반복 출력 -->
                 <c:if test="${not empty usePointList }">
                	<c:forEach var="uList" items="${usePointList }">
		                <tr>
		                  <td>0</td>
		                  <td>${uList.businessId }</td>
		                  <td>
		                  	<fmt:formatDate value="${uList.historyDate }" pattern="yyyy-MM-dd HH:mm"/>
		                  </td>
		                  <td>
		                  	<fmt:formatNumber value="${uList.historyPoint }" pattern="#,###"/>
		                  </td>
		                </tr>
		             </c:forEach>
		          </c:if>
		          <c:if test="${empty usePointList }">
		          	<tr>
		          		<td colspan="4">
		          			포인트 사용내역이 없습니다.
		          		</td>
		          	</tr>
		          </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <!-- 페이지네이션 -->
        <div class="row mb-3">
          <div class="col">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <c:if test="${chargeStartPage > chargePAGE_GROUP}">
			    	<li class="page-item">
			    		<a class="page-link" 
			    			href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${chargePageNum}&usePageNum=${useStartPage - usePAGE_GROUP}">Pre</a>
			    	</li>
			    </c:if>
                <c:forEach var="i" begin="${chargeStartPage}" end="${chargeEndPage}">
			    	<c:if test="${ i == chargePageNum}">
					    <li class="page-item active" aria-current="page">
					    	<span class="page-link">${i}</span>
					    </li>
				    </c:if>
				    <c:if test="${ i != chargePageNum}">
					    <li class="page-item">
					    	<a class="page-link" 
					    		href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${chargePageNum}&usePageNum=${i}">${i}</a>
					    </li>
				    </c:if>
			    </c:forEach>
                <c:if test="${chargeEndPage < chargePageCount}">
			    	<li class="page-item">
			    		<a class="page-link" 
			    			href="pointList?id=${sessionScope.NormalUser.normalId}&chargePageNum=${chargePageNum}&usePageNum=${useEndPage + 1}">Next</a>
			    	</li>
			    </c:if>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>