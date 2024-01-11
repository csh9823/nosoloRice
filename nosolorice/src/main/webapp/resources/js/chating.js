$(function(){

	//예약제안 동의 창에서는 새로고침 할때 물어보기
	window.addEventListener('beforeunload', function (e) {
		if ($("#bookPropose").is(":visible")) {
	        let message = "지금 페이지를 새로고침 하거나\n다른 페이지로 이동한다면\n예약제안이 취소됩니다";
	        e.returnValue = message;
	        return message;
		}
    });
	
	
    //채팅창 항상 최하단 유지
    let chatContent = document.querySelector("#chatContent");
    chatContent.scrollTo(0, chatContent.scrollHeight);
	
	
	//부트스트랩 tool-tip 활성화
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    tooltipList.forEach(tooltip => tooltip.hide());

	let memberList = new Array();
	
	const loginId = $("#loginId").val();
	const loginNickName = $("#loginNickName").val();
	const profileImg = $("#loginProfileImg").val();
	let chatHistory = "";
	let chatRoomInfo = "";
	let isChatMember = false;
	let roomId = "";
	let isBooking = false;
	let bookingInfo = {};
	let bookComplete = false;
	let isSearch = false;
	let keyword = "";
	
	//채팅방 진입시 db의 chat_member테이블에서 로그인한 ID가 있는지 확인. (없으면 강퇴. 이거는 나중에 만들자 필요없을지도....)
	$.ajax({
		url: "/app/chatMemberCheck",
		data : "id=" + loginId,
		type : "get",
		dataType : "json",
		async : false,
		success : function(resData){
			console.log(resData);				
			chatHistory = resData.chatHistory;
			chatRoomInfo = resData.chatRoomInfo;
			isChatMember = resData.isChatMember;
			roomId = resData.roomId;
			bookingInfo = resData.bookingInfo;
		}, error : function(err) {
			console.log("통신오류", err);
		}
	});
	
	if(roomId == null){
		alert("올바르지 않은 접근입니다");
		location.replace("login");
		return;
	}
	
	chatAppend(chatHistory, loginId);

	let memberCount = chatRoomInfo.memberCount;
	$(".memberCount").text(memberCount);
	//있으면 room_id의 값을 가져온다. <-- 위 AJAX에서 해결
	//가져온 room_id를 이용해 chat_room 테이블에서 채팅방의 정보를 가져온다. <-- 위 AJAX에서 해결
	//roomId를 이용해 chat_history테이블에서 기존 채팅메시지들을 가져온다 <-- 위 AJAX에서 해결
	
	if(bookingInfo != null && bookingInfo.bookingState == '대기'){
		let regDate = new Date(bookingInfo.bookingTime);
		let formatRegDate = (regDate.getHours() < 13 ? "오전" + String(regDate.getHours()) + ":" + String(regDate.getMinutes()).padStart(2,'0') : "오후" + String(regDate.getHours() - 12) + ":" + String(regDate.getMinutes()).padStart(2,'0'));
		//우선 타이머 0으로 시작하는데 booking테이블에 regDate 컬럼 추가하고 시간 계산해서 보내주던지 하자
		timerStart(0, 0);
		
		$(".bookingBookNo").text(bookingInfo.bookingBookNo);
		$(".bookModalProposeTime").text(formatRegDate);
		$(".bookModalProposeMsg").text(bookingInfo.bookingRequest);
		$("#bookModalName").text(loginNickName);
		//ajax로 businessId에 해당하는 정보를 가져온다
		$.ajax({
			url : "/app/getBusinessUserInfo",
			data : "businessId=" + bookingInfo.businessId,
			type : "post",
			dataType : "json",
			success : function(res){
				$("#storeDetailModalBusinessId").val(res.businessId);
				$(".bookModalBusinessName").text(res.businessName);
				$(".bookModalBusinessProfile").attr("src", res.businessProfile);
				$(".bookModalTotalReviewCount").text(res.totalReviewCount);
				$(".bookModalTotalScore").text(res.totalScore);
				$(".bookModalPhone").text(res.phone);
				$(".bookModalMobile").text(res.mobile);
				$(".bookModalBusinessName").text(res.businessName);
			}, error : function(error){
				console.log("통신에러 : ", error);
			}
		});

		$("#storeDetailModal").addClass("d-none");
		$("#bookPropose").addClass("d-none");
		$("#bookSuccess").addClass("d-none");
		$("#bookFail").addClass("d-none");
		$("#bookWait").removeClass("d-none");
		$("#bookModal").removeClass("d-none");
		
	} 
	
	if(bookingInfo != null && bookingInfo.bookingState == '승인'){
		
		let businessId = bookingInfo.businessId;
		let businessInfo = {};
		$.ajax({
			url: "/app/getBusinessUserInfo",
			data : "businessId=" + businessId,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				businessInfo = resData;
			}, error : function(err){
				console.log(err);
			}
		});
		let bookNo = bookingInfo.bookingBookNo;
		let originTime = bookingInfo.bookingTime;
		let newdate = new Date(originTime);
		let bookingTime = (newdate.getHours() < 13 ? "오전 " + String(newdate.getHours()).padStart(2,'0') + "시 " + String(newdate.getMinutes()).padStart(2,'0') + "분" : "오후" + String(newdate.getHours() - 12) + ":" + String(newdate.getMinutes()).padStart(2,'0'));
		
		
		let businessName = businessInfo.businessName;
		let businessAddress = businessInfo.address1;
		let bookingRequest = bookingInfo.bookingRequest;
		let bookingNo = bookingInfo.bookingNo;
		let nickNames = "";
		//ajax로 booking_userlist테이블에서 bookNo에 해당하는 닉네임을 다 가져온다.
		$.ajax({
			url: "/app/getBookingUserList",
			data : "bookingNo=" + bookingNo,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				console.log(resData);
				$(resData).each(function(i, v){
					nickNames += (i==resData.length-1 ? v.nickName :  v.nickName + ", ");
				});
			}, error : function(err){
				console.log("통신오류", err)
			}
		});
		$("#bookSuccessMemberList").text(nickNames);
		
		
		$(".bookingBookNo").text(bookNo);
		$(".bookModalProposeTime").text(bookingTime);
		$(".bookModalBusinessName").text(businessName);
		$("#showStoreAddress").attr("data-bs-title", businessAddress);
		$("#bookSuccessMemberList").text(nickNames);
		$(".bookModalProposeMsg").text(bookingRequest);
		
		bookComplete = true;
		$("#storeDetailModal").addClass("d-none");
		$("#bookPropose").addClass("d-none");
		$("#bookWait").addClass("d-none");
		$("#bookFail").addClass("d-none");
		$("#bookSuccess").removeClass("d-none");
		$("#bookModal").removeClass("d-none");
		
	} 
	
	
	//가져온 채팅방정보에서 centerPoint 혹은 address를 이용해 ajax로 가게리스트를 가져온다
	if(chatRoomInfo.locationMethod == 'map'){
		
		let locationData = chatRoomInfo.locationInfo
		let formatString = locationData.replace(/\[|\]/g, "");
		let latlng = formatString.split(",");
		let lat = latlng[0];
		let lng = latlng[1];
		let sList = new Array();
		let sortType = $("#chatStoreSortSelect").val();
		$.ajax({
			url: "/app/getStoreListByMap",
			data : "lat=" + lat + "&lng=" + lng + "&sortType=" + sortType,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				sList = resData;
			}, error : function(err){
				console.log(err)
			}
		});
		storeListAppend(sList);
		
		
	} else {
		$("#chatStoreSortSelect option[value='distance']").remove();
		let locationData = chatRoomInfo.locationInfo;
		let sList = new Array();
		let sortType = $("#chatStoreSortSelect").val();
		
		$.ajax({
			url: "/app/getStoreListByAddress",
			data : "address=" + locationData + "&sortType=" + sortType,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				sList = resData;				
			}, error : function(err){
				console.log(err)
			}
		});
		storeListAppend(sList);		
	}
	
	//가져온 room_id를 이용해 웹소켓채팅서버를 연다 - 완료
	//학원꺼
	//let url = "ws://192.168.0.14:8081/app/chating/" + roomId;
	//let url = "ws://192.168.0.16:8081/app/chating/" + roomId;
	
	//집꺼
	let url = "ws://192.168.35.92:8081/app/chating/" + roomId;
	
	//현진이꺼
	//let url = "ws://192.168.0.44:8090/app/chating/" + roomId;
	
	console.log("roomId : ", roomId);
	console.log("url : ", url);
    socket = new WebSocket(url);
    
    $(socket).on("open", function(event) {
        let chatHistory = {
			nickName : loginNickName,
			chatType : "connect",
			roomId : roomId
        }
		let jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
	});
			
	socket.addEventListener('message', function(event){
		let chatObj = JSON.parse(event.data);
		let chatType = chatObj.chatType;
		
		if(chatType == 'connect'){
			let memberList = chatObj.memberList;
			let nickNames = "";
			$(memberList).each(function(i, v){
				nickNames += (nickNames == "" ? v : ", " + v);
			});
			$(".currentMemberList:not(#bookSuccessMemberList)").text(nickNames);
			$(".currentMemberCount").text(memberList.length);
			chatContent.scrollTo(0, chatContent.scrollHeight);
		}
		
		if(chatType == 'agree'){
			let agreeCount = chatObj.agreeCount;
			$("#bookAgreeBtn").val(agreeCount + "명 동의중...");
			$("#bookRejectBtn").val("취소");
			$("#bookAgreeBtn").prop("disabled", true);
		}
		
		if(chatType == 'agreeComplete'){
		
			let bookingBookNo = 0; 
			if(loginNickName == $("#bookModalName").text()){
				//booking테이블에 넣을 Booking객체 만들기
				let bookingCount = chatRoomInfo.memberCount;
				let bookingRequest = $(".bookModalProposeMsg:first").text().trim();
				let bookingState = '대기';
				let deposit = $(".bookModalDeposit:first").text().trim();
				let businessId = $("#storeDetailModalBusinessId").val();
				let bookingChatName = roomId;
				let bookingTime = $(".bookModalProposeTime:first").text().trim();

				let data = "bookingCount=" + bookingCount + "&bookingRequest=" + bookingRequest + "&bookingTime=" + bookingTime + "&bookingState=" + bookingState + "&businessId=" + businessId + "&deposit=" + deposit + "&bookingChatName=" + bookingChatName;
				//ajax통신으로 booking 테이블에 정보를 넣는다. db에서 새벽 4시가 되면 Booking 테이블 전체 삭제하게 하자
				$.ajax({
					url : "/app/addBooking",
					data : data,
					contentType: "application/x-www-form-urlencoded",
					type : "post",
					dataType : "json",
					async : false,
					success : function(resData){
						bookingBookNo = resData.bookNo;
					}, error : function(err) {
						console.log(err);
					}
				});
			$(".bookingBookNo").text(bookingBookNo);		
			
			//예약번호를 멤버전원에게 전달한다
			let chatHistory = {
				chatType : 'bookNo',
				bookNo : $(".bookingBookNo:first").text().trim()
			}
			const jsonData = JSON.stringify(chatHistory);
        	socket.send(jsonData);
			}
		}
		
		if(chatType == 'userClose'){
		
			if(isBooking && !$("#bookPropose").hasClass("d-none")){
				let closeNickName = chatObj.closeNickName;
				
				isBooking = false;
				bookComplete = false;
				$("#bookFailReason").html(`
					<p>거절 사유<br>`+ closeNickName +`님이 예약제안 도중<br>채팅방을 이탈하여<br>예약제안이 취소 되었습니다</p>
				`);
				$("#bookWait").addClass("d-none");
				$("#bookSuccess").addClass("d-none");
				$("#bookPropose").addClass("d-none");
				$("#bookFail").removeClass("d-none");
				
				let chatHistory = {
					nickName : loginNickName,
					chatType : "connect",
					roomId : roomId
			    }
				let jsonData = JSON.stringify(chatHistory);
			    socket.send(jsonData);
				
			}
			
		}
		
		
		if(chatType == 'bookNo'){
			
			let bookNo = chatObj.bookNo;
			let businessId = $("#storeDetailModalBusinessId").val();
			let bookingBookNo = bookNo;
			
			$(".bookingBookNo").text(bookNo);
			$("#bookRejectBtn").val("거절");
			$("#bookAgreeBtn").prop("disabled", false);
			$("#bookAgreeBtn").val("동의");
			$("#bookPropose").addClass("d-none");
			$("#bookWait").removeClass("d-none");
			
			//멤버 전원 booking_userlist에 자기 자신 등록

			$.ajax({
				url : "/app/addBookingUserList",
				data : "normalId=" + loginId + "&businessId=" + businessId + "&bookNo=" + parseInt($(".bookingBookNo:first").text().trim()),
				type : "post",
				dataType : "json",
				async : false,
				success : function(resData){
					console.log(resData);
				}, error : function(err) {
					console.log(err);
				}
			});
			
			//사장님과 통신할 웹소켓서버에 연결
			//학원꺼
			//let url = "ws://192.168.0.14:8081/app/booking/" + businessId;
			//let url = "ws://192.168.0.16:8081/app/booking/" + businessId;
			//집꺼
			let url = "ws://192.168.35.92:8081/app/booking/" + businessId;
			//현진이꺼		
			//let url = "ws://192.168.0.44:8090/app/booking/" + businessId;
			
			bookingSocket = new WebSocket(url);			
			
			$(bookingSocket).on("open", function(event) {
				
				//모든 사용자는 서버에 접속 하면 메시지를 보낸다. { loginId : loginId, roomId : roomId} (사장의 경우 roomId : 자기 아이디)
				let conncectMsg = {
					type : 'connect',
					loginId : loginId,
					roomId : roomId
				}
				
				const jsonData = JSON.stringify(conncectMsg);
        		bookingSocket.send(jsonData);
				
				//서버에 { type : 'request', businessId : businessId, roomId : roomId } 메시지 보내기
				if(loginNickName == $("#bookModalName").text()){
					let msg = {
						type : 'request',
						businessId : businessId,
						roomId : roomId
					}
					const jsonData = JSON.stringify(msg);
					
					setTimeout(function(){
		        		bookingSocket.send(jsonData);					
					}, 1000);
				}
				
				
			});
			
			bookingSocket.addEventListener('message', function(event){
			
				//사장님 승인/거절 응답대기 로직
				let msgObj = JSON.parse(event.data);
				if(msgObj.type=="approve"){
					//각자의 포인트 차감
					let usePoint = $(".bookModalDeposit:first").text().trim();
					$.ajax({
						url : "/app/payWithPoint",
						data : "normalId=" + loginId + "&deposit=" + usePoint,
						dataType : "json",
						type : "post",
						success : function(resData){
							console.log(resData);
						}, error : function(err){
							console.log("통신에러", err);
						}
					});
					
					let bookingNo = 0;
					$.ajax({
						url: "/app/chatMemberCheck",
						data : "id=" + loginId,
						type : "get",
						dataType : "json",
						async : false,
						success : function(resData){
							bookingNo = resData.bookingInfo.bookingNo;
						}, error : function(err) {
							console.log("통신오류", err);
						}
					});
					
					let nickNames = "";
					//ajax로 booking_userlist테이블에서 bookNo에 해당하는 닉네임을 다 가져온다.
					$.ajax({
						url: "/app/getBookingUserList",
						data : "bookingNo=" + bookingNo,
						type : "post",
						dataType : "json",
						async : false,
						success : function(resData){
							$(resData).each(function(i, v){
								nickNames += (i==resData.length-1 ? v.nickName :  v.nickName + ", ");
							});
						}, error : function(err){
							console.log("통신오류", err)
						}
					});
					$("#bookSuccessMemberList").text(nickNames);		
				
					bookComplete = true;
					$("#bookWait").addClass("d-none");
					$("#bookFail").addClass("d-none");
					$("#bookPropose").addClass("d-none");
					$("#bookSuccess").removeClass("d-none");
				}
				
				
				if(msgObj.type=="reject"){
					isBooking = false;
					bookComplete = false;
					let reason = msgObj.reason;
					$("#bookFailReason").html(`
						<p>거절 사유<br><pre>`+ reason +`</pre></p>
					`);
					$("#bookWait").addClass("d-none");
					$("#bookSuccess").addClass("d-none");
					$("#bookPropose").addClass("d-none");
					$("#bookFail").removeClass("d-none");
					
					let msg = {
						chatType : 'denied'
					}
					const jsonData = JSON.stringify(msg);
	        		socket.send(jsonData);
					
				}
			
			});
			
			$(bookingSocket).on('close', function(event) {		
			    console.log('WebSocket 연결이 닫혔습니다.');
			});
		
			$(bookingSocket).on('error', function(event) {
			    console.error('WebSocket 오류:', event);
			});
			
			timerStart(0, 0);
		}
		if(chatType == 'reject'){
			//예약 실패 화면으로 이동
            isBooking = false;
            $("#bookRejectBtn").val("거절");
		    $("#bookPropose").addClass("d-none"); 
			$("#bookAgreeBtn").prop("disabled", false);
			$("#bookAgreeBtn").val("동의");
		    $("#bookWait").addClass("d-none");
		    $("#bookSuccess").addClass("d-none");
			$("#bookFailReason").html(`
				<p>예약제안을<br>거절한 멤버가 있어<br>예약이 취소되었습니다</p>
			`);
			$("#bookFail").removeClass("d-none");
			return;
		}
		
		if(chatType == 'quitPropose'){
			isBooking = false;
			$("#bookRejectBtn").val("거절");
			$("#bookPropose").addClass("d-none");
			$("#bookAgreeBtn").prop("disabled", false);
			$("#bookAgreeBtn").val("동의");
		    $("#bookWait").addClass("d-none");
		    $("#bookSuccess").addClass("d-none");
			$("#bookFailReason").html(`
				<p>예약제안 도중<br>채팅방을 나간 멤버가 있어<br>예약이 취소되었습니다</p>
			`);
			$("#bookFail").removeClass("d-none");
			
		}
		
		if(chatType == 'quitChatRoom'){
			
			//중간에 한명이 나가면 
			$(".memberCount").text(paserInt($(".memberCount:first").text()) - 1);
			$(".currentMemberCount").text(parseInt($(".currentMemberCount").text()) - 1);
			memberCount--;
			
		}
		
		if(chatType == 'userCancel'){
			//멤버 전원다 booking_userlist에서 자신 지우기
			$.ajax({
    			url : "/app/deleteBookingUserList",
    			data : "normalId=" + loginId,
    			type : "post",
    			dataType : "json",
    			async : false,
    			success : function(resData) {
    				console.log(resData);
    			}, error : function(err){
    				console.log(err);
    			}
    		});
		
			if(loginNickName == $("#bookModalName").text()){
				setTimeout(function(){
		    		//Booking 테이블에서 business_id가 businessId 이고 booking_book_no가 bookingBookNo인 행을 찾아 삭제
		    		let businessId = $("#storeDetailModalBusinessId").val();
		    		let bookingBookNo = $(".bookingBookNo:first").text().trim();
	
		    		$.ajax({
		    			url : "/app/deleteBooking",
		    			data : "businessId=" + businessId + "&bookingBookNo=" + bookingBookNo,
		    			type : "post",
		    			dataType : "json",
		    			async : false,
		    			success : function(resData) {
		    				console.log(resData);
		    			}, error : function(err){
		    				console.log(err);
		    			}
		    		});
				}, 1500);
			}
						
			//예약 실패 화면으로 이동
			$("#bookRejectBtn").val("거절");
			$("#bookWait").addClass("d-none");
			$("#bookFailReason").html(`
				<p>예약대기 중<br>취소한 멤버가 있어<br>예약이 취소되었습니다.</p>
			`);
			$("#bookFail").removeClass("d-none");
			return;
		}
		
		let chatId = chatObj.normalId;
		let chatNickName = chatObj.nickName;
		let chatMsg = chatObj.chatMessage;
		let regDate = new Date(chatObj.chatRegDate);
		
		let chatProfileImg = chatObj.profileImg;
		let chatRegDate = (regDate.getHours() < 13 ? "오전" + String(regDate.getHours()) + ":" + String(regDate.getMinutes()).padStart(2,'0') : "오후" + String(regDate.getHours() - 12) + ":" + String(regDate.getMinutes()).padStart(2,'0'));
		let lastChat = $("#chatDiv .chatRow:last");
		
		if(lastChat.attr("data-time") == chatRegDate && lastChat.attr("data-id") == chatId) lastChat.find(".regDate").text("");
		
		switch(chatType){
			case 'msg' : 
			
				if(chatId == loginId){
				
					if(lastChat.attr("data-id") != loginId){
						$("#chatDiv").append(`
		                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
		                        <div class="col"></div>
		                        <div class="col-5">
		                            <div class="row my-1 d-flex justify-content-end">
		                            	<div class="col-auto p-0 me-1 d-flex align-items-end">
		                            		<span style="font-size: 12px;" class="regDate">
		                                    ` + chatRegDate + `
		                                    </span>
		                            	</div>
		                                <div class="col-auto p-0 me-4">
		                                    <div class="sendChat px-3 py-2">
		                                    ` + chatMsg +`
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
						`);
						
					} else {
						
						$("#chatDiv").append(`
		                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
		                        <div class="col"></div>
		                        <div class="col-5">
		                            <div class="row justify-content-end">
		                            	<div class="col-auto p-0 me-1 d-flex align-items-end">
		                            		<span style="font-size: 12px;" class="regDate">
		                                    ` + chatRegDate + `
		                                    </span>
		                            	</div>
		                                <div class="col-auto p-0 me-4">
		                                    <div class="sendChat2 text-center px-3 py-2">
		                                    ` + chatMsg + `
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
					`);
					}
					
					
					
				} else {
				
					if(lastChat.attr("data-id") != chatId){
					$("#chatDiv").append(`
	                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
	                        <div class="col-auto p-0">
	                            <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">                                        
	                        </div>
	                        <div class="col-5">
	                            <div class="row">
	                                <div class="col fs-5 fw-bold p-0 ms-4">
	                                ` + chatNickName + `
	                                </div>
	                            </div>
	                            <div class="row my-1">
	                                <div class="col-auto p-0 ms-4">
	                                    <div class="receiveChat px-3 py-2">
	                                    ` + chatMsg + `
	                                    </div>
	                                </div>
                                	<div class="col-auto p-0 ms-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>
					`);
					} else {
						$("#chatDiv").append(`
	                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
	                        <div class="col-auto p-0">
	                        	<div style="width:70px;"></div>                                        
	                        </div>
	                        <div class="col-5">
	                            <div class="row">
	                                <div class="col-auto p-0 ms-4">
	                                    <div class="receiveChat2 px-3 py-2">
	                                    ` + chatMsg + `
	                                    </div>
	                                </div>
	                                <div class="col-auto p-0 ms-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>
					`);
					}
				}
			break;
			case 'img' : 
				if(chatId == loginId){
				
				
					if(lastChat.attr("data-id") != loginId){
					$("#chatDiv").append(`
                        <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                            <div class="col">
                                <div class="row justify-content-end">
                                	 <div class="col-auto p-1 me-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
	                            	
                                    <div class="col-auto p-0 me-4">
                                        <div class="sendImgChat py-2">
                                        ` + chatMsg + `
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
					`);
					} else {
						$("#chatDiv").append(`
                        <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                            <div class="col">
                                <div class="row justify-content-end">
                                	 <div class="col-auto p-1 me-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
                                    <div class="col-auto p-0 me-4">
                                        <div class="sendImgChat py-2">
                                            ` + chatMsg + `
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					`);
					}
					
					
				} else {
				
					if(lastChat.attr("data-id") != chatId){
					$("#chatDiv").append(`
                        <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                            <div class="col-auto p-0">
                                <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col fs-5 fw-bold p-0 ms-4">
                                    ` + chatNickName + `
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-auto p-0 ms-4">
                                        <div class="receiveImgChat py-2">
                                            ` + chatMsg + `
                                        </div>
                                    </div>
                                	<div class="col-auto p-1 ms-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
                                </div>
                            </div>
                        </div>
					`);	
					} else {
						$("#chatDiv").append(`
                        <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                            <div class="col-auto p-0">
                                <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col fs-5 fw-bold p-0 ms-4">
                                    ` + chatNickName + `
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-auto p-0 ms-4">
                                        <div class="receiveImgChat py-2">
                                            ` + chatMsg + `
                                        </div>
                                    </div>
                                    <div class="col-auto p-1 ms-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
                                </div>
                            </div>
                        </div>
					`);	
					}
								
				}
			break;
			case 'info' : 
				$("#chatDiv").append(`
                    <div class="row mt-4 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col">
                            <div class="row justify-content-center">
                                <div class="col p-0 col-9 text-center text-secondary storeChatDiv" style="font-size: 14px;cursor: pointer;">
                                    <span class="text-dark fs-5"><b>` + chatNickName + `</b>님이 소개하셨어요!</span>
                                </div>
                            </div>
                            <div class="dragStore row justify-content-center">
                                <div class="col bg-danger rounded col-9 storeChatDiv" style="height: 125px; overflow: hidden; cursor: pointer;">
                                    <div class="row">
										`+ chatMsg +`
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				`);
			break;
			case 'book' : 
			
				isBooking = true;
			
				let bookChatInfo = JSON.parse(chatMsg);
				let businessId = bookChatInfo.businessId;
				let proposeTime = bookChatInfo.proposeTime;
				let proposeMsg = bookChatInfo.proposeMsg;
				let businessInfo = {};
				let normalInfo = {};
								
				let formatDate = new Date();
				let timeArr = proposeTime.split(":");
				let hours = parseInt(timeArr[0]);
				let minutes = parseInt(timeArr[1]);
				formatDate.setHours(hours);
				formatDate.setMinutes(minutes);
				
				let bookTime = (formatDate.getHours() < 13 ? "오전 " + String(formatDate.getHours()) + "시 " + String(formatDate.getMinutes()).padStart(2,'0') + "분" : "오후 " + String(formatDate.getHours() - 12) + "시" + String(formatDate.getMinutes()).padStart(2,'0') + "분");
				
				if(proposeMsg == null || proposeMsg == '') proposeMsg = '요청사항 없음';
				
				$.ajax({
					url: "/app/getBusinessUserInfo",
					data : "businessId=" + businessId,
					type : "post",
					dataType : "json",
					async : false,
					success : function(resData){
						businessInfo = resData;
					}, error : function(err){
						console.log(err);
					}
				});
				let businessName = businessInfo.businessName;
				let businessProfile = businessInfo.businessProfile;
				let totalScore = businessInfo.totalScore;
				let totalReviewCount = businessInfo.totalReviewCount;
				let deposit = businessInfo.deposit;
				let xpoint = businessInfo.xpoint;
				let ypoint = businessInfo.ypoint;
				
				$.ajax({
					url: "/app/getNormalUserInfo",
					data : "normalId=" + loginId,
					type : "post",
					dataType : "json",
					async : false,
					success : function(resData){
						normalInfo = resData;
					}, error : function(err){
						console.log(err);
					}
				});				
				
				$("#storeDetailModalBusinessId").val(businessId);
				
				$("#bookModalName").text(chatNickName);

				let businessName2 = businessInfo.businessName;
				$(".bookModalBusinessName").text(businessName2);

				let businessProfile2 = businessInfo.businessProfile;
				$(".bookModalBusinessProfile").attr("src", "resources/upload/" + businessProfile2);

				let totalScore2 = businessInfo.totalScore;
				$(".bookModalTotalScore").text(totalScore2);

				let totalReviewCount2 = businessInfo.totalReviewCount;
				$(".bookModalTotalReviewCount").text(totalReviewCount2);

				let deposit2 = businessInfo.deposit;
				$(".bookModalDeposit").text(deposit2);
				
				let phone2 = businessInfo.phone;
				$(".bookModalPhone").text(phone2);
				
				let mobile2 = businessInfo.mobile;
				$(".bookModalMobile").text(mobile2);
				$("#bookModalMyPoint").text(normalInfo.myPoint);
	
				$(".bookModalProposeTime").text(bookTime);
				$(".bookModalProposeMsg").text(proposeMsg);
				
				$("#showStoreAddress").attr("data-bs-title", businessInfo.address1+ " " + businessInfo.address2);
				let tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
			   	let tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
			   	tooltipList.forEach(tooltip => tooltip.hide());
				
				
				$("#storeDetailModal").addClass("d-none");
				$("#bookFail").addClass("d-none");
				$("#bookPropose").removeClass("d-none");
        		$("#bookModal").removeClass("d-none");
        		
        		//맵호출 함수
				getBookMap([xpoint, ypoint], businessName2);
			
				$("#chatDiv").append(`
                    <div class="row mt-4 chatRow">
                        <div class="col">
                            <div class="dragStore row justify-content-center">
                                <div class="col-9 bg-primary py-2 rounded">
                                    <div class="row">
                                        <div class="col text-white p-2 text-center">
                                            <p class="m-0 p-0 fs-5">
                                                <b>` + chatNickName + `</b>님이 예약을 제안했어요!
                                            </p>
                                            <p class="m-0 p-0">
                                                오른쪽 예약창을 확인해주세요
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				`);
			break;
		}
		
		//화면 최하단으로 이동
		chatContent.scrollTo(0, chatContent.scrollHeight);
		$("#bookAgreeBtn").prop("disabled", false);
		
	});

	$(socket).on('close', function(event) {
	    console.log('WebSocket 연결이 닫혔습니다.');
	});

	$(socket).on('error', function(event) {
	    console.error('WebSocket 오류:', event);
	});
	
	//채팅이 입력되면 db의 chat_history에 저장한다.이때 클라이언트에서 서버로 보내는 메시지객체에 들어갈 타입은(msg, img, info, book) 4가지로 나뉜다.(더 늘어날수도 있음)
	
	//예약이 완료되면 book테이블에 정보를 저장하고 예약시간을 기준으로 채팅방 소멸시간을 설정한 후 chat_room테이블에 입력한다.
	
	//예약완료여부를 체크하여 완료시 오른쪽에 예약안내 모달을 띄운다. 이 모달을 닫을 수 없다.(아직 고려중...)
	 
	
    //... 텍스트 애니메이션
    const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));
    const textAnimation1 = async () => {
        await $(".chatTextAnimation1").text(".");
        await delay(500);
        await $(".chatTextAnimation1").text("..");
        await delay(500);
        await $(".chatTextAnimation1").text("...");
        await delay(500);
        await $(".chatTextAnimation1").text("..");
        await delay(500);
        await $(".chatTextAnimation1").text(".");
        await delay(500);
        await $(".chatTextAnimation1").text("");
        await delay(500);
    };
    textAnimation1();
    setInterval(function(){
        textAnimation1();
    }, 3000);

    //가게창 검색어 입력이 focus됬을 때
    $("#chatStoreSearchInput").on("focus", function(){
        $("#chatStoreSearchDiv").css("border-bottom", "1px solid black");
        $("#chatStoreSearchBtn").css("color", "black");
        $("#chatStoreSearchInput").css("color", "black");
    });

    //가게창 검색어 입력이 blur됬을 때
    $("#chatStoreSearchInput").on("blur", function(){
        $("#chatStoreSearchDiv").css("border-bottom", "1px solid #aaa");
        $("#chatStoreSearchBtn").css("color", "#aaa");
        $("#chatStoreSearchInput").css("color", "#aaa");
    });

    //가게창 검색어 부모 Div가 hover됬을 때
    $('#chatStoreSearchDiv, #chatStoreSearchBtn').hover(
        function() {
            $("#chatStoreSearchDiv").css("border-bottom", "1px solid black");
            $("#chatStoreSearchBtn").css("color", "black");
            $("#chatStoreSearchInput").css("color", "black");
        },
        function() {
            if(!$("#chatStoreSearchInput").is(":focus")){
                $("#chatStoreSearchDiv").css("border-bottom", "1px solid #aaa");
                $("#chatStoreSearchBtn").css("color", "#aaa");
                $("#chatStoreSearchInput").css("color", "#aaa");
            }
        }
	);
	
	$("#chatStoreSearchBtn").on("click", function(){
		$("#storeSearchForm").submit();	
	})
	
	$("#storeSearchForm").on("submit", function(e){
		e.preventDefault();
		isSearch = true;
		keyword = $("#chatStoreSearchInput").val();
		if(keyword.length == 0 || keyword == null) return;
		searchStoreListReset(chatRoomInfo, keyword);
	});
	
	$(document).on("click", "#searchBackBtn", function(){
		isSearch = false;
		storeListReset(chatRoomInfo);		
	});
	
	$("#chatStoreSortSelect").on("change", function(){
		if(isSearch) searchStoreListReset(chatRoomInfo, keyword);
		else storeListReset(chatRoomInfo);
	});
        
    //여기부터 채팅기능 ----------------------------------------------------------------------------------------------------------------------------------------

    //채팅입력창이 focus됬을 떄
    $("#chatMessageInput").on("focus", function(){
        $('#chatImgUploadBtn').css("color", "black");
        $('#chatSendBtn').css("color", "black");
        $("#chatInputBottomBorder").css("border-bottom", "1px dashed #777");
        $("#chatInputDiv").css("border", "1px solid black");
        $("#chatMessageInput").css("color", "black");
    });

    //채팅입력창이 blur됬을 때
    $("#chatMessageInput").on("blur", function(){
        $('#chatImgUploadBtn').css("color", "#777");
        $('#chatSendBtn').css("color", "#777");
        $("#chatInputBottomBorder").css("border-bottom", "1px dashed #dfdfdf");
        $("#chatInputDiv").css("border", "1px solid #777");
        $("#chatMessageInput").css("color", "#777");
    });

    //채팅입력창이 hover됬을 때
    $('#chatInputDiv').hover(
        function() {
            $('#chatImgUploadBtn').css("color", "black");
            $('#chatSendBtn').css("color", "black");
            $("#chatInputBottomBorder").css("border-bottom", "1px dashed #777");
            $("#chatInputDiv").css("border", "1px solid black");
            $("#chatMessageInput").css("color", "black");
        },
        function() {
            if(!$("#chatMessageInput").is(":focus")){
                $('#chatImgUploadBtn').css("color", "#777");
                $('#chatSendBtn').css("color", "#777");
                $("#chatInputBottomBorder").css("border-bottom", "1px dashed #dfdfdf");
                $("#chatInputDiv").css("border", "1px solid #777");
                $("#chatMessageInput").css("color", "#777");
            }
        }
    );

    //채팅 입력창 이미지업로드 버튼이 hover됬을 때
    $('#chatImgUploadBtn').hover(
        function() {
            $('#chatImgUploadBtn').removeClass("bi-camera");
            $('#chatImgUploadBtn').addClass("bi-camera-fill");
        },
        function() {
            $('#chatImgUploadBtn').removeClass("bi-camera-fill");
            $('#chatImgUploadBtn').addClass("bi-camera");
        }
    );

    //채팅 입력창 보내기 버튼이 hover됬을 때
    $('#chatSendBtn').hover(
        function() {
            $('#chatSendBtn').removeClass("bi-send");
            $('#chatSendBtn').addClass("bi-send-fill");
        },
        function() {
            $('#chatSendBtn').removeClass("bi-send-fill");
            $('#chatSendBtn').addClass("bi-send"); 
        }
    );
    
    //채팅 inputForm이 submit 될 때
    $("#chatInputForm").on("submit", function(e){
        e.preventDefault();
        
        
        //여기에서 채팅메시지를 객체로 만들어 AJAX통신으로 DB에 저장한다
        const msg = $("#chatMessageInput").val();
        if(msg.length == 0 || msg.trim().length == 0) return;
        
        let chatHistory = {
			normalId : loginId,
			chatName : roomId,
			chatType : "msg",
			chatMessage : msg
        }
        $.ajax({
        	url : "/app/addChatMessage",
        	data : chatHistory,
        	type : "post",
        	dataType : "json"
        });
        
        chatHistory = {
			normalId : loginId,
			nickName : loginNickName,
			chatName : roomId,
			chatType : "msg",
			chatMessage : msg,
			chatRegDate : new Date(),
			profileImg : profileImg 
        }
        
        //채팅서버에 send
        const jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
        
        $("#chatMessageInput").val("");
        $("#chatMessageInput").focus();
    });

    //채팅 입력창 이미지업로드 버튼을 눌렀을 때
    $("#chatImgUploadBtn").on("click", function(){
        $("#chatImgUpload").click();
    });
    
    //이미지 업로드 기능
    $("#chatImgUpload").on("change", function(){
    
    	let imgFileName = "";
    	 
		//change된 이미지를 서버에 업로드 하고 경로 반환 
		const fd = new FormData();
		const file = $("#chatImgUpload")[0].files[0];
		fd.append('image',file);
		
		if(this.files.length <= 0){
			return $(this).val("");			
		}

       $.ajax({

		url : "chatImgUpload",
		data : fd,
		dataType : "json",
		type : "post",
		enctype : "multipart/form-data",
		processData: false,
		contentType : false,
		async : false,
		success : function(resData){
			imgFileName = resData.fileName;
       }, error : function(err){
			console.log("통신에러", err);
       }
       });
       
    let imgMsg = '<img src="resources/upload/' + imgFileName + '" style="max-width:200px;max-height:500px;" class="rounded">';
    
    	//chatMessage를 html코드로 저장 
        let chatHistory = {
			normalId : loginId,
			chatName : roomId,
			chatType : "img",
			chatMessage : imgMsg
        }
        //ajax로 채팅객체 db에 저장
        $.ajax({
        	url : "/app/addChatMessage",
        	data : chatHistory,
        	type : "post",
        	dataType : "json"
        });
        //서버에 채팅을 보낸다
        chatHistory = {
			normalId : loginId,
			nickName : loginNickName,
			chatName : roomId,
			chatType : "img",
			chatMessage : imgMsg,
			chatRegDate : new Date(),
			profileImg : profileImg 
        }
        //채팅서버에 send
        let jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);	
        $(this).val("");        
    });
    
    //채팅본문에 프로필이미지를 눌렀을 때
    $(document).on("click", ".chatProfileImg", function (e) {
        $("#userConfigBox").addClass("d-none");
        		
		let userNickName = $(this).parent().next().children().eq(0).children().text().trim();
		let userId = $(this).parent().parent().attr("data-id");
        //e.target의 bottom = userConfig박스의 top

        const height = this.height;
        let top = $(this).position().top + $(this).height();
        let left = $(this).position().left;
        $("#userConfigBox").css("left", left + "px");
        $("#userConfigBox").css("top", top + "px");
        $("#userConfigBox").removeClass("d-none");
		$("#userConfigBox").attr("data-nick", userNickName);
		$("#userConfigBox").attr("data-id", userId);
    });

    //채팅본문을 눌럿을 떄
    $("#chatContent").on("click", function(e){
        if(! e.target.classList.contains("chatProfileImg") && ! e.target.classList.contains("reportBtn") && ! e.target.classList.contains("blockBtn") ){
            $("#userConfigBox").addClass("d-none");
        }
    });


    //신고모달 닫기
    $(".reportModalCloseBtn").on("click", function(){
        $("#reportModal").addClass("d-none");    
    });

    //차단모달 닫기
    $(".blockModalCloseBtn").on("click", function(){
        $("#blockModal").addClass("d-none");
    });
    
    //신고하기 모달열기
    $(".reportBtn").on("click", function(){
    	$("#reportContent").val("");
    	$("#reportImgFile").val("");
        $("#blockModal").addClass("d-none");
        $("#reportModal").removeClass("d-none");
        $("#userConfigBox").addClass("d-none");
        
        let id = $("#userConfigBox").attr("data-id");
        let nickName = $("#userConfigBox").attr("data-nick");
        
        $("#reportTargetId").val(id);
        $("#reportTargetNick").text(nickName);
        
    });

    //차단하기 모달열기
    $(".blockBtn").on("click", function(){
        $("#reportModal").addClass("d-none");
        $("#blockModal").removeClass("d-none");
        $("#userConfigBox").addClass("d-none");
        
        let id = $("#userConfigBox").attr("data-id");
        let nickName = $("#userConfigBox").attr("data-nick");
        
        $("#blockTargetId").val(id);
        $(".blockTargetNick").text(nickName);
        
    });

    //신고서브밋 클릭
    $(".reportModalSubmitBtn").on("click", function(){
        if($("#reportContent").val().length <= 0){
            alert("신고내용을 입력해주세요");
            return;
        }
    	let reportContent = $("#reportContent").val();
        let reportPicture = "";
        let reportReporter = loginId;
        let reportAttacker = $("#reportTargetId").val();
        //첨부이미지가 있으면 이미지부터 업로드
        if($("#reportImgFile").val().length > 0){
			const fd = new FormData();
			const file = $("#reportImgFile")[0].files[0];
			fd.append('image',file);
	
	       $.ajax({
				url : "chatImgUpload",
				data : fd,
				dataType : "json",
				type : "post",
				enctype : "multipart/form-data",
				processData: false,
				contentType : false,
				async : false,
				success : function(resData){
					reportPicture = resData.fileName;
		       }, error : function(err){
					console.log("통신에러", err);
		       }
	       });     
        }
        $.ajax({
        	url : "/app/addChatMemberReport",
        	data : "reportContent=" + reportContent + "&reportPicture=" + reportPicture+ "&reportReporter=" + reportReporter + "&reportAttacker=" + reportAttacker,
        	type : "post",
        	dataType : "json",
        	async : false,
        	success : function(resData){
        		console.log(resData);        		
        	}, error : function(err) {
        		console.log("통신에러 : ", err);
        	}
        	
        });
        $("#reportTargetName").text($("#reportTargetNick").text().trim());
        $("#reportModal").addClass("d-none");
        $("#reportCompleteModal").removeClass("d-none");
    });

    //신고완료 확인버튼
    $(".reportCompleteModalCloseBtn").on("click", function(){
        $("#reportCompleteModal").addClass("d-none");
    });

    //차단서브밋 클릭
    $(".blockModalSubmitBtn").on("click", function(){
    
		let blockHistoryNo;
		let blockDate;
		let blockState = "차단";
		let blocker = loginId;
		let blockAttacker = $("#blockTargetId").val();
		let nick = $(".blockTargetNick:first").text().trim();
    	if(confirm(nick + "님을 정말 차단 하시겠습니까?")){
	        $("#blockModal").addClass("d-none");
	                
		
			$.ajax({
	        	url : "/app/addChatMemberBlock",
	        	data : "blockState=" + blockState + "&blocker=" + blocker+ "&blockAttacker=" + blockAttacker,
	        	type : "post",
	        	dataType : "json",
	        	async : false,
	        	success : function(resData){
	        		console.log(resData);        		
	        	}, error : function(err) {
	        		console.log("통신에러 : ", err);
	        	}
	        });
	        
	        $("#blockCompleteModal").removeClass("d-none");
        }
    });

    //차단완료 확인버튼
    $(".blockCompleteModalCloseBtn").on("click", function(){
        $("#blockCompleteModal").addClass("d-none");
    });

    //채팅창 나가기 확인 모달열기
    $("#chatQuitBtn").on("click", function(){
        $("#chatRoomQuitModal").removeClass("d-none");
    });

    //채팅창 나가기 확인 모달 취소화기
    $("#chatQuitCancelBtn").on("click", function(){
        $("#chatRoomQuitModal").addClass("d-none");
    });

    //채팅창 나가기 확인 모달 서브밋
    $("#chatQuitSubmitBtn").on("click", function(){
        
        if(bookComplete){
        	location.href="mainPage";
        } else {
        	
        	//chat_member 테이블에서 자기 자신 삭제
        	$.ajax({
        		url : "/app/deleteChatMember",
        		data : "normalId=" + loginId,
        		type : "post",
        		dataType : "json",
        		async : false,
        		success : function(resData){
        			console.log(resData);
        		}, error : function(err){
        			console.log(err);
        		}
        	});
        	
			let chatHistory = {
				normalId : loginId,
				nickName : loginNickName,
				chatName : roomId,
				chatType : "quitChatRoom",
				chatRegDate : new Date(),
        	}
        	const jsonData = JSON.stringify(chatHistory);
        	socket.send(jsonData);
        	//socket.disconnect 하고 main페이지로 이동
        	socket.close();
        	location.replace("mainPage");
        }
        
    });

    //여기서부터 가게 상세보기 모달 =======================================================================================================================

	//storeChatDiv 클릭이벤트
	$(document).on("click", ".storeChatDiv", function(){
		let storeBusinessId = $(this).find(".storeChatDivBusinessId").val();
		let target = $("#storeRow").find("input[type='hidden'][value='"+ storeBusinessId + "']");
		target.click();
	});
	
	$("#proposeStoreInfo").on("click", function(){
     	let storeBusinessId = $("#storeDetailModalBusinessId").val();
		let target = $("#storeRow").find("input[type='hidden'][value='"+ storeBusinessId + "']");
		target.click();
	});

    //가게 상세보기 모달 열기
    $(document).on("click", ".storeDiv", function(){

		let storeBusinessId = $(this).find(".storeBusinessId").val();
		$("#storeDetailModalBusinessId").val(storeBusinessId);
		
    	let storeBusinessName = $(this).find(".storeBusinessName").val();
    	$(".storeBusinessNameDiv").text(storeBusinessName);
    	
    	let storeBusinessProfile = $(this).find(".storeBusinessProfile").val();
    	$("#storeBusinessProfile").empty();
    	$("#storeBusinessProfile").append(`<img src="resources/upload/`+storeBusinessProfile+`" class="rounded" style="width:130px;height:130px;">`);
    	
    	let storeTotalScore = $(this).find(".storeTotalScore").val();
    	$("#storeTotalScore").text(storeTotalScore);
    	
    	let storeTotalReviewCount = $(this).find(".storeTotalReviewCount").val();
    	$("#storeTotalReviewCount").text(storeTotalReviewCount);
    	
    	let storePhone = $(this).find(".storePhone").val();
    	$("#storeInfoPhone").text(storePhone);
    	
    	let storeAddress1 = $(this).find(".storeAddress1").val();
    	$("#storeInfoAddress").text(storeAddress1);
    	
    	let storeOpenTime = $(this).find(".storeOpenTime").val();
    	$("#storeInfoOpenTime").text(storeOpenTime);
    	
    	let storeCloseTime = $(this).find(".storeCloseTime").val();
    	$("#storeInfoCloseTime").text(storeCloseTime);
    	
    	let storeBreakTime = $(this).find(".storeBreakTime").val();
    	$("#storeInfoBreakTime").text(storeBreakTime);
    	
    	let storeIntroduction =$(this).find(".storeIntroduction").html();
    	$("#storeIntroduction").empty();
    	if(storeIntroduction == 'null') $("#storeIntroduction").append(`<span>등록된 가게 소개가 없습니다</span>`);    	
		else $("#storeIntroduction").append(storeIntroduction);
		$("#storeIntroduction").find("img").each(function(i,v){
			$(this).css("max-width", "100%");
		});
		
    	let storeDeposit = $(this).find(".storeDeposit").val();
    	$("#storeDeposit").text(storeDeposit + " 포인트");
    	
    	let xpoint = $(this).find(".xPoint").val();
    	$("#storeDetailModalXPoint").val(storeBusinessId);
    	let ypoint = $(this).find(".yPoint").val();
    	$("#storeDetailModalYPoint").val(storeBusinessId);
    	
    	
    	$("#storeDeatilHomeContent").removeClass("d-none");
    	$("#storeDeatilMenuContent").addClass("d-none");
    	$("#storeDeatilReviewContent").addClass("d-none");
    	$("#storeDeatilBookContent").addClass("d-none");
        $("#storeDetailModal").removeClass("d-none");
		tooltipList.forEach(tooltip => tooltip.hide());
    });

    //모달 닫기
    $("#storeDetailModalCloseBtn").on("click", function(){
        $("#storeDetailModal").addClass("d-none");
    });

    $("#storeDetailModalInfoBtn").hover(
    function(){
        $("#storeDetailModalInfoDiv").removeClass("d-none");
    }, function(){
        $("#storeDetailModalInfoDiv").addClass("d-none");
    });

    //가게상세보기 모달 하단 메뉴버튼 클릭이벤트 - 홈
    $("#storeDetailModalHomeBtn").on("click", function(){
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilHomeContent").removeClass("d-none");    
    });
    
    //가게상세보기 모달 하단 메뉴버튼 클릭이벤트 - 메뉴
    $("#storeDetailModalMenuBtn").on("click", function(){
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilMenuContent").removeClass("d-none");
        
        //ajax로 해당 businessId가 가지고 있는 메뉴를 다 가져온다.
        let businessId = $("#storeDetailModalBusinessId").val();
        $.ajax({
        	url : "/app/getChatStoreMenuList",
        	data : "businessId="+businessId,
        	type : "post",
        	dataType : "json",
        	success : function(resData){
				let arr = new Array();
				$(resData).each(function(i, v){
					arr.push(v.menuCategoryName);
				});
				let categorySet = new Set(arr);
				let categoryList = Array.from(categorySet);

				let menuItems = resData;
				
				let menuByCategory = {};
				menuItems.forEach((menuItem) => {
				    const { menuName, menuCategoryName } = menuItem;
				    if (!menuByCategory[menuCategoryName]) menuByCategory[menuCategoryName] = [];
				    menuByCategory[menuCategoryName].push(menuItem);
				});
				
        		$("#storeMenuDiv").empty();
        		if(resData.length == 0) {
        			$("#storeMenuDiv").append(`
						<div class="text-center h-100 d-flex justify-content-center align-items-center">
						    <span>등록된 메뉴가 없습니다</span>
						</div>
        			`);
        			return;
        		}
        		
				for (let category in menuByCategory) {
				
				  $("#storeMenuDiv").append(`
						<div class="row border-bottom border-dark storeDetailMenuCategoryRow">
	                        <div class="col ps-3 py-3 fs-5 fw-bold">
	                            	`+ category +`
	                        </div>
	                        <div class="col-auto px-4 py-3 fs-5 fw-bold">
	                            <i class="bi bi-caret-down-fill storeDetailMenuCategoryArrowDown"></i>
	                            <i class="bi bi-caret-up-fill d-none storeDetailMenuCategoryArrowUp"></i>
	                        </div>
	                    </div>
	                    <div class="row d-none chatStoreCategoryMenu">
	                    	<div class="col" data-category="`+ category +`">
	                    		
	                    	</div>
	                    </div>
	                    
	        		`);

				  $(menuByCategory[category]).each(function(i, v){
				  	let cat = v.menuCategoryName;
				  	$("[data-category="+ cat +"]").append(`
				  		<div class="row my-3" style="height:125px; overflow-y: hidden;">
							<div class="col-3 p-0">
							        <img src="`+ v.menuPicture +`" class="rounded" style="width:125px; height:125px;">
							    </div>
							    <div class="col-9">
							        <div class="row">
							            <div class="col fs-4 fw-bold">
							                `+ v.menuName +`
							            </div>
							            <div class="col-auto p-0 m-0 me-1 d-flex align-items-center">
							                <input type="button" value="원산지" 
							                class="btn btn-sm btn-primary"
							                data-bs-toggle="tooltip" data-bs-placement="bottom"
							                data-bs-custom-class="custom-tooltip"
							                data-bs-html="true" 
							                data-bs-title="`+ v.menuOrigin +`">
							            </div>
							        </div>
							        <div class="row">
							            <div class="col fs-4">
							                `+ v.menuPrice +`원
							            </div>
							        </div>
							        <div class="row">
							            <div class="col storeDetailMenuInfo bg-white">
							                `+ v.menuInfo +`
							            </div>
							        </div>
							    </div>
							</div>
				  	`);
					let tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
			    	let tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
			    	tooltipList.forEach(tooltip => tooltip.hide());
				  });					  
				}		
				

        	}, error : function(err){
        		console.log(err);
        	}
        });
    });
    
     //메뉴화면에서 카테고리 눌렀을때
    $(document).on("click", ".storeDetailMenuCategoryRow", function(){
        if($(this).next().is(":visible")){
            $(this).find("i")[1].classList.add("d-none");
            $(this).find("i")[0].classList.remove("d-none");
            $(this).next().addClass("d-none");
        } else {
        	$(".chatStoreCategoryMenu").addClass("d-none");
        	$(".storeDetailMenuCategoryArrowUp").addClass("d-none");
        	$(".storeDetailMenuCategoryArrowDown").removeClass("d-none");
            $(this).find("i")[0].classList.add("d-none");
            $(this).find("i")[1].classList.remove("d-none");
            $(this).next().removeClass("d-none");
        }
    });
    
    
    //가게상세보기 모달 하단 리뷰버튼 클릭이벤트
    $("#storeDetailModalReviewBtn").on("click", function(){
    
    	$("#storeDeatilReviewContent").empty();
    
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilReviewContent").removeClass("d-none");
        
        //ajax로 businessId에 해당하는 리뷰리스트를 가져온다.
        let businessId = $("#storeDetailModalBusinessId").val();
        let totalReviewCount = 0;
        let rList;
        $.ajax({
        	url : "/app/getChatStoreReviewList",
        	data : "businessId=" + businessId,
        	type : "post",
        	dataType : "json",
        	async : false,
        	success : function(resData) {
        		rList = resData;
        		totalReviewCount = resData.length;      		
        	}, error : function(err) {
        		console.log(err)
        	}
        });
        
        if(totalReviewCount > 0){
        	$("#storeDeatilReviewContent").append(`
        		<div id="storeDeatilReviewContentDiv" class="px-3">
	                <div class="row py-2">
	                    <div class="col p-0">
	                        <span class="fs-3 fw-bold">리뷰(`+ totalReviewCount +`)</span>
	                    </div>
	                </div>
	            </div>`
	        );
	        $(rList).each(function(i, v){
	        
	        	let id = v.normalId;
	        	let nickName = "";
	        	let profileImg = "";
	        	let starScore = "";
	        	let regDate = new Date(v.regDate);
	        	let formatRegDate = String(regDate.getFullYear()) + "년 " + String(regDate.getMonth() + 1).padStart(2,'0') + "월 " + String(regDate.getDate()).padStart(2,'0') + "일 "
	        	+ String(regDate.getHours()).padStart(2,'0') + ":" + String(regDate.getMinutes()).padStart(2,'0') + ":" + String(regDate.getSeconds()).padStart(2,'0');
	        	
	        	switch(v.reviewScore){
	        		case 5 : starScore = 
	        		 `
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 `
	        		break;
	        		case 4 : starScore = 
	        		 `
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star"></i>
	        		 `
	        		break;
	        		case 3 : starScore = 
	        		 `
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 `
	        		break;
	        		case 2 : starScore = 
	        		 `
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 `
	        		break;
	        		case 1 : starScore = 
	        		 `
	        		 <i class="bi bi-star-fill"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 `
	        		break;
	        		case 0 : starScore = 
	        		 `
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 <i class="bi bi-star"></i>
	        		 `
	        		break;
	        	}
	        	
	        	$.ajax({
	        		url : "/app/getReviewWriterInfo",
	        		data : "normalId=" + id,
	        		type : "post",
	        		dataType : "json",
	        		async : false,
	        		success : function(resData) {
	        			nickName = resData.nickName;
	        			profileImg = resData.profile;
	        		}, error : function(err) {
	        			console.log(err);
	        		}
	        	});
	        	
		        $("#storeDeatilReviewContentDiv").append(`
		            <div class="row my-2">
		                <div class="col-auto p-0">
		                    <img src="resources/upload/`+ profileImg +`" class="rounded-circle" style="width:50px; height:50px;">
		                </div>
		                <div class="col d-flex flex-column">
		                    <span class="fs-5 fw-bold">
		                        `+ nickName +`
		                    </span>
		                    <span style="font-size: 14px;">
		                        `+ formatRegDate +`
		                    </span>
		                </div>
		                <div class="col-3 p-0 pe-3 d-flex justify-content-end align-items-center text-end">
		                    `+ starScore +`
		                </div>
		            </div>
		            <div class="row my-2">
		                <div class="col p-3">
		                	`+ v.reviewContent +`
		                </div>
		            </div>
		            <div class="row my-2">
		                <div class="col p-3">
		                    ` + (v.reviewPicture != null ? `<img src="resources/upload/`+ v.reviewPicture +`" style="max-width: 100%;">` : ``) + `
		                </div>
		            </div>
		         `);
	        });
        } else {
        	$("#storeDeatilReviewContent").append(`
	            <div class="text-center h-100 d-flex justify-content-center align-items-center">
	                <span>등록된 리뷰가 없습니다</span>
	            </div>
        	`);
        }
        
    });
    
    //가게상세보기 모달 하단 예약버튼 클릭이벤트
    $("#storeDetailModalBookBtn").on("click", function(){
    	if(isBooking) return alert("예약 진행중에는 이용하실 수 없습니다");
    	if(bookComplete) return alert("예약이 완료되었습니다\n마이페이지를 확인해 주세요");
    	
    	$("#proposeTime").val("");
    	$("#proposeMsg").val("");
    	
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilBookContent").removeClass("d-none");
    });
    
    $("#proposeBookBtn").on("click", function(){
        //businessID 쓸데가 요긴하게 있을것이다~~~
        let currentMemberCount = parseInt($(".currentMemberCount:first").text().trim());
        let memberCount = parseInt($(".memberCount:first").text().trim());
        if(currentMemberCount != memberCount){
        	alert("매칭 멤버가 전부 채팅방에 입장하지 않았습니다");
        	return;
        }
        
        let businessId = $("#storeDetailModalBusinessId").val();
        let proposeTime = $("#proposeTime").val();

        let proposeMsg = $("#proposeMsg").val();
        let center = new Array();
        
        if(proposeTime.length <= 0 || proposeTime == null) return alert("예약시간을 지정해주세요");
        
        let bookMsg = {
        	businessId : businessId,
        	proposeTime : proposeTime,
        	proposeMsg : proposeMsg
        }
        const msgData = JSON.stringify(bookMsg);
        
		let chatHistory = {
        	normalId : loginId,
			chatName : roomId,
			chatType : "book",
			chatMessage : msgData
        }
        
		$.ajax({
        	url : "/app/addChatMessage",
        	data : chatHistory,
        	type : "post",
        	dataType : "json"
        });
        
        //chating 서버에 'book'타입 메시지 보내기
        chatHistory = {
        	normalId : loginId,
			nickName : loginNickName,
			chatName : roomId,
			chatType : "book",
			chatMessage : msgData,
			chatRegDate : new Date(),
        }
        
        
        const jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
        isBooking = true;
    });


    //여기서부터 가게리스트 드래그 이벤트 ------------------------------------------------------------------------------------------------------------------------
    
    //드래그 주고받을 두 영역
    const container = document.getElementById("chatContainer"); //채팅창
    const container2 = document.getElementById("storeContainer"); //스토어창

    //채팅창 DIV 드래그 이벤트
    container.addEventListener("dragover", (e) => {
        e.preventDefault();
    });
    container.addEventListener("drop", (e) => {

        const storeBusinessId = e.dataTransfer.getData('storeBusinessId');
        const storeProfileImg = e.dataTransfer.getData('storeProfileImg');
        const storeName = e.dataTransfer.getData('storeName');
        const storeReviewCount = e.dataTransfer.getData('storeReviewCount');
        const storeDeposit = e.dataTransfer.getData('storeDeposit');
        const storeAddress = e.dataTransfer.getData('storeAddress');

        let infoMsg = `
        
			<div class="col-auto p-2">
				<input type="hidden" class="storeChatDivBusinessId" value="`+ storeBusinessId +`">
			    <img src="`+ storeProfileImg +`" style="width: 110px; height: 110px;" class="rounded">
			</div>
			<div class="col text-white p-2">
				<p class="m-0 p-0 fs-4 fw-bold">`+ storeName +`</p>
				<p class="m-0 p-0" style="font-size: 14px;">`+ storeReviewCount +`</p>
				<p class="m-0 p-0" style="font-size: 14px;">`+ storeDeposit +`</p>
				<p class="m-0 p-0" style="font-size: 14px; height: 24px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
				주소 : `+ storeAddress +`</p>
			</div>
        `;
        
        
        //여기에서 채팅메시지를 객체로 만들어 AJAX통신으로 DB에 저장한다
        const msg = $("#chatMessageInput").val();
        let chatHistory = {
			normalId : loginId,
			chatName : roomId,
			chatType : "info",
			chatMessage : infoMsg
        }
        $.ajax({
        	url : "/app/addChatMessage",
        	data : chatHistory,
        	type : "post",
        	dataType : "json"
        });
        
        chatHistory = {
			normalId : loginId,
			nickName : loginNickName,
			chatName : roomId,
			chatType : "info",
			chatMessage : infoMsg,
			chatRegDate : new Date(),
        }
        
        //채팅서버에 send
        const jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
        
    });

    //가게창 DIV 드래그 이벤트
    container2.addEventListener("dragstart", (e) => {
        const storeDiv = $(e.target).closest(".storeDiv");
        const storeProfileImg = storeDiv.find('.storeProfileImg').attr("src");
        const storeName = storeDiv.find('.storeName').text().trim();
        const storeReviewCount = storeDiv.find('.storeReviewCount').text().trim();
        const storeDeposit = storeDiv.find('.storeDeposit').text().trim();
        const storeAddress = storeDiv.find('.storeAddress').val();
        const storeBusinessId = storeDiv.find('.storeBusinessId').val();

        e.dataTransfer.setData('storeBusinessId', storeBusinessId);
        e.dataTransfer.setData('storeProfileImg', storeProfileImg);
        e.dataTransfer.setData('storeName', storeName);
        e.dataTransfer.setData('storeReviewCount', storeReviewCount);
        e.dataTransfer.setData('storeDeposit', storeDeposit);
        e.dataTransfer.setData('storeAddress', storeAddress);
    });
    container2.addEventListener("dragover", (e) => {
        e.preventDefault();
    });
    container2.addEventListener("drop", (e) => {
        e.preventDefault();
    });

    //여기서부터 예약모달 --------------------------------------------------------------------------------------------------------------------------------------
    //예약모달 가게 상세보기 클릭이벤트
    $("#bookModalShowStoreDetailBtn").on("click", function(){
        $("#storeDetailModal").removeClass("d-none");
    });

    //예약 거절 버튼 클릭이벤트
    $("#bookRejectBtn").on("click", function(){
        if($("#bookRejectBtn").val() == '거절'){
			//거절 버튼 누르면 웹소켓 서버에 'reject' 타입으로 메시지 보내고 서버에서 전체멤버에게 거절 메시지 보내기
			let chatHistory = {
				normalId : loginId,
				nickName : loginNickName,
				chatName : roomId,
				chatType : "reject",
				memberCount : chatRoomInfo.memberCount
	        }
	        let jsonData = JSON.stringify(chatHistory);
	        socket.send(jsonData);
            return;
        }
        if($("#bookRejectBtn").val() == '취소'){
            $("#bookRejectBtn").val("거절");
            $("#bookAgreeBtn").val("동의");
            $("#bookAgreeBtn").prop("disabled", false);
            
			//취소 버튼 누르면 웹소켓 서버에 'agreeCancle' 타입으로 메시지 보내고 서버에서 agreeSet에서 자기 빼고 agreeSet멤버들에게 현재 멤버인원 다시 알려주기
			let chatHistory = {
				normalId : loginId,
				nickName : loginNickName,
				chatName : roomId,
				chatType : "agreeCancel",
				memberCount : chatRoomInfo.memberCount
	        }
	        let jsonData = JSON.stringify(chatHistory);
	        socket.send(jsonData);
            return;
        }
    });

    //예약 동의 버튼 클릭이벤트
    $("#bookAgreeBtn").on("click", function(){
    	
    	let deposit = parseInt($(".bookModalDeposit:first").text().trim());
    	let myPoint = parseInt($("#bookModalMyPoint").text().trim());
    	
    	if(deposit > myPoint){
    		alert("포인트가 부족합니다\n포인트를 충전해 주세요");
    		return;
    	}
        //동의 버튼 누르면 웹소켓 서버에 '동의' 타입으로 메시지 보내고 서버에서 동의한 사람 set만들기
		let chatHistory = {
			normalId : loginId,
			nickName : loginNickName,
			chatName : roomId,
			chatType : "agree",
			memberCount : chatRoomInfo.memberCount
        }
        let jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
    });
    
    //예약 동의 지도표시
    const getBookMap = (coords, businessName) => {
        var mapContainer = document.getElementById('bookMap'),
        mapOption = { 
            center: new kakao.maps.LatLng(coords[0], coords[1]),
            level: 5
        };
        var bookMap = new kakao.maps.Map(mapContainer, mapOption);
        bookMap.setDraggable(false);
        var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(bookMap);
        var iwContent = `
        <div style="padding:5px;">
        <b>`+ businessName +`</b><br>
        <a class="text-decoration-none" href="https://map.kakao.com/link/map/Hello World!,${coords[0]},${coords[1]}" style="color:blue" target="_blank">
        큰지도보기
        </a> 
        <a class="text-decoration-none" href="https://map.kakao.com/link/to/Hello World!,${coords[0]},${coords[1]}" style="color:blue" target="_blank">
        길찾기
        </a>
        </div>`,
        iwPosition = new kakao.maps.LatLng(coords[0], coords[1]);
        var infowindow = new kakao.maps.InfoWindow({
            position : iwPosition, 
            content : iwContent 
        });
        infowindow.open(bookMap, marker);
        bookMap.setMinLevel(5);
        bookMap.setMaxLevel(5);
        bookMap.relayout();
    }
    //예약완료 후 확인버튼 클릭이벤트
    $("#bookCompleteConfirmBtn").on("click", function(){
    	isBooking = false;
    	bookComplete = true;    
    	$("#chatDiv").empty();
    	$.ajax({
			url: "/app/chatMemberCheck",
			data : "id=" + loginId,
			type : "get",
			dataType : "json",
			async : false,
			success : function(resData) {
				chatHistory = resData.chatHistory;
				chatRoomInfo = resData.chatRoomInfo;
				isChatMember = resData.isChatMember;		
				roomId = resData.roomId;
			}, error : function(err) {
			console.log(err)
			}
		});
		
		chatAppend(chatHistory, loginId);
        $("#bookModal").addClass("d-none");
		let chatContent = document.querySelector("#chatContent");
    	chatContent.scrollTo(0, chatContent.scrollHeight);
    });

    //예약실패 후 확인버튼 클릭이벤트
    $("#bookFailedConfirmBtn").on("click", function(){
    	
    	$("#chatDiv").empty();
    	$.ajax({
			url: "/app/chatMemberCheck",
			data : "id=" + loginId,
			type : "get",
			dataType : "json",
			async : false,
			success : function(resData) {
				chatHistory = resData.chatHistory;
				chatRoomInfo = resData.chatRoomInfo;
				isChatMember = resData.isChatMember;		
				roomId = resData.roomId;
			}, error : function(err) {
			console.log(err)
			}
		});
		
		chatAppend(chatHistory, loginId);
		let chatContent = document.querySelector("#chatContent");
    	chatContent.scrollTo(0, chatContent.scrollHeight);
    	
    	isBooking = false;
        $("#bookModal").addClass("d-none");
        $("#bookFail").addClass("d-none");
        $("#bookSuccess").addClass("d-none");
        $("#bookWait").addClass("d-none");
        $("#bookPropose").removeClass("d-none");        
    });
    
    //예약 대기창 취소하기 버튼 클릭이벤트
    $("#bookWaitCancelBtn").on("click", function(){
    	
    	if(confirm("정말 취소하시겠습니까?")){
    		//채팅 서버에 'userCancel' 타입 메시지 전송
    		let chatHistory = {
				normalId : loginId,
				nickName : loginNickName,
				chatName : roomId,
				chatType : "userCancel",
				chatRegDate : new Date(),
				profileImg : profileImg 
        	}
    		let jsonData = JSON.stringify(chatHistory);
        	socket.send(jsonData);
        	
        	let msg = {
				type : "userCancel",
				bookNo : $(".bookingBookNo:first").text().trim(),
				businessId : $("#storeDetailModalBusinessId").val()
        	}
    		let jData = JSON.stringify(msg);
        	bookingSocket.send(jData);
        	
    	}
    });
    

});//끝

