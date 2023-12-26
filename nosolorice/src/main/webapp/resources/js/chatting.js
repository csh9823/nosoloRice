$("#send").on("click", function(e) {
    sendMessage();
    $('#msg').val('');
});

var sock = new SockJS('http://localhost:8080/chatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
    sock.send($("#msg").val());
}

// 메시지 받았을 때
function onMessage(msg) {
    var data = msg.data;
    var sessionId = null; // 데이터 보낸놈
    var message = null;

    var arr = data.split(":");

    for (var i = 0; i < arr.length; i++) {
        console.log('arr[' + i + ']: ' + arr[i]);
    }

    var cur_session = '${normalId}'; // Assuming you have 'normalId' defined somewhere
    console.log("cur_session : " + cur_session);

    sessionId = arr[0];
    message = arr.slice(1).join(":"); // Combine the rest of the array elements into the message

    // 로그인 한 클라이언트와 타 클라이언트 분류
    if (sessionId == cur_session) {
        var str = "<div class='col-6'>";
        str += "<div class='alert alert-secondary'>";
        str += "<b>" + nickName + " : " + message + "</b>";
        str += "</div></div>";

        $("#msgArea").append(str);
    } else {
        var str = "<div class='col-6'>";
        str += "<div class='alert alert-warning'>";
        str += "<b>" + nickName + " : " + message + "</b>";
        str += "</div></div>";

        $("#msgArea").append(str);
    }
}

// 채팅탈주
function onClose(evt) {
    var user = '${nickName}';
    var str = user + " 님이 퇴장하셨습니다.";

    $("#msgArea").append(str);
}
