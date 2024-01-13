<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/matching.css" rel="stylesheet">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0a417775ec6a571d18167c6c49816e7&libraries=services"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/matching.js"></script>

</head>
<body>
	<input type="hidden" id="loginId" value="${sessionScope.NormalUser.normalId}">		
	<div id="matchingModalBg"></div>
	  <div class="row mt-5">
		<div class="col d-flex justify-content-center align-items-center">
		

				<div id="step1" class="stepDiv">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger stepIntro">
								같이 식사하실 인원을 선택 해 주세요(필수)
							</p>
						</div>
					</div>
					<div class="row my-2" >
						<div class="col text-center p-5 stepCol">
							<span style="font-size : 4em; word-spacing: -0.2em;" class="text-dark">
								<i class="bi bi-people-fill"></i>
								인원
							</span>
							<br>
							<i class="bi bi-dash" style="font-size : 7em; cursor: pointer;" id="step1Minus"></i>
							<span id="memberCount" style="font-size : 7em;" class="mx-3">2</span>
							<i class="bi bi-plus" style="font-size : 7em; cursor: pointer;" id="step1Plus"></i>
						</div>
					</div>
					<div class="row my-5">
						<div class="col rounded matchingNextBtn d-flex justify-content-center align-items-center fs-1" id="step1NextBtn">
							다음으로
						</div>
					</div>
				</div>

			
				<div id="step2" class="stepDiv d-none">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger stepIntro">
								식사하실 위치를 설정해주세요(필수)
							</p>
						</div>
					</div>
					<div class="row my-2">
						<div class="col d-flex justify-content-center align-items-center text-center stepCol">
							<div class="mx-5 matchingConfigLabel" id="step2MapBtn" style="cursor:pointer;">
								<i class="bi bi-geo" style="font-size:10rem"></i>
								<p>지도로<br>위치설정</p>
							</div>
							<div class="mx-5 matchingConfigLabel" id="step2AddressBtn" style="cursor:pointer;">
								<i class="bi bi-house" style="font-size:10rem"></i>
								<p>주소로<br>위치설정</p>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col rounded matchingPrevBtn d-flex justify-content-center align-items-center fs-1" id="step2PrevBtn">
							이전으로
						</div>
					</div>
				</div>

				<div id="step3_1" class="stepDiv d-none">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger stepIntro">
								<span class="align-middle">
									지정하신 위치 반경
								</span>
								<select name="locationAreaSelect" id="locationAreaSelect" 
								class="form-select w-25 d-inline shadow-none" style="width: 100px !important;">
									<option selected value="1">1KM</option>
									<option value="3">3KM</option>
									<option value="5">5KM</option>
									<option value="10">10KM</option>
								</select>
								<span class="align-middle">
									안에서 매칭을 시작합니다
								</span>
							</p>
						</div>
					</div>
					<div class="row my-2">
						<div class="col map_wrap py-3 stepCol" style="background-color: #deffea;">
							<div id="map" style="width:100%;height:100%;border-radius: 15px;" class="border"></div>
							<div class="custom_zoomin radius_border d-flex justify-content-center align-items-center" onclick="zoomIn()">
								<i class="bi bi-plus"></i>
							</div>
							<div class="custom_zoomout radius_border d-flex justify-content-center align-items-center" onclick="zoomOut()">
								<i class="bi bi-dash"></i>
							</div>
							<div class="custom_search radius_border d-flex justify-content-center align-items-center" id="mapAddressSearchBtn">
								<span>주소검색</span>
							</div>
							<div class="custom_home radius_border d-flex justify-content-center align-items-center" id="mapMyAdressBtn">
								<span>내 주소</span>
							</div>
							<!-- 지도로 선택에서 주소검색 모달 -->
							<div id="mapAddressSearchModal" class="">
								<div id="mapWrap" class="rounded m-0 p-0" style="display:block;margin:5px 0;"></div>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col rounded matchingPrevBtn d-flex justify-content-center align-items-center fs-1 me-2" id="step3_1PrevBtn">
							이전으로
						</div>
						<div class="col rounded matchingNextBtn d-flex justify-content-center align-items-center fs-1 ms-2" id="step3_1NextBtn">
							다음으로
						</div>
					</div>
				</div>
			
				<div id="step3_2" class="stepDiv d-none">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger stepIntro">
								검색하신 주소의 동을 기준으로 매칭을 시작합니다
							</p>
						</div>
					</div>

					<div class="row my-2">
						<div class="col stepCol p-2" id="addressDiv">
							<div class="rounded text-center py-3 mb-1" id="searchAddressBtn">
								<span class="fs-1">다시 검색</span>
							</div>
							<div id="wrap" class="rounded" style="display:block;margin:5px 0;"></div>
							<div id="matchingAddress" class="d-flex justify-content-center align-items-center flex-column fs-2">
								<span class="fs-3 text-secondary my-2">선택하신 주소</span>
								<span id="addressValue"></span>
							</div>
						</div>
					</div>
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="resources/js/addressApi.js"></script>

					<div class="row my-5">
						<div class="col rounded matchingPrevBtn d-flex justify-content-center align-items-center fs-1 me-2" id="step3_2PrevBtn">
							이전으로
						</div>
						<div class="col rounded matchingNextBtn d-flex justify-content-center align-items-center fs-1 ms-2" id="step3_2NextBtn">
							다음으로
						</div>
					</div>
				</div>
					
				<div id="step4" class="stepDiv d-none">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger stepIntro">
								세부사항을 설정해 주세요(선택사항)
							</p>
						</div>
					</div>

					<div class="row my-2">
						<div class="col d-flex justify-content-center">

								<div id="carouselExampleDark" class="carousel carousel-dark slide d-flex justify-content-center p-5">
									<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<div class="carousel-inner d-flex align-items-center">

									<div class="carousel-item active p-5">
										<div class="p-5">
											<p class="fs-3 text-center fw-bold">카테고리 선택(최대 3개 가능)</p>
											<table class="table">
												<tbody class="fs-5">
													<tr class="row">
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory1" value="한식" class="me-1">
															<label for="matchMenuCategory1" class="matchingConfigLabel">한식</label>
														</td>
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory2" value="양식" class="me-1">
															<label for="matchMenuCategory2" class="matchingConfigLabel">양식</label>
														</td>
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory3" value="중식" class="me-1">
															<label for="matchMenuCategory3" class="matchingConfigLabel">중식</label>
														</td>

													</tr>
													<tr class="row">
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory4" value="일식/돈까스" class="me-1">
															<label for="matchMenuCategory4" class="matchingConfigLabel">일식/돈까스</label>
														</td>
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory5" value="치킨" class="me-1">
															<label for="matchMenuCategory5" class="matchingConfigLabel">치킨</label>
														</td>
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory6" value="피자" class="me-1">
															<label for="matchMenuCategory6" class="matchingConfigLabel">피자</label>
														</td>

													</tr>
													<tr class="row">
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory7" value="분식" class="me-1">
															<label for="matchMenuCategory7" class="matchingConfigLabel">분식</label>
														</td>
														<td class="col py-3">
															<input type="checkbox" name="matchMenuCategory" id="matchMenuCategory8" value="족발/보쌈" class="me-1">
															<label for="matchMenuCategory8" class="matchingConfigLabel">족발/보쌈</label>
														</td>
														<td class="col py-3"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="carousel-item">
										<p class="text-center fs-3 fw-bold">같은 성별만 만나고 싶어요</p>
										<div class="text-center">
											<input type="radio" class="form-check-input me-1 align-middle" name="matchGender" value="${sessionScope.NormalUser.gender}" id="matchGender1">
											<label for="matchGender1" class="matchingConfigLabel fs-4 align-middle" style="cursor: pointer;">네</label>
											<input type="radio" checked class="form-check-input me-1 ms-5 align-middle" name="matchGender" value="no" id="matchGender2">
											<label for="matchGender2" class="matchingConfigLabel fs-4 align-middle" style="cursor: pointer;">상관 없어요</label>
										</div>		
									</div>
									
									<div class="carousel-item">
										<p class="text-center fs-3 fw-bold">연령대 선택</p>
										<div class="d-flex justify-content-center">
											<select class="form-select py-3 text-center fs-4 shadow-none" id="matchingAgeSelect" style="width: 50%">
												<option selected value="0">상관없음</option>
												<option value="10">10대</option>
												<option value="20">20대</option>
												<option value="30">30대</option>
												<option value="40">40대</option>
												<option value="50">50대</option>
												<option value="60">60대</option>
											</select>
										</div>
									</div>
									
									</div>
									<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>

							</div>
							<div class="row my-5" id="step4BtnDiv">
								<div class="col">
									<div class="row">
										<div class="col rounded matchingPrevBtn d-flex justify-content-center align-items-center fs-1 me-2" id="step4PrevBtn">
											이전으로
										</div>
										<div class="col rounded matchingNextBtn d-flex justify-content-center align-items-center fs-1 ms-2" id="step4NextBtn">
											설정완료
										</div>
									</div>
								</div>
							</div>
				</div>
				</div>


				<div id="matchingStart" class="stepDiv d-none">
					<div class="row">
						<div class="col text-center">
							<p class="text-danger" id="matchingStartMention">
								버튼을 누르면 매칭을 시작합니다
							</p>
						</div>
					</div>

					<div class="row my-2 stepCol" style="background-color: #3DB78B;">
						<div class="col fs-bold text-center text-white d-flex align-items-center justify-content-center flex-column matchingNextBtn" 
						id="matchingStartBtn" style="cursor:pointer;">
							<span style="font-size:6em;">매칭시작</span>
						</div>
					</div>

					<div class="row my-5">
						<div class="col rounded matchingPrevBtn d-flex justify-content-center align-items-center fs-1 me-2" id="matchingStartCancleBtn">
							이전으로
						</div>
						<div class="col rounded matchingNextBtn d-flex justify-content-center align-items-center fs-1 ms-2" id="firstStepBtn">
							처음으로
						</div>
					</div>
				</div>

				<!-- 매칭설정보기 모달 -->
				<div class="border rounded" id="matchingConfigModal">
					<div class="px-3 fs-3 py-3 m-0 border-bottom" id="matchingConfigModalTitle">
						<div class="row">
							<div class="col text-secondary">매칭설정 보기</div>
							<div class="col-auto text-end">
								<i class="bi bi-x-circle-fill" id="matchingConfigModalCloseBtn" style="cursor: pointer;"></i>
							</div>
						</div>
					</div>
					<table class="table m-0">
						<tbody class="fs-5">
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 text-secondary py-3 align-middle">
									인원
								</td>
								<td class="col text-secondary py-3 align-middle">
									<span class="configCount"></span>명
								</td>
							</tr>
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 text-secondary py-3 align-middle">
									위치설정 방식
								</td>
								<td class="col text-secondary py-3 align-middle">
									<span class="configMethod"></span>로 선택
								</td>
							</tr>
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 align-middle text-secondary py-3">
									위치설정정보
								</td>
								<td class="col text-secondary py-3 align-middle configLocationInfo"></td>
									
								</td>
							</tr>
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 text-secondary py-3 align-middle">
									음식 카테고리
								</td>
								<td class="col text-secondary py-3 align-middle">
									<span class="configCategory"></span>
								</td>
							</tr>
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 text-secondary py-3 align-middle">
									같은 성별만?
								</td>
								<td class="col text-secondary py-3 align-middle">
									<span class="configGender"></span> 
								</td>
							</tr>
							<tr class="matchingConfigModalRow">
								<td class="col-4 ps-3 text-secondary py-3 align-middle">
									연령대
								</td>
								<td class="col text-secondary py-3 align-middle">
									<span class="configAge"></span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="px-3 fs-5 fw-bold py-4 m-0 border-bottom bg-white">
						<div class="row">
							<div class="col text-center text-danger">
								선택하신 정보가 맞으시면 매칭시작 버튼을 눌러주세요
							</div>
						</div>
					</div>
					<div class="text-center text-white rounded-bottom py-4 fs-1" 
					id="matchingConfigModalMatchingBtn" style="cursor: pointer;">
						매칭시작
					</div>
				</div>
			</div>
		</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script src="resources/js/kakaomap.js"></script>
</body>
</html>