//채팅내역 불러와서 출력하는 함수
const chatAppend = (chatHistory, loginId) => {
	$(chatHistory).each(function(i, v){
		let chatObj = v;
		let chatType = chatObj.chatType;
		let chatId = chatObj.normalId;
		let chatNickName = chatObj.nickName;
		let chatMsg = chatObj.chatMessage;
		let regDate = new Date(chatObj.chatRegDate);
		let chatProfileImg = chatObj.profileImg;
		let chatRegDate = (regDate.getHours() < 13 ? "오전" + String(regDate.getHours()) + ":" + String(regDate.getMinutes()).padStart(2,'0') : "오후" + String(regDate.getHours() - 12) + ":" + String(regDate.getMinutes()).padStart(2,'0'));
		let lastChat = $("#chatDiv .chatRow:last");
		if(lastChat.attr("data-time") == chatRegDate && lastChat.attr("data-id") == chatId) lastChat.find(".regDate").text("");
		switch(v.chatType){
			case 'msg' : 
	
			if(chatId == loginId){
			
				if(lastChat.attr("data-id") != loginId){
					$("#chatDiv").append(`
	                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
	                        <div class="col"></div>
	                        <div class="col-5">
	                            <div class="row my-1 justify-content-end">
	                            	<div class="col-auto p-0 me-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
	                                <div class="col-auto p-0 me-4">
	                                    <div class="sendChat px-3 py-2">
	                                    ` + chatMsg +`
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					`);
					
				} else {
					
					$("#chatDiv").append(`
	                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
	                        <div class="col"></div>
	                        <div class="col-5">
	                            <div class="row justify-content-end">
	                            	<div class="col-auto p-0 me-1 d-flex align-items-end">
	                            		<span style="font-size: 12px;" class="regDate">
	                                    ` + chatRegDate + `
	                                    </span>
	                            	</div>
	                                <div class="col-auto p-0 me-4">
	                                    <div class="sendChat2 text-center px-3 py-2">
	                                    ` + chatMsg + `
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
				`);
				}
				
				
				
			} else {
			
				if(lastChat.attr("data-id") != chatId){
				$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col-auto p-0">
                            <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">                                        
                        </div>
                        <div class="col-5">
                            <div class="row">
                                <div class="col fs-5 fw-bold p-0 ms-4">
                                ` + chatNickName + `
                                </div>
                            </div>
                            <div class="row my-1">
                                <div class="col-auto p-0 ms-4">
                                    <div class="receiveChat text-center px-3 py-2">
                                    ` + chatMsg + `
                                    </div>
                                </div>
                            	<div class="col-auto p-0 ms-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                            </div>
                        </div>
                    </div>
				`);
				} else {
					$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col-auto p-0">
                        	<div style="width:70px;"></div>                                        
                        </div>
                        <div class="col-5">
                            <div class="row">
                                <div class="col-auto p-0 ms-4">
                                    <div class="receiveChat2 text-center px-3 py-2">
                                    ` + chatMsg + `
                                    </div>
                                </div>
                                <div class="col-auto p-0 ms-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                            </div>
                        </div>
                    </div>
				`);
				}
			}
		break;
		case 'img' : 
			if(chatId == loginId){
			
			
				if(lastChat.attr("data-id") != loginId){
				$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col">
                            <div class="row justify-content-end">
                            	 <div class="col-auto p-1 me-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                            	
                                <div class="col-auto p-0 me-4">
                                    <div class="sendImgChat py-2">
                                    ` + chatMsg + `
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
				`);
				} else {
					$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col">
                            <div class="row justify-content-end">
                            	 <div class="col-auto p-1 me-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                                <div class="col-auto p-0 me-4">
                                    <div class="sendImgChat py-2">
                                        ` + chatMsg + `
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				`);
				}
				
				
			} else {
			
				if(lastChat.attr("data-id") != chatId){
				$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col-auto p-0">
                            <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col fs-5 fw-bold p-0 ms-4">
                                ` + chatNickName + `
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-auto p-0 ms-4">
                                    <div class="receiveImgChat py-2">
                                        ` + chatMsg + `
                                    </div>
                                </div>
                            	<div class="col-auto p-1 ms-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                            </div>
                        </div>
                    </div>
				`);	
				} else {
					$("#chatDiv").append(`
                    <div class="row mt-2 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                        <div class="col-auto p-0">
                            <img src="resources/upload/` + chatProfileImg + `" class="rounded-circle chatProfileImg" style="cursor: pointer;width:70px;height:70px;">
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col fs-5 fw-bold p-0 ms-4">
                                ` + chatNickName + `
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-auto p-0 ms-4">
                                    <div class="receiveImgChat py-2">
                                        ` + chatMsg + `
                                    </div>
                                </div>
                                <div class="col-auto p-1 ms-1 d-flex align-items-end">
                            		<span style="font-size: 12px;" class="regDate">
                                    ` + chatRegDate + `
                                    </span>
                            	</div>
                            </div>
                        </div>
                    </div>
				`);	
				}
							
			}
		break;
		case 'info' : 
			$("#chatDiv").append(`
                <div class="row mt-4 chatRow" data-id=` + chatId + ` data-type=` + chatType + ` + data-time=` + chatRegDate + `>
                    <div class="col">
                        <div class="row justify-content-center">
                            <div class="col p-0 col-9 text-center text-secondary storeChatDiv" style="font-size: 14px;cursor: pointer;">
                                <span class="text-dark fs-5"><b>` + chatNickName + `</b>님이 소개하셨어요!</span>
                            </div>
                        </div>
                        <div class="dragStore row justify-content-center">
                            <div class="col bg-danger rounded col-9 storeChatDiv" style="height: 125px; overflow: hidden; cursor: pointer;">
                                <div class="row">
                                `+ chatMsg +`
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			`);
		break;
		case 'book' : 				
			$("#chatDiv").append(`
                <div class="row mt-4 chatRow">
                    <div class="col">
                        <div class="dragStore row justify-content-center">
                            <div class="col-9 bg-danger py-2 rounded">
                                <div class="row">
                                    <div class="col text-white p-2 text-center">
                                        <p class="m-0 p-0 fs-5">
                                            <b>` + chatNickName + `</b>님의 예약 제안이 종료되었습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			`);
		break;
			}
	});
	}

//가게리스트를 받아서 출력하는 함수	
const storeListAppend = (storeList) => {
	$("#storeRow").empty();
	$(storeList).each(function(i, v){
		$("#storeRow").append(`
            <div class="col-4 text-center px-3 pb-2 my-2 storeDiv" draggable="true" style="cursor: pointer;"
            data-bs-toggle="tooltip" data-bs-placement="top"
            data-bs-custom-class="custom-tooltip"
            data-bs-title="채팅창으로 드래그해보세요! 이 가게를 채팅창 멤버들에게 소개 할 수 있어요">
            
            <input type="hidden" class="storeBusinessId" value="`+ v.businessId +`">
            <input type="hidden" class="storeBusinessName" value="`+ v.businessName +`">
            <input type="hidden" class="storeBusinessProfile" value="`+ v.businessProfile +`">
            <input type="hidden" class="storeTotalScore" value="`+ v.totalScore +`">
            <input type="hidden" class="storeTotalReviewCount" value="`+ v.totalReviewCount +`">
            <input type="hidden" class="storePhone" value="`+ v.phone +`">
            <input type="hidden" class="storeAddress1" value="`+ v.address1 +`">
            <input type="hidden" class="storeOpenTime" value="`+ v.openTime +`">
            <input type="hidden" class="storeCloseTime" value="`+ v.closeTime +`">
            <input type="hidden" class="storeBreakTime" value="`+ v.breakTime+`">
            <span class="storeIntroduction d-none">` + v.introduction + `</span>
            <input type="hidden" class="storeDeposit" value="`+ v.deposit +`">
            <input type="hidden" class="xPoint" value="`+ v.xpoint +`">
            <input type="hidden" class="yPoint" value="`+ v.ypoint +`">
            
                <div class="my-3" style="position: relative;">
                    <img src="resources/upload/`+ v.businessProfile +`" class="rounded storeProfileImg" draggable="false"
                    style="width: 162px; height: 162px;">
                </div>
                <div class="fw-bold storeName" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break:break-all">
                    `+ v.businessName +`
                </div>
                <div style="font-size: 14px;" class="storeReviewCount">
                    리뷰 `+ v.totalReviewCount +` 별점 `+ v.totalScore +`
                </div>
                <div style="font-size: 14px;" class="storeDeposit">
                    인당예약금 : `+ v.deposit +`원
                    <input type="hidden" class="storeAddress" value="`+ v.address1 +`">
                </div>
            </div>
		`);
		let tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
		let tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
		tooltipList.forEach(tooltip => tooltip.hide());
	});
}

//가게리스트 초기화
const storeListReset = (chatRoomInfo) => {
	isSearch = false;
	$("#searchTextRow").remove();
	
	if(chatRoomInfo.locationMethod == 'map'){
		let locationData = chatRoomInfo.locationInfo
		let formatString = locationData.replace(/\[|\]/g, "");
		let latlng = formatString.split(",");
		let lat = latlng[0];
		let lng = latlng[1];
		let sList = new Array();
		let sortType = $("#chatStoreSortSelect").val();
		
		$.ajax({
			url: "/app/getStoreListByMap",
			data : "lat=" + lat + "&lng=" + lng+ "&sortType=" + sortType,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				sList = resData;
			}, error : function(err){
				console.log(err)
			}
		});
	storeListAppend(sList);	
	} else {
		let locationData = chatRoomInfo.locationInfo;
		let sList = new Array();		
		let sortType = $("#chatStoreSortSelect").val();
		$.ajax({
			url: "/app/getStoreListByAddress",
			data : "address=" + locationData+ "&sortType=" + sortType,
			type : "post",
			dataType : "json",
			async : false,
			success : function(resData){
				sList = resData;				
			}, error : function(err){
				console.log(err)
			}
		});
		storeListAppend(sList);
	}
}	

const searchStoreListReset = (chatRoomInfo, keyword) => {
		$("#searchTextRow").remove();

		if(chatRoomInfo.locationMethod == 'map'){
			let locationData = chatRoomInfo.locationInfo
			let formatString = locationData.replace(/\[|\]/g, "");
			let latlng = formatString.split(",");
			let lat = latlng[0];
			let lng = latlng[1];
			let sList = new Array();
			let sortType = $("#chatStoreSortSelect").val();
			$.ajax({
				url: "/app/searchStoreListByMap",
				data : "lat=" + lat + "&lng=" + lng + "&keyword=" + keyword + "&sortType=" + sortType,
				type : "post",
				dataType : "json",
				async : false,
				success : function(resData){
					sList = resData;
				}, error : function(err){
					console.log(err)
				}
			});
			if(sList.length > 0) storeListAppend(sList);
			else {
				$("#storeRow").empty();
				$("#storeRow").append(`
					<div class="ms-4">
					    <span class="fs-3 fw-bold">검색 결과가 없습니다</span>
					</div>
				`);
			}
		} else {
			let locationData = chatRoomInfo.locationInfo;
			let sList = new Array();		
			let sortType = $("#chatStoreSortSelect").val();
			$.ajax({
				url: "/app/searchStoreListByAddress",
				data : "address=" + locationData + "&keyword=" + keyword + "&sortType=" + sortType,
				type : "post",
				dataType : "json",
				async : false,
				success : function(resData){
					sList = resData;				
				}, error : function(err){
					console.log(err)
				}
			});
			if(sList.length > 0) storeListAppend(sList);
			else {
				$("#storeRow").empty();
				$("#storeRow").append(`
					<div class="ms-4">
					    <span class="fs-3 fw-bold">검색 결과가 없습니다</span>
					</div>
				`);
			}
		}
		
		$("#searchTextAppend").prepend(`
			<div class="row px-3" id="searchTextRow">
				<div class="col ms-4 py-3 d-flex align-items-center border-bottom">
					<span class="fs-5">
					'`+ keyword +`'에 대한 검색결과
					</span>
				</div>
				<div class="col-auto py-3 border-bottom">
					<input type="button" class="btn btn-primary" id="searchBackBtn" value="이전목록">
				</div>
			</div>
		`);	
		$("#chatStoreSearchInput").val("");
}

const timerReset = () => {
	let time = new Date();
	time.setMinutes(0);
	time.setSeconds(0);
	let minutes = String(time.getMinutes()).padStart(2, '0');
	let seconds = String(time.getSeconds()).padStart(2, '0');
	let resetTime = minutes + ":" + seconds;
	document.querySelector("#waitTimer").innerText = resetTime; 
}

const timerStart = (minutes, seconds) => {
    let time = new Date();
    const updateTimer = () => {
        seconds++;
        if (seconds === 60) {
            minutes++;
            seconds = 0;
        }
        const formatTime = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
        document.querySelector("#waitTimer").innerText = formatTime;
        setTimeout(updateTimer, 1000);
    };
    updateTimer();
}



