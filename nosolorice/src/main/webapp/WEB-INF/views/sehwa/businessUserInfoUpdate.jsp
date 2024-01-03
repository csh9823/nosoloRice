<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 정보수정</title>
</head>
<body>
  <div class="container">
    <form class="row" name ="businessUserInfoUpdate" id="businessUserInfoUpdate" 
    		action="businessUserInfoUpdate" method="post" enctype="multipart/form-data">
	  <input type="hidden" name="rPass" id="rPass" value="${user.pass}">		
      <div class="col-3">
        <input type="file" name="fileInput" id="fileInput"  onchange="readImage(this)"  style="display:none;" accept="image/*">
        <button style="border : none; background-color: white;" class="w-100" id="clickImg">
          <c:if test="${user.businessPicture eq 'defaultImg'}">
	          <img src="resources/img/profile_img.png" class="preview w-100">      
          </c:if>
          <c:if test="${user.businessPicture ne 'defaultImg'}">
	          <img class="preview w-100">      
          </c:if>
        </button>
        <a href="" style="text-decoration: none;" class="text-gray">기본이미지로 변경</a>
      </div>
      <div class="col-9 px-5">
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="businessId" id="businessId" class="form-control" value="${user.businessId}" readonly>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="password" name="oldPass" id="oldPass" class="form-control" placeholder="기존 비밀번호">
          	<span id="oldPassCheck" class="text-green" style="display:none;">비밀번호가 일치합니다.</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="password" name="pass" id="pass" class="form-control" placeholder="새 비밀번호">
          </div>
        </div>        
        <div class="row mb-3">
          <div class="col">
            <input type="password" name="passCheck" id="passCheck" class="form-control" placeholder="새 비밀번호 확인">
          	<span id="passCheckResult" class="text-green" style="display:none;">비밀번호가 일치합니다.</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <select class="form-select" name="mobile1">
              <option ${user.mobile.split('-')[0] == '010' ? 'selected' : ''}>010</option>
              <option ${user.mobile.split('-')[0] == '011' ? 'selected' : ''}>011</option>
              <option ${user.mobile.split('-')[0] == '016' ? 'selected' : ''}>016</option>
              <option ${user.mobile.split('-')[0] == '017' ? 'selected' : ''}>017</option>
              <option ${user.mobile.split('-')[0] == '018' ? 'selected' : ''}>018</option>
              <option ${user.mobile.split('-')[0] == '019' ? 'selected' : ''}>019</option>
            </select>
          </div>
          <div class="col">
            <input type="text" name="mobile2" id="mobile2" class="form-control" value="${user.mobile.split('-')[1]}">
          </div>
          <div class="col">
            <input type="text" name="mobile3" id="mobile3" class="form-control" value="${user.mobile.split('-')[2]}">
          </div>
          <div class="col">
            <input type="button" id="verifyBtn" class="green btn w-100" value="인증하기" onclick="verify();">
            <input type="hidden" id="verifyResult" value="false">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-8">
            <input type="text" name="mail" id="mail" class="form-control w-100" value="${user.email.split('@')[0]}">
          </div>
          <div class="col-4 text-end">
            <select name="domain" id="domain" class="form-select">
              <option hidden selected>@${user.email.split('@')[1]}</option>
              <option value="@naver.com">@naver.com</option>
              <option value="@daum.net">@daum.net</option>
              <option value="@kakao.com">@kakao.com</option>
              <option value="@gmail.com">@gmail.com</option>
              <option value="@hanmail.net">@hanmail.net</option>
              <option value="choice">- 직접입력 -</option>
            </select>
          </div>
        </div>
        <div class="row mb-3 border-bottom">
        </div>
        <div class="row mb-3">
          <div class="col-4">
            <input type="text" name="name" id="name" class="form-control" value="${user.name}">
          </div>
          <div class="col-8">
            <input type="text" name="businessName" id="businessName" class="form-control" value="${user.businessName}">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="businessNumber" id="businessNumber" class="form-control" value="${user.businessNumber}" disabled>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-4">
            <select name="bankName" class="form-select">
              <option ${user.bankName == '기업은행' ? 'selected' : '' }>기업은행</option>
              <option ${user.bankName == '국민은행' ? 'selected' : '' }>국민은행</option>
              <option ${user.bankName == '농협중앙회' ? 'selected' : '' }>농협중앙회</option>
              <option ${user.bankName == '단위농협' ? 'selected' : '' }>단위농협</option>
              <option ${user.bankName == '우리은행' ? 'selected' : '' }>우리은행</option>
              <option ${user.bankName == '대구은행' ? 'selected' : '' }>대구은행</option>
              <option ${user.bankName == '외환은행' ? 'selected' : '' }>외환은행</option>
              <option ${user.bankName == 'SC제일은행' ? 'selected' : '' }>SC제일은행</option>
              <option ${user.bankName == '부산은행' ? 'selected' : '' }>부산은행</option>
              <option ${user.bankName == '새마을금고' ? 'selected' : '' }>새마을금고</option>
              <option ${user.bankName == '한국씨티은행' ? 'selected' : '' }>한국씨티은행</option>
              <option ${user.bankName == '광주은행' ? 'selected' : '' }>광주은행</option>
              <option ${user.bankName == '경남은행' ? 'selected' : '' }>경남은행</option>
              <option ${user.bankName == '수협' ? 'selected' : '' }>수협</option>
              <option ${user.bankName == '신협' ? 'selected' : '' }>신협</option>
              <option ${user.bankName == '전북은행' ? 'selected' : '' }>전북은행</option>
              <option ${user.bankName == '제주은행' ? 'selected' : '' }>제주은행</option>
              <option ${user.bankName == '산림조합' ? 'selected' : '' }>산림조합</option>
              <option ${user.bankName == '우체국' ? 'selected' : '' }>우체국</option>
              <option ${user.bankName == '하나은행' ? 'selected' : '' }>하나은행</option>
              <option ${user.bankName == '신한은행' ? 'selected' : '' }>신한은행</option>
              <option ${user.bankName == '동양종금증권' ? 'selected' : '' }>동양종금증권</option>
              <option ${user.bankName == '한국투자증권' ? 'selected' : '' }>한국투자증권</option>
              <option ${user.bankName == '삼성증권' ? 'selected' : '' }>삼성증권</option>
              <option ${user.bankName == '미래에셋' ? 'selected' : '' }>미래에셋</option>
              <option ${user.bankName == '우리투자증권' ? 'selected' : '' }>우리투자증권</option>
              <option ${user.bankName == '현대증권' ? 'selected' : '' }>현대증권</option>
              <option ${user.bankName == 'SK증권' ? 'selected' : '' }>SK증권</option>
              <option ${user.bankName == '신한금융투자' ? 'selected' : '' }>신한금융투자</option>
              <option ${user.bankName == '하이증권' ? 'selected' : '' }>하이증권</option>
              <option ${user.bankName == 'HMC증권' ? 'selected' : '' }>HMC증권</option>
              <option ${user.bankName == '대신증권' ? 'selected' : '' }>대신증권</option>
              <option ${user.bankName == '하나대투증권' ? 'selected' : '' }>하나대투증권</option>
              <option ${user.bankName == '동부증권' ? 'selected' : '' }>동부증권</option>
              <option ${user.bankName == '유진증권' ? 'selected' : '' }>유진증권</option>
              <option ${user.bankName == '메리츠증권' ? 'selected' : '' }>메리츠증권</option>
              <option ${user.bankName == '신영증권' ? 'selected' : '' }>신영증권</option>
              <option ${user.bankName == '대우증권' ? 'selected' : '' }>대우증권</option>
            </select>
          </div>
          <div class="col-8">
            <input type="text" name="bankNumber" id="bankNumber" value="${user.bankNumber}" class="form-control">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <select name="phone1" id="phone1" class="form-select">
              <option ${user.phone.split('-')[0] == '02' ? 'selected' : ''}>02</option>
              <option ${user.phone.split('-')[0] == '031' ? 'selected' : ''}>031</option>
              <option ${user.phone.split('-')[0] == '031' ? 'selected' : ''}>032</option>
              <option ${user.phone.split('-')[0] == '033' ? 'selected' : ''}>033</option>
              <option ${user.phone.split('-')[0] == '041' ? 'selected' : ''}>041</option>
              <option ${user.phone.split('-')[0] == '042' ? 'selected' : ''}>042</option>
              <option ${user.phone.split('-')[0] == '043' ? 'selected' : ''}>043</option>
              <option ${user.phone.split('-')[0] == '044' ? 'selected' : ''}>044</option>
              <option ${user.phone.split('-')[0] == '051' ? 'selected' : ''}>051</option>
              <option ${user.phone.split('-')[0] == '052' ? 'selected' : ''}>052</option>
              <option ${user.phone.split('-')[0] == '053' ? 'selected' : ''}>053</option>
              <option ${user.phone.split('-')[0] == '054' ? 'selected' : ''}>054</option>
              <option ${user.phone.split('-')[0] == '055' ? 'selected' : ''}>055</option>
              <option ${user.phone.split('-')[0] == '061' ? 'selected' : ''}>061</option>
              <option ${user.phone.split('-')[0] == '062' ? 'selected' : ''}>062</option>
              <option ${user.phone.split('-')[0] == '063' ? 'selected' : ''}>063</option>
              <option ${user.phone.split('-')[0] == '064' ? 'selected' : ''}>064</option>
            </select>
          </div>
          <div class="col">
            <input type="text" name="phone2" id="phone2" class="form-control" value="${user.phone.split('-')[1]}">
          </div>
          <div class="col">
            <input type="text" name="phone3" id="phone3" class="form-control" value="${user.phone.split('-')[2]}">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col-6">
            <input type="text" name="postNum" id="postNum" value="${user.postNum}" class="form-control">
          </div>
          <div class="col-4 offset-2 text-end">
            <input type="button" value="우편번호 조회" class="green btn w-100" onclick="sample6_execDaumPostcode()">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="address1" id="address1" value="${user.address1}" class="form-control">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="address2" id="address2" value="${user.address2}" class="form-control">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col-4 offset-4">
            <input type="submit" value="수정하기" class="green btn w-100">
          </div>
        </div>
      </div>
    </form>
  </div>
  
  <script>
	
  </script>
  
</body>
</html>