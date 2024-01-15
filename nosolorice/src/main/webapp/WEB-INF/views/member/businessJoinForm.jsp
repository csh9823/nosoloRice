<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<head>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link href="resources/bootstrap/main.css" rel="stylesheet">
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


/* input file 커스텀 */
.businessProfile {
   display: none;
}
#businessProfileLabel {
	color:#515151;
	cursor:pointer;
}
#businessProfileLabel:hover {
	font-weight: 600;
}

</style>
</head>
<body>
<div class="container justify-content-center">
	
	<form class="form form-center" id="businessJoinForm" action="businessJoinResult" method="post" enctype="multipart/form-data">
	<input type="hidden" name="isIdCheck" id="isIdCheck" value="false" />
	<input type="hidden" name="bPhoneCheck" id="bPhoneCheck" value="false" />
	<input type="hidden" name="bNoCheck" id="bNoCheck" value="false" />
	<input type="hidden" name="xpoint" id="xpoint" />
	<input type="hidden" name="ypoint" id="ypoint" />
	<input type="hidden" name="okNoOk" id="okNook" value="0" />	
	<input type="hidden" name="root" id="root" value="1" />		
	
    <div class="row p-5">          
      <div class="d-flex justify-content-center">  
        <span class="fs-1 fw-bold">사업자회원 가입</span>
      </div>
    </div>

        <div class="row-12 d-flex p-3 justify-content-center">
          
          <!-- profile_img -->
         <div class="col-md-4">
          <div class="col-sm-2">
            <img src="resources/upload/business_upload/business_defaultImage.png" id="profileImageInput">
            <label for="businessProfile" style="width: 200px; padding-top: 10px; color:#515151;">상호 이미지 업로드하기</label>
            <input type="file" accept="image/*" onchange="profileImage(this)" id="businessProfile" name="businessProfile" style="display:none;">
            <pre style="width: 300px; padding-top: 10px; color:#C93C3C; ">* 이미지를 업로드 하지 않을 경우
  기본 이미지가 등록됩니다.</pre>
          </div> 
         </div> 
	<div class="row">
		<div class="col">
	        <div class="row justify-content-center">

		  <div class="col-sm-1">
          	<div class="form-group">
            </div>
          </div>

           <div class="col-md-8">
            <div class="row">
               
              <div class="col-7 p-2">
                <div class="form-group">
                  <p>*표시는 필수사항입니다.</p>
                </div>
              </div>
            
              <div class="col-7 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* ID</p>
                  <input type="text" class="form-control" id="businessId" name="businessId" placeholder="ID" >
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <p>&nbsp</p>
                  <input type="button" class="btn btn-success" id="businessOverlapCheck" name="businessOverlapCheck" value="증복확인">
                </div>
              </div>
              
              <div class="col-10 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 비밀번호</p>
                  <input type="password" class="form-control" id="bPass" name="bPass" placeholder="비밀번호" >
                </div>
              </div>
              
              <div class="col-10 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 비밀번호확인</p>
                  <input type="password" class="form-control" id="checkBPass" name="checkBPass" placeholder="비밀번호확인" >
                </div>
              </div>

			  <div class="col-8 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 휴대폰번호</p>
                  <input type="text" class="form-control" name="bPhone" id="bPhone" placeholder="010-1234-5678" maxlength="13" oninput="autoHyphen(this)">
                </div>
              </div>
	         <div class="col-3 text-center">
	            <img src="resources/upload/business_upload/profile_img.png" id="profileImageInput" style="width: 300px; height: 300px;" class="rounded border mb-2">
	            <label for="businessProfile" id="businessProfileLabel">상호 이미지 업로드하기</label>
	            <input type="file" accept="image/*" onchange="profileImage(this)" id="businessProfile" name="businessProfile" style="display:none;">
	            <br>
	            <span style="color:#C93C3C; ">* 이미지를 업로드 하지 않을 경우<br>기본 이미지가 등록됩니다.</span>
	         </div> 	
			
			<div class="col-6">
			<div class="row">
	           <div class="col">
	            <div class="row">
	              <div class="col p-2">
	                <div class="form-group">
	                  <p>*표시는 필수사항입니다.</p>
	                </div>
	              </div>
	            </div>
	                            
	            <div class="row">
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="text" class="form-control" id="businessId" name="businessId" placeholder="* ID" >
	                </div>
	              </div>
	              <div class="col-auto p-2">
	                <div class="form-group">
	                	<input type="button" class="btn btn-success" id="businessOverlapCheck" name="businessOverlapCheck" value="증복확인">
	                </div>
	              </div>
	            </div>

              <div class="col-2 text-end p-2">
                <div class="form-group">
                  <p>&nbsp</p>
                  <input type="button" class="btn btn-success" id="getBPhoneCheck" name="getBPhoneCheck" value="인증번호 받기" >
                </div>
              </div>
              
              <div class="col-8 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 인증번호 입력</p>
                  <input type="number" class="form-control" name="checkNum" id="checkNum" placeholder="인증번호를 입력해 주세요" >
                </div>
              </div>
              
              <div class="col-2 p-2 text-end">
                <div class="form-group">
                  <p>&nbsp</p>
                  <input type="button" class="btn btn-success" id="businessPhoneCheck" name="businessPhoneCheck" value="인증하기">
                </div>
              </div>
              
              <div class="col-10 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 이메일</p>
                  <input type="email" class="form-control" name="bEmail" id="bEmail" placeholder="example@sample.com" >
                </div>
              </div>           
              
              <div class="col-10 m-2">  
             	<div class="row">
             		<span class="border border-bottom"></span>
             	</div>		
              </div>
              
              <div class="col-4 p-2">
              	<div class="form-group">
              	    <p style="color : #515151;" class="fw-bolder">* 대표자명</p>
              		<input type="text" class="form-control" id="businessUserName" name="businessUserName" placeholder="대표자명" >
              	</div>
              </div>
              	

              <div class="col-6 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 상호명</p>
                  <input type="text" class="form-control" name="bName" id="bName" placeholder="상호명" >
                </div>
              </div>

			  <div class="col-7 p-2">
			  	<div class="form-group">
			  		<p style="color : #515151;" class="fw-bolder">* 사업자번호</p>
			  		<input type="number" class="form-control" id="businessNumber" name="businessNumber" placeholder="-를 제외한 사업자번호를 입력해주세요" maxlength="10" oninput="bNoLength(this);" >
			  	</div>
			  </div>
			  
			  <div class="col-3 text-end p-2">
                <div class="form-group">
                  <p>&nbsp</p>
                  <input type="button" class="btn btn-success" name="checkBusinessReg" id="checkBusinessReg" value="진위확인">
                </div>
              </div>
              
              <div class="col-10 p-2">
			  	<div class="form-group">
			  		<p style="color : #515151;" class="fw-bolder">* 사업자등록증 사본 업로드</p>
			  		<input type="file" accept="image/*" class="form-control" id="businessRegImg" name="businessRegImg" >
			  	</div>
			  </div>
              
              <!-- option으로 수정 -->
              <div class="col-3 p-2">
                <p style="color : #515151;" class="fw-bolder">* 은행</p>
                <select class="form-select" id="bankcode" name="bankcode" >
                  <option>--- 선택해 주세요 ---</option>
                  <option value="국민은행">국민은행</option>
                  <option value="농협중앙회">농협중앙회</option>
                  <option value="단위농협">단위농협</option>
                  <option value="우리은행">우리은행</option>
                  <option value="대구은행">대구은행</option>
                  <option value="외환은행">외환은행</option>
                  <option value="SC제일은행">SC제일은행</option>
                  <option value="부산은행">부산은행</option>
                  <option value="새마을금고">새마을금고</option>
                  <option value="한국씨티은행">한국씨티은행</option>
                  <option value="광주은행">광주은행</option>
                  <option value="경남은행">경남은행</option>
                  <option value="수협">수협</option>
                  <option value="신협">신협</option>
                  <option value="전북은행">전북은행</option>
                  <option value="제주은행">제주은행</option>
                  <option value="산림조합">산림조합</option>
                  <option value="우체국">우체국</option>
                  <option value="하나은행">하나은행</option>
                  <option value="신한은행">신한은행</option>
                  <option value="동양종금증권">동양종금증권</option>
                  <option value="한국투자증권">한국투자증권</option>
                  <option value="삼성증권">삼성증권</option>
                  <option value="미래에셋">미래에셋</option>
                  <option value="우리투자증권">우리투자증권</option>
                  <option value="현대증권">현대증권</option>
                  <option value="SK증권">SK증권</option>
                  <option value="신한금융투자">신한금융투자</option>
                  <option value="하이증권">하이증권</option>
                  <option value="HMC증권">HMC증권</option>
                  <option value="대신증권">대신증권</option>
                  <option value="하나대투증권">하나대투증권</option>
                  <option value="동부증권">동부증권</option>
                  <option value="유진증권">유진증권</option>
                  <option value="메리츠증권">메리츠증권</option>
                  <option value="신영증권">신영증권</option>
                  <option value="대우증권">대우증권</option>
                </select>
              </div>
              
              <div class="col-7 p-2">
			  	<div class="form-group">
			  		<p style="color : #515151;" class="fw-bolder">* 계좌번호</p>
			  		<input type="number" class="form-control" id="accountNumber" name="accountNumber" placeholder="-를 제외한 계좌번호를 입력해 주세요" >
			  	</div>
			  </div>
              
              <div class="col-10 p-2">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 대표번호</p>
                  <input type="tel" class="form-control" name="callPhone" id="callPhone" placeholder="대표번호" >
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-3 p-1">
                <div class="form-group">
                  <p style="color : #515151;" class="fw-bolder">* 업체 주소</p>
                  <input type="number" maxlength="5" class="form-control" name="zipcode" id="zipcode" placeholder="우편번호" readonly >
                </div>
              </div>

              <div class="col-4">
                <div class="form-group">
                </div>
              </div>

              <div class="col-3 text-end p-1">
                <div class="form-group">
                  <p>&nbsp</p>
                  <input type="button" class="btn btn-success" id="btnZipcode" name="btnZipcode" value="주소찾기">
                </div>
              </div>

              <div class="col-10 p-1">
                <div class="form-group">
                  <input type="text" class="form-control" name="address1" id="address1" placeholder="* 주소"readonly >
                </div>
              </div>

              <div class="col-10 p-1">
                <div class="form-group">
                  <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소">
                </div>
              </div>
             
              <div class="col-10 p-2">
                <p>&nbsp</p>
                <h5 class="fw-bolder" style="color : #515151;">이용약관</h5>
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
                  <label class="form-check-label fw-bolder" style="color : #515151;" for="termOK">* 위 이용약관에 동의합니다. (필수)</label>
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-10 text-center p-2">
                <div class="form-group">
                  <button type="submit" class="btn btn-success" id="businessJoin">&nbsp&nbsp&nbsp&nbsp가입하기&nbsp&nbsp&nbsp&nbsp</button>
                </div>
              </div>
              
				</div>

	            <div class="row">  
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="password" class="form-control" id="bPass" name="bPass" placeholder="* 비밀번호" >
	                </div>
	              </div>
	            </div>
	
				<div class="row">              
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="password" class="form-control" id="checkBPass" name="checkBPass" placeholder="* 비밀번호확인" >
	                </div>
	              </div>
	            </div>
	
				<div class="row">
				  <div class="col p-2">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="bPhone" id="bPhone" placeholder="* 01012345678" maxlength="13" oninput="autoHyphen(this)">
	                </div>
	              </div>
				  <div class="col-auto p-2">
	                <div class="form-group">
	                	<input type="button" class="btn btn-success" id="getBPhoneCheck" name="getBPhoneCheck" value="인증번호 받기" >
	                </div>
	              </div>
	            </div>
	
				<div class="row">
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="number" class="form-control" name="checkNum" id="checkNum" placeholder="* 인증번호를 입력해 주세요" >
	                </div>
	              </div>
	              <div class="col-auto p-2">
	                <div class="form-group">
	                	<input type="button" class="btn btn-success" id="businessPhoneCheck" name="businessPhoneCheck" value="인증하기">
	                </div>
	              </div>
	            </div>
	              
				<div class="row">
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="email" class="form-control" name="bEmail" id="bEmail" placeholder="* 이메일을 입력해 주세요" >
	                </div>
	              </div>           
	            </div>           
	
				<div class="row">
	              <div class="col p-2">
	              	<div class="form-group">
	              		<input type="text" class="form-control" id="businessUserName" name="businessUserName" placeholder="* 대표자명" >
	              	</div>
	              </div>
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="bName" id="bName" placeholder="* 상호명" >
	                </div>
	              </div>
	            </div>
	              	
	
	
				<div class="row">
				  <div class="col p-2">
				  	<div class="form-group">
				  		<input type="number" class="form-control" id="businessNumber" name="businessNumber" placeholder="* -를 제외한 사업자번호를 입력해주세요" maxlength="10" oninput="bNoLength(this);" >
				  	</div>
				  </div>
				  <div class="col-auto p-2">
				  	<div class="form-group">
	                  <input type="button" class="btn btn-success" name="checkBusinessReg" id="checkBusinessReg" value="진위확인">
				  	</div>
				  </div>
			    </div>
				  
				  <div class="col text-end p-2">
	                <div class="form-group">
	                </div>
	              </div>
				
				<div class="row">
	              <div class="col p-2">
				  	<div class="form-group">
				  		<input type="file" accept="image/*" class="form-control" id="businessRegImg" name="businessRegImg" >
				  	</div>
				  </div>
			    </div>
	              
	            <div class="row">
	              <!-- option으로 수정 -->
	              <div class="col p-2">
	                <select class="form-select" id="bankcode" name="bankcode" >
	                  <option>*  --- 선택해 주세요 ---</option>
	                  <option value="국민은행">국민은행</option>
	                  <option value="농협중앙회">농협중앙회</option>
	                  <option value="단위농협">단위농협</option>
	                  <option value="우리은행">우리은행</option>
	                  <option value="대구은행">대구은행</option>
	                  <option value="외환은행">외환은행</option>
	                  <option value="SC제일은행">SC제일은행</option>
	                  <option value="부산은행">부산은행</option>
	                  <option value="새마을금고">새마을금고</option>
	                  <option value="한국씨티은행">한국씨티은행</option>
	                  <option value="광주은행">광주은행</option>
	                  <option value="경남은행">경남은행</option>
	                  <option value="수협">수협</option>
	                  <option value="신협">신협</option>
	                  <option value="전북은행">전북은행</option>
	                  <option value="제주은행">제주은행</option>
	                  <option value="산림조합">산림조합</option>
	                  <option value="우체국">우체국</option>
	                  <option value="하나은행">하나은행</option>
	                  <option value="신한은행">신한은행</option>
	                  <option value="동양종금증권">동양종금증권</option>
	                  <option value="한국투자증권">한국투자증권</option>
	                  <option value="삼성증권">삼성증권</option>
	                  <option value="미래에셋">미래에셋</option>
	                  <option value="우리투자증권">우리투자증권</option>
	                  <option value="현대증권">현대증권</option>
	                  <option value="SK증권">SK증권</option>
	                  <option value="신한금융투자">신한금융투자</option>
	                  <option value="하이증권">하이증권</option>
	                  <option value="HMC증권">HMC증권</option>
	                  <option value="대신증권">대신증권</option>
	                  <option value="하나대투증권">하나대투증권</option>
	                  <option value="동부증권">동부증권</option>
	                  <option value="유진증권">유진증권</option>
	                  <option value="메리츠증권">메리츠증권</option>
	                  <option value="신영증권">신영증권</option>
	                  <option value="대우증권">대우증권</option>
	                </select>
	              </div>
	            </div>
	              
	              <div class="col p-2">
				  	<div class="form-group">
				  		<input type="number" class="form-control" id="accountNumber" name="accountNumber" placeholder="* -를 제외한 계좌번호를 입력해 주세요" >
				  	</div>
				  </div>
	              
				<div class="row">
	              <div class="col p-2">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="callPhone" id="callPhone" placeholder="* 대표번호" >
	                </div>
	              </div>
	            </div>
	
	            <div class="row">
	              <div class="col p-1">
	                <div class="form-group">
	                  <input type="number" maxlength="5" class="form-control" name="zipcode" id="zipcode" placeholder="* 우편번호" readonly >
	                </div>
	              </div>
	              <div class="col-auto p-1">
	                <div class="form-group">
	                	<input type="button" class="btn btn-success" id="btnZipcode" name="btnZipcode" value="주소찾기">
	                </div>
	              </div>
	            </div>
	
				<div class="row">
	              <div class="col p-1">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="address1" id="address1" placeholder="* 주소"readonly >
	                </div>
	              </div>
	            </div>
	
				<div class="row">
	              <div class="col p-1">
	                <div class="form-group">
	                  <input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소">
	                </div>
	              </div>
	            </div>
	             
	            <div class="row">
	              <div class="col p-2">
	                <h5>이용약관</h5>
	                  <div class="form-group" style="overflow: auto; height: 150px; padding:16px; border-radius:4px; border: 1px solid #979797;" id="termOfUse">
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
	            </div>
	
	              <div class="col">
	                <div class="form-group">
	                </div>
	              </div>
	
				<div class="row">
	              <div class="col p-2">
	                <div class="form-check">
	                  <input class="form-check-input" type="checkbox" name="termOK" id="termOK" >
	                  <label class="form-check-label" for="termOK">* 위 이용약관에 동의합니다. (필수)</label>
	                </div>
	              </div>
	            </div>
	
				<div class="row">
	              <div class="col text-center p-2">
	                <div class="form-group">
	                  <button type="submit" class="btn btn-success" id="businessJoin">가입하기</button>
	                </div>
	              </div>
	            </div>
	            </div>
	            </div>
	              
					</div>
	            </div>
            </div>
		</div>
	</div>
  </form>  
</div>
</body>
<script type="text/javascript">
	
	/* 사업자번호 maxlength_적용 */
	function bNoLength(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	/* 엔터 이벤트 방지 */
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
    
</script>
<script src="resources/js/businessUserPhoneCheck.js"></script>
<script src="resources/js/business.js"></script>

