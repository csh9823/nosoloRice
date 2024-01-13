<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="resources/css/findForm.css">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
	.loginHoverBtn {
		background-color: #00ba73;
	}
	.loginHoverBtn:hover {
		background-color: #1c9969;
	}
	.loginHoverDiv{
		color : salmon;
		background-color: #f5f5f5;
	}
	.loginHoverDiv:hover{
		color : #d6594b;
	}
</style>
</head>
<body>
	<div class="container" style="height:100vh; overflow: hidden;">
		<div class="row justify-content-center">
			<div class="col-9">
	
			    <div class="row imgrows" style="margin-top: 8vh;">
			        <div class="col text-center"> 
			            <img src="resources/img/logo/nosolorice_logo_M.png">
			        </div>
			    </div>

			    <div class="row justify-content-center my-2">
			    	<div class="col mx-3">
			    		<div class="row justify-content-center">
					        <div class="col-5 text-center me-3" style="cursor: pointer;">
								<span class="fs-3">아이디 찾기</span>
					        </div>
					
					        <div class="col-5 text-center ms-3" style="cursor: pointer;">
								<span class="fs-3">비밀번호 찾기</span>
					        </div>
						</div>
			        </div>
			    </div>
			    
			    <div class="row justify-content-center">
			    	<div class="col mx-3">
			    		<div class="row justify-content-center">
					        <div class="col-5 text-center border rounded me-3 py-5 loginHoverDiv" onclick="location.href='idFind'" style="cursor: pointer;">
								<i class="bi bi-person-fill-lock loginHoverIcon" style="font-size:15em;"></i>
					        </div>
					
					        <div class="col-5 text-center border rounded ms-3 py-5 loginHoverDiv" onclick="location.href='newpassword'" style="cursor: pointer;">
								<i class="bi bi-lock-fill loginHoverIcon" style="font-size:15em;"></i>
					        </div>
						</div>
			        </div>
			    </div>
			    
			    <div class="row my-5 justify-content-center">
			        <div class="col-10 px-0 text-center">
			            <input type="button" onclick="location.href='login'" class="btn w-100 loginHoverBtn text-white fs-3" style="height:100px;" value="로그인 페이지로 이동">
			        </div>
			    </div>
			    
	    	</div>
	    </div>
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>