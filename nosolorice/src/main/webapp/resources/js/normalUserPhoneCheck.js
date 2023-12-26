$('#getNormalPhoneCheck').click(function() {
	const phone = $('#phone').val();
	
	if(phone.trim() === '') {
		alert("휴대폰번호를 입력해 주세요.");
		
		return;
	}
	
	$.ajax({
		url : "getNormalPhoneCheck",
		type : "POST",
		data : "phone=" + phone ,
		dataType : "json",
		success : function(data) {
			
	          if (data !== null && data !== undefined) {
	              console.log("완료" +  data);
	          } else {
	              console.log("전송된 값 없음");
	          }

            
		},
		error : function() {
			alert("에러가 발생했습니다.")
		}
	});

});

$('#normalPhoneCheck').click(function(){
 
	var to = $('#chkNum').val();
	
	$.ajax({
		url : "normalPhoneCheck",
		type : "POST",
		data : "to=" + to,
		dataType : "json",
		success : function(data) {
			const checkNum = data;
			
            //인증하기 버튼 클릭 이벤트
			$('#normalPhoneCheck').click(function(){
				
				if($("#chkNum").val() == to) {
					alert("인증에 성공하였습니다!");
					certCheck = true;
				} else {
					alert("인증에 실패하였습니다. \n 다시 시도해 주세요");
					certCheck = false;
				}
			});
            
		},
		error : function() {
			alert("에러가 발생했습니다.")
		}
	});
});

$("#normalJoin").click(function submitCheck() {
	
	if(certCheck == false) {
		alert("인증이 진행되지 않았습니다. \n 먼저 인증을 진행해 주세요.");
		return false;
	} else
		true;
});