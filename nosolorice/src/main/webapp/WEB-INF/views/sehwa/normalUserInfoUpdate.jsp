<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <title>내 정보 수정하기</title>
</head>
<body>
  <div class="container">
    <form id="normalUserInfoUpdate" method="post" enctype="multipart/form-data" 
    		class="row">
      <input type="text" name="rPass" id="rPass" value="${rPass}">
      <div class="col-3">
        <input type="file" id="fileInput" style="display: none;">
        <button style="border : none; background-color: white;" class="w-100" id="clickImg">
          <img src="https://via.placeholder.com/150" class="w-100">
        </button>
        <a href="" style="text-decoration: none;" class="text-gray">기본이미지로 변경</a>
      </div>
      <div class="col-9 px-5">
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.normalId}" readonly>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.name}" readonly>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-8">
            <input type="text" class="form-control w-100" value="${sessionScope.NormalUser.nickName}">
          </div>
          <div class="col-4 text-end">
            <input type="button" value="중복확인" class="green btn px-4">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="oldPass" id="oldPass" class="form-control" placeholder="기존 비밀번호">
          	<span id="oldPassCheck" class="text-green" style="display:none;">비밀번호가 일치합니다.</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="pass" id="pass" class="form-control" placeholder="새 비밀번호">
          </div>
        </div>        
        <div class="row mb-3">
          <div class="col">
            <input type="text" name="passCheck" id="passCheck" class="form-control" placeholder="새 비밀번호 확인">
          	<span id="passCheckResult" class="text-green" style="display:none;">비밀번호가 일치합니다.</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-4">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.birth.split('-')[0]}" readonly>
          </div>
          <div class="col-4">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.birth.split('-')[1]}" readonly>
          </div>
          <div class="col-4">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.birth.split('-')[2]}" readonly>
          </div>
        </div>
        <div class="row mb-3 radio-btn gx-0 text-center">
          <div class="col">
            <input type="radio" id="male" name="gender" checked>
            <label for="male">남자</label>
          </div>
          <div class="col">
            <input type="radio" id="female" name="gender">
            <label for="female">여자</label>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-3">
             <select class="form-select" name="mobile1">
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '010' ? 'selected' : ''}>010</option>
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '011' ? 'selected' : ''}>011</option>
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '016' ? 'selected' : ''}>016</option>
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '017' ? 'selected' : ''}>017</option>
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '018' ? 'selected' : ''}>018</option>
              <option ${sessionScope.NormalUser.mobile.split('-')[0] == '019' ? 'selected' : ''}>019</option>
            </select>
          </div>
          <div class="col-3">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.mobile.split('-')[1]}">
          </div>
          <div class="col-3">
            <input type="text" class="form-control" value="${sessionScope.NormalUser.mobile.split('-')[2]}">
          </div>
          <div class="col-3">
            <input type="button" value="인증하기" class="green btn w-100">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-8">
            <input type="text" class="form-control w-100" value="${sessionScope.NormalUser.email.split('@')[0]}">
          </div>
          <div class="col-4 text-end">
            <select class="form-select">
              <option hidden selected>@${sessionScope.NormalUser.email.split('@')[1]}</option>
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
            <input type="text" id="sample6_postcode" value="${sessionScope.NormalUser.postNum}" class="form-control">
          </div>
          <div class="col-4 offset-2 text-end">
            <input type="button" value="우편번호 조회" class="green btn w-100" onclick="sample6_execDaumPostcode()">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" id="sample6_address" value="${sessionScope.NormalUser.address1}" class="form-control">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col">
            <input type="text" id="sample6_detailAddress" value="${sessionScope.NormalUser.address2}" class="form-control">
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>