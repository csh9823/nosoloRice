<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약리스트</title>
  <style>
    .hover {
      position: relative;
      background: #979797;
      border-radius: .4em;
      padding: 5px;
    }

    .hover:after {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      width: 0;
      height: 0;
      border: 10px solid transparent;
      border-bottom-color: #979797;
      border-top: 0;
      margin-left: -10px;
      margin-top: -10px;
    }
   .reviewCSS {
      display: none;
    }
  </style>

</head>
<body>
  <div class="container">
  <input type="hidden" id="loginId" value="testNormalId">
    <div class="row">
      <div class="col">
        <div class="row mb-3">
          <div class="col">
            <h3 class="text-red">진행중인 예약</h3>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col">
            <table class="table text-center table-borderless">
              <thead class="border-top border-bottom">
                <tr>
                  <th>예약번호</th>
                  <th>가게명</th>
                  <th>참여멤버</th>
                  <th>예약시간</th>
                </tr>
              </thead>
              <tbody> <!-- DB출력 -->
              	<c:if test="${currentBookingNo eq 0}">
              		<tr>
              			<td colspan="4">
              				현재 예약중인 내역이 없습니다.
              			</td>
              		</tr>
              	</c:if>
              	<c:if test="${currentBookingNo ne 0}">
	                <tr>
	                  <td>${currentBookingNo}</td>
	                  <td>${storeInfo.businessName}</td>
	                  <td>
	                  	<c:forEach var="member" items="${memberInfo}" begin="0" end="${memberCount -1}" varStatus="loop">
						    ${member.nickName}${!loop.last ? ", " : ""}
						</c:forEach>
	                  </td>
	                  <td>
	                  	<fmt:formatDate value="${currentBookingDetail.bookingTime}" pattern="yyyy/MM/dd HH:mm" />
	                  </td>
	                </tr>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <h3 class="text-red">지난 예약이력</h3>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col">
            <table class="table text-center table-borderless">
              <thead class="border-top border-bottom">
                <tr>
                  <th>번호</th>
                  <th>가게명</th>
                  <th>리뷰쓰기</th>
                  <th>참여멤버</th>
                  <th>예약시간</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody>
              	<c:if test="${empty bookingList}">
              		<tr>
						<td colspan="6">
							방문하신 내역이 없습니다.
						</td>              		
              		</tr>
              	</c:if>
                <!-- DB 반복 출력 -->
                <c:if test="${not empty bookingList}">
	                <c:forEach var="bookingList" items="${bookingList}" begin="0" end="${size}">
		                <tr class="border-bottom">
		                  <td class="visitantBookingOkNo">${bookingList.no}</td>
		                  <td class="visitantBusinessName">${bookingList.businessUser.businessName}</td>
		                  <td>
		                  	<input type="hidden" class="businessId" value="${bookingList.businessUser.businessId}">
		                  	<input type="hidden" class="bookingNo" value="${bookingList.no}">
		                  	<input type="hidden" class="visitantTime" value="${bookingList.bookingTime}">
		                  	<input type="button" value="${bookingList.reviewStatus ? '리뷰보기' : '리뷰쓰기'}"
		                  			class="${bookingList.reviewStatus ? 'reviewDropDownBtn' : 'reviewModalBtn'} green btn btn-sm" 
		                  			${bookingList.reviewStatus ? '' : 'data-bs-toggle="modal" data-bs-target="#reviewModal"'} data-no="01">
		                  </td>
		                  <td>
		                    <!-- 참여자 반복출력 -->
		                    <c:forEach var="member" items="${bookingList.normalUser}"  varStatus="loop">
			                    <div style="display: inline-block;" class="bookingMember" data-id="${member.normalId}">
			                      <div style="position: relative;">
			                        <span>${member.nickName}${!loop.last ? ", " : "" }</span>
			                      </div>
			                      <div class="hover mt-2" data-hover="${member.normalId}" style="display:none; position: absolute;">
			                        <button style="text-decoration: none; font-size: 14px; color: black; border: none; background-color: #979797;"
			                                data-bs-toggle="modal" data-bs-target="#reportModal" class="reportBtn" 
			                                data-id="${member.normalId}" data-name="${member.nickName}">
			                          	신고
			                        </button><br>
			                        <button style="text-decoration: none; font-size: 14px; border: none; background-color: #979797;" class="blockBtn text-red"
			                                data-bs-toggle="modal" data-bs-target="#blockModal"
			                                data-id="${member.normalId}" data-name="${member.nickName}">
			                         	차단
			                        </button>
			                      </div>
			                    </div>
		                    </c:forEach>
		                  </td>
		                  <td>
		                  	<fmt:formatDate value="${bookingList.bookingTime}" pattern="yyyy/MM/dd HH:mm" />
		                  </td>
		                  <td>
		                    <button style="border: none; background-color: white;">
		                      <span class="bookingBlindBtn" data-no="${bookingList.no}"><i class="bi bi-trash fs-5"></i></span>
		                    </button>
		                  </td>
		                </tr>
		                <tr class="reviewBox reviewCSS border-top border-bottom text-start" data-review="01">
		                  <td colspan="6">
		                    <div class="row mb-3">
		                      <div class="col">
		                        <div class="row">
		                          <div class="col-auto">
		                            <div class="profile-box-50">
		                              <img src="https://via.placeholder.com/150" class="profile-img">
		                            </div>
		                          </div>
		                          <div class="col-auto">
		                           <span class="fw-bold">아이디</span><br>
		                           <span class="text-gray">
		                           	<fmt:formatDate value="${bookingList.review.regDate}" pattern="yyyy/MM/dd HH:mm:ss" />
		                           </span>
		                          </div>
		                        </div>
		                      </div>
		                      <div class="col text-end text-red">
		                        <i class="bi ${bookingList.review.reviewScore >=1 ? 'bi-star-fill' : 'bi-star'}"></i>
		                        <i class="bi ${bookingList.review.reviewScore >=2 ? 'bi-star-fill' : 'bi-star'}"></i>
		                        <i class="bi ${bookingList.review.reviewScore >=3 ? 'bi-star-fill' : 'bi-star'}"></i>
		                        <i class="bi ${bookingList.review.reviewScore >=4 ? 'bi-star-fill' : 'bi-star'}"></i>
		                        <i class="bi ${bookingList.review.reviewScore >=5 ? 'bi-star-fill' : 'bi-star'}"></i>
		                      </div>
		                    </div>
		                    <div class="row">
		                      <div class="col-9">
		                      	<pre>${bookingList.review.reviewContent}</pre>
		                        <img src="resources/upload/${bookingList.review.reviewPicture}" alt="리뷰사진" class="w-100">
		                      </div>
		                        <div class="col-3" style="position: relative;">
			                        <input type="button" value="리뷰삭제" class="reviewDeleteBtn green btn btn-sm" 
			                        		style="position: absolute; right:0; bottom:0;"
			                        		data-no="${bookingList.review.reviewNo}">
		                        </div>
		                    </div>
		                  </td>
		                </tr>
	                </c:forEach>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <!-- 페이지네이션 -->
        <div class="row mb-3">
          <div class="col">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 신고 모달 -->
  <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header pt-5" style="border: none;">
          <span class="fw-bold fs-3">신고하기</span><span class="reportId fs-5"></span>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form name="reportModalForm" id="reportModalForm" enctype="multipart/form-data">
          	<input type="hidden" name="reporter" id="reporter" value="testNormalId">
          	<input type="hidden" name="attacker" id="attacker" class="attacker">
            <div style="border: 1px solid black; border-radius: 5%; padding: 20px; margin-bottom: 10px;">
              <textarea name="reportContent" id="reportContent" rows="10" cols="50" style="border: none;"></textarea><br>
            </div>
            <div class="row mb-3">
	            <div class="col text-start">
	              <input type="file" name="reportFileInput" class="fileInput" style="display: none;">
	              <span class="clickImg"><i class="bi bi-camera fs-4"></i> 사진 올리기</span>
	            </div>
            </div>
            <div class="row">
              <div class="col">
                <button type="button" class="gray btn w-100" data-bs-dismiss="modal" style="font-size: 20px;">취소하기</button>
              </div>
              <div class="col text-end">
                <button type="button" class="reportSubmit red btn w-100" style="font-size: 20px;">신고하기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- 신고완료 모달 -->
  <div class="modal fade" id="reportCompleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">       
        <div class="modal-body">
          <div class="text-end">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="text-center mb-3">
            <span class="fs-3 fw-bold">신고가 접수 되었습니다.</span>
          </div>
        </div>
      </div>
    </div>
  </div>




  <!-- 차단 모달 -->
  <div class="modal fade" id="blockModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header" style="border: none;">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="blockForm" class="modal-body text-center">
        	<input type="hidden" name="blocker" id="blocker" value="testNormalId">
          	<input type="hidden" name="blockAttacker" id="blockAttacker" class="blockAttacker">
          <span class="blockAttackerId fs-3 fw-bold">아이디</span>
          <spans>님을<br>정말 차단하시겠습니까?</span><br>
          <span class="text-red fs-5">차단한 이용자와 더이상 매칭되지 않습니다.</span>    
          <div class="row mt-4">
            <div class="col">
              <button type="button" class="gray btn w-100" data-bs-dismiss="modal" style="font-size: 20px;">취소하기</button>
            </div>
            <div class="col text-end">
              <button type="button" class="blockSubmit red btn w-100" style="font-size: 20px;">신고하기</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

    <!-- 차단완료 모달 -->
    <div class="modal fade" id="blockCompleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">       
          <div class="modal-body">
            <div class="text-end">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="text-center mb-3">
              <span class="fs-3 fw-bold">정상적으로 차단되었습니다.</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  
  <!-- 리뷰쓰기 모달 -->
  <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <form name="reviewModalForm" id="reviewModalForm" class="modal-content"
      			action="insertReview" method="post" enctype="multipart/form-data">
      	<input type="hidden" name="reviewNormalUser" id="reviewNormalUser" class="reviewNormalUser" value="testNormalId">
        <input type="hidden" name="reviewBusinessUser" id="reviewBusinessUser" class="reviewBusinessUser">
        <input type="hidden" name="reviewBookingNo" id="reviewBookingNo" class="reviewBookingNo">
        <input  type="hidden" name="starPoint" class="starPoint">
        <div class="modal-header" style="border: none;">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body text-center">
        	<div>
	          <span class="reviewModalVisitantDate">날짜</span>
	          <span>에 방문하신</span><br>
	          <span class="reviewModalVisitantName fs-3 fw-bold">가게명</span>
	          <span>의 리뷰를 남겨주세요!</span><br>
        	</div>
          <div class="row text-center">
            <span>
              <i class="star1 bi bi-star fs-1"></i>
              <i class="star2 bi bi-star fs-1"></i>
              <i class="star3 bi bi-star fs-1"></i>
              <i class="star4 bi bi-star fs-1"></i>
              <i class="star5 bi bi-star fs-1"></i>
            </span>
          </div> 
          <div class="row" style="border: 1px solid black; border-radius: 5%; padding: 20px; margin-bottom: 10px;">
            <textarea name="reviewContent" id="reviewContent" rows="10" cols="50" style="border: none;"></textarea><br>
          </div>
          <div class="row mt-4">
            <div class="col text-start">
              <input type="file" name="reviewFileInput" class="fileInput" style="display: none;">
              <span class="clickImg"><i class="bi bi-camera fs-4"></i> 사진 올리기</span>
            </div>
            <div class="col text-end">
              <input type="submit" value="작성하기" style="border: none; background-color: white;">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>

  <script>
  	// 사진업로드창
  	$(document).on("click", ".clickImg", function() {
	    $(this).prev(".fileInput").trigger("click");
	    return false;
	 });
  
  	// hover (신고/차단)
    $(document).on("mouseover", ".bookingMember", function() {
      let bookingMember = $(this).data('id');
      $(".hover[data-hover='" + bookingMember + "']").css("display","block");
    });
    $(document).on("mouseleave", ".bookingMember", function() {
      let bookingMember = $(this).data('id');
      $(".hover[data-hover='" + bookingMember + "']").css("display","none");
    });
    
    // 리뷰쓰기 버튼 눌렀을때
    $(document).on("click", ".reviewModalBtn", function() {
    	// 방문날짜 보이기
    	let visitantTime = $(this).parents().find(".visitantTime").val();
    	let date = new Date(visitantTime);
    	let year = date.getFullYear();
    	let month = date.getMonth() + 1;
    	let day = date.getDate();
    	let hour = date.getHours();
    	let minute = date.getMinutes();
    	let format = year + "/" + month + "/" + day + " " + hour + ":" + minute;
    	$(".reviewModalVisitantDate").text(format);
    	// 상호명 보이기
    	let businessName = $(".visitantBusinessName").text();
    	$(".reviewModalVisitantName").text(businessName);
    	// 사업자 아이디 연결하기
    	let businessId = $(this).parents().find(".businessId").val();
    	$(".reviewBusinessUser").val(businessId);
    	// 방문관리번호 연결하기
    	let bookingOkNo = $(this).parents().find(".visitantBookingOkNo").text();
    	$(".reviewBookingNo").val(bookingOkNo);
    });
    
    // 리뷰보기버튼 눌렀을 때
    $(document).on("click", ".reviewDropDownBtn", function() {
      let no = $(this).data('no');
      if($(".reviewBox[data-review='" + no + "']").hasClass("reviewCSS") == true){
        $(".reviewBox[data-review='" + no + "']").removeClass("reviewCSS");
      } else {
        $(".reviewBox[data-review='" + no + "']").addClass("reviewCSS");
      }
    });

    // 신고버튼 눌렀을 때
    $(document).on("click", ".reportBtn", function() {
    	// 신고당하는 사람 닉네임 가져오기
    	let normalNickName = $(this).data("name");
		$(".reportId").text("(" + normalNickName + ")");
		// 신고당하는 사람 아이디 가져오기
		let normalId = $(this).data("id");
		$(".attacker").val(normalId);
    });
    
    // 차단버튼 눌렀을 때
    $(document).on("click", ".blockBtn", function() {
    	// 차단당하는 사람 닉네임 가져오기
    	let normalNickName = $(this).data("name");
		$(".blockAttackerId").text( normalNickName);
		// 차단당하는 사람 아이디 가져오기
		let normalId = $(this).data("id");
		$(".blockAttacker").val(normalId);
    });

    // 목록삭제버튼 눌렀을때
    $(document).on("click", ".bookingBlindBtn", function() {
		let no = $(this).data("no");
		let loginId = $("#loginId").val();
		
		$.ajax({
			"url" : "visitantBlind.ajax",
			"data" : {
				id : loginId,
				no : no
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				location.href="noramlUserBookingList";
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", err);
			}
		});
	});
    
    // 리뷰 삭제버튼 눌렀을 때
    $(document).on("click", ".reviewDeleteBtn", function() {
    	let no = $(this).data("no");
    	location.href="deleteReview?no=" + no;
    });
    
    
    // 별점 hover 처리하기
    let clicked1 = false;
    $(document).on("mouseover", ".star1", function() {
    	$(".star1").removeClass("bi-star").addClass("bi-star-fill").addClass("text-red");
    });
    $(document).on("mouseleave", ".star1", function() {
    	if(! clicked1) {
	    	$(".star1").removeClass("bi-star-fill").removeClass("text-red").addClass("bi-star");
    	}
    });
    $(document).on("click", ".star1", function() {
    	clicked1 = true;
    	clicked2 = clicked3 = clicked4 = clicked5 = false;
    	$(".star1").removeClass("bi-star").addClass("bi-star-fill").addClass("text-red");
    	$(".star2, .star3, .star4, .star5").removeClass("bi-star-fill text-red").addClass("bi-star");
    	$(".starPoint").val("1");
    });
    
    let clicked2 = false;
    $(document).on("mouseover", ".star2", function() {
    	$(".star1, .star2").removeClass("bi-star").addClass("bi-star-fill").addClass("text-red");
    });
    $(document).on("mouseleave", ".star2", function() {
    	if(! clicked2) {
    		$(".star1, .star2").removeClass("bi-star-fill").removeClass("text-red").addClass("bi-star");
    	}
    });
    $(document).on("click", ".star2", function() {
    	clicked1 = clicked2 =  true;
    	clicked3 = clicked4 = clicked5 = false;
    	$(".star1, .star2").removeClass("bi-star").addClass("bi-star-fill").addClass("text-red");
    	$(".star3, .star4, .star5").removeClass("bi-star-fill text-red").addClass("bi-star");
    	$(".starPoint").val("2");
    });    
    
    let clicked3 = false;
    $(document).on("mouseover", ".star3", function() {
        $(".star1, .star2, .star3").removeClass("bi-star").addClass("bi-star-fill text-red");
    });
    $(document).on("mouseleave", ".star3", function() {
        if (!clicked3) {
            $(".star1, .star2, .star3").removeClass("bi-star-fill text-red").addClass("bi-star");
        }
    });
    $(document).on("click", ".star3", function() {
        clicked1 = clicked2 = clicked3 = true;
        clicked4 = clicked5 = false;
        $(".star1, .star2, .star3").removeClass("bi-star").addClass("bi-star-fill text-red");
        $(".star4, .star5").removeClass("bi-star-fill text-red").addClass("bi-star");
        $(".starPoint").val("3");
    });
    
    let clicked4 = false;
    $(document).on("mouseover", ".star4", function() {
        $(".star1, .star2, .star3, .star4").removeClass("bi-star").addClass("bi-star-fill text-red");
    });
    $(document).on("mouseleave", ".star4", function() {
        if (!clicked4) {
            $(".star1, .star2, .star3, .star4").removeClass("bi-star-fill text-red").addClass("bi-star");
        }
    });
    $(document).on("click", ".star4", function() {
        clicked1 = clicked2 = clicked3 = clicked4 = true;
        clicked5 = false;
        $(".star1, .star2, .star3, .star4").removeClass("bi-star").addClass("bi-star-fill text-red");
        $(".star5").removeClass("bi-star-fill text-red").addClass("bi-star");
        $(".starPoint").val("4");
    });
    
    let clicked5 = false;
    $(document).on("mouseover", ".star5", function() {
        $(".star1, .star2, .star3, .star4, .star5").removeClass("bi-star").addClass("bi-star-fill text-red");
    });

    $(document).on("mouseleave", ".star5", function() {
        if (!clicked5) {
            $(".star1, .star2, .star3, .star4, .star5").removeClass("bi-star-fill text-red").addClass("bi-star");
        }
    });

    $(document).on("click", ".star5", function() {
        clicked1 = clicked2 = clicked3 = clicked4 = clicked5 = true;
        $(".star1, .star2, .star3, .star4, .star5").removeClass("bi-star").addClass("bi-star-fill text-red");
        $(".starPoint").val("5");
    });
    
  </script>
</body>
</html>