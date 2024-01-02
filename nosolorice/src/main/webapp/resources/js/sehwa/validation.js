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
	// 비밀번호일치확인(새로운비밀번호)
	$("#passCheck").on("keyup", function() {
		if($("#passCheck").val() == $("#pass").val() && $("#passCheck").val().length != 0) {
			$("#passCheckResult").css("display", "block");
		}
		if($("#passCheck").val() != $("#pass").val()) {
			$("#passCheckResult").css("display", "none");
		}
	});
	
	// 핸드폰번호 변경 시
	$("#mobile1, #mobile2, #mobile3").on("change", function() {
		let id = $("#businessId").val();
		let mobile1 = $("#mobile1").val();
		let mobile2 = $("#mobile2").val();
		let mobile3 = $("#mobile3").val();
		let inputMobile = mobile1 + "-" + mobile2 + "-" + mobile3;	
	
		$.ajax({
			"url" : "checkBusinessMobile.ajax",
			"data" : {
				"id" : id,
				"inputMobile" : inputMobile
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				if(resData == 'true') {
					$("#verifyResult").val(true);
				} else {
					$("#verifyResult").val(false);
				}
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", xhr, err);
			}
		});	
	
	
		// $("#verifyResult").val(false);
	});



	// 사장님 개인정보 수정
	$("#businessUserInfoUpdate").on("submit", function() {
		if($("#oldPassCheck").css("display") === "none") {
			alert("기존 비밀번호가 일치하지 않습니다.");
			$("#oldPass").focus();
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
		if($("#passCheck").val() != $("#pass").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#passCheck").focus();
			return false;
		}
		if($("#verifyResult").val() == "false"){
			alert("핸드폰 인증을 진행해주세요.");
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

	// 일반유저 개인정보 수정
	$("#normalUserInfoUpdate").on("submit", function() {
		if($("#oldPassCheck").css("display") === "none") {
			alert("기존 비밀번호가 일치하지 않습니다.");
			$("#oldPass").focus();
			return false;
		}
		if($("#birth1").val().length <= 0) {
			alert("출생년도를 입력해주세요.");
			$("#birth1").focus();
			return false;
		}
		if($("#birth2").val().length <= 0) {
			alert("출생 월을 입력해주세요.");
			$("#birth2").focus();
			return false;
		}
		if($("#birth3").val().length <= 0) {
			alert("출생 일을 입력해주세요.");
			$("#birth3").focus();
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
			alert("핸드폰 인증을 진행해주세요.");
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
	
	// 리뷰모달 유효성검사
	$("#reviewModalForm").on("submit", function() {
		if($("#reviewContent").val().length <= 0) {
			alert("리뷰내용을 작성해주세요.");
			return false;
		}
		if($(".starPoint").val() == 0) {
			alert("별점을 선택해주세요.");
			return false;
		}
	});
	






});