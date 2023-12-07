function findZipcode(){
 	 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr = data.roadAddress; // 도로명으로 바꿔버림
                    //addr = data.jibunAddress; 지번 안쓰니 지번을 지워줌 
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   addr += extraAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#zipcode").val(data.zonecode);
                $("#address1").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#address2").focus();
            }
        }).open();
}


function inputCharReplace(){
	//대문자 A Z 소문자 a z 0부터 9까지 ^의 뜻 부정 아니면
	let regExp = /[^A-Za-z0-9]/gi;
		
	//입력 값이 숫자 또는 영문자인지 판단 -- 정규 표현식
	if(regExp.test($(this).val())){
		alert("영문 대소문자와 숫자만 입력할 수 있음")
		$(this).val($(this).val().replace(regExp,"")); //A Z 소문자 a z 0부터 9가 아니면 "" 문자를 지워라
	}
}

function inputEmailDomainReplace(){
	//대문자 A Z 소문자 a z 0부터 9까지 ^의 뜻 부정 아니면
	let regExp = /[^A-Za-z0-9\.]/gi;
		
	//입력 값이 숫자 또는 영문자인지 판단 -- 정규 표현식
	if(regExp.test($(this).val())){
		alert("이메일 도메인은 영문 대소문자와 숫자,(.)만 입력 할 수 있음")
		$(this).val($(this).val().replace(regExp,"")); //A Z 소문자 a z 0부터 9가 아니면 "" 문자를 지워라
	}
}

//회원 가입 폼 , 수정 폼 유효성 검사 함수
function joinFormCheck(elem){
	if($("#name").val().length == 0 ){
		alert("이름을 입력해주세요");
	}

		if($("#isIdCheck").val() == 'false' ){
			alert("아이디 중복을 체크해 주세요");
		}
	
		if($("#pass1").val().length == 0 ){
			alert("비밀번호를 입력해 주세요");
		}
	
	
		if($("#pass2").val().length == 0 ){
			alert("비밀번호 확인을 입력해 주세요");
		}
		
		if($("#pass1").val() != $("#pass2").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}

	if($("#userId2").val().length == 0){
		alert("아이디를 입력해 주세요.");
	}
	

	if($("#zipcode").val().length == 0){
		alert("우편주소를 입력해주세여");
	}
	

	if($("#address1").val().length == 0){
		alert("주소를 입력해주세요");
	}

	if($("#emailId").val().length == 0){
		alert("이메일 아이디를 입력해 주세요.");
	}
	
	if($("#emailDomain").val().length == 0){
		alert("이메일 주소를 입력해 주세요.");
	}
	

	if($("#mobile2").val().length == 0){
		alert("핸드폰 번호를 입력해주세여");
	}
	
	if($("#mobile3").val().length == 0){
		alert("핸드폰 번호를 입력해주세여");
	}
	

	if($("#phone2").val().length == 0){
		alert("자택 번호를 입력해 주세요.");
	}
	
	if($("#phone3").val().length == 0){
		alert("자택 번호를를 입력해 주세요.");
	}
}

$(function() {
	
	$("#joinUpdateForm").on("submit", function(){
		let formck = $("#isPassCheck").val();
		if(!formck){ // .prop("disabled") true인지 false인지 확인
			alert("비밀번호 확인을 해주세요");
			return false;
		}
		
	})
	
	$("#btnPassCheck").on("click",function(){
		let id = $("#userId2").val();
		let pass = $("#oldPass1").val();
		
		if(pass.length == 0){
			alert("기존 비밀번호를 입력해 주세요");
			return;
		}
		//이렇게 데이터를 보내게 함 id=asds&pass=1234
		/*
			문자,숫자,블린, bjson
			{"result": "false"} => JSON.parse() = js object JSON.stringify() = json file{}
		*/
		let data = "id=" + id + "&pass=" + pass;
		$.ajax({
			"url" : "passCheck.ajax",
			"data" : data,
			"type" : "post" ,
			"dataType" : "json",
			// 성공하면 호출
			"success" : function(resData){
				console.log(resData);
				//비밀번호가 맞으면
				if(resData.result == true){
					$("#passajax").text("확인");
					$("#isPassCheck").val("true");
					$("#oldPass1").prop("readonly",true)
				}else{
					//비밀번호가 틀리면
					alert("비밀번호가 일치하지 않음");
					$("#oldPass1").val("").focus();
					return;
				}
				
			},
			// 에러 생김 호출
			"error" : function(xhr,statusText,err){
				console.error("error...");
			}
		});
	})
	
	$("#joinForm").on("submit", function(){
		return joinFormCheck();
	});
	
	
	$("#selectDomain").on("change",function(){
		let str = $(this).val();
		
		if(str == "직접입력") {
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		} else if(str == "네이버"){
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "다음") {
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "한메일"){
			$("#emailDomain").val("hanmail.net");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "구글") {
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
		}else if(str == "카카오") {
			$("#emailDomain").val("kakao.com");
			$("#emailDomain").prop("readonly", true);
		}
	});
	
	$("#btnZipcode").on("click",findZipcode)
	
	//입력 값이 숫자 또는 영문자인지 판단
	$("#pass1").on("keyup",inputCharReplace);
	$("#pass2").on("keyup",inputCharReplace);
	$("#emailId").on("keyup",inputEmailDomainReplace);
	
	//입력 값이 숫자 또는 영문자인지 판단
	$("#userId2").on("keyup", function(){
		let id = $(this).val();
		//대문자 A Z 소문자 a z 0부터 9까지 ^의 뜻 부정 아니면
		let regExp = /[^A-Za-z0-9]/gi;
		
		//입력 값이 숫자 또는 영문자인지 판단 -- 정규 표현식
		if(regExp.test(id)){
			alert("영문 대소문자와 숫자만 입력할 수 있음")
			$(this).val($(this).val().replace(regExp,"")); //A Z 소문자 a z 0부터 9가 아니면 "" 문자를 지워라
		}
	});
	
	
	$("#btnIdCheckClose").on("click", function() {
		
		let id = $(this).attr("data-id-value");
		
		opener.document.joinForm.id.value = id ;
		
		opener.document.joinForm.isIdCheck.value = true ;
		
		window.close();
	})
	
	$("#idCheckForm").submit(() => {
	
		let id = $("#checkId").val();
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않음");
			return false;	
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		
	})

	// 회원 아이디 중복 확인 버튼이 클릭되면
	$("#btnOverlapId").on("click", () => {	
		let id = $("#userId2").val();
		url = "overlapIdCheck?id="+id;
		if(id.length <= 0) {
			alert("아이디가 입력되지 않음");
			return false;	
		}
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
	
		window.open(url, "idCheck", "toolbar=no, location=no, " + "status=no, memubar=no, width=500, height=400");
	
	});
	
	$("#loginForm").submit(() => {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않음");
			$("#userId").focus();
		
			return false;	
		}
		
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않음");
			$("#userPass").focus();
			
			return false;
		}
	});
	
	$("#loginFormModal").submit(() => {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않음");
			$("#userId").focus();
		
			return false;	
		}
		
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않음");
			$("#userPass").focus();
			
			return false;
		}
	});
	
});