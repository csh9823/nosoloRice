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
		//모든 사용자는 서버에 접속 하면 메시지를 보낸다. { loginId : loginId, roomId : roomId} (사장의 경우 roomId : 자기 아이디)
		let conncectMsg = {
			type : 'connect',
			loginId : 로그인아이디,
			roomId : 로그인아이디
		}
		const jsonData = JSON.stringify(conncectMsg);
		socket.send(jsonData);
	});
	socket.addEventListener('message', function(event){
		//사장은 무조건 request 메시지만 받는다.
		
		//받은 메시지를 자바스크립트 객체화		
		let chatObj = JSON.parse(event.data);
		let roomId = chatObj.roomId;
		
		//roomId가 현재 페이지에 존재하는지 확인 후 로직 처리
		if(roomId가 현재 페이지에 존재하지 않으면){
				//알림출력 후 리다이렉트
		}
		
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