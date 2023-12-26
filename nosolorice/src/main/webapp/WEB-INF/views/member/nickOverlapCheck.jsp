<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  
  	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/member.js"></script>
	<link href="resources/bootstrap/main.css" rel="stylesheet">
</head>

<body>
  <div class="row my-5">

	<c:choose>
		
		<c:when test="${ overlap }">
		     
            <div class="row text-center">
              <div class="col">
                <p class="fs-1 fw-bold">사용할 수 없는 닉네임 입니다.</p>
                <p class="fs-6">입력하신 ${nickName}는 이미 사용중인 닉네임 입니다.</p>
              </div>       
         	</div>
         	
         	<form action="/nickOverlapCheck" method="post" name="nickCheckForm" class="row mt-5">
         		<div class="col-10 offset-1">
         			<div class="input-group">
         				<span class="input-group-text">* 닉네임</span>
         				<input type="text" class="form-control" name="nick" id="checkNick">
         				<input type="submit" class="btn btn-success" value="중복확인">
         			</div>
         		</div>
         	</form>
            
          </c:when>
          
          <c:otherwise>
          	<div class="col">
	          	<div class="row text-center">
	              <div class="col">
	                <p class="fs-1 fw-bold">사용할 수 있는 닉네임 입니다.</p>
	                <p class="fs-6">입력하신 ${nickName}은(는) 사용할 수 있는 닉네임 입니다.</p>
	              </div>       
	         	</div>
	         	<div class="row mt-5">
	         		<div class="col text-center">
	         			<input type="button" value="${nickName}을(를) 닉네임으로 사용하기" id="btnNickCheckClose" data-id-value="${nickName}" class="btn btn-success" />
	         		</div>
	         	</div>
            </div>
          </c:otherwise>
        </c:choose>
  	</div>
</body>
</html>
