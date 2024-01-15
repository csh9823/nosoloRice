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
            border: none;
            background-color: rgb(61,183,139);
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
        .yeslistbtn{
        background-color: rgb(61,183,139);
        border: none;
        }
        .nolisttbtn{
        background-color: #c93c3c;
        border: none;
        }
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
<%@ include file="../../temple/header/businessMenubar.jsp" %>
		<input type="hidden" id="bId" value="${sessionScope.BusinessUser.businessId}">
        <div class="col" style="overflow: auto;">
            <div class="row">
				<div class="col p-5">
				
				<div class="row">
	                <div class="col" style="font-size: 30px;">
	                    <strong>예약관리</strong>
	                </div>
                </div>

                <div class="row mt-3">
                    <div class="col fw-bold fs-4">예약 대기 리스트</div>
                </div>
                
     			<c:forEach var="booking" items="${booking}">
				<c:if test="${booking.bookingState eq '대기'}">
				<fmt:formatDate value="${booking.bookingTime}" pattern="HH:mm" var="bookingTime" />
                <div class="row px-3 my-2">
		                <div class="col-2 text-center ps-0" style="border: solid 1px black; border-right: none; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
		                    <p style="font-size: 30px; border-right: lightgray solid 1px; height: 100px;  margin-top: 15px; padding-top: 25px;">
		                    	${bookingTime}
		                    </p>
		                </div>
		
		                <div class="col border-top border-bottom border-dark d-flex flex-column align-items-start justify-content-center">
		                    <div class="row">
		                        <div class="col">
		                            <span style="font-size: 24px; font-weight:600;">${booking.bookingCount}명 예약</span>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col">
		                            <span class="fs-5">요청사항</span>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col">
		                            <span class="fs-5">${booking.bookingRequest}</span>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-2 text-center border-top border-bottom border-dark" style="background-color: rgb(61,183,139);">
		                <form action="bookingStateOk" method="get">
		                	<input type="hidden" name="bookingState" value="승인">
		                	<input type="hidden" name="bookingOkState" value="0">
		                	<input type="hidden" name="bookingOkTime" value="${booking.bookingTime}">
		                	<input type="hidden" name="bookingOkRequest" value="${booking.bookingRequest}">
		                	<input type="hidden" name="bookingOkCount" value="${booking.bookingCount}">
		                	<input type="hidden" name="bookingNo" value="${booking.bookingNo}">
		                	<input type="hidden" name="deposit" value="${booking.deposit}">
		                	<input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
		                	<button type="submit" class="yeslist pyeslist" data-id="${booking.bookingChatName}">승인</button>
		                </form>    	
		                </div>
		    
		                <div class="col-2 text-center border border-dark border-start-0 rounded-end" style="background-color: #c93c3c; border: 1px 0 solid black;">
		                    <button class="pnolist" style="border: none; background-color: #c93c3c;" value="${booking.bookingNo}" data-id="${booking.bookingChatName}">거절</button>
		                </div>
                </div>
        		</c:if>
                </c:forEach>
                
                
                
                <div class="row border-top border-dark mt-3 pt-3">
	                <div class="col fs-4">
	                    <strong>예약 승인 리스트</strong>
	                </div>
                </div>
				<c:forEach var="booking" items="${booking}">
				<c:if test="${booking.bookingState eq '승인'}">
				<fmt:formatDate value="${booking.bookingTime}" pattern="HH:mm" var="bookingTime" />
                <div class="row px-3 my-2">

                    <div class="col-2 ps-0 border border-dark border-end-0 rounded-start text-center">
                        <p style="font-size: 30px; border-right: lightgray solid 1px; height: 100px; margin-top: 15px; padding-top: 25px;">${bookingTime}</p>
                    </div>

                    <div class="col border-top border-bottom border-dark">
                        <div class="row mt-3">

                            <div class="col-auto">
                                <span style="font-size: 24px; font-weight:600; border-right: 1px solid lightgray; padding-right: 10px;">
                                	예약번호
                                </span>
                            </div>
                            
                            <div class="col">
                                <span style="font-size: 24px; font-weight:600;">${booking.bookingBookNo}</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <span class="fs-5">요청사항</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <span class="fs-5">${booking.bookingRequest}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 text-center border-top border-bottom border-dark" style="background-color: rgb(61,183,139); ">
                    <form action="Bookingok" method="get">
                        <button type="submit" class="yeslist yeslistbtn"><p class="pyeslist" style="font-size:27px;">방문완료</p></button>
                        <input type="hidden" name="bookingOkCount" value="${booking.bookingCount}">
                        <input type="hidden" name="bookingOkRequest" value="${booking.bookingRequest}">
                        <input type="hidden" name="bookingOkTime" value="${booking.bookingTime}">
                        <input type="hidden" name="bookingOkState" value="방문">
                        <input type="hidden" name="bookingNo" value="${booking.bookingNo}">
                        <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                        <input type="hidden" name="deposit" value="${booking.deposit}">
                        <input type="hidden" name="bookingState" value="방문완료">
                     </form>
                    </div>
    
                    <div class="col-2 text-center border border-dark border-start-0" style="background-color: #c93c3c; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                    <form action="Bookingok" method="get">
                        <button type="submit" class="nolist nolisttbtn"><p class="pnolist2">미방문</p></button>
                        <input type="hidden" name="bookingOkCount" value="${booking.bookingCount}">
                        <input type="hidden" name="bookingOkRequest" value="${booking.bookingRequest}">
                        <input type="hidden" name="bookingOkTime" value="${booking.bookingTime}">
                        <input type="hidden" name="bookingOkState" value="미방문">
                        <input type="hidden" name="bookingNo" value="${booking.bookingNo}">
                        <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                        <input type="hidden" name="deposit" value="${booking.deposit}">
                        <input type="hidden" name="bookingOkNo" value="${booking.bookingOkNo}">
                     </form>
                    </div>
                </div>
                </c:if>
                </c:forEach>
                </div>
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
                    <form action="bookingStateDelete" method="get" id="bookingStateDelete">
                        <input type="text" style="width: 500px; height: 250px; margin-left: 30px;" id="reason"><br>
                        <input type="hidden" name="bookingNo" value="" id="bookingNo">
                        <input type="hidden" id="roomId" value="">
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
    
    const openModal2Btns = document.querySelectorAll(".pnolist");
    
    const closeModal2Btn = document.getElementById("close-modal2");
  
    // 모달창 열기
	openModal2Btns.forEach((openModal2Btn) => {
	  openModal2Btn.addEventListener("click", () => {
	    if (modal2) {
	      modal2.style.display = "block";
	      document.body.style.overflow = "hidden"; // remove scrollbar
	    }
	  });
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
    
    openModal2Btns.forEach((openModal2Btn) => {
    	  openModal2Btn.addEventListener("click", (event) => {
    		  let buttonValue = event.target.value;
    		  let clickEl = event.target;
    		  let roomId = $(clickEl).attr("data-id");
    	        // 콘솔에 출력
    	        console.log(buttonValue);
    	        
    	        // 아이디가 bookingNo인걸 선택
    	        let hiddenInput = document.getElementById('bookingNo');
    	        
    	        // value를 선택된 버튼의 value로 변환
    	        hiddenInput.value = buttonValue;
    	        $("#roomId").val(roomId);
    	  });
    	});

    
    const loginId = $("#bId").val();
    console.log("사장님 loginId : ", loginId);
    
    //예약관리 페이지에 접속하면 웹소켓 서버에 연결한다. 서버 아이피 입력
    //let url = "ws://192.168.0.44:8090/app/booking/" + loginId;
    
    //학원꺼
    //let url = "ws://192.168.0.14:8081/app/booking/" + loginId;
    //let url = "ws://192.168.0.16:8081/app/booking/" + loginId;
    
    //집꺼
    let url = "ws://192.168.35.92:8081/app/booking/" + loginId;
			
			bookingSocket = new WebSocket(url);
			
			$(bookingSocket).on("open", function(event) {
				//모든 사용자는 서버에 접속 하면 메시지를 보낸다. { loginId : loginId, roomId : roomId} (사장의 경우 roomId : 자기 아이디)
				let conncectMsg = {
					type : 'connect',
					loginId : loginId,
					roomId : loginId
				}
				const jsonData = JSON.stringify(conncectMsg);
				bookingSocket.send(jsonData);
			});
			
			bookingSocket.addEventListener('message', function(e){
				//서버로부터 받은 json문자열 메시지를 자바스크립트로 객체로 변환.
				let msgObj = JSON.parse(e.data);
				
				if(msgObj.type == 'request'){
			        location.reload();
				}
				
				if(msgObj.type == 'userCancel'){
					console.log("시발 새로고침하라고!");
					location.reload();
				}
				
				
			});
			
			$(bookingSocket).on('close', function(event) {		
			    console.log('WebSocket 연결이 닫혔습니다.');
			});
		
			$(bookingSocket).on('error', function(event) {
			    console.error('WebSocket 오류:', event);
			});
    


    //승인 버튼 눌렀을 때
    $(document).on("click", ".yeslist", function(){
    	let roomId = $(this).attr("data-id");
		let approveMsg = {
				type : 'approve',
				roomId : roomId 
		}
		const jsonData = JSON.stringify(approveMsg);
		bookingSocket.send(jsonData);
    });
    
    //거절 사유입력 후 버튼 눌렀을 때
    $("#bookingStateDelete").on("submit", function(){
    	let reason = $("#reason").val();
    	let roomId = $(this).find("#roomId").val();
    	let rejectMsg = {
				type : 'reject',
				roomId : roomId,
				reason : reason
		}
		const jsonData = JSON.stringify(rejectMsg);
    	bookingSocket.send(jsonData);
    });    
</script>
</body>
</html>