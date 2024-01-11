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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link href="resources/css/sehwa/globalStyle.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<script src="resources/js/sehwa/globalFunction.js"></script>
<script src="resources/js/sehwa/validation.js"></script>
<script src="resources/js/sehwa/ajax.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>

<!-- favicon 404 에러 방지용 -->
<link rel="icon" href="data:,">
</head>
<body>

	<div class="container">
		<%@ include file="temple/header/header.jsp" %>
		<jsp:include page="${param.body}" />
		<%@ include file="temple/footer/footer.jsp" %>
	</div>	
	
	<script src="resources/bootstrap/bootstrap.bundle.min.js">
	</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
</body>
</html>