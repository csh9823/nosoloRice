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
					<div class="col bg-white" style="min-height:100vh;">
					
						<div class="row mx-2 mt-5">
							<div class="col">
								<span class="fw-bold fs-3 text-danger">1:1 문의</span>
							</div>
						</div>
						
						<form class="row mx-2 my-3" method="post" enctype="multipart/form-data" action="writeUserInquiry">
							<div class="col">
							
								<div class="row my-3">
									<div class="col">
									<input type="hidden" name="normalId" value="testNormalId">
										<span class="fw-bold me-3">문의구분</span>
										<input type="radio" name="inquiryDivision" id="inquiryDivision1" value="불편신고">
										<label for="inquiryDivision1" class="text-secondary me-3">불편신고</label>
										<input type="radio" name="inquiryDivision" id="inquiryDivision2" value="매칭관련">
										<label for="inquiryDivision2" class="text-secondary me-3">매칭관련</label>
										<input type="radio" name="inquiryDivision" id="inquiryDivision3" value="회원관련">
										<label for="inquiryDivision3" class="text-secondary me-3">회원관련</label>
										<input type="radio" name="inquiryDivision" id="inquiryDivision4" value="결제관련">
										<label for="inquiryDivision4" class="text-secondary me-3">결제관련</label>
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<input type="text" name="inquiryTitle" class="form-control" placeholder="제목을 입력해주세요">
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<textarea class="form-control" name="inquiryContent" placeholder="내용을 입력해 주세요" rows="20" style="resize:none;"></textarea>
									</div>
								</div>
								<div class="row my-3">
									<div class="col">
										<label for="file1">이미지 업로드</label>
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