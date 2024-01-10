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
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> <!-- Axios CDN -->
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
            <li class="my-5"><a href="businessDeleteList" class="textColor" style="color:#C93C3C">업체삭제</a></li>
            <li class="my-5"><a href="deniedList" class="textColor">회원정지</a></li>
            <li class="my-5"><a href="adminSales" class="textColor">매출현황</a></li>
          </ul>
        </div> 
          
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">업체삭제</div>
              <br>
              
              <div class="row py-3">
  					<div class="col">
			  		<form action="#" id="businessIdSearchForm" name="businessIdSearchForm" method="post">
				    <div class="col-5 py-5 d-flex align-items-center">
				        <input type="text" id="businessSearchId" name="searchId" placeholder="사업자 아이디를 정확하게 입력하세요" class="form-control">
				        <button type="submit" class="btn col-2 mx-3">검색</button>
				    </div>
					</form>
		  	</div>
		  </div>
		  		
		  <div class="row resultDiv d-none">
		  		
		  	<div class="col">
		  		<div class="row">
		  			<div class="col fs-3">
		  				검색 결과
		  			</div>
		  			<div class="col text-end">
		  				<input type="button" value="목록보기" id="businessListBtn" class="btn">
		  			</div>
		  		</div>
		  		<div class="row border-bottom resultRow">
		  			 <div class="col-md-3">
				        <img  id="businessImg" style="max-width: 100%; height: auto;">
				    </div>
				    <div class="col-md-3 py-4">
				        <div class="fs-2"><span id="businessName"></span></div>
				        <div class="fs-4"><span id="bname"></span></div>
				        <div class="fs-4"><span id="bphone"></span></div>
				        <div class="fs-4"><span id="baddress"></span></div>
				    </div>
				    <div class="col-md-6 text-md-end align-self-center">
				        <input type="button" value="삭제" class="btn btn-lg deleteBtn" style="background-color:#C93C3C; color:white;">
				    </div>
		  					
		  					
		  		</div>
		  			</div>
			</div>
					<div class="row"id="forBlist">
				<div class="col" >
					<c:if test="${not empty bList}">
					<c:forEach var="b" items="${bList}">
				<div class="row" data-id="${b.businessId}">
				    <div class="col-md-3">
				        <img src="resources/upload/${b.businessProfile}" style="max-width: 100%; height: auto;">
				    </div>
				    <div class="col-md-5 py-4">
				        <div class="fs-2">${b.businessName}</div>
				        <div class="fs-4">${b.businessId}(${b.name})</div>
				        <div class="fs-4">${b.phone}</div>
				        <div class="fs-4">${b.address1} ${b.address2}</div>
				    </div>
				    <div class="col-md-auto text-md-end align-self-center">
				        <input type="button" value="삭제" class="btn btn-lg deleteBtn" style="background-color:#C93C3C; color:white;">
				    </div>
						</div>
				</c:forEach>
						</c:if>	
					</div>
				</div>			
						
				<c:if test="${not empty bList}">		
						
			<div class="row my-5">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					
					  	<c:if test="${ startPage > PG }">
						    <li class="page-item">
						      <a class="page-link" href="businessDeleteList?pageNum=${ startPage - PG }">Pre</a>
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
						    		<a class="page-link" href="businessDeleteList?pageNum=${i}">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
				
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="businessDeleteList?pageNum=${ startPage + PG }">Next</a>
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
	</div> <!-- container end  -->

            
            
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script>
 
 
 $("#businessIdSearchForm").on('submit', async function(e){
	 
	 e.preventDefault();
	 
	 let id = $("#businessSearchId").val();
	 
	 console.log(id);
	 
	 const resData = await axios.post("/app/searchBusinessId", { id : id });
	 
	 console.log(resData.data);
	 
	 console.log(typeof resData.data);
	 
	 if(resData.data.result){
		 
		 $("#businessName").text(resData.data.searchUserInfo.businessName);
		 $("#bname").text(resData.data.searchUserInfo.name);
		 $("#bphone").text(resData.data.searchUserInfo.phone);
		 $("#baddress").text(resData.data.searchUserInfo.address1 + "  " +resData.data.searchUserInfo.address2 );
		 
		 $("#businessImg").attr("src","resources/upload/"+ resData.data.searchUserInfo.businessProfile);
		 $(".resultRow").attr("data-id",resData.data.searchUserInfo.businessId);
		 $(".resultDiv").removeClass("d-none");
		 
		 $("#forBlist").addClass("d-none");

	 } else {
		 alert("존재하지 않는 업체/아이디 입니다.");
	 }
	
	 
 });
 	
		 $("#businessListBtn").on('click',function(){
			 
		 $(".resultDiv").addClass("d-none");
			 
		 $("#forBlist").removeClass("d-none");
			 
		 });
  
  $(document).on('click', ".deleteBtn", function(){
	  
	  
	  let businessId = $(this).parent().parent().attr("data-id");
	  let row = $(this).parent().parent();
	  
	  console.log(businessId);
	  
	  if(confirm("업체를 삭제하시겠습니까?")){
		  
		  
		  
		  $.ajax({
			  
			  url:"/app/businessDelete",
			  data : "businessId=" + businessId,
			  type : "post",
			  dataType : "json",
			  success : function(resData){
				  
				  if(resData.id){
					 
				row.remove();
				
				location.href='businessDeleteList?pageNum=' +pageNum
					  
				  }
				  
				  console.log(resData);
				  
			  },error : function(err){
				  
				  console.log(err);
			  }
  
			  
		  });

			
			
		} 
	  
  });
 

 
 

</script>
</body>
</html>