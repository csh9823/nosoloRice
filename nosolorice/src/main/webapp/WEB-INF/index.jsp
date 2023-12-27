<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/mode.css">
<link rel="stylesheet" href="resources/css/findForm.css">
<link rel="stylesheet" href="resources/css/idFind.css">
<link rel="stylesheet" href="resources/css/joinForm.css">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="container">
	<c:if test="${sessionScope.BusinessUser.root == 1}">
			<%@ include file="temple/header/businessMenubar.jsp" %>
	</c:if>
	
	<c:if test="${sessionScope.NormalUser.root == 2}">
		<%@ include file="temple/header/header.jsp" %>
	</c:if>
	
		<jsp:include page="${param.body}" />
		<%@ include file="temple/footer/footer.jsp" %>	
	</div>	
	
	<script src="resources/bootstrap/bootstrap.bundle.min.js">
	</script>
	
</body>
</html>