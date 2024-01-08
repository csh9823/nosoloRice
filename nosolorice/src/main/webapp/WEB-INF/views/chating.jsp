<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link href="resources/css/chating.css" rel="stylesheet">
<script src="resources/js/chating.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0a417775ec6a571d18167c6c49816e7&libraries=services"></script>

 <div class="row mt-2">
     <div class="col">
     	
     	<input type="hidden" id="loginId" value="${sessionScope.NormalUser.normalId}">
     	<input type="hidden" id="loginNickName" value="${sessionScope.NormalUser.nickName}">
     	<input type="hidden" id="loginProfileImg" value="${sessionScope.NormalUser.profile}">
     
         <div class="row">

             <!-- 채팅 시작 -->
             <div class="col-6 rounded border border-secondary-subtle bg-white" id="chatContainer">
                 <!-- 채팅헤더 -->
                 <div class="row p-3" style="height:100px">
                     <div class="col-auto d-flex justify-content-start align-items-center p-0">
                         <i class="bi bi-chat-right-dots" style="font-size: 3em; color:#555;"></i>
                     </div>
                     <div class="col d-flex justify-content-center align-items-start flex-column">
                         <div class="text-secondary">
                             현재 <span class="currentMemberCount"></span>명 채팅중(<span class="currentMemberCount"></span>/<span class="memberCount"></span>)
                             <span class="chatTextAnimation1" style="letter-spacing: 5px;"></span>
                         </div>
                         <span class="fw-bold fs-5 currentMemberList"></span>
                     </div>
                     <div class="col-auto d-flex justify-content-center align-items-center">
                         <input type="button" class="btn btn-danger" value="나가기" id="chatQuitBtn">
                     </div>
                 </div>
                 <!-- 상단 라인 -->
                 <div class="row px-3 my-2">
                     <div class="col" style="border-bottom: 1px solid #aaa;"></div>
                 </div>
                 <!-- 채팅본문 -->
                 <div class="row p-3" id="chatContent" style="height:500px; overflow-x: hidden; overflow-y: auto;">
                     <div class="col p-3" id="chatDiv" style="position: relative;">
                         
                         <!-- 신고,차단버튼 -->
                         <div id="userConfigBox" class="my-2 d-none" style="width: 70px;">
                             <ul class="nav justify-content-center align-items-center flex-column" style="font-size: 12px;">
                                 <li class="p-2 rounded-top text-white bg-secondary reportBtn" style="cursor: pointer;">
                                     신고하기
                                 </li>
                                 <li class="p-2 rounded-bottom text-white bg-danger blockBtn" style="cursor: pointer;">
                                     차단하기
                                 </li>
                             </ul>
                         </div>

                         
                         
                         

                         

                         




                     </div>
                 </div>
                 <!-- 채팅입력 -->
                 <form class="row p-3" id="chatInputForm">
                     <div class="col w-100 h-100 rounded py-2" style="border: 1px solid #777;" id="chatInputDiv">
                         <div class="row">
                             <div class="col-auto p-0 ms-3 me-4">
                                 <i class="bi bi-camera" style="font-size: 3em; color: #777; cursor: pointer;" id="chatImgUploadBtn"></i>
                                 <input type="file" id="chatImgUpload" class="d-none">
                             </div>
                             <div class="col d-flex align-items-center">
                                 <div class="col d-flex justify-content-center align-items-center p-0 h-75" style="border-bottom: 1px dashed #dfdfdf;" id="chatInputBottomBorder">
                                     <input type="text" class="form-control border-0 shadow-none h-100 fs-5" id="chatMessageInput" autocomplete="off" spellcheck="false">
                                 </div>
                             </div>
                             <div class="col-auto p-0 me-3">
                                 <button type="submit" class="shadow-none border-0 bg-white">
                                     <i class="bi bi-send" style="font-size: 3em; color: #777; cursor: pointer;" id="chatSendBtn"></i>
                                 </button>
                             </div>
                         </div>
                     </div>
                 </form>
             </div>
             <!-- 채팅 끝 -->

             <!-- 가게리스트 시작 -->
             <div class="col-6 bg-white ps-4">
                 <div class="row">
                     <div class="col" style="position: relative;" id="storeContainer">

                         <!-- 예약 모달 시작 -->
                         <div id="bookModal" class="rounded border px-4 py-2 d-none">
                             <!-- 예약제안 시작 -->
                             <div class="row h-100" id="bookPropose">
                                 <div class="col">

                                     <div class="row my-3">
                                         <div class="col d-flex justify-content-center align-items-center">
                                             <span class="fs-3"><b id="bookModalName"></b>님이 예약을 제안하셨습니다</span>
                                         </div>
                                     </div>
                                     
                                     <div class="row px-3 my-2">
                                         <div class="col py-2 ps-3 rounded text-dark fw-bold fs-4" style="background-color: #d6ffe6;">
                                             	예약시간 : 오늘 
                                             	<span class="bookModalProposeTime"></span>
                                         </div>
                                     </div>
                                     
                                     <div class="row px-3 my-2">
                                         <div class="col py-2 ps-3 rounded text-dark fw-bold fs-4" style="overflow: hidden;background-color: #fff7d6;" >
                                              <span>요청사항 : </span>
                                              <span class="bookModalProposeMsg"></span>
                                              <!-- <span class="chatTextAnimation1 fs-4" style="letter-spacing: 5px;"></span> -->
                                         </div>
                                     </div>

                                     <div class="row m-2 rounded" id="bookModalShowStoreDetailBtn" style="cursor:pointer;">
                                             <div class="col-auto p-0">
                                                 <img class="rounded bookModalBusinessProfile" style="width:120px; height:120px;">
                                             </div>

                                             <div class="col text-start">
     
                                                 <div class="row">
                                                     <div class="col">
                                                         <span class="fs-2 fw-bold bookModalBusinessName"></span>
                                                     </div>
                                                 </div>
     
                                                 <div class="row">
                                                     <div class="col">
                                                         <span class="fs-5">별점 </span>
                                                         <span class="fs-5 bookModalTotalScore"></span>
                                                         <span class="fs-5">  리뷰수 </span>
                                                         <span class="fs-5 bookModalTotalReviewCount"></span>
                                                     </div>
                                                 </div>

                                                 <div class="row">
                                                     <div class="col">
                                                         <span class="fs-5">인당 예약금 : </span>
                                                         <span class="fs-5 bookModalDeposit"></span>
                                                         <span class="fs-5">원</span>
                                                     </div>
                                                 </div>

                                             </div>
                                     </div>

                                     <div class="row mt-2 px-3">
                                         <div class="col border rounded bg-secondary" id="bookMap" style="height: 200px;">
                                             
                                         </div>
                                     </div>

                                     <div class="row px-3 my-2">
                                         <div class="col rounded border text-end p-2" style="background-color: #dfdfdf;">
                                             <div class="row">
                                                 <div class="col-auto ps-4 d-flex align-items-center">
                                                     <i class="bi bi-coin fw-bold" style="font-size: 3em;"></i>
                                                 </div>
                                                 <div class="col pe-4">
                                                     <span class="fs-4 fw-bold text-white" style="
                                                         text-shadow: -1px -1px 0 red,  
                                                         1px -1px 0 red,
                                                         -1px 1px 0 red,
                                                         1px 1px 0 red;">
                                                     차감 포인트 : <span class="bookModalDeposit"></span> 포인트
                                                     </span><br>
                                                     <span class="fs-4 fw-bold text-white" style="
                                                         text-shadow: -1px -1px 0 black,  
                                                         1px -1px 0 black,
                                                         -1px 1px 0 black,
                                                         1px 1px 0 black;">
                                                     보유 포인트 : <span id="bookModalMyPoint"></span> 포인트
                                                     </span>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                     


                                     <div class="row my-3 px-3">
                                         <div class="col">
                                             <input type="button" value="거절" id="bookRejectBtn" class="btn btn-danger btn-lg w-100 fs-3" style="height: 60px;">
                                         </div>
                                         <div class="col">
                                             <input type="button" value="동의" id="bookAgreeBtn" class="btn btn-success btn-lg w-100 fs-3" style="height: 60px;">
                                         </div>
                                     </div>

                                 </div>
                             </div>
                             <!-- 예약제안 끝 -->
                             
                             <!-- 예약 대기 시작  -->
                             <div class="row p-3 d-none" id="bookWait">
                             	<div class="col">
                             		<div class="row">
		                             	<div class="col rounded" id="bookWaitContent">
		                             		<canvas id="canvas"></canvas>
											<div class="waitInfoMessage">
											    <span>
											    	사장님의예약승인을<br>
											    	기다리는 중입니다<br>
											    	<span id="waitTimer">00:00</span>
											    </span>											    
											</div>
											
		                             	</div>
                             		</div>
                             		
                             		<div class="row my-2 p-0">

                             			<div class="col rounded text-secondary d-flex flex-column align-itmes-center justify-content-center" 
                             			style="height : 200px;background-color: #30ffa9;">
                             				<div class="row">
                             					<div class="col text-center text-dark fs-5 fw-bold">
                             						가게정보
                             					</div>
                             				</div>
                             				<div class="row py-1">
                             					<div class="col text-dark mx-3 rounded bg-white">
                             						<div class="row">
                             							<div class="col-auto p-0">
                             								<img class="rounded-start bookModalBusinessProfile" style="width:70px; height:70px;">
                             							</div>
                             							<div class="col d-flex justify-content-center align-items-start flex-column">
                             								<div class="row">
                             									<div class="col">
                             										<span class="fs-4 fw-bold bookModalBusinessName"></span>
                             									</div>
                             								</div>
                             								<div class="row">
                             									<div class="col">
                             										리뷰 <span class="bookModalTotalReviewCount"></span> 별점 <span class="bookModalTotalScore"></span>
                             									</div>
                             								</div>
                             							</div>
                             						</div>
                             					</div>
                             				</div>
                             				<div class="row mx-1 pt-1 bg-white rounded-top">
                             					<div class="col-auto pe-0 text-dark">
                             						가게전화
                             					</div>
                             					<div class="col text-dark fw-bold">
                             						<span class="bookModalPhone"></span>
                             					</div>
                             				</div>
                             				<div class="row mx-1 py-1 bg-white rounded-bottom">
                             					<div class="col-auto pe-0 text-dark">
                             						휴대전화
                             					</div>
                             					<div class="col text-dark fw-bold">
                             						<span class="bookModalMobile"></span>
                             					</div>
                             				</div>
