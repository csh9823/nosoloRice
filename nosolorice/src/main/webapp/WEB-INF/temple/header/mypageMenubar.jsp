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
    ul {
      list-style: none;
    }
    a{
      text-decoration: none;
      color : #616161;
    }
    a:active {
      color: #C93C3C ;
      
    }
  </style>
<body>
        <div class="col-md-3">
            <ul class="my-3">
                <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">마이페이지</li>
                <li class="my-5 fs-4"><a href="normalUserInfoUpdate?id=${sessionScope.NormalUser.normalId}">내 정보</a></li>
                <li class="my-5 fs-4"><a href="noramlUserBookingList?id=${sessionScope.NormalUser.normalId}">내 예약이력</a></li>
                <li class="my-5 fs-4"><a href="pointList?id=${sessionScope.NormalUser.normalId}">포인트 충전내역</a></li>
                <li class="my-5 fs-4"><a href="userReportList?id=${sessionScope.NormalUser.normalId}">신고내역</a></li>
                <li class="my-5 fs-4"><a href="blockList?id=${sessionScope.NormalUser.normalId}">차단목록</a></li>
				<li class="my-5 fs-4"><a href="normalUsesrSecession?id=${sessionScope.NormalUser.normalId}">탈퇴</a></li>
            </ul>
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

