
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}



let code = "";

$('#getBPhoneCheck').click(function() {
	const mobile = $('#bPhone').val();
	
	console.log(mobile)
	
	if(mobile.trim() === '') {
		alert("휴대폰번호를 입력해 주세요.");
		
		return;
	}
	
	$.ajax({
	
		"url" : "getBusinessPhoneCheck",
		"data" : "mobile=" + bPhone ,
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


$("#businessPhoneCheck").click(function() {
    if($("#checkNum").val() === code) {
    	alert("인증이 완료되었습니다.");
        $("#bPhoneCheck").val(true); 
    } else {
    	alert("인증번호가 맞지 않습니다. \n다시 시도해 주세요.");
		$("#bPhoneCheck").val(false); 
    };

    
});
