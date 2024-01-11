<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가게 정보</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link href="resources/css/sehwa/globalStyle.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="resources/js/sehwa/globalFunction.js"></script>
<script src="resources/js/sehwa/validation.js"></script>
<script src="resources/js/sehwa/ajax.js"></script>

</head>
<body>
	<div class="container">
	<div class="row">
	  	<%@ include file="../../temple/header/businessMenubar.jsp" %>
  		<div class="col-md-9">
			<input type="hidden" id="businessId" value="${BusinessUser.businessId}">
		   <div class="row">
		     <div class="col-4">
		       <c:if test="${empty BusinessUser.businessProfile}">
		          <img src="resources/img/profile_img.png" class="preview w-100">      
	          </c:if>
	          <c:if test="${not empty BusinessUser.businessProfile}">
		          <img src="resources/upload/${BusinessUser.businessProfile}" class="preview w-100">
	          </c:if>
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
		           <input type="text" class="form-control" value="${BusinessUser.businessName}" readonly>
		         </div>
		         <div class="col-6">
		           <label>전화번호</label>
		           <input type="text" class="form-control" value="${BusinessUser.phone}" readonly>
		         </div>
		       </div>
		       <div class="row">
		         <div class="col-6">
		           <label>대표자명</label>
		           <input type="text" class="form-control" value="${BusinessUser.name }" readonly>
		         </div>
		         <div class="col-6">
		           <label>주소</label>
		           <input type="text" class="form-control" value="${BusinessUser.address1} ${sessionScope.BusinessUser.address2}" readonly>
		         </div>
		       </div>
		       <div class="row">
		         <div class="col-6">
		           <label>계좌번호</label>
		           <input type="text" class="form-control" value="${BusinessUser.bankName} ${sessionScope.BusinessUser.bankNumber}" readonly>
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
		           		value="<fmt:formatNumber value="${BusinessUser.deposit}" pattern="#,###" />">
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
		           <input type="checkbox" name="selector" class="selector" value="1" 
		           			onclick="checkSectors(this)" ${secNum.contains('1') ? 'checked' : ''}>
		           <label class="me-1">한식</label>
		           <input type="checkbox" name="selector" class="selector" value="2" 
		           			onclick="checkSectors(this)" ${secNum.contains('2') ? 'checked' : ''}>
		           <label class="me-1">양식</label>
		           <input type="checkbox" name="selector" class="selector" value="3" 
		           			onclick="checkSectors(this)" ${secNum.contains('3') ? 'checked' : ''}>
		           <label class="me-1">중식</label>
		           <input type="checkbox" name="selector" class="selector" value="4" 
		           			onclick="checkSectors(this)" ${secNum.contains('4') ? 'checked' : ''}>
		           <label class="me-1">일식/돈까스</label><br>
		           <input type="checkbox" name="selector" class="selector" value="5" 
		           			onclick="checkSectors(this)" ${secNum.contains('5') ? 'checked' : ''}>
		           <label class="me-1">치킨</label>
		           <input type="checkbox" name="selector" class="selector" value="6" 
		           			onclick="checkSectors(this)" ${secNum.contains('6') ? 'checked' : ''}>
		           <label class="me-1">피자</label>
		           <input type="checkbox" name="selector" class="selector" value="7" 
		           			onclick="checkSectors(this)" ${secNum.contains('7') ? 'checked' : ''}>
		           <label class="me-1">족발/보쌈</label>
		           <input type="checkbox" name="selector" class="selector" value="8" 
		           			onclick="checkSectors(this)" ${secNum.contains('8') ? 'checked' : ''}>
		           <label class="me-1">야식</label>
		           <input type="checkbox" name="selector" class="selector" value="9" 
		           			onclick="checkSectors(this)" ${secNum.contains('9') ? 'checked' : ''}>
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
		           		class="timepicker form-control" value="${BusinessUser.openTime}">
		         </div>
		         <div class="col-6">
		           <input type="text" name="dayOff" id="dayOff" 
		           		class="form-control" value="${BusinessUser.dayOff}">
		         </div>
		       </div>
		       <div class="row">
		         <label>마감시간</label>
		       </div>
		       <div class="row">
		         <div class="col-6">
		           <input type="text" name="closeTime" id="closeTime"
		           		class="timepicker form-control" value="${BusinessUser.closeTime}">
		           <label>브레이크 타임</label>
		           <div class="row">
		             <div class="col">
		               <input type="text" name="breakTime01" id="breakTime01"
		               		class="timepicker form-control" value="${BusinessUser.breakTime.split('~')[0]}">
		             </div>~
		             <div class="col">
		               <input type="text"  name="breakTime02" id="breakTime02"
		               		class="timepicker form-control" value="${BusinessUser.breakTime.split('~')[1]}">
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
		   <div class="row gy-4 mb-5">
		     <div class="col-12">
		       <h2>가게소개</h2>
		       <textarea class="summernote" name="editordata" id="editordata">${BusinessUser.introduction}</textarea>    
		     </div>
		     <div class="col-4 offset-4">
		       <input type="button" name="storeIntroductionUpdateBtn" id="storeIntroductionUpdateBtn" 
		       			value="수정하기" class="green btn w-100">
		     </div>
		   </div>
	   </div>
	  </div>
	 </div>
	 
	 <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script>
		// 체크박스 업종 최대 3개 선택
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
		// 웹 에디터 
		  $('.summernote').summernote({
			    height: 450,
			    lang: "ko-KR"
			});
		  
		  // 타임피커
			  $('.timepicker').timepicker({
			    timeFormat: 'HH:mm',
			    interval: 30,
			    startTime: '00:00',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
			});
	</script>
	 
  
</body>
</html>