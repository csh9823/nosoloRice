<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="container" style="height:100vh; overflow: hidden;">
		<div class="row align-items-center h-100">
		    <div class="content col">
		    
		        <div class="row imgrows">
		            <div class="col text-center"> 
		                <img src="resources/img/logo/nosolorice_logo_M.png">
		            </div>
		        </div>
		
		        <div class="row mb-5">
		            <div class="col text-center">
			            <form action="FindidForm" id="submitForm" method="post">
			            
			            	<div class="row justify-content-center my-2">
			            		<div class="col-5">
					                <input type="text" class="form-control" placeholder="이름을 입력해 주세요"  name="name" id="name" style="height:50px;">		            		
			            		</div>
			            	</div>
			            
			            	<div class="row justify-content-center my-2">
			            		<div class="col-5 d-flex">
					                <input type="text" class="form-control me-1" placeholder="휴대폰 번호를 입력해주세요" name="mobile" id="phone" style="height:50px;">
					                <button id="CertificationNumber" class="btn btn-success ms-1 col-auto">인증번호받기</button>
			            		</div>
			            	</div>
			            
			            	<div class="row justify-content-center my-2">
			            		<div class="col-5 d-flex">
					                <input type="text" class="form-control" placeholder="인증번호를 입력해 주세요" name="phoneChk2" id="phoneChk2" style="height:50px;">
			            		</div>
			            	</div>
			            
			            	<div class="row justify-content-center my-2">
			            		<div class="col-5">
							        <input type="hidden" id="Yesnewpass" value="0">
					                <input type="hidden" id="Findid" name="Findid">
					                <button type="submit" class="btn btn-success w-100 fs-3" id="loginsub" style="height:100px;">인증하기</button>
			            		</div>
			            	</div>
			            	
			             </form>
		            </div>
		        </div>
		        <div class="row mb-5"></div>
	        </div>
	    </div>
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<script>
	
	$("#submitForm").on("submit", function () {
		
		let yesnewpass = $("#Yesnewpass").val();
		
		console.log(yesnewpass)
		
		if(yesnewpass == 0){
			alert("인증이 완료되지 않았습니다.")
	    	return false;
		}
	
	});
	
	    $("#CertificationNumber").on("click",function(){
	    	event.preventDefault();
	    	
	        let phone = $("#phone").val();
	        let name = $("#name").val();
	
	        if(name.length == 0){
	            alert("이름을 입력해 주세요")
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
	    		"url" : "Findid.ajax",
	    		"data" : "userPhoneNumber=" + phone +"&name="+name ,
	    		"type" : "POST" ,
	    		"dataType" : "json",
	    		// 성공하면 호출
	    		"success" : function(resData){
	    			
	    			console.log(resData.number)
	    			
	    			console.log(resData.businessid)
	    			
	    			
					if(resData.businessid == null && resData.normalid == null){
						alert("존재하지 않는 사용자 입니다.")
						return false;    					
					}
						
	    			if(resData.businessid != null){
	    				$("#Findid").val(resData.businessid)
	    				$("#Yesnewpass").val("1")
	    			}
	    			
	    			if(resData.normalid != null){
	    				$("#Findid").val(resData.normalid)
	    				$("#Yesnewpass").val("1")
	    			}
	    			
	    			
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
</body>