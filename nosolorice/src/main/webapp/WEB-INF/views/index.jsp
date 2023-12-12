<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="resources/css/styles.css" type="text/css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/headerFunction.js"></script>
<script src="resources/js/globalFunction.js"></script>
<script src="resources/js/memberFunction.js"></script>
</head>
<body>
<div class="container">

	<jsp:include page="${param.body }" />

	
</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>