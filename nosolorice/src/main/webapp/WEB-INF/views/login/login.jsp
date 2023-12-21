<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="content">
        <div class="row imgrows">
            <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 20px;" > 
                <img src="resources/img/logo/nosolorice_logo_M.png" alt="">
            </div>
        </div>

        <div class="row">
        	<!-- ${sessionScope.member.emailGet ? "checked" : ""} -->
            <div class="col-6 text-center" style="float: none; margin: 0 auto; margin-top: 20px; min-width: 450px;" >
            <form action="loginservice" method="get" id="loginsummit">
                <input type="checkbox" value="1" name="idsave" id="idsave" ${id != null ? 'checked' : ''} > 아이디 저장하기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="autologin" name="autologin" id="autologin"> 자동 로그인<br>
                <input type="text" style="width: 458px; height: 45px; margin-top: 10px; margin-bottom: 10px;" placeholder="아이디를 입력해 주세요"  name="id" id="id" value="${id != null ? id : ''}"><br>
                <input type="text" style="width: 458px; height: 45px; margin-bottom: 10px;" placeholder="비밀번호를 입력해 주세요" name="pass" id="pass"><br>

                <div class="row">
                    <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 10px; background-color: rgb(255, 229, 202); width: 450px; height: 45px; min-width: 450px;" >
                        <button type="submit" style="background-color: rgb(255, 229, 202); border: none; margin-top: 8px;" id="loginsub">로그인</button>
                    </div> 
                </div>
             </form>
                <div class="row">
                    <div class="col-4 text-center" style="float: none; margin: 0 auto; margin-top: 10px; background-color: rgb(255, 229, 202); width: 450px; height: 45px; min-width: 450px;" >
                        <p style="padding-top: 10px;"><a href="joinForm" id="memberjoin">회원가입</a></p>
                        <p><a id="myfind" href="findForm">아이디나 비밀번호가 기억나지 않으세요?</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
$("#loginsummit").on("submit", function () {
    let id = $("#id").val();
    let pass = $("#pass").val();
    
	if(id.length == 0){
		alert("아이디를 입력해 주세요")
		return false;
	}
	
	if(pass.length == 0 ){
		alert("비밀번호를 입력해 주세요.")
		return false;
	}
})
</script>