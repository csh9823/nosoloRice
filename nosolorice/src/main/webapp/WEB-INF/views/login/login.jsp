<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
	a {
		text-decoration: none;
	}
	.loginHoverBtn {
		height:50px;
		background-color: salmon;
	}
	.loginHoverBtn:hover {
		background-color: #d6594b;
	}
	#myfind {
		color : #555;
	}
	#myfind:hover {
		color : black;
	}
</style>
</head>
<body>
    <div class="container content" style="height:100vh; overflow: hidden;">
    
        <div class="row imgrows" style="margin-top: 15vh;">
            <div class="col text-center"> 
                <img src="resources/img/logo/nosolorice_logo_M.png" alt="">
            </div>
        </div>

        <form action="loginservice" method="post" id="loginsummit" class="row justify-content-center my-2">
        	<div class="col">        		
        		<div class="row justify-content-center">
        			<div class="col-4 text-center">
						<input type="checkbox" value="1" name="idsave" id="idsave" ${id != null ? 'checked' : ''} >
						<span class="fs-5">아이디 저장하기</span><br>
		             	<input type="text" class="form-control my-3" style="height:50px;" placeholder="아이디를 입력해 주세요"  name="id" id="id" value="${id != null ? id : ''}">
		             	<input type="password" class="form-control my-3" style="height:50px;" placeholder="비밀번호를 입력해 주세요" name="pass" id="pass">
	             	</div>
				</div>
             	<div class="row justify-content-center">
	                 <div class="col-4 text-center">
	                     <input type="submit" class="btn w-100 fs-5 text-white loginHoverBtn" id="loginsub" value="로그인">
	                 </div> 
             	</div>
            </div>
         </form>
         
         <div class="row justify-content-center">
             <div class="col-4 text-center">
                 <input type="button" onclick='location.href="joinForm"' class="btn w-100 fs-5 mb-2 text-white loginHoverBtn" id="memberjoin" value="회원가입">
                 <a id="myfind" href="findForm">아이디나 비밀번호가 기억나지 않으세요?</a>
             </div>
         </div>
   </div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$("#loginsummit").on("submit", function () {
    let id = $("#id").val();
    let pass = $("#pass").val();
    
	if(id.length == 0){
		alert("아이디를 입력해 주세요")
		return false;
	}
	
	if(pass.length == 0 ){
		alert("비밀번호를 입력해 주세요.")
		return false;
	}
})
</script>
</body>