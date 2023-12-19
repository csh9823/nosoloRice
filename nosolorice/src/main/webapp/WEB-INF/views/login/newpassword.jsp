<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
    <div class="content">
        <div class="row imgrows">
            <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 20px;" > 
                <img src="resources/img/logo/nosolorice_logo_M.png">
            </div>
        </div>

        <div class="row">
            <div class="col-6 text-center" style="float: none; margin: 0 auto; margin-top: 20px; min-width: 450px;" >
	            <form action="" id="submitForm">
	                <input type="text" style="width: 458px; height: 45px; margin-top: 10px; margin-bottom: 10px;" placeholder="아이디를 입력해 주세요"  name="id" id="id"><br>
	                <input type="text" style="width: 258px; height: 45px; margin-bottom: 10px; margin-right: 80px;" placeholder="휴대폰 번호를 입력해주세요" name="phone" id="phone"> <button id="CertificationNumber" style="border: solid 1px black;">인증번호받기</button><br>
	                <input type="text" style="width: 458px; height: 45px; margin-bottom: 10px;" placeholder="인증번호를 입력해 주세요" name="phoneChk2" id="phoneChk2"><br>
	                <button type="submit" style="background-color: rgb(255, 229, 202); border: solid 1px black; margin-top: 8px;" id="loginsub">인증하기</button>
	             </form>
            </div>
        </div>
    </div>
</div>
<script>
    $("#CertificationNumber").on("click",function(){
    	event.preventDefault();
    	
        let phone = $("#phone").val();
        let id = $("#id").val();

        if(id.length == 0){
            alert("아을 입력해 주세요")
            return false;
        }

        if(phone.length == 0){
    		alert("핸드폰 번호를 입력해 주세요.")
    		return false;
            
	    }else if(phone.length < 11){
    		alert("핸드폰 번호를 확인해 주세요")
    		return false;
	    }
        
        $.ajax({
    		"url" : "testphone.ajax",
    		"data" : "userPhoneNumber=" + phone,
    		"type" : "POST" ,
    		"dataType" : "json",
    		// 성공하면 호출
    		"success" : function(resData){
    			
    			console.log(resData.number);
    			console.log(resData.isfalse);
    			
    			$("#submitForm").on("submit", function () {
    				
    				if(resData.number != $("#phoneChk2").val()){
    					alert("인증번호가 일치하지 않습니다.")
    					return false;
    				}
    			})

    		},
    		// 에러 생김 호출
    		"error" : function(xhr,statusText,err){
    			console.error("error...");
    		}
    	});
    })
    
</script>