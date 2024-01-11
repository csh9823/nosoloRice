<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
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
									<span class="fs-5 text-danger">문의하기</span>
								</a>
								<a href="businessInquiryList" style="text-decoration: none;" class="ms-5">
									<span class="fs-5 text-secondary">문의내역</span>
								</a>
							</div>
						</div>
						
						<form class="row mx-2" method="post" enctype="multipart/form-data" action="writeBusinessInquiry">
							<div class="col">
								
								<div class="row my-3">
									<div class="col">
										<input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
										<span class="fw-bold me-3">문의구분</span>
										<input type="radio" name=businessDivision id="businessDivision1" value="불편신고">
										<label for="businessDivision1" class="text-secondary me-3">불편신고</label>
										<input type="radio" name="businessDivision" id="businessDivision2" value="예약관련">
										<label for="businessDivision2" class="text-secondary me-3">예약관련</label>
										<input type="radio" name="businessDivision" id="businessDivision3" value="수수료관련">
										<label for="businessDivision3" class="text-secondary me-3">수수료관련</label>
										<input type="radio" name="businessDivision" id="businessDivision4" value="업체관련">
										<label for="businessDivision4" class="text-secondary me-3">업체관련</label>
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<input type="text" class="form-control" name="businessTitle" placeholder="제목을 입력해주세요">
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<textarea class="form-control" name="businessContent" placeholder="내용을 입력해 주세요" rows="20" style="resize:none;"></textarea>
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<label for="business_picture">이미지 업로드</label>
										<input type="file" name="file1" id="file1" class="form-control">
									</div>
								</div>
								<div class="row my-3">
									<div class="col text-end">
										<input type="submit" class="btn btn-lg btn-success" value="문의하기">
									</div>
								</div>
								
							</div>
						</form>
						
					</div>
				</div>
				
				<!-- 여기까지 작업 끝 -->
			</div>
		</div>
	</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>