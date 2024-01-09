$(function(){

	let loginId = $("#loginId").val();
	console.log(loginId);
	$.ajax({
		url: "isMatchingCheck",
		data : "id=" + loginId,
		type : "post",
		dataType : "json",
		success : function(resData){
			console.log("resData : ", resData);
			if(resData.result){
				location.href="/app/chating"
			}
		}, error : function(err) {
			console.log("통신에러",err);
		}
	});

    //Matching 웹소켓 변수
    let socket;

    //지도에서 선택한 위치의 좌표
    let selectedCoord = new Array();
    
    //메뉴카테고리 3개이상 못고르게 하는 이벤트
    $("input[name=matchMenuCategory]").on("click", function(){
        let checkedCount = 0;
        $("input[name=matchMenuCategory]").each(function(){
            if(this.checked) checkedCount++;
        });
        if(checkedCount > 3){
            $(this).prop("checked", false);
            alert("최대 3개까지 선택하실 수 있습니다");
        }
    });
    
    
    $("#step1NextBtn").on("click", function(){
        
        $('#step1').css("opacity", "0");
        setTimeout(function(){
            $("#step1").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step2').css("opacity", "0");
            $("#step2").removeClass("d-none");
            setTimeout(()=>{
                $('#step2').css("opacity", "1");
            }, 250);
        }, 250);
        
    });

    $("#step2PrevBtn").on("click", function(){
        $('#step2').css("opacity", "0");
        setTimeout(function(){
            $("#step2").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step1').css("opacity", "0");
            $("#step1").removeClass("d-none");
            setTimeout(()=>{
                $('#step1').css("opacity", "1");
            }, 250);
        }, 250);
    });

    $("#step1Plus").on("click", function(){
        let count = parseInt($("#memberCount").text());
        if(count >= 4){
            return;
        }
        $("#memberCount").text(count + 1);
    });

    $("#step1Minus").on("click", function(){
        let count = parseInt($("#memberCount").text());
        if(count <= 2){
            return;
        }
        $("#memberCount").text(count - 1);
    });

    $("#step2MapBtn").on("click", function(){
        $('#step2').css("opacity", "0");
        setTimeout(function(){
            $("#step2").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step3_1').css("opacity", "0");
            $("#step3_1").removeClass("d-none");
            setTimeout(()=>{
                $('#step3_1').css("opacity", "1");
            }, 250);
            relayout();
        }, 250);
    });
    
    $("#step2AddressBtn").on("click", function(){
        $('#step2').css("opacity", "0");
        setTimeout(function(){
            $("#step2").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step3_2').css("opacity", "0");
            $("#step3_2").removeClass("d-none");
            setTimeout(()=>{
                $('#step3_2').css("opacity", "1");
            }, 250);
        }, 250);
    });

    let selectedLocationMethod = "";

    $("#step3_1PrevBtn").on("click", function(){
        $('#step3_1').css("opacity", "0");
        setTimeout(function(){
            $("#step3_1").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step2').css("opacity", "0");
            $("#step2").removeClass("d-none");
            setTimeout(()=>{
                $('#step2').css("opacity", "1");
            }, 250);
        }, 250);
    });

    $("#step3_2PrevBtn").on("click", function(){
        $('#step3_2').css("opacity", "0");
        setTimeout(function(){
            $("#step3_2").addClass("d-none");
        }, 250);
        setTimeout(function(){
            $('#step2').css("opacity", "0");
            $("#step2").removeClass("d-none");
            setTimeout(()=>{
                $('#step2').css("opacity", "1");
            }, 250);
        }, 250);
    });

    $("#step3_1NextBtn").on("click", function(){
        if(selectedCoord.length <= 0){
            alert("원하시는 위치를 클릭해서 지정해주세요");
            return;
        }

        $('#step3_1').css("opacity", "0");
        setTimeout(function(){
            $("#step3_1").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step4').css("opacity", "0");
            $("#step4").removeClass("d-none");
            setTimeout(()=>{
                $('#step4').css("opacity", "1");
            }, 250);
        }, 250);
        selectedLocationMethod = "map";
    });

    $("#step3_2NextBtn").on("click", function(){
        const addressValue = $("#addressValue").text();
        if(addressValue.length <= 0){
            alert("주소를 입력해주세요");
            return;
        }

        $('#step3_2').css("opacity", "0");
        setTimeout(function(){
            $("#step3_2").addClass("d-none");
        }, 250);

        setTimeout(function(){
            $('#step4').css("opacity", "0");
            $("#step4").removeClass("d-none");
            setTimeout(()=>{
                $('#step4').css("opacity", "1");
            }, 250);
        }, 250);
        selectedLocationMethod = "address";
    });

    $("#step4PrevBtn").on("click", function(){

        if(selectedLocationMethod == 'map'){
            $('#step4').css("opacity", "0");
            setTimeout(function(){
                $("#step4").addClass("d-none");
            }, 250);
            setTimeout(function(){
                $('#step3_1').css("opacity", "0");
                $("#step3_1").removeClass("d-none");
                setTimeout(()=>{
                    $('#step3_1').css("opacity", "1");
                }, 250);
            }, 250);
            return;
        }
        if(selectedLocationMethod == 'address'){
            $('#step4').css("opacity", "0");
            setTimeout(function(){
                $("#step4").addClass("d-none");
            }, 250);
            setTimeout(function(){
                $('#step3_2').css("opacity", "0");
                $("#step3_2").removeClass("d-none");
                setTimeout(()=>{
                    $('#step3_2').css("opacity", "1");
                }, 250);
            }, 250);
            return;
        }
    });

    $("#step4NextBtn").on("click", function(){
        $('#step4').css("opacity", "0");
        setTimeout(function(){
            $("#step4").addClass("d-none");
        }, 250);
        setTimeout(function(){
            $('#matchingStart').css("opacity", "0");
            $("#matchingStart").removeClass("d-none");
            setTimeout(()=>{
                $('#matchingStart').css("opacity", "1");
            }, 250);
        }, 250);
    });

    $("#matchingStartCancleBtn").on("click", function(){
        if($("#matchingStartCancleBtn").text().trim() == '이전으로'){
            $('#matchingStart').css("opacity", "0");
            setTimeout(function(){
                $("#matchingStart").addClass("d-none");
            }, 250);
            setTimeout(function(){
                $('#step4').css("opacity", "0");
                $("#step4").removeClass("d-none");
                setTimeout(()=>{
                    $('#step4').css("opacity", "1");
                }, 250);
            }, 250);


        } else{
	    	matchingServerDisconnect();
            $("#matchingStartMention").text("버튼을 누르면 매칭을 시작합니다");
            $("#matchingStartBtn").html('<span style="font-size:6em;">매칭시작</span>');
            $("#matchingStartCancleBtn").text("이전으로");
        }
    });

            //매칭시작 버튼 눌렀을 때
    $("#matchingStartBtn").on("click", function(){

        if($(this).text().trim() == '매칭시작'){
            $("#matchingConfigModal").css("display", "block");
            $("#matchingModalBg").css("display", "block");
            setTimeout(function(){
                $('#matchingConfigModal').css("opacity", "1");
                $("#matchingModalBg").css("opacity", "1");
            }, 250);
    
            //보여줘야할 것들
            //인원,메서드,메서드내용,음식카테고리,성별,연령대
            
            // 인원
            $(".configCount").text($("#memberCount").text().trim());
            
            //메서드
            if(selectedLocationMethod == 'map'){
                $(".configMethod").text("지도");
            } else if(selectedLocationMethod == 'address'){
                $(".configMethod").text("주소");
            }
            
            //위치설정 정보
    
            const addressValue = $("#addressValue").text();
            
            $(".configLocationInfo").empty();
            if(selectedLocationMethod == 'map'){
                const locationAreaSelect = $('#locationAreaSelect').val();
                //xy좌표
                //
                $(".configLocationInfo").append(
                    `<div id="miniMap" class="rounded border bg-white" style="width: 100%; height: 150px;"></div>`
                );
                getMiniMap(selectedCoord);
            } else if(selectedLocationMethod == 'address'){
                $(".configLocationInfo").append(`
                <span class="fs-6">
                ${addressValue}
                </span>
                `)
            }
    
            //음식카테고리
            const category = $("input[name=matchMenuCategory]:checked");
            $(".configCategory").empty();
            if(category.length == 0){
                $(".configCategory").append("상관없음");
            } else {
                category.each(function(i, v){            
                    $(".configCategory").append($(v).val()+"<br>");
                });
            }
            
            //성별
            const gender = $("input[name=matchGender]:checked").val();
            if(gender == 'yes'){
                $(".configGender").text("같은 성별만 매칭");
            } else if(gender == 'no' || gender == undefined){
                $(".configGender").text("상관없음");
            }
            
            //연령대
            let configAge = $("#matchingAgeSelect").val();
            if(configAge == 0){
                $(".configAge").text("상관없음");
            } else{
                $(".configAge").text($("#matchingAgeSelect").val() + "대");
            }
        } else {
        	matchingServerDisconnect();
            $("#matchingStartMention").text("버튼을 누르면 매칭을 시작합니다");
            $("#matchingStartBtn").html(
                '<span style="font-size:6em;">매칭시작</span>'
            );
            $("#matchingStartCancleBtn").text("이전으로");
        }
    });

    $("#matchingConfigModalCloseBtn").on("click", function(){

        $('#matchingConfigModal').css("opacity", "0");
        $("#matchingModalBg").css("opacity", "0");
        setTimeout(function(){
            $("#matchingConfigModal").css("display", "none");
            $("#matchingModalBg").css("display", "none");
        }, 250);
    });

    $("#matchingConfigModalMatchingBtn").on("click", function(){
        $("#matchingConfigModalCloseBtn").click();
        setTimeout(function(){
            $("#matchingStartMention").text("버튼을 누르면 매칭이 취소됩니다");
            $("#matchingStartCancleBtn").text("취소하기");
            $("#matchingStartBtn").html(
                `<div class="matchingTextAnimation" style="font-size:6em;">
                    <span>매</span>
                    <span>칭</span>
                    <span>중</span>
                </div>`
            );
            
            //Matching 웹소켓 연결
            //인원, 위치메서드, 위치정보, 카테고리, 성별, 연령대
            const memberCount = $("#memberCount").text().trim();
            const locationMethod = selectedLocationMethod;
            let locationInfo = null;
            
            if(locationMethod == "map"){
            	const area = $("#locationAreaSelect").val();
            	selectedCoord.push(area);
            	locationInfo = selectedCoord;
            } 
            else {
            	locationInfo = $(addressValue).text().trim();
            }
            
            let category = new Array();
            $("input[name=matchMenuCategory]:checked").each(function(i, v){
            	category.push($(v).val());
            });
            const gender = $("input[name=matchGender]:checked").val();
            const age = $("#matchingAgeSelect").val();
            //세션로그인 이용자의 정보. 일단 임시로 지정해놓음
            const sessionGender = "male";
            let blockList = new Array();
            //ajax로 자신의 blockList를 가져온다.
            $.ajax({
            	url : "/app/getBlockList",
            	data : "blocker=" + loginId,
            	type : "post",
            	dataType : "json",
            	async : false,
            	success : function(resData){
            		console.log(resData);
            		blockList = resData;
            	}, error : function(err){
            		console.log(err);
            	}
            });
            
            console.log("blockList : ", blockList);
            
			const matchingData = {
				loginId : loginId,
		        memberCount : memberCount,
		        locationMethod: locationMethod,
		        locationInfo : locationInfo,
		        category : category,
		        gender : gender,
		        age : age,
		        sessionGender : sessionGender,
		        blockList : blockList
		    };
		    matchingServerConnect(matchingData);
            
        }, 500);
    });
        
    //matching 웹소켓 서버 연결
    const matchingServerConnect = (matchingData) => {
    
    	//학원꺼
	    //let url = "ws://192.168.0.14:8081/app/matching";
	    let url = "ws://192.168.0.16:8081/app/matching";
	    
	    //집꺼
	    //let url = "ws://192.168.35.92:8081/app/matching";
	    
	    //현진이꺼
		//let url = "ws://192.168.0.44:8090/app/matching";
	    
	    socket = new WebSocket(url);
	    
	    //matching 웹소켓 서버에 연결 됬을 때 이벤트
	    $(socket).on("open", function(event) {
	    	console.log("matching 웹소켓 서버에 연결 되었습니다.");      	
	    	const data = JSON.stringify(matchingData);
			socket.send(data);            	
		});
	    
	    //matching 웹소켓 서버에서 메시지가 왔을 때 이벤트    						
		socket.addEventListener('message', function(event){
		    
		    console.log('서버로부터 메시지 수신:', event.data); // 문자열로 출력
		    
		    const messageObj = JSON.parse(event.data);
		    console.log(messageObj);
		    
		    //ajax통신으로 messageObj객체를 서버에 보내 DB작업을 해야함
		    //1. chat_room테이블에 정보저장
		    //2. chat_member테이블에 정보저장(이 과정에서 현재 로그인한 유저의 id가 필요함)
		    $.ajax({
		    
		    	url : "/app/matchingComplete",
		    	contentType: "application/json; charset=utf-8",
		    	data : event.data,
		    	type : "post",
		    	dataType: "json",
		    	success : function(resData){
		    		console.log(resData);
		    		if(resData.success){
			    		//db작업이 끝나면 채팅창으로 이동
					    //채팅창에서 db를 검색해 자동으로 roomId가 엔드포인트인 웹소켓 서버로 연결 시켜줄거임
					    location.href="/app/chating";
		    		}
		    	}, error : function(){
		    		console.log("통신에러");
		    	}
		    
		    });
		});
		
		//matching 웹소켓 서버에 연결이 끊겼을때 이벤트
		$(socket).on('close', function(event) {
		    console.log('WebSocket 연결이 닫혔습니다.');
		});
		
		//matching 웹소켓 서버와 통신이 에러났을 때 이벤트
		$(socket).on('error', function(event) {
		    console.error('WebSocket 오류:', event);
		});
	}
	
	//Matching 웹소켓 버서 연결해제
	const matchingServerDisconnect = () => {
		if(socket) {
			socket.close();
		}
	}
    
    $("#firstStepBtn").on("click", function(){
        if($("#matchingStartBtn").text().trim() == "매칭시작"){
            $('#matchingStart').css("opacity", "0");
            setTimeout(function(){
                $("#matchingStart").addClass("d-none");
            }, 250);
            setTimeout(function(){
                $('#step1').css("opacity", "0");
                $("#step1").removeClass("d-none");
                setTimeout(()=>{
                    $('#step1').css("opacity", "1");
                }, 250);
            }, 250);
        }
        else {
            alert("매칭을 먼저 취소해주세요");
            return;
        }

    });

    $("#mapAddressSearchBtn").on("click", function(){
        if($("#mapAddressSearchModal").is(":visible")){
            $('#mapAddressSearchModal').css("opacity", "0");
            setTimeout(function(){
                $("#mapAddressSearchModal").css("display", "none");
            }, 300);
        } else{
            let address = "";
            $("#mapAddressSearchModal").css("display", "block");
            setTimeout(function(){
                $('#mapAddressSearchModal').css("opacity", "1");
            }, 300);
            // 우편번호 찾기 찾기 화면을 넣을 element
            var mapWrap = document.getElementById('mapWrap');

            function foldDaumPostcode() {
                // iframe을 넣은 element를 안보이게 한다.
                mapWrap.style.display = 'none';
            }

            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';
                    if (data.userSelectedType === 'R') {addr = data.roadAddress;}
                    else {addr = data.jibunAddress;}
                    
                    // 비지니스 로직 시작
                    address = addr;
                    console.log("검색한 주소 : ", address);

                    // 검색이 끝나면 지도API를 검색한 주소로 이동한다.
                    geocoder.addressSearch(address, (res, stat) => { 
                        marker.setMap(null);
                        circle.setMap(null);
                        infowindow.setMap(null);
                        if (stat === kakao.maps.services.Status.OK) {
                        const coords = new kakao.maps.LatLng(res[0].y, res[0].x);
                        map.setCenter(new kakao.maps.LatLng(res[0].y, res[0].x));
                        marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        })
                        infowindow.open(map, marker);
                        circle.setMap(map);
                        circle.setOptions({radius: $("#locationAreaSelect").val()*1000});
                        circle.setPosition(new kakao.maps.LatLng(res[0].y, res[0].x));
                        }
                        $("#mapAddressSearchModal").css("display", "none");
                        selectedCoord = [res[0].y, res[0].x];
                    });

                    // 비지니스 로직 끝

                    document.body.scrollTop = currentScroll;
                },
                onresize : function(size) {mapWrap.style.height = size.height+'px';},
                width : '100%',
                height : '476px',
                animation : true
            }).embed(mapWrap);
            mapWrap.style.display = 'block';
        }
    });
	
    $("#mapMyAdressBtn").on("click", function(){
        const myAddress = [33.44989314758255, 126.5770215978931];
        $('#mapAddressSearchModal').css("opacity", "0");
        setTimeout(function(){
            $("#mapAddressSearchModal").css("display", "none");
        }, 300);

        marker.setMap(null);
        circle.setMap(null);
        infowindow.setMap(null);

        map.setCenter(new kakao.maps.LatLng(myAddress[0], myAddress[1]));
        marker = new kakao.maps.Marker({
            map: map,
            position: map.getCenter()
        })
        infowindow.open(map, marker);

        circle.setMap(map);
        circle.setOptions({radius: $("#locationAreaSelect").val()*1000});
        circle.setPosition(new kakao.maps.LatLng(myAddress[0], myAddress[1]));
        selectedCoord = [myAddress[0], myAddress[1]];
    });
    
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        circle.setMap(null);
        infowindow.setMap(null);
        var latlng = mouseEvent.latLng;
        marker.setPosition(latlng);
        infowindow.open(map, marker);

        circle.setMap(map);
        circle.setOptions({radius: $("#locationAreaSelect").val()*1000});
        circle.setPosition(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));

        selectedCoord = [latlng.getLat(), latlng.getLng()];
        relayout();
    });

    $("#locationAreaSelect").on("change", function(){
        circle.setOptions({radius: $(this).val()*1000});
    });


});