<!--                              				<div class="row py-1">
                             					<div class="col text-center p-0 mx-3">                             						
                             						<input type="button" class="btn btn-success w-100 fs-5" value="지도로 길찾기">
                             					</div>
                             				</div> -->
                             			</div>
                             			
                             			<div class="col rounded ms-1 fw-bold text-secondary" 
                             			style="height : 200px;background-color: #ffd900; font-size: 14px;">
                             				<div class="row mt-3">
                             					<div class="col text-center text-dark fs-5">
                             						예약정보
                             					</div>
                             				</div>
                             				<div class="row mt-1 px-3">
                             					<div class="col bg-white rounded">
		                             				<div class="row pt-1">
		                             					<div class="col-auto d-flex align-items-center py-1 pe-0">
		                             						예약번호                             					
		                             					</div>
		                             					<div class="col text-dark d-flex align-items-center py-1">
		                             						<span class="bookingBookNo" id="bookingWaitBookNo"></span>번
		                             					</div>
		                             				</div>
		                             				<div class="row py-1">
		                             					<div class="col-auto d-flex align-items-center py-1 pe-0">
		                             						예약시간                             					
		                             					</div>
		                             					<div class="col text-dark d-flex align-items-center py-1">
		                             						<span class="bookModalProposeTime"></span>
		                             					</div>
		                             				</div>
		                             				<div class="row pb-1">
		                             					<div class="col-auto d-flex align-items-center py-1 pe-0">
		                             						예약장소                             					
		                             					</div>
		                             					<div class="col text-dark d-flex align-items-center py-1">
		                             						<span class="bookModalBusinessName"></span>
		                             					</div>
		                             				</div>
		                             				<div class="row pb-1">
		                             					<div class="col-auto d-flex align-items-center py-1 pe-0">
		                             						요청사항                             					
		                             					</div>
		                             					<div class="col text-dark d-flex align-items-center">
		                             						<span class="bookModalProposeMsg"></span>
		                             					</div>
		                             				</div>
                             					</div>
                             				</div>
