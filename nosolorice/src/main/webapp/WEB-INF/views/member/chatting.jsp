<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  
  	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="resources/js/member.js"></script>
	<link href="resources/bootstrap/main.css" rel="stylesheet">
</head>

<body>
	<div class="container">
	<div class="col-6">
		<label><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="username" aria-describedby="btn btn-warning">
			<div class="input-group-append">
				<button class="btn btn-warning" type="button" id="send">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
</div>

</body>