$(function(){

    //채팅창 항상 최하단 유지
    let chatContent = document.querySelector("#chatContent");
    chatContent.scrollTo(0, chatContent.scrollHeight);

	//부트스트랩 tool-tip 활성화
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

	let memberList = new Array();
	
	const loginId = $("#loginId").val();
	const loginNickName = $("#loginNickName").val();
	const profileImg = $("#loginProfileImg").val();
	let chatHistory = "";
	let chatRoomInfo = "";
	let isChatMember = false;
	let roomId = "";
	
	
	//채팅방 진입시 db의 chat_member테이블에서 로그인한 ID가 있는지 확인. (없으면 강퇴. 이거는 나중에 만들자 필요없을지도....)
	const getInfo = () => {
		$.ajax({
			url: "/app/chatMemberCheck",
			data : "id=" + loginId,
			type : "get",
			dataType : "json",
			async : false,
			success : function(resData){				
				chatHistory = resData.chatHistory;
				chatRoomInfo = resData.chatRoomInfo;
				isChatMember = resData.isChatMember;		
				roomId = resData.roomId;
				
				console.log("resData : ", resData);
				
				
				$(chatHistory).each(function(i, v){
				
					let chatObj = v;
					let chatType = chatObj.chatType;
					let chatId = chatObj.normalId;
					let chatNickName = chatObj.nickName;
					let chatMsg = chatObj.chatMessage;
					let regDate = new Date(chatObj.chatRegDate);
					let chatProfileImg = chatObj.profileImg;
					let chatRegDate = (regDate.getHours() < 13 ? "오전" + String(regDate.getHours()) : "오후" + String(regDate.getHours() - 12) ) + ":" + String(regDate.getMinutes()).padStart(2,'0');
					let lastChat = $("#chatDiv .chatRow:last");
					if(lastChat.attr("data-time") == chatRegDate && lastChat.attr("data-id") == chatId) lastChat.find(".regDate").text("");
					
					switch(v.chatType){
					case 'msg' : 
			
					if(chatId == loginId){
					
						if(lastChat.attr("data-id") != loginId){
						console.log("현재채팅 시간 : ", chatRegDate);
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
					
				});
				
				
			}, error : function(err) {
				console.log("통신오류", err);
			}
		});
	}
	getInfo();
	console.log(chatHistory);
	let memberCount = chatRoomInfo.memberCount;
	$(".memberCount").text(memberCount);
	//있으면 room_id의 값을 가져온다. <-- 위 AJAX에서 해결
	//가져온 room_id를 이용해 chat_room 테이블에서 채팅방의 정보를 가져온다. <-- 위 AJAX에서 해결
	//roomId를 이용해 chat_history테이블에서 기존 채팅메시지들을 가져온다 <-- 위 AJAX에서 해결
	
	
	//가져온 채팅방정보에서 centerPoint 혹은 address를 이용해 ajax로 가게리스트를 가져온다
	
	if(chatRoomInfo.locationMethod == 'map'){
		
		let locationData = chatRoomInfo.locationInfo
		let formatString = locationData.replace(/\[|\]/g, "");
		let latlng = formatString.split(",");
		let lat = latlng[0];
		let lng = latlng[1];
		
		$.ajax({
			url: "/app/getStoreListByMap",
			data : "lat=" + lat + "&lng=" + lng,
			type : "post",
			dataType : "json",
			success : function(resData){
				console.log("가게 리스트", resData);
				let storeList = resData;
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
		                <input type="hidden" class="storeIntroduction" value="`+ v.introduction +`">
		                <input type="hidden" class="storeDeposit" value="`+ v.deposit +`">
		                
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
				});
				
				
				
			}, error : function(err){
				console.log(err)
			}
		});
		
		
	} else {
		
		console.log(chatRoomInfo.locationInfo);
		let locationData = chatRoomInfo.locationInfo;
		
		$.ajax({
			url: "/getStoreListByAddress",
			data : "address=" + locationData,
			type : "post",
			dataType : "json",
			success : function(resData){
				
				console.log("가게 리스트", resData);
				let storeList = resData;
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
			                <input type="hidden" class="storeDayOff" value="`+ v.dayOff +`">
			                <input type="hidden" class="storeIntroduction" value="`+ v.introduction +`">
			                <input type="hidden" class="storeDeposit" value="`+ v.deposit +`">
		                
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
				});
				
			}, error : function(err){
				console.log(err)
			}
		});
		
	}
	
	
	//가져온 room_id를 이용해 웹소켓채팅서버를 연다 - 완료
	//학원꺼
	//let url = "ws://192.168.0.16:8081/app/chating/" + roomId;
	
	//집꺼
	//let url = "ws://192.168.35.92:8081/app/chating/" + roomId;
	
	//현진이꺼
	let url = "ws://192.168.0.44:8090/app/chating/" + roomId;
    socket = new WebSocket(url);
    
    $(socket).on("open", function(event) {
    
        let chatHistory = {
			nickName : loginNickName,
			chatType : "connect",
        }
		let jsonData = JSON.stringify(chatHistory);
        socket.send(jsonData);
    
	});
			
	socket.addEventListener('message', function(event){
		console.log(event.data);
		let chatObj = JSON.parse(event.data);
		let chatType = chatObj.chatType;
		if(chatType == 'connect'){
			let memberList = chatObj.memberList;
			let nickNames = "";
			$(memberList).each(function(i, v){
				console.log("v : ",v);
				nickNames += (nickNames == "" ? v : ", " + v);
			});
			console.log(nickNames);
			$("#memberList").text(nickNames);
			$(".currentMemberCount").text(memberList.length);
			
		}
		let chatId = chatObj.normalId;
		let chatNickName = chatObj.nickName;
		let chatMsg = chatObj.chatMessage;
		let regDate = new Date(chatObj.chatRegDate);
		
		let chatProfileImg = chatObj.profileImg;
		let chatRegDate = (regDate.getHours() < 13 ? "오전" + String(regDate.getHours()) : "오후" + String(regDate.getHours() - 12) ) + ":" + String(regDate.getMinutes()).padStart(2,'0');
		let lastChat = $("#chatDiv .chatRow:last");
		
		if(lastChat.attr("data-time") == chatRegDate && lastChat.attr("data-id") == chatId) lastChat.find(".regDate").text("");
		
		switch(chatType){
			case 'msg' : 
			
				if(chatId == loginId){
				
					if(lastChat.attr("data-id") != loginId){
					console.log("현재채팅 시간 : ", chatRegDate);
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
		
	});

	$(socket).on('close', function(event) {
	    console.log('WebSocket 연결이 닫혔습니다.');
	});

	$(socket).on('error', function(event) {
	    console.error('WebSocket 오류:', event);
	});
	
	console.log("roomId : " + roomId);

	
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
			console.log("resData : ", resData);
			imgFileName = resData.fileName;
       }, error : function(err){
			console.log("통신에러", err);
       }
       });
    	
    console.log("imgFileName : ", imgFileName);
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
    $(".chatProfileImg").on("click", function (e) {
        $("#userConfigBox").addClass("d-none");

        //e.target의 bottom = userConfig박스의 top

        const height = this.height;
        let top = $(this).position().top + $(this).height();
        let left = $(this).position().left;

        $("#userConfigBox").css("left", left + "px");
        $("#userConfigBox").css("top", top + "px");
        $("#userConfigBox").removeClass("d-none");
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
        $("#blockModal").addClass("d-none");
        $("#reportModal").removeClass("d-none");
        $("#userConfigBox").addClass("d-none");
    });

    //차단하기 모달열기
    $(".blockBtn").on("click", function(){
        $("#reportModal").addClass("d-none");
        $("#blockModal").removeClass("d-none");
        $("#userConfigBox").addClass("d-none");
    });

    //신고서브밋 클릭
    $(".reportModalSubmitBtn").on("click", function(){
        if($("#reportContent").val().length <= 0){
            alert("신고내용을 입력해주세요");
            return;
        }
        $("#reportModal").addClass("d-none");
        $("#reportCompleteModal").removeClass("d-none");
    });

    //신고완료 확인버튼
    $(".reportCompleteModalCloseBtn").on("click", function(){
        $("#reportCompleteModal").addClass("d-none");
    });

    //차단서브밋 클릭
    $(".blockModalSubmitBtn").on("click", function(){
        $("#blockModal").addClass("d-none");
        $("#blockCompleteModal").removeClass("d-none");
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
        $("#chatRoomQuitModal").addClass("d-none");
    });

    //여기서부터 가게 상세보기 모달 =======================================================================================================================

    //가게 상세보기 모달 열기
    $(document).on("click", ".storeDiv, .storeChatDiv", function(){
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
    	
    	let storeIntroduction =$(this).find(".storeIntroduction").val();
    	$("#storeIntroduction").empty();
    	if(storeIntroduction == 'null') $("#storeIntroduction").append(`<span>등록된 가게 소개가 없습니다</span>`);    	
		else $("#storeIntroduction").append(`<pre>`+ storeIntroduction +`</pre>`);
		
    	let storeDeposit = $(this).find(".storeDeposit").val();
    	$("#storeDeposit").text(storeDeposit + " 포인트");
    	
    	
    	
        $("#storeDetailModal").removeClass("d-none");
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

    //메뉴화면에서 카테고리 눌렀을때
    $(".storeDetailMenuCategoryRow").on("click", function(){
        if($(this).next().is(":visible")){
            $(this).find("i")[1].classList.add("d-none");
            $(this).find("i")[0].classList.remove("d-none");
            $(this).next().addClass("d-none");
        } else {
            $(this).find("i")[0].classList.add("d-none");
            $(this).find("i")[1].classList.remove("d-none");
            $(this).next().removeClass("d-none");
        }
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
				
				// 카테고리별로 객체를 묶은 객체
				let menuByCategory = {};
				
				// 배열을 순회하면서 카테고리에 따라 객체를 묶음
				menuItems.forEach((menuItem) => {
				    const { menuName, menuCategoryName } = menuItem;
				
				    // 카테고리에 해당하는 배열이 없으면 생성
				    if (!menuByCategory[menuCategoryName]) {
				        menuByCategory[menuCategoryName] = [];
				    }
				
				    // 객체를 해당 카테고리에 추가
				    menuByCategory[menuCategoryName].push(menuItem);
				});
				
				// 결과 확인
				console.log(menuByCategory);
				
let newObject = {};

// 원본 객체를 순회하면서 각각의 카테고리를 새로운 객체로 이동
for (let key in menuByCategory) {
    if (menuByCategory.hasOwnProperty(key)) {
        newObject[key] = { items: menuByCategory[key] };
        // 원본 객체에서 해당 카테고리를 삭제하려면 아래의 코드 사용
        // delete originalObject[key];
    }
}

// 결과 확인
console.log(newObject);
				
				
        		$("#storeMenuDiv").empty();
        		$(categoryList).each(function(i, v){
	        		$("#storeMenuDiv").append(`
						<div class="row border-bottom border-dark storeDetailMenuCategoryRow">
	                        <div class="col ps-3 py-3 fs-5 fw-bold">
	                            	`+ v +`
	                        </div>
	                        <div class="col-auto px-4 py-3 fs-5 fw-bold">
	                            <i class="bi bi-caret-down-fill"></i>
	                            <i class="bi bi-caret-up-fill d-none"></i>
	                        </div>
	                    </div>
	        		`);
        		});	
        	}, error : function(err){
        		console.log(err);
        	}
        });
        
    });

	$(".storeDetailMenuCategoryRow").on("click", function(){
	});

    //가게상세보기 모달 하단 메뉴버튼 클릭이벤트 - 리뷰
    $("#storeDetailModalReviewBtn").on("click", function(){
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilReviewContent").removeClass("d-none");
    });
    
    //가게상세보기 모달 하단 메뉴버튼 클릭이벤트 - 예약하기
    $("#storeDetailModalBookBtn").on("click", function(){
        $("#storeDeatilHomeContent").addClass("d-none");
        $("#storeDeatilMenuContent").addClass("d-none");
        $("#storeDeatilReviewContent").addClass("d-none");
        $("#storeDeatilBookContent").addClass("d-none");
        $("#storeDeatilBookContent").removeClass("d-none");
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

        const storeProfileImg = e.dataTransfer.getData('storeProfileImg');
        const storeName = e.dataTransfer.getData('storeName');
        const storeReviewCount = e.dataTransfer.getData('storeReviewCount');
        const storeDeposit = e.dataTransfer.getData('storeDeposit');
        const storeAddress = e.dataTransfer.getData('storeAddress');

        let infoMsg = `
        
			<div class="col-auto p-2">
			    <img src="resources/upload/`+ storeProfileImg +`" style="width: 110px; height: 110px;" class="rounded">
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
        console.log(e);
        console.log("드래그 요소가 '두' 번째 박스 영역에 드롭");
    });

    //여기서부터 예약모달 --------------------------------------------------------------------------------------------------------------------------------------
    //예약모달 가게 상세보기 클릭이벤트
    $("#bookModalShowStoreDetailBtn").on("click", function(){
        $("#storeDetailModal").removeClass("d-none");
    });

    //예약 거절 버튼 클릭이벤트
    $("#bookRejectBtn").on("click", function(){
        if($("#bookRejectBtn").val() == '거절'){
            $("#bookModal").addClass("d-none");
            return;
        }
        if($("#bookRejectBtn").val() == '취소'){
            $("#bookRejectBtn").val("거절");
            $("#bookAgreeBtn").removeClass("fs-3");
            $("#bookAgreeBtn").addClass("fs-2");
            $("#bookAgreeBtn").val("동의");
            $("#bookAgreeBtn").removeAttr("disabled");
            return;
        }
    });

    //예약 동의 버튼 클릭이벤트
    $("#bookAgreeBtn").on("click", function(){
        if(confirm("포인트가 차감됩니다\n동의하시겠습니까?")){
            $("#bookAgreeBtn").removeClass("fs-2");
            $("#bookAgreeBtn").addClass("fs-3");
            $("#bookAgreeBtn").val("동의하셨습니다");
            $("#bookAgreeBtn").attr("disabled", "true");
            $("#bookRejectBtn").val("취소");
        }
    });
    
    //예약 동의 지도표시
    const getBookMap = (coords) => {
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
        <b>BBQ 봉천점</b><br>
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
    }
    //파라미터에 예약제안 된 가게의 x,y좌표를 넣으면 됨
    getBookMap([33.450701, 126.570667]);

    //예약완료 후 확인버튼 클릭이벤트
    $("#bookCompleteConfirmBtn").on("click", function(){
        $("#bookModal").addClass("d-none");
    });

    //예약실패 후 확인버튼 클릭이벤트
    $("#bookFailedConfirmBtn").on("click", function(){
        $("#bookModal").addClass("d-none");
    });
    

});//끝