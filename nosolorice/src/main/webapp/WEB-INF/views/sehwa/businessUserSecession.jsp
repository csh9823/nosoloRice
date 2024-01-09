<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link href="resources/css/sehwa/globalStyle.css" type="text/css" rel="stylesheet">
<link href="resources/css/sehwa/style.css" type="text/css" rel="stylesheet">
<script src="resources/js/sehwa/globalFunction.js"></script>
<script src="resources/js/sehwa/validation.js"></script>
<script src="resources/js/sehwa/ajax.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<%@ include file="../../temple/header/businessMenubar.jsp" %>
	 	<div class="col-md-9">
	 		<div class="row my-5">
	 			<div class="col-8 offset-2">
	 				<div class="row my-5">
	 					<div class="col">
			 				<h1 class="text-red">회원탈퇴</h1>
	 					</div>
	 				</div>
		 			<div class="row mt-5">
			 			<div class="col gy-3">
					 		<input type="hidden" name="secessionId" id="secessionId" value="${id}">
					 		<input type="password" name="secessionPass" id="secessionPass" class="form-control"
					 					placeholder="비밀번호를 입력해주세요.">
					 		<span class="text-red">탈퇴하기버튼 클릭 시, 계정은 삭제되며 복구되지 않습니다.</span>
			 			</div>
			 		</div>
		 			<div class="row my-2">
			 			<div class="col gy-3">
					 		<input type="button" id="secessionBtn" value="탈퇴하기" class="red btn btn-lg">
			 			</div>
			 		</div>
	 			</div>
	 		</div>
	 	</div>
	 </div>
</div>

<script>
	$("#secessionBtn").on("click", function() {
		let id = $("#secessionId").val();
		let pass = $("#secessionPass").val();
		console.log(pass);
		
		$.ajax({
			"url" : "checkBusinessPass.ajax",
			"data" : {
				"id" : id,
				"inputPass" : pass,
				"type" : "business"
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log("비밀번호가 맞나요? : ", resData);
				if(resData == "true") {
					
					$.ajax({
						"url" : "businessUserSecession.ajax",
						"data" : {
							"id" : id
						},
						"type" : "post",
						"dataType" : "text",
						"success" : function(result) {
							console.log("회원탈퇴를 했어요");
							locaion.href='login';
						},
						"error" : function(xhr, status, error) {
							console.log("err : ", xhr, "-", error);
						}
						
					});
					
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
				
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", xhr, "-", err);
			}
			
		});
		
		
		
	});

</script>

</body>
</html>