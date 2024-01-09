<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <style>
    .darkgray {
      background-color : #2E2E2E !important;
      color : white !important;
    }
    .red {
      background-color : #C93C3C !important;
      color : white !important;
    }
    .text-red {
      color : #C93C3C !important;
    }
  </style>
<body>
      <div class="col-md-3 darkgray" style="min-height:100vh;">
        <div class="row">
          <div class="col">
            <div class="row red p-4" onclick="location.href=''">
              <span class="menu fs-4 fw-bold">영업시작</span>
            </div>
            <div class="menu row p-4" onclick="location.href='businessUserStoreInfo?id=${sessionScope.BusinessUser.businessId}'">
              <span class="fs-4 fw-bold">업체정보</span>
            </div>
            <div class="menu row p-4" onclick="location.href='yesnoList?businessId=${sessionScope.BusinessUser.businessId}'">
              <span class="fs-4 fw-bold">예약관리</span>
            </div>
            <div class="menu row p-4" onclick="location.href=''">
              <span class="fs-4 fw-bold">예약이력</span>
            </div>
            <div class="menu row p-4" onclick="location.href=''">
              <span class="fs-4 fw-bold">리뷰관리</span>
            </div>
            <div class="menu row p-4" onclick="location.href='BusinessMenu'">
              <span class="fs-4 fw-bold">메뉴관리</span>
            </div>
            <div class="menu row p-4" onclick="location.href='businessUserSecession?id=${sessionScope.BusinessUser.businessId}'">
              <span class="fs-4 fw-bold">탈퇴</span>
            </div>
            <div class="row p-4 gy-2">
              <span class="menu" onclick="location.href='noticeBusiness'">공지사항</span><br>
              <span class="menu" onclick="location.href='businessInquiry'">1:1문의</span><br>
              <span class="menu" onclick="location.href='businessUserInfoUpdate?id=${sessionScope.BusinessUser.businessId}'">내 정보 수정</span><br>
              <span class="menu text-red" onclick="location.href='businessUserLogOut'">로그아웃</span><br>
            </div>
          </div>
        </div>
      </div> 
</body>

  <script>
    $(document).on("mouseover", ".menu", function() {
      $(this).css("opacity", "30%").css("cursor","pointer");
      
    });
    $(document).on("mouseleave", ".menu", function() {
      $(this).css("opacity", "100%");
    });
  </script>
</html>

