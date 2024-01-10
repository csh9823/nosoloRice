// 유효성검사
$(document).ready(function () {
    $("#normalJoinForm").on("submit", function (event) {
        if (!validateForm()) {
            event.preventDefault();
        }
    });
});

function validateForm() {

	// 입력값 가져오기
    let name = $("#name").val();
    let id = $("#normalId").val();
    let nickname = $("#nickName").val();
    let pass = $("#pass").val();
    let passCheck = $("#checkPass").val();
    let phone = $("#mobile").val();
    let chkNum = $("#chkNum").val();
    let year = $("#year").val();
    let month = $("#month").val();
    let day = $("#day").val();
    let email = $("#emailId").val();
    let gender = $("input[name='gender']:radio:checked").length;
    let zip = $("#zipcode").val();
    let add1 = $("#address1").val();
    let term =  $("input[name='termOK']:checked").length;
    
    // hidden값 가져오기
    let idCheck = $("#isIdCheck").val();
    let nickCheck = $("#isNickCheck").val();
    let phoneCheck = $("#certCheck").val();
    let x = $("#xpoint").val();
    let y = $("#ypoint").val();
    let domain = $("#emailDomain").val();
    
    if (name.trim() === "") {
        alert("이름은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (id.trim() === "") {
        alert("아이디는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (nickname.trim() === "") {
        alert("닉네임은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (pass.trim() === "") {
        alert("비밀번호는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (passCheck.trim() === "") {
        alert("비밀번호 확인은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (pass != passCheck) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (phone.trim() === "") {
        alert("전화번호는 \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (chkNum.trim() === "") {
        alert("인증번호를 입력해 주세요.");
        return false;
    }
    
    if (month < 1 || month > 12) {
    	alert("입력가능한 월은 1월부터 12월까지 입니다. \n확인 후 다시 입력해 주세요.");
    	return false;
    }
    
    if (day < 1 || day > 31) {
    	alert("입력가능한 일은 1일부터 31일까지 입니다. \n확인 후 다시 입력해 주세요.");
    	return false;
    }
    
    if (email.trim() === "") {
        alert("이메일은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (year.trim() === "" || month.trim() === "" || day.trim() === "") {
        alert("생년월일은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (year <= 1900 || year >= 2025) {
    	alert("입력가능한 연도는 1900년부터 2024년까지 입니다. \n확인 후 다시 입력해 주세요.");
    	return false;
    }
    
	if (gender <= 0) {
        alert("성별을 선택해 주세요.");
        return false;
    }
    
	if (zip.trim() === "") {
        alert("우편번호는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (add1.trim() === "") {
        alert("주소는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (term <= 0) {
        alert("이용약관 동의를 하지 않을 경우 회원가입이 불가합니다.");
        return false;
    }
    
    if (idCheck === false) {
        alert("아이디 중복확인은 필수입니다. \n진행 후 다시 시도해 주세요.");
        return false;
    }
    
    if (nickCheck === false) {
        alert("닉네임 중복확인은 필수입니다. \n진행 후 다시 시도해 주세요.");
        return false;
    }
    
    if (phoneCheck === false) {
        alert("휴대폰 중복확인은 필수입니다. \n진행 후 다시 시도해 주세요.");
        return false;
    }
    
    if (x === null) {
        alert("올바른 주소를 입력해 주세요.");
        return false;
    }
    
    if (y === null) {
        alert("올바른 주소를 입력해 주세요.");
        return false;
    }
    
    if (domain === null) {
        alert("이메일 도메인을 선택해 주세요.");
        return false;
    }
    

    return true;
}

// 입력한 이미지를 미리보기
    function profileImage(input) {
	    var preview = document.getElementById('profilePreview');
	    var file = input.files[0];

	
	    if (file) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	            preview.src = e.target.result;
	            preview.style.width = '400px';
	            preview.style.height = '400px';
	            
	        };
	
	        reader.readAsDataURL(file);
	    }
	}

$(document).ready(function () {
	
	// 이미지 입력시
    $('#profileImageInput').change(function () {
        profileImage(this);
    });

});

$("#btnZipcode").click(normalFindZipcode);

function normalFindZipcode(){
 	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 주소 - 좌표 변환
	            var geocoder = new daum.maps.services.Geocoder();
	
	            var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				    }
				};
				
				geocoder.addressSearch('#address1', callback);
					
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr = data.roadAddress; // 도로명으로 바꿔버림
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
                
                // 주소를 가져옴
			    var address = $("#address1").val();
			
			    // 주소를 좌표로 변환하는 Geocoder 객체 생성
			    var geocoder = new kakao.maps.services.Geocoder();
			
			    // 주소 검색 요청
			    geocoder.addressSearch(address, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            // 검색 결과에서 좌표값 가져오기
			            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			            // hidden 폼에 좌표값 설정
			            $("#xpoint").val(coords.getLat());
			            $("#ypoint").val(coords.getLng());
			
			            // 콘솔에 좌표값 출력
			            console.log('x :', coords.getLat());
			            console.log('y :', coords.getLng());
			        }
			   
			    });
    
            }
        }).open();
}


	$(document).ready(function () {
		$("#selectDomain").on("change", function() {
			var str = $(this).val();
			
			if(str == "naver.com") {
				$("#emailDomain").val("naver.com");
			} else if(str == "gmail.com") {
				$("#emailDomain").val("gmail.com");
			}else if(str == "daum.net") {
				$("#emailDomain").val("daum.net");
			}
		});
	});	

	// 회원 아이디 중복 확인 버튼이 클릭되면
	$("#overlapCheck").on("click", function() {	
		var id = $("#normalId").val();
		url = "overlapIdCheck?normalId="+id;
		var childWindowWidth = 500;
    	var childWindowHeight = 400;
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았습니다. \n 입력 후 다시 시도해 주세요.");
			return false;	
		}
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
	
		// 화면 중앙정렬
		var leftPosition = (screen.width - childWindowWidth) / 2;
    	var topPosition = (screen.height - childWindowHeight) / 2;
		window.open(url, "IdCheck", "toolbar=no, location=no, status=no, menubar=no, width=" + childWindowWidth + ", height=" + childWindowHeight + ", left=" + leftPosition + ", top=" + topPosition);
	
	});

	// 닉네임 중복 확인 버튼이 클릭되면
	$("#nickOverlapCheck").on("click", function() {
	    var nickName = $("#nickName").val();
	    var url = "nickOverlapCheck?nickName=" + nickName;
	    var childWindowWidth = 500;
    	var childWindowHeight = 400;

	    if (nickName.length <= 0) {
	        alert("닉네임이 입력되지 않았습니다. \n 입력 후 다시 시도해 주세요.");
	        return false;
	    }
	
	    if (nickName.length < 3) {
	        alert("닉네임은 3자 이상 입력해주세요.");
	        return false;
	    }
	
		// 화면 중앙정렬
		var leftPosition = (screen.width - childWindowWidth) / 2;
    	var topPosition = (screen.height - childWindowHeight) / 2;
    	
	    window.open(url, "NickCheck", "toolbar=no, location=no, status=no, menubar=no, width=" + childWindowWidth + ", height=" + childWindowHeight + ", left=" + leftPosition + ", top=" + topPosition
    );
	});
	
	// 아이디를 사용하겠다는 버튼이 눌리면
	$(document).on('click', '#btnIdCheckClose', function() {
		console.log("버튼은 눌림");
	    var id = $(this).attr("data-id-value");
	    console.log(id);
	    var normalIdElement = $(window.opener.document).find("#normalId");
	    var bIdElement = $(window.opener.document).find("#businessId");
	    var idCheck = $(window.opener.document).find("#isIdCheck").val(true);
	    let bIdCheck = $(window.opener.document).find("#isBusinessIdCheck").val(true);
	    
		normalIdElement.val(id);
		bIdElement.val(id);

	    window.close();
	});
	
	// 닉네임을 사용하겠다는 버튼이 눌리면
	$(document).on('click', '#btnNickCheckClose', function() {
	    var nickName = $(this).attr("data-nickname-value");
		var normalNickElement = $(window.opener.document).find("#nickName");
		var isNickCheck = $(window.opener.document).find("#isNickCheck").val(true);

	    normalNickElement.val(nickName);
	    
	    window.close();
	});
	
	$("#normalId").on("keyup", function() {
				
		let id = $(this).val();
		let regExp = /^[a-zA-Z0-9[\b]]+$/gi;

		if(! regExp.test(id)) {
			alert("아이디는 숫자 및 영문자만 입력 가능합니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
		
	});
	
	$("#nickName").on("keyup", function() {
				
		let nick = $(this).val();
		let regExp = /^[a-zA-Z0-9]+$/gi;

		if(! regExp.test(nick)) {
			alert("닉네임은 숫자와 영문자 대소문자만 입력 가능합니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
		
	});
	
	// 비번에 들어가는거 정규표현식
	$("#pass").on("keyup", function() {
		let reg = /^[a-zA-Z0-9!^&*()/_-]+$/;
	    let pass = $(this).val();
	
	    if (! reg.test(pass)) {
	        alert("비밀번호는 하나 이상의 대소문자, 숫자, 특수문자가 입력되어야 합니다.");
	        $(this).val($(this).val().replace(reg, ""));
	    }
	})
	
	// 비번_확인에 들어가는거 정규표현식
	$("#checkPass").on("keyup", function() {
		let reg = /^[a-zA-Z0-9!^&*()/_-]+$/;
	    let checkPass = $(this).val();
	
	    if (! reg.test(checkPass)) {
	        alert("비밀번호는 하나 이상의 대소문자, 숫자, 특수문자가 입력되어야 합니다.");
	        $(this).val($(this).val().replace(reg, ""))
	    }
	})
	
	$("#emailId").on("keyup", function() {
		let reg = /^[a-zA-z0-9._%+-]+/;
		let email = $(this).val();
		
		if (! reg.test(email)) {
	        alert("@이전의 이메일 아이디만 입력해 주세요.");
	        $(this).val($(this).val().replace(reg, ""))
	    }
	});