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
      <div class="col-md-3 border-end" style="height:100vh;">
        <div class="row">
          <div class="col">
            <div class="row my-5">
              <span class="fs-2 fw-bold text-red">마이페이지</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='normalUserInfoUpdate?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">내 정보</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='noramlUserBookingList?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">내 예약이력</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='pointList?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">포인트 충전내역</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='userReportList?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">신고내역</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='location.href='blockList?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">차단목록</span>
            </div>
            <div class="menu row mb-3" onclick="location.href='normalUsesrSecession?id=${sessionScope.NormalUser.normalId}'">
              <span class="fs-5 text-gray">탈퇴</span>
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

