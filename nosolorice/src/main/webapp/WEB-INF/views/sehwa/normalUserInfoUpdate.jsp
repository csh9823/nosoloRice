<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685bdba705a3c08af0c489199df63809&libraries=services"></script>
  <title>내 정보 수정하기</title>
</head>
<body>
  <div class="container">
  	<div class="row">
	    <%@ include file="../../temple/header/mypageMenubar.jsp" %>
	    <div class="col-md-9">
	    <form id="normalUserInfoUpdate" method="post" enctype="multipart/form-data" 
	    		class="row">
	      <input type="hidden" name="xpoint" id="xpoint" value="${NormalUser.xpoint }">
	      <input type="hidden" name="ypoint" id="ypoint" value="${NormalUser.ypoint }">
	      <div class="col-3 text-center">
	        <input type="file" name="fileInput" id="fileInput"  onchange="readImage(this)"  style="display:none;" accept="image/*">
	        <button style="border : none; background-color: white;" class="w-100 my-2" id="clickImg">
	          <div class="profile-box-200">
		          <c:if test="${NormalUser.profile eq 'defaultImg'}">
			          <img src="resources/img/profile_img.png" class="preview w-100 profile-img">      
		          </c:if>
		          <c:if test="${NormalUser.profile ne 'defaultImg'}">
			          <img src="resources/upload/${NormalUser.profile}" class="preview w-100 profile-img">
		          </c:if>
		          </div>
	        </button>
	        <span id="changeDefaultImg" class="text-gray" style="text-decoration: none; cursor:pointer;">기본이미지로 변경</span>
	      </div>
	      <div class="col-9 px-5">
	        <div class="row mb-3">
	          <div class="col">
	            <input type="text" name="normalId" id="normalId" class="form-control" value="${NormalUser.normalId}" readonly>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col">
	            <input type="text" name="name" id="name" class="form-control" value="${NormalUser.name}" readonly>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-6">
	            <input type="text" name="nickName" id="nickName" class="form-control w-100" value="${NormalUser.nickName}">
	          </div>
	          <div class="col-6 text-end">
	            <input type="button" id="checkNormalNickNameBtn" value="닉네임 중복확인" class="green btn px-4 w-100">
	          </div>
	          <div class="col-12">
	          	<span id="nickNameFalse" class="text-red" style="display:none;">중복된 닉네임 입니다.</span>
	          	<span id="nickNameTrue" class="text-green" style="display:none;">사용가능한 닉네임 입니다.</span>
	          	<input type="hidden" id="nickNameResult" value="true">
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
	          <div class="col-4">
	            <input type="text" name="birth1" id="birth1" class="form-control" value="${NormalUser.birth.split('-')[0]}" readonly>
	          </div>
	          <div class="col-4">
	            <input type="text" name="birth2" id="birth2" class="form-control" value="${NormalUser.birth.split('-')[1]}" readonly>
	          </div>
	          <div class="col-4">
	            <input type="text" name="birth3" id="birth3" class="form-control" value="${NormalUser.birth.split('-')[2]}" readonly>
	          </div>
	        </div>
	        <div class="row mb-3 radio-btn gx-0 text-center">
	          <div class="col">
	            <input type="radio" id="male" name="gender" value="남성" ${NormalUser.gender eq '남성' ? 'checked' : ''} disabled>
	            <label for="male">남자</label>
	          </div>
	          <div class="col">
	            <input type="radio" id="female" name="gender" value="여성" ${NormalUser.gender eq '여성' ? 'checked' : ''} disabled>
	            <label for="female">여자</label>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-3">
	             <select class="form-select" name="mobile1" id="mobile1">
	              <option ${NormalUser.mobile.split('-')[0] == '010' ? 'selected' : ''}>010</option>
	              <option ${NormalUser.mobile.split('-')[0] == '011' ? 'selected' : ''}>011</option>
	              <option ${NormalUser.mobile.split('-')[0] == '016' ? 'selected' : ''}>016</option>
	              <option ${NormalUser.mobile.split('-')[0] == '017' ? 'selected' : ''}>017</option>
	              <option ${NormalUser.mobile.split('-')[0] == '018' ? 'selected' : ''}>018</option>
	              <option ${NormalUser.mobile.split('-')[0] == '019' ? 'selected' : ''}>019</option>
	            </select>
	          </div>
	          <div class="col-3">
	            <input type="text" name="mobile2" id="mobile2" class="form-control" maxlength="4" value="${NormalUser.mobile.split('-')[1]}">
	          </div>
	          <div class="col-3">
	            <input type="text" name="mobile3" id="mobile3" class="form-control" maxlength="4" value="${NormalUser.mobile.split('-')[2]}">
	          </div>
	          <div class="col-3">
	            <input type="button" id="verifyBtn" value="인증하기" class="green btn w-100">
	            <input type="hidden" id="verifyResult" value="true">
	          </div>
	        </div>
	        <div class="row mb-3" id="blockVerify" style="display: none;">
	        	<div class="col">
	        		<input type="text" id="inputVerify" class="form-control">
	        	</div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-8">
	            <input type="text" name="mail" id="mail" class="form-control w-100" value="${NormalUser.email.split('@')[0]}">
	          </div>
	          <div class="col-4 text-end">
	            <select class="form-select" name="domain">
	              <option hidden selected>@${NormalUser.email.split('@')[1]}</option>
	              <option>@naver.com</option>
	              <option>@daum.net</option>
	              <option>@kakao.com</option>
	              <option>@gmail.com</option>
	              <option>@hanmail.net</option>
	              <option value="">- 직접입력 -</option>
	            </select>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col-6">
	            <input type="text" name="postNum" id="postNum" value="${NormalUser.postNum}" class="form-control">
	          </div>
	          <div class="col-4 offset-2 text-end">
	            <input type="button" value="우편번호 조회" class="green btn w-100" onclick="sample6_execDaumPostcode()">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <div class="col">
	            <input type="text" name="address1" id="address1" value="${NormalUser.address1}" class="form-control">
	          </div>
	        </div> 
	        <div class="row mb-3">
	          <div class="col">
	            <input type="text" name="address2" id="address2" value="${NormalUser.address2}" class="form-control">
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

  	</div>
  </div>
  
    <script>
	//비밀번호일치확인(실시간 출력)
	$("#oldPass").on("keyup", function() {
		let id = $("#normalId").val();
		let inputPass = $("#oldPass").val();
		
		$.ajax({
			"url" : "checkBusinessPass.ajax",
			"data" : {
				"id" : id,
				"inputPass" : inputPass,
				"type" : "normal"
			},
			"type" : "post", 
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData)
				if(resData == 'true') {
					$("#oldPassCheck").css("display", "block");
				} else {
					$("#oldPassCheck").css("display", "none");
				}
				
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", xhr, err)
			}
		});
	});
	
	// 핸드폰번호 변경 시
	$("#mobile1, #mobile2, #mobile3").on("change", function() {
		let id = $("#normalId").val();
		let mobile1 = $("#mobile1").val();
		let mobile2 = $("#mobile2").val();
		let mobile3 = $("#mobile3").val();
		let inputMobile = mobile1 + "-" + mobile2 + "-" + mobile3;	
		console.log(inputMobile);
		
		$.ajax({
			"url" : "checkBusinessMobile.ajax",
			"data" : {
				"id" : id,
				"inputMobile" : inputMobile,
				"type" : "normal"
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				if(resData == 'true') {
					$("#verifyResult").val(true);
				} else {
					$("#verifyResult").val(false);
				}
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", xhr, err);
			}
		});	
	});
	
	
	// 기본이미지로 변경하기
	$(document).on("click", "#changeDefaultImg", function() {
		let id = $("#normalId").val();
		$.ajax({
			"url" : "changeDefaultImg.ajax",
			"data" : {
						id : id,
						type : "normalUser"
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				$(".preview").attr("src", "resources/img/profile_img.png");
			},
			"error" : function(xhr, status, err) {
				console.log(xhr, "-", err);			
			}
		});
	});
	
	// 닉네임 중복체크
	$(document).on("keyup", "#nickName", function() {
		$("#nickNameResult").val(false);
		$("#nickNameFalse, #nickNameTrue").css("display", "none");
	});
	$(document).on("click", "#checkNormalNickNameBtn", function(){
		let nickName = $("#nickName").val();
		
		$.ajax({
			"url" : "checkNormalNickName.ajax",
			"data" : {
				nickName : nickName
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				if(resData == true) { // 닉네임이 있을 경우
					$("#nickNameFalse").css("display", "block");
					$("#nickNameTrue").css("display", "none");
				} else  {		// 닉네임 사용 가능 할 경우
					$("#nickNameFalse").css("display", "none");
					$("#nickNameTrue").css("display", "block");
					$("#nickNameResult").val(true);
				}
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", xhr, "-", err);
			}
		});
	});
	
	// 엔터키 방지
	$('input[type="text"]').keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	});
		
	
	
	
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>