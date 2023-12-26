<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link href="/resources/bootstrap/main.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<%@ include file="temple/header/header.jsp" %>
		<jsp:include page="${ param.body }" />
		<%@ include file="temple/footer/footer.jsp" %>
	</div>	
	
<script src="../js/normalUserPhoneCheck.js"></script>
</body>
</html> 