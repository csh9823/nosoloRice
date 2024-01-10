<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<!-- <link href="resources/bootstrap/main.css" rel="stylesheet"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- favicon 404 에러 방지용(파비폰은 resources/image 안에 있습니다.) -->
<link rel="icon" href="data:,">

<!-- 다음우편번호찾기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음좌표 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685bdba705a3c08af0c489199df63809&libraries=services"></script>

<!-- number 화살표 제거_(위)chrome용 / (아래)firefox용 -->
<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type='number'] {
  -moz-appearance: textfield;
}
</style>

<div class="container justify-content-center">
	
	<form class="form form-center" id="normalJoinForm" action="normalJoinResult" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="isIdCheck" id="isIdCheck" value="false" />
	<input type="hidden" name="isNickCheck" id="isNickCheck" value="false" />
	<input type="hidden" name="certCheck" id="certCheck" value="false" />
	<input type="hidden" name="xpoint" id="xpoint" />
	<input type="hidden" name="ypoint" id="ypoint" />
	<input type="hidden" name="emailDomain" id="emailDomain" />
	<input type="hidden" name="mypoint" id="mypoint" value=0 />
	<input type="hidden" name="root" id="root" value=2 />
	
        <div class="row-12 p-5">
          <div class="d-flex justify-content-center">
            <img src="resources/image/nosolorice_logo_M.png">
          </div>
          
          <div class="d-flex justify-content-center">  
          
            <p class="fs-1 fw-bold">일반회원 가입</p>
          </div>
        </div>

        <div class="row-12 d-flex p-3 justify-content-center">
          
          <!-- profile_img -->
         <div class="col-lg-4">
          <div class="col-sm-2">
            <img src="resources/upload/normal_upload/profile_img.png" id="profilePreview" style="width: 400px; height: 400px;" class="rounded-circle">
            <input type="file" accept="image/*" onchange="profileImage(this)" id="profileImageInput" name="profileImageInput">
          </div> 
         </div> 

		  <div class="col-sm-1">
          	<div class="form-group">
            </div>
          </div>

           <div class="col-md-8">
            <div class="row">
              
              <div class="col-sm-10 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="name" name="name" placeholder="이름" >
                </div>
              </div>

              <div class="col-7 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="normalId" name="normalId" placeholder="ID" >
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="overlapCheck" name="overlapCheck" value="증복확인">
                </div>
              </div>

              <div class="col-7 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임" >
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="nickOverlapCheck" name="nickOverlapCheck" value="증복확인">
                </div>
              </div>

              <div class="col-10 p-2">
                <div class="form-group">
                  <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호" >
                </div>
              </div>

              <div class="col-10 p-2">
                <div class="form-group">
                  <input type="password" class="form-control" id="checkPass" name="checkPass" placeholder="비밀번호확인" >
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="mobile" id="mobile" placeholder="전화번호를 입력해 주세요." maxlength="11" />
                </div>
              </div>

              <div class="col-2 text-end p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="getNormalPhoneCheck" name="getNormalPhoneCheck" value="인증번호 받기">
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="number" class="form-control" name="chkNum" id="chkNum" placeholder="인증번호를 입력해 주세요" >
                </div>
              </div>

              <div class="col-2 p-2 text-end">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="normalPhoneCheck" value="인증하기">
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-4 text-start p-2">
                <div class="form-group">
                  <input type="number" class="form-control" name="year" id="year" placeholder="년" maxlength="4" oninput="yearMaxLength(this);" />
                </div>
              </div>

              <div class="col-3 text-center p-2">
                <div class="form-group">
                  <input type="number" class="form-control" name="month" id="month" maxlength=2 placeholder="월" oninput="monthDay(this);" />
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <input type="number" class="form-control" name="day" id="day" maxlength=2 placeholder="일" oninput="monthDay(this);" />
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-4 p-2">
				  <p>성별을 선택해 주세요</p>
				  <div class="form-check form-check-inline">
				    <input class="form-check-input" type="radio" name="gender" id="man" value="남성">
				    <label class="form-check-label" for="man">남성</label>
				  </div>
				  <div class="form-check form-check-inline" >
				    <input class="form-check-input" type="radio" name="gender" id="woman" value="여성">
				    <label class="form-check-label" for="woman">여성</label>
				  </div>
			  </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-6 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="emailId" id="emailId" placeholder="이메일을 입력해 주세요" >
                </div>
              </div>
              
              <!-- option으로 수정 -->
              <div class="col-4 p-2">
                <select class="form-select" id="selectDomain" name="selectDomain">
                  <option selected>--- 선택해 주세요 ---</option>
                  <option value="naver.com">@naver.com</option>
                  <option value="gmail.com">@gmail.com</option>
                  <option value="daum.net">@daum.net</option>
                </select>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-3 p-1">
                <div class="form-group">
                  <input type="number" maxlength="5" class="form-control" name="postNum" id="postNum" readonly>
                </div>
              </div>

              <div class="col-4">
                <div class="form-group">
                </div>
              </div>

              <div class="col-3 text-end p-1">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="btnZipcode" value="주소검색">
                </div>
              </div>

              <div class="col-10 p-1">
                <div class="form-group">
                  <input type="text" class="form-control" name="address1" id="address1" readonly>
                </div>
              </div>

              <div class="col-10 p-1">
                <div class="form-group">
                  <input type="text" class="form-control" id="address2" name="address2">
                </div>
              </div>

              <div class="col-10 p-2">
                <h5>이용약관</h5>
                  <div class="form-group" style="overflow: scroll; height: 150px; padding:16px; border-radius:4px; border: 1px solid #979797;" id="termOfUse">
                    <p> 가. 개인정보의 수집 및 이용 목적
  
                    국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
            
                    나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법
                    ① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
                    ② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.
                    ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
                    ④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
                    ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
                    ⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
                    
                    다. 수집하는 개인정보의 항목
                    국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호
                    
                    라. 개인정보의 보유 및 이용기간
                    국가공간정보포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
                    
                    - 수집근거: 정보주체의 동의
                    - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
                    - 보존근거: 정보주체의 동의
                    
                    마. 동의 거부 권리 및 동의 거부에 따른 불이익
                    위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.</p>
                  </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-10 p-2">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="termOK" id="termOK" >
                  <label class="form-check-label" for="termOK"> 위 이용약관에 동의합니다. (필수)</label>
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-10 text-center p-2">
                <div class="form-group">
                  <button type="submit" class="btn btn-success" id="normalJoin">&nbsp&nbsp&nbsp&nbsp가입하기&nbsp&nbsp&nbsp&nbsp</button>
                </div>
              </div>
              
				</div>
            </div>
            
        </div>
         </form> 
      </div>
  
	<script type="text/javascript">
	
	/* 연도 maxlength */
	function yearMaxLength(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	/* 월일 maxlength */
	function monthDay(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	  
	</script>
	

<!-- 전화번호 인증 -->
<script src="resources/js/normalUserPhoneCheck.js"></script>

<!-- 유효성검사 등등등... -->
<script src="resources/js/member.js"></script>

