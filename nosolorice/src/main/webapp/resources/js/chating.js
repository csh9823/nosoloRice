$(function(){

	//채팅방 진입시 db의 chat_member테이블에서 로그인한 ID가 있는지 확인.
	//있으면 room_id의 값을 가져온다.
	//가져온 room_id를 이용해 chat_room 테이블에서 채팅방의 정보를 가져온다.
	//roomId를 이용해 chat_history테이블에서 기존 채팅메시지들을 가져온다
	//가져온 채팅방정보에서 centerPoint 혹은 address를 이용해 ajax로 가게리스트를 가져온다
	//가져온 room_id를 이용해 웹소켓채팅서버를 연다 ex)192.168.0.1:8081/app/chat/${roomId}
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

    //부트스트랩 tool-tip 활성화
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

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

    //채팅창 항상 최하단 유지
    let chatContent = document.querySelector("#chatContent");
    chatContent.scrollTo(0, chatContent.scrollHeight);

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
        console.log($("#chatMessageInput").val());
        $("#chatMessageInput").val("");
        $("#chatMessageInput").focus();
    });

    //채팅 입력창 이미지업로드 버튼을 눌렀을 때
    $("#chatImgUploadBtn").on("click", function(){
        $("#chatImgUpload").click();
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
    $(".storeDiv, .storeChatDiv").on("click", function(){
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

        console.log("채팅창에서 드롭 받음", e);
        console.log("storeProfileImg : ", storeProfileImg);
        console.log("storeName : ", storeName);
        console.log("storeReviewCount : ", storeReviewCount);
        console.log("storeDeposit : ", storeDeposit);
        console.log("storeAddress : ", storeAddress);
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