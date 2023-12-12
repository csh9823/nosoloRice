  <div class="container">
    <form class="row" action="businessUserInfoUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="rPass" value="${user.pass}">		
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
            <input type="text" class="form-control" value="${user.businessId}" disabled>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" placeholder="기존 비밀번호">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" placeholder="새 비밀번호">
          </div>
        </div>        
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" placeholder="새 비밀번호 확인">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <select class="form-select">
              <option ${user.mobile.slice(0, 3) == 010 ? 'selected' : ''}>010</option>
              <option ${user.mobile.slice(0, 3) == 011 ? 'selected' : ''}>011</option>
              <option ${user.mobile.slice(0, 3) == 016 ? 'selected' : ''}>016</option>
              <option ${user.mobile.slice(0, 3) == 017 ? 'selected' : ''}>017</option>
              <option ${user.mobile.slice(0, 3) == 018 ? 'selected' : ''}>018</option>
              <option ${user.mobile.slice(0, 3) == 019 ? 'selected' : ''}>019</option>
            </select>
          </div>
          <div class="col">
            <input type="text" class="form-control" value="${user.mobile.slice(3, 7)}">
          </div>
          <div class="col">
            <input type="text" class="form-control" value="${user.mobile.slice(7)}">
          </div>
          <div class="col">
            <input type="button" class="green btn w-100" value="인증하기">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-8">
            <input type="text" class="form-control w-100" value="이메일">
          </div>
          <div class="col-4 text-end">
            <select class="form-select">
              <option>@naver.com</option>
              <option>@daum.net</option>
              <option>@kakao.com</option>
              <option>@gmail.com</option>
              <option>@hanmail.net</option>
              <option value="">- 직접입력 -</option>
            </select>
          </div>
        </div>
        <div class="row mb-3 border-bottom">
        </div>
        <div class="row mb-3">
          <div class="col-4">
            <input type="text" class="form-control" value="${user.name}">
          </div>
          <div class="col-8">
            <input type="text" class="form-control" value="${user.businessName}">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" class="form-control" value="${user.businessNumber}" disabled>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-4">
            <select class="form-select">
              <option>기업은행</option>
              <option>국민은행</option>
              <option>농협중앙회</option>
              <option>단위농협</option>
              <option>우리은행</option>
              <option>대구은행</option>
              <option>외환은행</option>
              <option>SC제일은행</option>
              <option>부산은행</option>
              <option>새마을금고</option>
              <option>한국씨티은행</option>
              <option>광주은행</option>
              <option>경남은행</option>
              <option>수협</option>
              <option>신협</option>
              <option>전북은행</option>
              <option>제주은행</option>
              <option>산림조합</option>
              <option>우체국</option>
              <option>하나은행</option>
              <option>신한은행</option>
              <option>동양종금증권</option>
              <option>한국투자증권</option>
              <option>삼성증권</option>
              <option>미래에셋</option>
              <option>우리투자증권</option>
              <option>현대증권</option>
              <option>SK증권</option>
              <option>신한금융투자</option>
              <option>하이증권</option>
              <option>HMC증권</option>
              <option>대신증권</option>
              <option>하나대투증권</option>
              <option>동부증권</option>
              <option>유진증권</option>
              <option>메리츠증권</option>
              <option>신영증권</option>
              <option>대우증권</option>
            </select>
          </div>
          <div class="col-8">
            <input type="text" value="${user.bankNumber}" class="form-control">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <select class="form-select">
              <option>02</option>
              <option>031</option>
              <option>032</option>
              <option>033</option>
              <option>041</option>
              <option>042</option>
              <option>043</option>
              <option>044</option>
              <option>051</option>
              <option>052</option>
              <option>053</option>
              <option>054</option>
              <option>055</option>
              <option>061</option>
              <option>062</option>
              <option>063</option>
              <option>064</option>
            </select>
          </div>
          <div class="col">
            <input type="text" class="form-control" value="000">
          </div>
          <div class="col">
            <input type="text" class="form-control" value="0000">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col-6">
            <input type="text" id="sample6_postcode" value="${user.postNum}" class="form-control">
          </div>
          <div class="col-4 offset-2 text-end">
            <input type="button" value="우편번호 조회" class="green btn w-100" onclick="sample6_execDaumPostcode()">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <input type="text" id="sample6_address" value="${user.address1}" class="form-control">
          </div>
        </div> 
        <div class="row mb-3">
          <div class="col">
            <input type="text" id="sample6_detailAddress" value="${user.address2}" class="form-control">
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