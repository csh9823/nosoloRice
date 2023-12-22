<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="resources/css/Findpassword.css">
    <div class="row imgrows" style="min-width: 1100px;">
        <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 20px;" > 
            <img src="resources/img/logo/nosolorice_logo_M.png">
        </div>
    </div>

    <div class="row" style="min-width: 1100px;">
        <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 10px; font-size: 20px; color: grey;">
            보안정책상의 이유로<br>
            비밀번호 변경 후 이용이 가능합니다.
        </div>
    </div>

    <div class="row">
        <div class="col-6 text-center" style="float: none; margin: 0 auto; margin-top: 20px; min-width: 450px;" >
        
        <form action="newpass" id="passsubform" method="post">
            <input type="password" style="width: 400px; height: 45px; margin-top: 10px; margin-bottom: 20px; border-radius: 4px;" placeholder="새 비밀번호"  name="pass" id="pass"><br>
            <input type="password" style="width: 400px; height: 45px; margin-bottom: 10px; border-radius: 4px;" placeholder="새 비밀번호 확인" name="pass2" id="pass2"><br>
            <input type="hidden" id="normalORbusiness" name="normalORbusiness" value="${normalORbusiness}">
            <input type="hidden" id="id" name="id" value="${id}">
            <input type="submit" value="비밀번호 변경" style="width: 200px; background-color: red; border: none; height:70px; border-radius: 10px;">
        </form>
                        
        </div>
    </div>


<script type="text/javascript">
  $('input[type="password"]').keydown(function() {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
});

$("#passsubform").submit(function(){

    let pass = $("#pass").val();

    let pass2 = $("#pass2").val();

    if(pass != pass2){

        alert("비밀번호가 일치하지 않습니다.");

        return false;
    }

    if(pass == 0){

        alert("새 비밀번호를 입력해 주세요");

        return false;
    }
    
})
</script>
