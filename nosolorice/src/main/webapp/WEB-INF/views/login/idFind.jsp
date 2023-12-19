<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="content">
        <div class="row imgrows">
            <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 20px;" > 
                <img src="resources/img/logo/nosolorice_logo_M.png" alt="">
            </div>
        </div>

        <div class="row">
            <div class="col-6 text-center" style="float: none; margin: 0 auto; margin-top: 20px; min-width: 450px;" >
                <input type="text" style="width: 458px; height: 45px; margin-top: 10px; margin-bottom: 10px;" placeholder="이름을 입력해 주세요"  name="name" id="name"><br>
                <input type="text" style="width: 258px; height: 45px; margin-bottom: 10px; margin-right: 80px;" placeholder="휴대폰 번호를 입력해주세요" name="phone" id="phone"> <button id="CertificationNumber" style="border: solid 1px black;">인증번호받기</button><br>
                <input type="text" style="width: 458px; height: 45px; margin-bottom: 10px;" placeholder="인증번호를 입력해 주세요" name="phone2" id="phone2"><br>
                <button type="submit" style="background-color: rgb(255, 229, 202); border: solid 1px black; margin-top: 8px;" id="loginsub">인증하기</button>
            </div>
        </div>
    </div>

<script>
    $("#CertificationNumber").on("click",function(){
        let phone = $("#phone").val();
        let name = $("#name").val();

        if(name.length == 0){
            alert("이름을 입력해 주세요")
            return ;
        }

        if(phone.length == 0){
    		alert("핸드폰 번호를 입력해 주세요.")
            
	    }else if(phone.length < 11){
    		alert("핸드폰 번호를 확인해 주세요")
	    }
    })
    
</script>
