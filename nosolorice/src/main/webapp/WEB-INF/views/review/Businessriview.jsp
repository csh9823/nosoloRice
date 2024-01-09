<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
    .darkgray {
      background-color : #2E2E2E !important;
      color : white !important;
    }
    .red {
      background-color : #C93C3C !important;
      color : white !important;
    }
    .text-red {
      color : #C93C3C !important;
    }
    </style>
</head>
<body>
<div class="container">
<div class="row">
	<%@ include file="../../temple/header/businessMenubar.jsp" %>
        <div class="col">
            <div class="row">
                <div class="col-2"><span style="font-size: 30px;"><strong>리뷰</strong></span></div>
            </div>
            <div class="row">
                <div class="col-2"><span style="font-size: 20px;"><strong>리뷰(${review[0].totalCount})</strong></div>
            </div>
            
            <c:forEach var="rev" items="${review}">
            <div class="row">
                <div class="col-4">
                    <div class="row">
                    <c:if test="${rev.reviewPicture == null}">
                        <div class="col-2"><img src="https://via.placeholder.com/30" style="width: 30px; height: 30px; border-radius: 30px;"></div>
                    </c:if>
                    
                    <c:if test="${rev.reviewPicture == null}">
                        <div class="col-2"><img src="https://via.placeholder.com/30" style="width: 30px; height: 30px; border-radius: 30px;"></div>
                    </c:if>
                    
                        <div class="col-2">zzz</div>
                    </div>
                    <div class="col-2" style="margin-left: 54px;">
                        das
                    </div>
                </div>
                <div class="col-2">
                    z-index
                </div>
                <div class="col-2">
                    z
                </div>
                <div class="col-2">
                    z
                </div>
                <div class="col-2">
                    z
                </div>
            </div>

            <div class="row">
                <div class="col">
                    아싸라비야 아싸라비야아싸라비야아싸라비야아싸라비야아싸라비야아싸라비야아싸라비야아싸라비야
                </div>
            </div>
            
            <div class="row">
                    <div class="col-6">
                        <img src="https://via.placeholder.com/300">
                    </div>
                    <div class="col-6"  style="text-align: right;">
                        <button style="margin-top: 270px;">답글수정</button>
                        <button>답글삭제</button>
                    </div>
            </div>
		</c:forEach>
        </div>
</div>
</div>
  <script>
    $(document).on("mouseover", ".menu", function() {
      $(this).css("opacity", "30%");
    });
    $(document).on("mouseleave", ".menu", function() {
      $(this).css("opacity", "100%");
    });
  </script>
</body>
</html>