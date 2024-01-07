<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        .yeslist{
            text-decoration: none;
        }
        .nolist{
            text-decoration: none;
        }
        .pyeslist{
            font-size: 30px;
            color: white;
            text-align: center;
            padding-top: 40px;
        }
        .pyeslist:hover{
            color: black;
        }

        .pnolist{
            text-align: center; 
            font-size: 30px; color: white;
            padding-top: 40px;
            margin-left: 30px;
        }
        
        .pnolist:hover{
            color: black;
        }
  		.pnolist2{
  		    text-align: center; 
            font-size: 30px; color: white;
            padding-top: 40px;
  		}
        .pnolist2:hover{
            color: black;
        }
        #modal2 {
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            display: none;
        }
        .modal2-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            width: 600px;
            height: 400px;
        }   
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
<%@ include file="../../temple/header/businessMenubar.jsp" %>
        <div class="col">
            <div class="row">

                <div class="col" style="font-size: 30px; margin-left: 43px;">
                    <strong>예약관리</strong>
                </div>

                <div class="row">
                    <div class="col" style="font-size: 20px; margin-bottom: 50px; margin-top: 20px; margin-left: 43px;">예약 대기 리스트</div>
                </div>
     			<c:forEach var="booking" items="${booking}">
				<c:if test="${booking.bookingState eq '0'}">
				<fmt:formatDate value="${booking.bookingTime}" pattern="HH:mm" var="bookingTime" />
                <div class="row" style="margin-left: 30px; padding: 0px; margin-bottom: 15px;">
		                <div class="col-2" style="border: solid 1px black; border-right: none; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
		                    <p style="font-size: 30px; border-right: lightgray solid 1px; height: 100px;  margin-top: 15px; padding-top: 25px;">
		                    	${bookingTime}
		                    </p>
		                </div>
		
		                <div class="col" style="border: solid 1px black; border-left: none;">
		                    <div class="row">
		                        <div class="col-4">
		                            <p style="font-size: 30px; padding-top: 10px;">${booking.bookingCount}명 예약</p>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col">
		                            <p style="font-size: 10px;">요청사항</p>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col">
		                            <p style="font-size: 10px;">${booking.bookingRequest}</p>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-2" style="background-color: cadetblue;">
		                    <a href="bookingState?businessId=${sessionScope.BusinessUser.businessId}&bookingNo=${booking.bookingNo}" class="yeslist">
		                    	<p class="pyeslist">승인</p>
		                    </a>
		                </div>
		    
		                <div class="col-2" style="background-color: red; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
		                    <p><button class="pnolist" style="border: none; background-color: red;" value="4">거절</button> </p>
		                </div>
                </div>
        		</c:if>
                </c:forEach>
                
                
                
                <div class="row" style="border-top: solid 1px black; margin-top: 20px; margin-left: 30px;">
                    <div class="row">
                        <div class="col" style="font-size: 30px;">
                            <strong>예약 승인 리스트</strong>
                        </div>
                    </div>
                </div>
				<c:forEach var="booking" items="${booking}">
				<c:if test="${booking.bookingState eq '1'}">
				<fmt:formatDate value="${booking.bookingTime}" pattern="HH:mm" var="bookingTime" />
                <div class="row" style="margin-left: 30px; padding: 0px; margin-bottom: 15px;">

                    <div class="col-2" style="border: solid 1px black; border-right: none; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
                        <p style="font-size: 30px; border-right: lightgray solid 1px; height: 100px;  margin-top: 15px; padding-top: 25px;">${bookingTime}</p>
                    </div>

                    <div class="col" style="border: solid 1px black; border-left: none;">
                        <div class="row">

                            <div class="col-4">
                                <p style="font-size: 20px; padding-top: 10px ;"> 
                                <span style="border-right: 1px solid lightgray; padding-right: 10px;">
                                	예약번호
                                </span>
                                </p>
                            </div>
                            
                            <div class="col-2">
                                <p style="font-size: 20px; padding-top: 10px;">${booking.bookingBookNo}</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <p style="font-size: 10px;">요청사항</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <p style="font-size: 10px;">${booking.bookingRequest}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-2" style="background-color: cadetblue;">
                        <a href="naver.com" class="yeslist"><p class="pyeslist">방문완료</p></a>
                    </div>
    
                    <div class="col-2" style="background-color: red; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                        <a href="naver.com" class="nolist"><p class="pnolist2">미방문</p></a>
                    </div>
                </div>
                </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="modal2">
        <div class="modal2-content">
            <div class="row">
                <div class="col" style="font-size: 20px; margin-left: 28px;margin-bottom: 10px;"> <strong>예약 거절 사유를 입력해 주세요</strong></div>
            </div>

            <div class="row">
                <div class="col">
                    <form accept="##" method="get">
                        <input type="text" style="width: 500px; height: 250px; margin-left: 30px;" name=""><br>
                        <input type="hidden" name="시발" value="" id="nonono">
                        <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                        <button type="submit" class="btn btn-success" style="margin-top: 15px; margin-left: 345px;">거절하기</button>
                        <button type="button" class="btn btn-danger" id="close-modal2" style="width: 90px; margin-top: 15px;">취소</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    const modal2 = document.getElementById("modal2");
    const openModal2Btn = document.querySelector(".pnolist");
    const closeModal2Btn = document.getElementById("close-modal2");

    // 모달창 열기
    openModal2Btn.addEventListener("click", () => {
      modal2.style.display = "block"
      document.body.style.overflow = "hidden"; // 스크롤바 제거
      
    });
    
    // 모달창 닫기
    closeModal2Btn.addEventListener("click", () => {
      modal2.style.display = "none";
      document.body.style.overflow = "auto"; // 스크롤바 보이기
    });

    document.addEventListener("DOMContentLoaded", function() {
    
    let modal2 = document.getElementById("modal2");
    let modal2Content = document.querySelector(".modal2-content");

    modal2.addEventListener("click", function(e) {
        if (!modal2Content.contains(e.target)) {
            modal2.style.display = "none";
        }
    });
});
    // 버튼 값 가져오기
    const rejectButton = document.querySelector('.pnolist');
    document.addEventListener('DOMContentLoaded', function() {

        // 버튼이 클릭 됐을때 이벤트 주기
        rejectButton.addEventListener('click', function() {

        // 버튼 값 담아주기
        let buttonValue = this.value;
        // 콘솔에 출력
        console.log(buttonValue);
        // Get the reference to the hidden input element
        let hiddenInput = document.getElementById('nonono');
        // Change the value of the hidden input
        hiddenInput.value = buttonValue;
        });
    });

</script>
</body>
</html>