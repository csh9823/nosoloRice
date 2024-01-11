let code = "";

$('#getNormalPhoneCheck').click(function() {
	const mobile = $('#mobile').val();
	
	console.log(mobile)
	
	if(mobile.trim() === '') {
		alert("휴대폰번호를 입력해 주세요.");
		
		return;
	}
	
	$.ajax({
	
		"url" : "getNormalPhoneCheck",
		"data" : "mobile=" + mobile ,
    	"type" : "POST" ,
    	"dataType" : "json",
		
		success : function(data) {
		    console.log(data.certNum);
		    code = data.certNum;
		},
		
		error : function() {
			alert("에러가 발생했습니다.")
		}
	});

});


$("#normalPhoneCheck").click(function() {
	let chkNum = $("#chkNum").val();
    if(chkNum.length <= 0) {
    	alert("인증번호를 입력해 주세요");
    	
    } else if(chkNum == code) {
    	alert("인증이 완료되었습니다.");
        $("#certCheck").val(true); 
        
    } else {
    	alert("인증번호가 맞지 않습니다. \n다시 시도해 주세요.");
		$("#certCheck").val(false); 
    };

    
});
