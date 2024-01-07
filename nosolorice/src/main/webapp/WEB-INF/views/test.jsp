<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>
		테스트 사장님 예약관리페이지	
	</div>
	
	<div id="msgPrint">
		
	</div>
	
<script>

	const businessId = 'btest1'; 

	//학원꺼
	//let url = "ws://192.168.0.16:8081/app/booking/" + businessId;

	//집꺼
	let url = "ws://192.168.35.92:8081/app/booking/" + businessId;
	
	socket = new WebSocket(url);
	
	$(socket).on("open", function(event) {
		
	});
	socket.addEventListener('message', function(event){
		$("#msgPrint").text(event.data);
	});
	
	$(socket).on('close', function(event) {		
	    console.log('WebSocket 연결이 닫혔습니다.');
	});

	$(socket).on('error', function(event) {
	    console.error('WebSocket 오류:', event);
	});
	
	
</script>
</body>
</html>