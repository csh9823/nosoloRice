// 핸드폰인증 API 구현하기
function verify() {
	$("#verifyResult").val("true");
}

// 프로필 이미지 미리보기
 function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e){
            const previewImage = document.querySelector('.preview');
            previewImage.src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(function() {
	// 비밀번호일치확인(실시간 출력)
	$("#oldPass").on("keyup", function() {
		if($("#oldPass").val() == $("#rPass").val()) {
			$("#oldPassCheck").css("display", "block");
		}
		if($("#oldPass").val() != $("#rPass").val()) {
			$("#oldPassCheck").css("display", "none");
		}
	});
	$("#passCheck").on("keyup", function() {
		if($("#passCheck").val() == $("#pass").val()) {
			$("#passCheckResult").css("display", "block");
		}
		if($("#passCheck").val() != $("#pass").val()) {
			$("#passCheckResult").css("display", "none");
		}
	});

	// 사장님 개인정보 수정
	$("#businessUserInfoUpdate").on("submit", function() {
		if($("#oldPass").val().length <= 0) {
			alert("비밀번호를 입력해주세요.");
			$("#oldPass").focus();
			return false;
		}
		if($("#pass").val().length <= 0) {
			alert("새로운 비밀번호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if($("#passCheck").val().length <= 0) {
			alert("새로운 비밀번호를 확인해주세요.");
			$("#passCheck").focus();
			return false;
		}
		if($("#mobile2").val().length <= 0) {
			alert("핸드폰번호를 입력해주세요.");
			$("#mobile2").focus();
			return false;
		}
		if($("#mobile3").val().length <= 0) {
			alert("핸드폰번호를 입력해주세요.");
			$("#mobile3").focus();
			return false;
		}
		if($("#mail").val().length <= 0) {
			alert("이메일을 입력해주세요.");
			$("#mail").focus();
			return false;
		}
		if($("#name").val().length <= 0) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if($("#bankNumber").val().length <= 0) {
			alert("계좌번호를 입력해주세요.");
			$("#bankNumber").focus();
			return false;
		}
		if($("#phone2").val().length <= 0) {
			alert("가게 전화번호를 입력해주세요.");
			$("#phone2").focus();
			return false;
		}
		if($("#phone3").val().length <= 0) {
			alert("가게 전화번호를 입력해주세요.");
			$("#phone3").focus();
			return false;
		}
		if($("#postNum").val().length <= 0) {
			alert("우편번호를 입력해주세요.");
			$("#postNum").focus();
			return false;
		}
		if($("#address1").val().length <= 0) {
			alert("가게 주소를 입력해주세요.");
			$("#address1").focus();
			return false;
		}
		if($("#oldPass").val() != $("#rPass").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#oldPass").focus();
			return false;
		}
		if($("#passCheck").val() != $("#pass").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#passCheck").focus();
			return false;
		}
		if($("#verifyResult").val() == "false"){
			alert("본인인증을 진행해주세요.");
			return false;
		}
		if ($("#domain").val() != "choice" || ($("#domain").val() == "choice" && /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test($("#mail").val()))) {
		    // 올바른 이메일 형식
		} else {
		    alert("올바른 이메일 형식이 아닙니다.");
		    $("#mail").focus();
		    return false;
		}
				
	});





});