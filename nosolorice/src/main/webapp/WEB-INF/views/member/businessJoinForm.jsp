<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

	<form class="form form-center" action="/uploads" method="post" enctype="multipart/form-data">
    <div class="row">

        <div class="row-12 p-5">
          <div class="d-flex justify-content-center">
            <img src="/img/logo/nosolorice_logo_M.png">
          </div>
          <div class="d-flex justify-content-center">
            <p class="fs-1 fw-bold">사업자 가입</p>
          </div>
        </div>

        <div class="row-12 p-3 d-flex justify-content-center">
          <!-- profile_img -->
          <div class="col-2">
            <img src="../img/profile_img.png">
            <input type="file" accept="image/*">
          </div> 

          <div class="col-sm-8">
            <div class="row">
            
              <div class="col-5 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="normalId" name="normalId" placeholder="ID" required>
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <button type="button" class="btn btn-success" id="overlapCheck">증복확인</button>
                </div>
              </div>

              <div class="col-5 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="nickname" placeholder="닉네임" required>
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="BusinessNickOverlapCheck">증복확인
                </div>
              </div>

              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="password" class="form-control" name="pass" placeholder="비밀번호" required>
                </div>
              </div>

              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="password" class="form-control" name="checkPass" placeholder="비밀번호확인" required>
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="phone" id="phone" placeholder="01012345678" required>
                </div>
              </div>

              <div class="col-2 p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="getNormalPhoneCheck">인증번호 받기
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-5 p-2">
                <div class="form-group">
                  <input type="password" class="form-control" name="pass" placeholder="인증번호를 입력해 주세요" required>
                </div>
              </div>

              <div class="col-2 p-2">
                <div class="form-group">
                  <input type="button" class="btn btn-success" id="normalPhoneCheck">인증하기
                </div>
              </div>
              
              <div class="col-5 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해 주세요" required>
                </div>
              </div>
              
              <!-- option으로 수정 -->
              <div class="col-3 p-2">
                <select class="form-select">
                  <option value="@naver.com">@naver.com</option>
                  <option value="@naver.com">@gmail.com</option>
                  <option value="@naver.com">@daum.net</option>
                </select>
              </div>

			<!-- 가름줄 -->
			  <div class="col-12">
		      	<div class="form-group">
		      		<span class="border-bottom border-5 border-black border-opacity-75"></span>
			    </div>
			  </div>				
			<!-- 가름줄 -->
			
			  <div class="col-auto p-2">
				<div class="form-group">
                  <input type="text" class="form-control" name="name" id="name" placeholder="대표자명" required>
                </div>
              </div>
              
              <div class="col-5 p-2">
				<div class="form-group">
                  <input type="text" class="form-control" name="brand" id="brand" placeholder="상호명" required>
                </div>
              </div>
              
              <div class="col-5 p-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="businessNumber" name="businessNumber" placeholder="사업자등록번호" required>
                </div>
              </div>

              <div class="col-3 text-end p-2">
                <div class="form-group">
                  <button type="button" class="btn btn-success" id="businessNumberCheck">진위확인</button>
                </div>
              </div>
              
              <div class="col-5 p-2">
                <h5>사업자등록증 이미지를 업로드 해주세요</h5>
                <div class="form-group">
                  <input type="file" class="form-control" id="businessPicture" name="businessPicture" required>
                </div>
              </div>

			<div class="col-3 text-end p-2">
                <div class="form-control">
                  <input type="button" class="btn btn-success" id="bNoPhotoUpload">업로드
                </div>
              </div>
			
			<div class="col-12">
                <div class="form-group">
                </div>
              </div>
				
			<div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-3 p-2">
              	<div class="form-control">
	              	<select class="form-select" aria-label="selectBank">
					  <option selected>-- 은행을 선택해 주세요 --</option>
					  <option value="002">KDB산업은행</option>
					  <option value="003">IBK기업은행</option>
					  <option value="004">KB국민은행</option>
					  <option value="007">수협은행</option>
					  <option value="011">NH농협은행</option>
					  <option value="020">우리은행</option>
					  <option value="023">SC제일은행</option>
					  <option value="027">한국씨티은행</option>
					  <option value="031">대구은행</option>
					  <option value="032">부산은행</option>
					  <option value="034">광주은행</option>
					  <option value="035">제주은행</option>
					  <option value="037">전북은행</option>
					  <option value="039">경남은행</option>
					  <option value="081">하나은행</option>
					  <option value="088">신한은행</option>
					  <option value="089">케이뱅크</option>
					  <option value="090">카카오뱅크</option>
					  <option value="092">토스뱅크</option>
					  <option value="012">농협중앙회</option>
					  <option value="071">우체국</option>
					</select>
              	</div>
              </div>
			
              <div class="col-5 end p-2">
                <div class="form-control">
                  <input type="number" class="form-control" id="accountNumber" placeholder="대표자명의 계좌번호를 입력해 주세요">
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">
                </div>
              </div>
              
              <div class="col-8 p-2">
                <div class="form-group">
                  <input type="number" class="form-control" name="storeNumber" id="storeNumber" placeholder="메장 전화번호를 입력해 주세요">
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-4 p-2">
                <p>성별을 선택해 주세요</p>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="man" id="man">
                  <label class="form-check-label" for="man">
                    남성
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="woman" id="woman" checked>
                  <label class="form-check-label" for="woman">
                    여성
                  </label>
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
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

              <div class="col-3">
                <div class="form-group">
                </div>
              </div>

              <div class="col-2 text-end p-1">
                <div class="form-group">
                  <button type="button" class="btn btn-success" id="searchZipcode">우편코드 찾기</button>
                </div>
              </div>

              <div class="col-8 p-1">
                <div class="form-group">
                  <input type="number" maxlength="5" class="form-control" name="address1" id="address1" readonly>
                </div>
              </div>

              <div class="col-8 p-1">
                <div class="form-group">
                  <input type="text" class="form-control" name="detailAdress" readonly>
                </div>
              </div>

              <div class="col-8 p-2">
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

              <div class="col-8 p-2">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="termOK" required>
                  <label class="form-check-label" for="termOK"> 위 이용약관에 동의합니다. (필수)</label>
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">
                </div>
              </div>

              <div class="col-8 text-center p-2">
                <div class="form-group">
                  <button type="submit" class="btn btn-success" id="normalJoin">&nbsp&nbsp가입하기&nbsp&nbsp</button>
                </div>
              </div>
				</div>
            </div>
        </div>
      </div>
  </form>