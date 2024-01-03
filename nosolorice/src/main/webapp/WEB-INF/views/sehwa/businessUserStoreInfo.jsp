<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가게 정보</title>
</head>
<body>
	<div class="container">
		<input type="hidden" id="businessId" value="${user.businessId}">
	   <div class="row">
	     <div class="col-4">
	       <button style="border : none; background-color: white;" class="w-100" id="clickImg">
	         <img src="https://via.placeholder.com/150" class="w-100">
	       </button>
	     </div>
	     <div class="col-8">
	       <div class="row">
	         <div class="col">
	           <h2>업체정보</h2>
	         </div>
	       </div>
	       <div class="row">
	         <div class="col-6">
	           <label>업체명</label>
	           <input type="text" class="form-control" value="${user.businessName}" readonly>
	         </div>
	         <div class="col-6">
	           <label>전화번호</label>
	           <input type="text" class="form-control" value="${user.mobile}" readonly>
	         </div>
	       </div>
	       <div class="row">
	         <div class="col-6">
	           <label>대표자명</label>
	           <input type="text" class="form-control" value="${user.name }" readonly>
	         </div>
	         <div class="col-6">
	           <label>주소</label>
	           <input type="text" class="form-control" value="${user.address1} ${user.address2}" readonly>
	         </div>
	       </div>
	       <div class="row">
	         <div class="col-6">
	           <label>계좌번호</label>
	           <input type="text" class="form-control" value="${user.bankName} ${user.bankNumber}" readonly>
	         </div>
	       </div>
	     </div>
	   </div>
	   <div class="row py-5">
	     <div class="border-bottom"></div>
	   </div>
	   <div class="row">
	     <div class="col-6">
	       <div class="row">
	         <div class="col">
	           <h2>인당 예약금</h2>
	           <p class="text-red">미설정시 1,000원으로 기본설정입니다.</p>
	         </div>
	       </div>
	       <div class="row">
	         <div class="col-8">
	           <input type="text" id="deposit" name="deposit" class="form-control" 
	           		value="<fmt:formatNumber value="${user.deposit}" pattern="#,###" />">
	         </div>
	         <div class="col-4">
	           <input type="button" value="금액설정" id="depositUpdateBtn" class="green btn">
	         </div>
	       </div>
	       <div class="row">
	         <div class="col">
	           <h2>업종선택</h2>
	           <p class="text-red">*최대 3개까지 선택 가능합니다.</p>
	         </div>
	       </div>
	       <div class="row">
	         <div class="col-12">
	           <input type="checkbox" name="selector" value="01" onclick="checkSectors(this)">
	           <label class="me-1">한식</label>
	           <input type="checkbox" name="selector" value="02" onclick="checkSectors(this)">
	           <label class="me-1">양식</label>
	           <input type="checkbox" name="selector" value="03" onclick="checkSectors(this)">
	           <label class="me-1">중식</label>
	           <input type="checkbox" name="selector" value="04" onclick="checkSectors(this)">
	           <label class="me-1">일식/돈까스</label><br>
	           <input type="checkbox" name="selector" value="05" onclick="checkSectors(this)">
	           <label class="me-1">치킨</label>
	           <input type="checkbox" name="selector" value="06" onclick="checkSectors(this)">
	           <label class="me-1">피자</label>
	           <input type="checkbox" name="selector" value="07" onclick="checkSectors(this)">
	           <label class="me-1">족발/보쌈</label>
	           <input type="checkbox" name="selector" value="08" onclick="checkSectors(this)">
	           <label class="me-1">야식</label>
	           <input type="checkbox" name="selector" value="09" onclick="checkSectors(this)">
	           <label class="me-1">분식</label><br>
	         </div>
	         <div class="col-4 offset-8">
	           <input type="button" name="storeSectorUpdateBtn" id="storeSectorUpdateBtn" 
	           			value="선택완료" class="green btn">
	         </div>
	       </div>
	     </div>
	     <div class="col-6 border-start ps-4">
	       <div class="row">
	         <h2>영업시간</h2>
	         <p class="text-red">미설정시 공백으로 출력됩니다.</p>
	       </div>
	       <div class="row">
	          <div class="col-6">
	           <label>오픈시간</label>
	          </div>
	          <div class="col-6">
	           <label>휴무일</label>
	          </div>
	       </div>
	       <div class="row">
	         <div class="col-6">
	           <input type="text" name="openTime" id="openTime"
	           		class="timepicker form-control" value="${user.openTime}">
	         </div>
	         <div class="col-6">
	           <input type="text" name="dayOff" id="dayOff" 
	           		class="form-control" value="${user.dayOff}">
	         </div>
	       </div>
	       <div class="row">
	         <label>마감시간</label>
	       </div>
	       <div class="row">
	         <div class="col-6">
	           <input type="text" name="closeTime" id="closeTime"
	           		class="timepicker form-control" value="${user.closeTime}">
	           <label>브레이크 타임</label>
	           <div class="row">
	             <div class="col">
	               <input type="text" name="breakTime01" id="breakTime01"
	               		class="timepicker form-control" value="${user.breakTime.split('~')[0]}">
	             </div>~
	             <div class="col">
	               <input type="text"  name="breakTime02" id="breakTime02"
	               		class="timepicker form-control" value="${user.breakTime.split('~')[1]}">
	             </div>
	           </div>
	         </div>
	         <div class="col-6">
	           <input type="button" name="storeTimeUpdateBtn" id="storeTimeUpdateBtn" value="입력완료" class="green btn w-100 h-100">
	         </div>
	       </div>
	     </div>
	   </div>
	   <div class="row py-5">
	     <div class="border-bottom"></div>
	   </div>
	   <div class="row gy-4">
	     <div class="col-12">
	       <h2>가게소개</h2>
	       <textarea class="summernote" name="editordata" id="editordata">${user.introduction}</textarea>    
	     </div>
	     <div class="col-4 offset-4">
	       <input type="button" name="storeIntroductionUpdateBtn" id="storeIntroductionUpdateBtn" 
	       			value="수정하기" class="green btn w-100">
	     </div>
	   </div>
	 </div>
	 
	<script>
		var maxChecked = 3;
		var totalChecked = 0;
		function checkSectors(field) {
			if(field.checked) {
				totalChecked += 1;
			} else {
				totalChecked -= 1;
			}
			if(totalChecked > maxChecked) {
				field.checked = false;
				totalChecked -= 1;
			}
		}
	</script>
	 
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>