<!--                              				<div class="row py-1">
                             					<div class="col text-center p-0 mx-3">
                             						<input type="button" class="btn btn-primary w-100 fs-5" value="예약멤버 보기">
                             					</div>
                             				</div> -->
                             			</div>
                             			
                             		</div>
                             		
                             		<div class="row p-0">
                             			<div class="col p-0">
                             				<input type="button" class="btn btn-danger w-100 fs-4 py-4" value="취소하기" id="bookWaitCancelBtn">
                             			</div>
                             		</div>
                             		
                             		
                             	</div>
                             </div>
                             <!-- 예약 대기 끝  -->

                             <!-- 예약 성공 시작 -->
                             <div class="row h-100 align-items-center d-none" id="bookSuccess">
                                 <div class="col text-center px-5">
                                     <table class="table">
                                         <tbody>
                                             <tr class="row">
                                                 <td class="col rounded-top pb-3 fs-1">
                                                     예약에 성공했습니다
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col-3 py-3 fs-5">예약번호</td>
                                                 <td class="col py-3 fs-5">
                                                 	<span class="bookingBookNo"></span>
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col-3 py-3 fs-5">예약시간</td>
                                                 <td class="col py-3 fs-5">
                                                 	오늘 <span class="bookModalProposeTime"></span>
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col-3 py-3 fs-5">예약장소</td>
                                                 <td class="col py-3 fs-5">
                                                 <span class="bookModalBusinessName"></span>
                                                     <input type="button" class="btn btn-primary btn-sm p-1 py-0 align-middle"
                                                     value="주소보기"
                                                     id="showStoreAddress"
                                                     data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                     data-bs-custom-class="custom-tooltip"
                                                     data-bs-title="?">
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col-3 py-3 fs-5">예약멤버</td>
                                                 <td class="col py-3 fs-5">
                                                 	<span class="currentMemberList"></span>
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col-3 py-3 fs-5">요청사항</td>
                                                 <td class="col py-3 fs-5">
                                                 	<span class="bookModalProposeMsg"></span>
                                                 </td>
                                             </tr>
                                         </tbody>
                                     </table>
                                     <div class="mb-5">
                                         <input type="button" class="btn btn-success w-100 fs-2" value="확인" 
                                         id="bookCompleteConfirmBtn">
                                     </div>
                                 </div>
                             </div>
                             <!-- 예약 성공 끝 -->

                             <!-- 예약 실패 시작 -->
                             <div class="row h-100 align-items-center d-none" id="bookFail">
                                 <div class="col text-center px-5">
                                     <table class="table">
                                         <tbody>
                                             <tr class="row">
                                                 <td class="col rounded-top pb-3 fs-1">
                                                     예약에 실패했습니다
                                                 </td>
                                             </tr>
                                             <tr class="row">
                                                 <td class="col fs-3" id="bookFailReason">
                                                     
                                                 </td>
                                             </tr>
                                         </tbody>
                                     </table>
                                     <div class="mb-5">
                                         <input type="button" class="btn btn-danger w-100 fs-2" value="확인" 
                                         id="bookFailedConfirmBtn">
                                     </div>
                                 </div>
                             </div>
                             <!-- 예약 실패 끝 -->
                         </div>
                         <!-- 예약 모달 끝 -->

                         <!-- 가게 상세보기 모달 시작 -->
                         <div id="storeDetailModal" class="rounded border p-4 d-none">
                         	
                         	<input type="hidden" id="storeDetailModalBusinessId">
                         	<input type="hidden" id="storeDetailModalXPoint">
                         	<input type="hidden" id="storeDetailModalYPoint">
                         
                             <i class="bi bi-x-lg fs-3" id="storeDetailModalCloseBtn"></i>

                             <div class="row">
                                 <div class="col-auto p-0" id="storeBusinessProfile">
                                     
                                 </div>
                                 <div class="col me-4">

                                     <div class="row mt-3">
                                         <div class="col">
                                             <span class="fs-3 fw-bold storeBusinessNameDiv"></span>
                                         </div>
                                     </div>

                                     <div class="row">
                                         <div class="col">
                                             별점 <span id="storeTotalScore"></span>  리뷰수 <span id="storeTotalReviewCount"></span>
                                         </div>
                                     </div>

                                     <div class="row mt-2">
                                         <div class="col">
                                             <div class="fw-bold fs-5" id="storeDetailModalInfoBtn">
                                                 가게정보 보기
                                                 <div class="row px-2">
                                                     <div class="rounded d-none" id="storeDetailModalInfoDiv"
                                                     style="position: absolute; width: 350px;">
                                                         <table class="table table-hover table-borderless m-0">
                                                             <tbody class="text-white table-success fs-6">
                                                                 <tr class="row">
                                                                     <td class="col-3 text-end">전화번호</td>
                                                                     <td class="col me-1">
                                                                     	<span id="storeInfoPhone">02-1234-1234</span>
                                                                     </td>
                                                                 </tr>
                                                                 <tr class="row">
                                                                     <td class="col-3 text-end">가게주소</td>
                                                                     <td class="col me-1" style="font-size: 14px;">
                                                                     	<span id="storeInfoAddress">서울시 관악구 봉천동 872-65</span>
                                                                     </td>
                                                                 </tr>
                                                                 <tr class="row">
                                                                     <td class="col-3 text-end">오픈시간</td>
                                                                     <td class="col me-1">
                                                                     	<span id="storeInfoOpenTime">오전 11시</span>
                                                                     </td>
                                                                 </tr>
                                                                 <tr class="row">
                                                                     <td class="col-3 text-end">마감시간</td>
                                                                     <td class="col me-1">
                                                                     	<span id="storeInfoCloseTime">오후 10시</span>
                                                                     </td>
                                                                 </tr>
                                                                 <tr class="row">
                                                                     <td class="col-3 text-end">휴식시간</td>
                                                                     <td class="col me-1">
                                                                     	<span id="storeInfoBreakTime">오후 3시 ~ 오후 4시</span>
                                                                     </td>
                                                                 </tr>
                                                             </tbody>
                                                         </table>
                                                     </div>
                                                 </div>

                                             </div>
                                             
                                             
                                         </div>
                                     </div>
                                 </div>
                                 
                             </div>
                             
                             <div class="row mt-3 justify-content-center">
                                 <div class="col" style="border: 1px solid #eee"></div>
                             </div>

                             <div class="row">
                                 <div class="col mb-2" id="storeDetailModalContent" style="overflow-x: hidden; overflow-y: auto; height: 490px;">

                                     <!-- 홈 버튼 컨텐트 시작 -->
                                     <div id="storeDeatilHomeContent" class="h-100">
                                         <!-- 가게 소개가 없을 때 -->
                                         <div class="text-center h-100 d-flex justify-content-center align-items-center" id="storeIntroduction">
                                             
                                         </div>
                                         <!-- 가게 소개가 있을 때 -->
                                     </div>
                                     <!-- 홈 버튼 컨텐트 끝 -->


                                     <!-- 메뉴 버튼 컨텐트 시작 -->
                                     <div id="storeDeatilMenuContent" class="h-100 d-none">
                                         <div id="storeMenuDiv" class="h-100">
                                             <!-- 해당 가게의 메뉴카테고리 반복문 시작 -->

                                             <!-- 해당 가게의 메뉴카테고리 반복문 끝 -->
                                         </div>
                                     </div>
                                     <!-- 메뉴 버튼 컨텐트 끝 -->


                                     <!-- 리뷰 버튼 컨텐트 시작 -->
                                     <div id="storeDeatilReviewContent" class="h-100 d-none">
                                         <!-- 리뷰가 없을 때 -->

                                         <!-- 메뉴가 있을 때 -->
                                     </div>
                                     <!-- 리뷰 버튼 컨텐트 끝 -->


                                     <!-- 예약하기 버튼 컨텐트 시작 -->
                                     <div id="storeDeatilBookContent" class="d-none">
                                         <div class="row mt-4 mb-2 justify-content-center">
                                             <div class="col fs-3 fw-bold">
                                                 예약하기
                                             </div>
                                         </div>
                                         <div class="row my-2 p-0 justify-content-center">
                                             <div class="col px-0 py-3 rounded text-center text-dark fw-bold" style="background-color: #ccc;">
                                                 <span class="m-0 p-0 fs-5 storeBusinessNameDiv">BBQ 봉천점</span>
                                                 의 1인당 예약금<br>
                                                 <span class="fs-1 fw-bold text-white" id="storeDeposit" style="
                                                     text-shadow: -1px -1px 0 #000,  
                                                     1px -1px 0 #000,
                                                     -1px 1px 0 #000,
                                                     1px 1px 0 #000;">
                                                     2,000 포인트
                                                 </span>
                                             </div>
                                         </div>
                                         <div class="row my-2 justify-content-center">
                                             <div class="col p-0">
                                             <span>예약시간을 지정해주세요</span>
                                             <span class="text-danger" style="font-size: 14px;">당일 예약만 가능합니다</span>
                                             <input type="time" class="form-control shadow-none border border-secondary-subtle text-center fs-5" id="proposeTime" style="height:50px;">
                                             </div>
                                         </div>
                                         <div class="row my-2 justify-content-center">
                                             <div class="col p-0">
                                                 <span>요청사항을 작성해 주세요</span>
                                                 <textarea id="proposeMsg" class="form-control shadow-none border border-secondary-subtle" rows="3" style="resize: none;"></textarea>
                                             </div>
                                         </div>
                                         <div class="row my-2 justify-content-center">
                                             <div class="col p-0">
                                                 <input type="button" class="btn btn-danger btn-lg w-100 py-3 text-white" value="채팅방에 제안하기" id="proposeBookBtn">
                                             </div>
                                         </div>
                                     </div>
                                     <!-- 예약하기 버튼 컨텐트 끝 -->


                                 </div>
                             </div>
                             
                             <div class="row p-0" style="height: auto;">
                                 <div class="col p-1 text-center">
                                     <div class="rounded py-3 storeDetailModalBtn" id="storeDetailModalHomeBtn">
                                         홈
                                     </div>
                                 </div>
                                 <div class="col p-1 text-center">
                                     <div class="rounded py-3 storeDetailModalBtn" id="storeDetailModalMenuBtn">
                                         메뉴
                                     </div>
                                 </div>
                                 <div class="col p-1 text-center">
                                     <div class="rounded py-3 storeDetailModalBtn" id="storeDetailModalReviewBtn">
                                         리뷰
                                     </div>
                                 </div>
                                 <div class="col p-1 text-center">
                                     <div class="rounded py-3 storeDetailModalBtn" id="storeDetailModalBookBtn">
                                         예약하기
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <!-- 가게 상세보기 모달 끝 -->

                         <div class="row align-items-end py-3 pe-4">
                             <div class="col d-flex align-items-center">
                                 <form class="row align-items-end ms-3" id="storeSearchForm">
                                     <div class="col-8 d-flex justify-content-center align-items-center p-0 h-75" id="chatStoreSearchDiv">
                                         <input type="text" class="form-control border-0 shadow-none h-100 fs-5" placeholder="가게명/메뉴명" id="chatStoreSearchInput">
                                     </div>
                                     <div class="col-auto" id="chatStoreSearchBtn" style="cursor: pointer;">
                                         <i class="bi bi-search"></i>
                                     </div>
                                 </form>
                             </div>
                             <div class="col-auto p-0 pe-2">
                                 <select class="form-select shadow-none" style="border: 1px solid #aaa; height:40px;" id="chatStoreSortSelect">
                                     <option value="distance">가까운 순</option>
                                     <option value="totalScore">별점 높은 순</option>
                                     <option value="totalReviewCount">리뷰 많은 순</option>
                                 </select>
                             </div>
                         </div>
                         <div class="row p-0" style="height: 670px; overflow-x: hidden; overflow-y: auto;">
                             <div class="col p-0" id="searchTextAppend">
                                 <div class="row p-3 g-3" id="storeRow">

                                     <!-- 가게리스트 반복문 시작 -->

                                     <!-- 가게리스트 반복문 끝 -->

                                 </div>
                             </div>
                         </div>

                         <!-- 신고모달 시작 -->
                         <div id="reportModal" class="rounded bg-white border px-3 py-2 d-none">
                         	 <input type="hidden" id="reportTargetId">
                             <div class="row my-3">
                                 <div class="col px-3">
                                     <span class="fs-3">신고하기</span>
                                 </div>
                                 <div class="col-auto me-2">
                                     <i class="bi bi-x-lg fs-3 reportModalCloseBtn" style="cursor: pointer;"></i>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="col px-3">
                                     <div class="rounded px-2 py-2 text-secondary fs-5 fw-bold" style="background-color:#ffd2d2; border: 1px solid #ccc;">
                                         신고대상 : <span id="reportTargetNick"></span>
                                     </div>
                                 </div>
                             </div>
                             <div class="row my-3">
                                 <div class="col px-3">
                                     <textarea placeholder="신고하실 내용을 적어주세요" id="reportContent" class="form-control p-2 shadow-none border border-secondary-subtle" style="resize: none;" rows="17"></textarea>
                                 </div>
                             </div>
                             <div class="row mt-3">
                                 <div class="col px-3 text-secondary" style="font-size: 14px;">
                                     신고 관련 이미지를 첨부해주시면 더욱 빠른 처리가 가능합니다
                                 </div>
                             </div>
                             <div class="row mb-3">
                                 <div class="col px-3">
                                     <input type="file" class="form-control" id="reportImgFile">
                                 </div>
                             </div>
                             <div class="row my-3">
                                 <div class="col px-3 text-end">
                                     <input type="button" class="btn btn-lg btn-dark reportModalCloseBtn" value="취소하기">
                                     <input type="button" class="btn btn-lg btn-danger reportModalSubmitBtn" value="신고하기">
                                 </div>
                             </div>
                         </div>
                         <!-- 신고모달 끝 -->
                         
                         <!-- 신고완료 모달 시작 -->
                         <div id="reportCompleteModal" class="text-center h-100 d-flex align-items-center justify-content-center d-none">
                             <p class="fs-3">
                                 <span class="text-dark fs-3" style="font-weight: 600;">홍길동</span>님에 대한<br>
                             신고가 완료 되었습니다<br>
                             <input type="button" class="btn btn-dark btn-lg mt-3 reportCompleteModalCloseBtn" value="확인">
                             </p>
                         </div>
                         <!-- 신고완료 모달 끝 -->

                         <!-- 차단모달 시작 -->
                         <div id="blockModal" class="d-none">
                         	<input type="hidden" id="blockTargetId">
                             <div class="row h-100 justify-content-center align-items-center">
                                 <div class="col-auto text-center">
                                     <p class="fs-2">
                                         <span class="text-dark blockTargetNick" style="font-weight: 600;">홍길동</span>님을
                                         <br>차단하시겠습니까?
                                     </p>
                                     <p class="text-dark p-3 rounded" style="background-color: #ffd6d6;">
                                         <i class="bi bi-exclamation-circle-fill"></i>
                                         <span class="blockTargetNick">홍길동</span>님을 차단하게 되면<br>
                                         해당 유저와 더이상 매칭되지 않고<br>
                                         현재 매칭된 채팅방은 종료됩니다
                                     </p>
                                     <input type="button" value="취소하기" class="btn btn-lg btn-dark blockModalCloseBtn">
                                     <input type="button" value="차단하기" class="btn btn-lg btn-danger blockModalSubmitBtn">
                                 </div>
                             </div>
                         </div>
                         <!-- 차단모달 끝 -->

                         <!-- 차단완료 모달 시작 -->
                         <div id="blockCompleteModal" class="text-center h-100 d-flex align-items-center justify-content-center d-none">
                             <p class="fs-3">
                                 <span class="text-dark fs-3 blockTargetNick" style="font-weight: 600;">홍길동</span>님을<br>
                                 차단하였습니다<br>
                                 <input type="button" class="btn btn-dark btn-lg mt-3 blockCompleteModalCloseBtn" value="확인">
                             </p>
                         </div>
                         <!-- 차단완료 모달 끝 -->

                         <div id="chatRoomQuitModal" class="text-center h-100 d-none">
                             <div class="row align-items-center h-100">
                                 <div class="col">
                                     <p class="fs-1">
                                         <i class="bi bi-exclamation-circle-fill"></i>
                                         정말 나가시겠습니까?
                                     </p>
                                     <p class="p-3 w-75 rounded border text-start my-2" style="background-color: #ffd6d6;margin: auto;">
                                         <span><i class="bi bi-exclamation-circle"></i> 예약되지 않은 경우</span><br>
                                         <span class="fs-5 fw-bold">현재 채팅방에 다시 입장하실 수 없습니다</span>
                                     </p>
                                     <p class="p-3 w-75 rounded border text-start my-2" style="background-color: #fff7d6;margin: auto;">
                                         <span><i class="bi bi-exclamation-circle"></i> 예약이 이루어진 경우</span><br>
                                         <span class="fs-5 fw-bold">상단의 메뉴에서 재입장이 가능합니다</span>
                                     </p>
                                     <p class="p-3 w-75 rounded border text-start my-2" style="background-color: #d6ffe6;margin: auto;">
                                         <span><i class="bi bi-exclamation-circle"></i> 완료된 예약정보 확인</span><br>
                                         <span class="fs-5 fw-bold">마이페이지의 예약이력에서 확인 가능합니다</span>
                                     </p>
                                     <p class="w-75 rounded text-start my-4 d-flex" style="margin: auto;height: 60px;">
                                         <input type="button" class="btn btn-dark w-50 h-100 me-1 fs-5" value="취소하기" id="chatQuitCancelBtn">
                                         <input type="button" class="btn btn-danger w-50 h-100 ms-1 fs-5" value="채팅방 나가기" id="chatQuitSubmitBtn">
                                     </p>
                                     
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <!-- 가게리스트 끝 -->

         </div>
     </div>
 </div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script>
	const el = document.getElementById('canvas');
	const ctx = el.getContext('2d');
	const dpr = window.devicePixelRatio || 1;
	const pi = Math.PI;
	const points = 12;
	const radius = 200 * dpr;
	const h = 400 * dpr;
	const w = 600 * dpr;
	const center = {
	x: w / 2 * dpr,
	y: h / 2 * dpr };
	
	const circles = [];
	const rangeMin = 1;
	const rangeMax = 30;
	const showPoints = true;
	
	let mouseY = 0;
	let tick = 0;
	
	const gradient1 = ctx.createLinearGradient(0, 0, w, 0);
	gradient1.addColorStop(0, '#96fbc4');
	gradient1.addColorStop(1, '#f9f586');
	
	const gradient2 = ctx.createLinearGradient(0, 0, w, 0);
	gradient2.addColorStop(0, '#48c6ef');
	gradient2.addColorStop(1, '#6f86d6');
	
	const gradient3 = ctx.createLinearGradient(0, 0, w, 0);
	gradient3.addColorStop(0, '#9795f0');
	gradient3.addColorStop(1, '#9be15d');
	
	const gradient4 = ctx.createLinearGradient(0, 0, w, 0);
	gradient4.addColorStop(0, '#f6d365');
	gradient4.addColorStop(1, '#fda085');
	
	const gradients = [gradient1, gradient2, gradient3, gradient4];
	
	window.addEventListener('mousemove', handleMove, true);
	
	function handleMove(event) {
	mouseY = event.clientY;
	}
	
	ctx.scale(dpr, dpr);
	el.width = w * dpr;
	el.height = h * dpr;
	el.style.width = w + 'px';
	el.style.height = h + 'px';
	
	for (var idx = 0; idx <= gradients.length - 1; idx++) {
	
	let swingpoints = [];
	let radian = 0;
	
	for (var i = 0; i < points; i++) {
	 radian = pi * 2 / points * i;
	 var ptX = center.x + radius * Math.cos(radian);
	 var ptY = center.y + radius * Math.sin(radian);
	
	 swingpoints.push({
	   x: ptX,
	   y: ptY,
	   radian: radian,
	   range: random(rangeMin, rangeMax),
	   phase: 0 });
	}
		circles.push(swingpoints);
	}
	
	function swingCircle() {
	ctx.clearRect(0, 0, w * dpr, h * dpr);
	
	ctx.globalAlpha = 1;
	ctx.globalCompositeOperation = 'screen';
	
	for (let k = 0; k < circles.length; k++) {
	 	let swingpoints = circles[k];
	
	 	for (var i = 0; i < swingpoints.length; i++) {
		   swingpoints[i].phase += random(1, 10) * -0.01;
		
		   let phase = 4 * Math.sin(tick / 65);
	
		   if (mouseY !== 0) {
		     phase = mouseY / 200 + 1;
		   }
	
		   var r = radius + swingpoints[i].range * phase * Math.sin(swingpoints[i].phase) - rangeMax;
		
		   swingpoints[i].radian += pi / 360;
	
		   var ptX = center.x + r * Math.cos(swingpoints[i].radian);
		   var ptY = center.y + r * Math.sin(swingpoints[i].radian);
		
		   if (showPoints === true) {
		     ctx.strokeStyle = '#96fbc4';
		
		     ctx.beginPath();
		     ctx.arc(ptX, ptY, 2 * dpr, 0, pi * 2, true);
		     ctx.closePath();
		     ctx.stroke();
		   }
	
		   swingpoints[i] = {
			     x: ptX,
			     y: ptY,
			     radian: swingpoints[i].radian,
			     range: swingpoints[i].range,
			     phase: swingpoints[i].phase 
			};
		}
		
		 const fill = gradients[k];
		
		 drawCurve(swingpoints, fill);
		
		}
		
		tick++;
		
		requestAnimationFrame(swingCircle);
	}
	
	requestAnimationFrame(swingCircle);
	function drawCurve(pts, fillStyle) {
		ctx.fillStyle = fillStyle;
		ctx.beginPath();
		ctx.moveTo(
		(pts[cycle(-1, points)].x + pts[0].x) / 2,
		(pts[cycle(-1, points)].y + pts[0].y) / 2);
		for (var i = 0; i < pts.length; i++) {
			 ctx.quadraticCurveTo(
			 pts[i].x,
			 pts[i].y,
			 (pts[i].x + pts[cycle(i + 1, points)].x) / 2,
			 (pts[i].y + pts[cycle(i + 1, points)].y) / 2);
		}
		ctx.closePath();
		ctx.fill();
	
	}

	function cycle(num1, num2) {
		return (num1 % num2 + num2) % num2;
	}
	function random(num1, num2) {
		var max = Math.max(num1, num2);
		var min = Math.min(num1, num2);
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}
	/*
	function rotate (x, y, angle) {
	  var radians = (pi / 180) * angle,
	      cos = Math.cos(radians),
	      sin = Math.sin(radians),
	      nx = (cos * (x - center.x)) + (sin * (y - center.y)) + center.x,
	      ny = (cos * (y - center.y)) - (sin * (x - center.x)) + center.y;
	  return { x: nx, y: ny };
	}
	*/
</script>
