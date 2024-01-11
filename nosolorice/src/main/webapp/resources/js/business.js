// 유효성검사
$(document).ready(function () {
    $("#businessJoinForm").on("submit", function () {
    	
    	// 입력값 가져오기
    let bname = $("#businessUserName").val();
    let bid = $("#businessId").val();
    let bName = $("#bName").val();
    let bpass = $("#bPass").val();
    let passCheck = $("#checkBPass").val();
    let phone = $("#bPhone").val();
    let chkNum = $("#checkNum").val();
    let email = $("#bEmail").val(); 
    let bNum = $("#businessNumber").val();
    let bankcode = $("select[name=bankcode]").val();
    let accountNumber = $("#accountNumber").val();
    let callPhone = $("#callPhone").val();
    let zip = $("#zipcode").val();
    let add1 = $("#address1").val();
    let term =  $("input[name='termOK']:checked").length;
    let regImg = $("#businessRegImg").val();
    let checkNum = $("#bNoCheck").val;
    
    // hidden값 가져오기
    let idCheck = $("#isIdCheck").val(); // 아이디
    let phoneCheck = $("#bPhoneCheck").val(); // 전화번호인증
    let x = $("#xpoint").val();
    let y = $("#ypoint").val();
    let bNo = $("#bNoCheck").val();

	if (bid.trim() === "") {
        alert("아이디는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (bpass.trim() === "") {
        alert("비밀번호는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }

    if (passCheck.trim() === "") {
        alert("비밀번호 확인은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }

    if (bpass != passCheck) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    } // 안먹음
    
    if (phone.trim() === "") {
        alert("전화번호는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }

    if (chkNum === "") {
        alert("인증번호를 입력해 주세요.");
        return false;
    }
    
    if (email === "") {
        alert("이메일은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (bname === "") {
        alert("이름은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (bName === "") {
        alert("상호명은 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
    if (bNum === "") {
        alert("사업자번호는 공란으로 둘 수 없습니다. \n다시 시도해 주세요.");
        return false;
    }
    
    if (regImg === "" || regImg === null) {
        alert("사업자 확인을 위해 사업자등록증 사본 이미지를 반드시 업로드 해 주세요.");
        return false;
    }
    
    if (bankcode === "") {
        alert("은행을 반드시 선택해 주세요.");
        return false;
    }

  	if (accountNumber === "") {
        alert("계좌번호는 공란으로 둘 수 없습니다. \n확인 후 다시 시도해 주세요.");
        return false;
    }
    
    if (callPhone === "") {
    	alert("대표번호는 공란으로 둘 수 없습니다. \n확인 후 다시 시도해 주세요.");
    	return false;
    }
    
	if (zip === "") {
        alert("우편번호는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
	if (add1 === "") {
        alert("주소는 공란으로 둘 수 없습니다. \n입력 후 다시 시도해 주세요.");
        return false;
    }
    
	if (term <= 0) {
        alert("이용약관 동의를 하지 않을 경우 회원가입이 불가합니다.");
        return false;
    }
	
	if (idCheck == 'false') {
        alert("아이디 중복확인은 필수입니다. \n진행 후 다시 시도해 주세요.");
        return false;
    }
    
    if (phoneCheck == 'false') {
        alert("휴대폰 인증은 필수입니다. \n진행 후 다시 시도해 주세요.");
        return false;
    } 
        
    if (bNo == 'false') {
        alert("사업자번호 인증은 필수입니다. \n인증 후 다시 시도해 주세요.");
        return false;
    }    
    	
	if (x == 'null') {
        alert("올바른 주소를 입력해 주세요.");
        return false;
    }
    
    if (y == 'null') {
        alert("올바른 주소를 입력해 주세요.");
        return false;
    }
    
    return true;
    });
});

		// 정규표현식 모음
		$("#businessId").on("keyup", function() {
			let bId = $(this).val();
			 let regExp = /[^A-Za-z0-9_-]/g;
			console.log(bId);
	
			if(regExp.test(bId)) {
				alert("아이디는 숫자 및 영문자, -와 _만 입력 가능합니다.");
		        $(this).val("");
			}
		});
	
		// 비번에 들어가는거 정규표현식
		$("#bPass").on("keyup", function() {
		    let bPass = $(this).val();
			var reg = /^(?=.*[0-9])(?=.*[a-z])(?=.*[$@!%*#?&])[a-zA-Z0-9$@!%*#?&]$/;
		
		    if (reg.test(bPass) || $(this).length < 0) {
		        alert("비밀번호는 대소문자와 숫자, 특수문자가 각 1개씩 포함되어야 하며, 총 8자리 이상이어야 합니다. \n확인 후 다시 시도해 주세요.");
		        $(this).val("");
		    }
		});
		
		// 비번_확인에 들어가는거 정규표현식
		$("#checkBPass").on("keyup", function() {
		    let checkBPass = $(this).val();
		    var reg = /^(?=.*[0-9])(?=.*[a-z])(?=.*[$@!%*#?&])[a-zA-Z0-9$@!%*#?&]$/;
		    console.log(checkBPass);
		
		    if (reg.test(checkBPass) || $(this).length < 0) {
		        alert("비밀번호 확인은 대소문자와 숫자, 특수문자가 각 1개씩 포함되어야 하며, 총 8자리 이상이어야 합니다. \n확인 후 다시 시도해 주세요.");
		        $(this).val("");
		    }
		})

	// 입력한 이미지를 미리보기
    function profileImage(input) {
	    var preview = document.getElementById('profileImageInput');
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
    $('#businessProfile').change(function () {
        profileImage(this);
    });

});

// 주소입력_좌표값구하기
$("#btnZipcode").click(findZipcode);

function findZipcode(){
 	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 주소 - 좌표 변환
	            var geocoder = new daum.maps.services.Geocoder(); // Geocoder 객체 생성
	
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

	// 사업자 아이디 중복 확인 버튼이 클릭되면
	$("#businessOverlapCheck").on("click", function() {	
		var businessId = $("#businessId").val();
		url = "overlapIdCheck?normalId="+businessId;
		var childWindowWidth = 500;
    	var childWindowHeight = 400;
		
		
		if(businessId.length <= 0) {
			alert("아이디가 입력되지 않았습니다. \n 입력 후 다시 시도해 주세요.");
			return false;	
		}
		if(businessId.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
	
		// 화면 중앙정렬
		var leftPosition = (screen.width - childWindowWidth) / 2;
    	var topPosition = (screen.height - childWindowHeight) / 2;
		window.open(url, "businessId", "toolbar=no, location=no, " + "status=no, memubar=no, width=" + childWindowWidth + ", height=" + childWindowHeight + ", left=" + leftPosition + ", top=" + topPosition);
	
	});
	
	// 사업자 아이디 중복페이지에서 닫으면
   $(document).on('click', '#btnIdCheckClose', function() {
       var id = $(this).attr("data-id-value");
       console.log(id);
       var bIdElement = $(window.opener.document).find("#businessId");
       var bidCheck = $(window.opener.document).find("#isIdCheck").val(true);
       
      bIdElement.val(id);

       window.close();
   });
   
   
   // 사업자번호 조회
   $("#checkBusinessReg").on("click", function () {
       let businessNumber = $("#businessNumber").val();
       let numCheck = $("#bNoCheck").val();
   
       if (businessNumber.length <= 0) {
           alert("사업자번호가 입력되지 않았습니다. \n 입력 후 다시 시도해 주세요.");
           return false;
       }
   
       if (businessNumber.length < 10) {
           alert("사업자번호를 정확히 입력해 주세요");
           return false;
       }
       
       function checkBusiness() {
		    let data = { "b_no": ["" + businessNumber + ""] };
		
		    $.ajax({
		        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=GwlTEq9WhhOCWK9%2FYjxr5GKfNdCEWXYeHl82B1AY%2BT%2BOuOy45hl8Itbg0tkAt3y0KQff3Kke%2FNF%2FGSDNKPmEjA%3D%3D",
		        type: "POST",
		        data: JSON.stringify(data),
		        dataType: "JSON",
		        contentType: "application/json",
		        accept: "application/json",
		        success: function (result) {
		            
		            window.b_stt_ce = result.data[0].b_stt_cd;
		            window.b_no = result.data[0].b_no;

		            businessNumberOverlapCheck();
		        },
		        fail: function (result) {
		            fail(error);
		        }
		    });
		}
		
		function businessNumberOverlapCheck() {
		    
		    $.ajax({
		        url: "businessNumberOverlapCheck",
		        type: "POST",
		        data: {
		            "businessNumber": Number(window.b_no),
		            "b_stt_ce": window.b_stt_ce
		        },
		        dataType: "json",
		        success: function (overlapResult) {
		            if (overlapResult > 0) {
                    alert("이미 가입한 사업자번호입니다. \n 다시 시도해 주세요");
                } else {
                    if (b_stt_ce === "01") {
                        alert("정상적으로 인증되었습니다.");
                        console.log("b_stt_ce : " + b_stt_ce + ", b_no : " + b_no);
                        $("#bNoCheck").prop("value", true);
                    } else if (b_stt_ce === "02" || b_stt_ce === "03") {
                        alert("휴/폐업된 사업자번호입니다. \n 다시 시도해 주세요.");
                        console.log("b_stt_ce : " + b_stt_ce + ", b_no : " + b_no);
                        $("#bNoCheck").prop("value", false);
                    } else {
                        alert("등록되지 않은 사업자번호입니다. \n 다시 시도해 주세요.");
                        console.log("b_stt_ce : " + b_stt_ce + ", b_no : " + b_no);
                        $("#bNoCheck").prop("value", false);
                    }
                }
		        },
		        error: function (error) {
		            console.error(error);
		        }
		    });
		}
		
		// checkBusiness 함수 호출
		checkBusiness();
	

});