<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
	.joinHoverDiv {
		background-color: #f5f5f5;
		color : salmon;
	}
	.joinHoverDiv:hover {
		color : #d6594b;
	}
	.loginHoverBtn {
		background-color: #00ba73;
	}
	.loginHoverBtn:hover {
		background-color: #1c9969;
	}
</style>
</head>
<body>
<div class="container" style="height:100vh; overflow: hidden;">
	<div class="row justify-content-center align-items-center h-100">
		<div class="col">
		    <div class="row imgrows">
		        <div class="col text-center"> 
		            <img src="resources/img/logo/nosolorice_logo_M.png" alt="">
		        </div>
		    </div>
		
		    <div class="row mb-3">
		        <div class="col text-center fs-4" style="color:#777">
			            <span class="fw-bold" style="color : salmon;">혼밥시러</span>에 회원가입 하시면 다앙한 컨텐츠를 이용하실 수 있습니다.
		        </div>
		    </div>
		
		    <div class="row justify-content-center mb-5">
		    	<div class="col mx-3">
		    		<div class="row justify-content-center">
				        <div class="col-4 text-center border rounded me-3 p-5 joinHoverDiv"  onclick="location.href='normalJoin'" style="cursor: pointer;">
				            <i class="bi bi-person-add"  style="font-size:10em;"></i><br><br>
				            <span class="fs-3 fw-bold">일반 회원가입</span>
				        </div>
				        
				        <div class="col-4 text-center border rounded ms-3 p-5 joinHoverDiv" onclick="location.href='businessJoin'" style="cursor: pointer;">
				            <i class="bi bi-building-add" style="font-size:10em;"></i><br><br>
				            <span class="fs-3 fw-bold">사업자 회원가입</span>
				        </div>
					</div>
		        </div>
		        
		    </div>
		    
	    	<div class="row my-5 justify-content-center">
		        <div class="col-8 px-0 mx-3 text-center">
		            <input type="button" onclick="location.href='login'" class="btn w-100 loginHoverBtn text-white fs-3" style="height:100px;" value="로그인 페이지로 이동">
		        </div>
		    </div>
		    
		</div>
		
	    
	</div>
</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>