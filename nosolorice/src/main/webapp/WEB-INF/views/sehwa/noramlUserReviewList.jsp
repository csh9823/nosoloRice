<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
  <style>
    .reviewCSS {
      display: none;
    }
  </style>

</head>
<body>
<div class="container">
    <div class="row">
      <div class="col">
        <div class="row mb-3">
          <div class="col">
            <h3 class="text-red">작성한 리뷰</h3>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col">
            <table class="table text-center table-borderless">
              <thead class="border-top border-bottom">
                <tr>
                  <th>번호</th>
                  <th>가게명</th>
                  <th>리뷰보기</th>
                  <th>참여멤버</th>
                  <th>예약시간</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody class="">
                <!-- DB 반복 출력 -->
                <tr>
                  <td>번호</td>
                  <td>가게명</td>
                  <td>
                    <input type="button" value="리뷰보기" class="reviewBtn green btn btn-sm" data-no="01">
                  </td>
                  <td>참여멤버</td>
                  <td>예약시간</td>
                  <td>
                    <button style="border: none; background-color: white;">
                      <i class="bi bi-trash fs-5"></i>
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
                           <span class="text-gray">날짜</span>
                          </div>
                        </div>
                      </div>
                      <div class="col text-end text-red">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        댓글내용<br>
                        <img src="" alt="리뷰사진">
                      </div>
                    </div>
                  </td>
                </tr>
                <!-- 여기까지 반복 -->
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

  <script>
    $(document).on("click", ".reviewBtn", function() {
      let no = $(this).data('no');
      if($(".reviewBox[data-review='" + no + "']").hasClass("reviewCSS") == true){
        $(".reviewBox[data-review='" + no + "']").removeClass("reviewCSS");
      } else {
        $(".reviewBox[data-review='" + no + "']").addClass("reviewCSS");
      }
    });


  </script>

</body>
</html>