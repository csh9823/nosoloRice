<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<style>
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
    * {
      font-family: 'SUITE Variable', sans-serif;
    }

  .answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out;
  }

</style>
</head>
<body>

  <div class="container">
    
      
  
      <div class="row">
        <div class="col-md-3">
            <ul class="my-3">
                 <li class="my-5 fs-2 fw-bold" style="color:#C93C3C">고객센터</li>
                <li class="my-5 fs-4"><a href="question">자주 묻는 질문</a></li>
                <li class="my-5 fs-4"><a href="userInquiry">1:1 문의</a></li>
                <li class="my-5 fs-4"><a href="userInquiryList">1:1 문의내역</a></li>
                <li class="my-5 fs-4"><a href="noticeNormal">공지사항</a></li>
            </ul>
        </div>
        <div class="col-md-1 d-none d-md-block my-5" style="margin-left: -50px;">
            <div style="border-left: 1px solid #CCC; height: 80vh;"></div>
        </div>
        <div class="col mt-5">
            <div class="mt-3 fs-2 fw-bold" style="color:#C93C3C">자주 묻는 질문</div><br>

            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
              Q. 사업자는 반드시 사업자등록증을 업로드 해야하나요?
              <img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>

            <div class="answer fs-5">
              <hr>
              A. 사업자등록증 업로드는 필수사항 입니다.
            </div>
            <br><br>

            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
              Q. ID가 생각나지 않아요.
              <img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>
            <div class="answer fs-5">
              <hr>
              A. 이름 / 전화번호로 찾기로 혼밥싫어 서비스에 등록하신 닉네임 또는 이름과 인증한 휴대폰 번호를 통해 혼밥싫어 계정을 찾을 수 있습니다.
            </div>
            <br><br>
            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
              Q. 비밀번호가 생각나지 않아요.
              <img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>
              
            <div class="answer fs-5">
              <hr>
              A. 혼밥싫어 계정에 등록된 본인인증 정보로 찾기 혼밥싫어에서 본인인증 정보를 등록한 적이 있다면 인증서와 휴대폰 본인인증을 통해 비밀번호를 재설정하실 수 있습니다.
            </div>
            <br><br>
            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
              Q. 본인 인증이 되지 않아요.
              <img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>

            <div class="answer fs-5">
              <hr>
              Q. 본인인증은, 본인명의의 휴대폰 정보로만 받을 수 있습니다. <br>
              	 다른 사람 명의로 된 휴대폰 번호를 사용하고 있다면 통신사에 실사용자 등록을 해주셔야 합니다. <br>
        
            </div>
            <br><br>
            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
              Q. 충전금액은 환불이 가능할까요?
              <img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>

            <div class="answer fs-5">
              <hr>
              A. 고객님께서 충전하신 금액은 환불이 불가능합니다. <br>
              	이는 우리 서비스에 정책에 따른 것으로, 충전 후에는 해당 금액에 대한 환불이 불가능하오니 이점 양해 부탁드립니다.
            </div>
            <br><br>
            <div class="my-3 fs-5 question" style="cursor: pointer; display: flex; justify-content: space-between;">
           		Q. 개인정보 수정은 어디서 해야하나요?
			<img src="https://cdn.icon-icons.com/icons2/788/PNG/512/down-arrow_icon-icons.com_64915.png" alt="아래화살표" style="width: 20px; height: 20px;">
            </div>

			<div class="answer fs-5">
              <hr>
              A. 로그인 후 마이페이지 메뉴로 이동 후 개인정보 수정 또는 유사한 항목을 클릭하여 수정하고자 하는 정보를 선택합니다.
              	 비밀번호 , 이메일주소 , 주소 등의 개인정보를 수정하실 수 있습니다. 
            </div>
            <br><br>
           


        </div>
    </div> 
  </div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
<script>
  const questions = document.querySelectorAll('.question');
  const answers = document.querySelectorAll('.answer');

  questions.forEach((question, index) => {
    question.addEventListener('click', () => {
      const answer = answers[index];
      if (answer.style.maxHeight) {
        answer.style.maxHeight = null;
      } else {
        answer.style.maxHeight = answer.scrollHeight + 'px';
      }
    });
  });
</script>
</body>
</html>