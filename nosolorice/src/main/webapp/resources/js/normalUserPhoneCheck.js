$('#getNormalPhoneCheck').click(function() {
	const phone = $('#phone').val();
	
	console.log(phone)
	
	if(phone.trim() === '') {
		alert("휴대폰번호를 입력해 주세요.");
		
		return;
	}
	
	$.ajax({
	
		"url" : "getNormalPhoneCheck",
		"data" : "phone=" + phone ,
    	"type" : "POST" ,
    	"dataType" : "json",
		
		success : function(data) {
		    console.log(data.certNum)
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