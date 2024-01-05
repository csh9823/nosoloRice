<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <!-- 포트원 결제 -->
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>포인트 리스트</title>
<style>
.payment-radio-btn input[type="radio"] {
  display: none;
}
.payment-radio-btn label {
  width: 100%;
  display: inline-block;
  padding: 16px 16px;
  font-size: 16px;
  color: #3DB78B;
  border: 2px solid #3DB78B;
  cursor: pointer;
}
.payment-radio-btn input[type="radio"]:checked + label {
  background-color: #3DB78B;
  color: white;
  border-color: #3DB78B;
}
.payment-radio-btn {
  display: flex;
}


.amount-radio-btn input[type="radio"] {
  display: none;
}
.amount-radio-btn label {
  width: 100%;
  display: inline-block;
  font-size: 16px;
  color: #3DB78B;
  border: 2px solid #3DB78B;
  cursor: pointer;
}
.amount-radio-btn input[type="radio"]:checked + label {
  background-color: #3DB78B;
  color: white;
  border-color: #3DB78B;
}
.amount-radio-btn {
  display: flex;
}

</style>
</head>
<body>
  <div class="container">
  	<input type="hidden" id="id" value="${sessionScope.NormalUser.normalId}">
    <div class="row">
      <div class="col-10 offset-1">
        <div class="row mb-3">
          <div class="col">
            <h1 class="text-red fw-bold">충전하기</h1>
          </div>
        </div>
        <div class="row">
        	<div class="col">
		        <div class="row mb-5 payment-radio-btn text-center">
		        	<div class="col-4">
		        		<input type="radio" id="신용카드" name="payment" value="danal_tpay.9810030929">
		        		<label for="신용카드">
		        			<img src="resources/img/payment/cheque-guarantee-card-2103506_1280.jpg" class="w-100">
		        		</label>
		        	</div>
		        	<div class="col-4">
		        		<input type="radio" id="카카오페이" name="payment" value="kakaopay.TCSUBSCRIP">
		        		<label for="카카오페이">
		        			<img src="resources/img/payment/kakaopay_og_20201217.jpg" class="w-100">
		        		</label>
		        	</div>
		        	<div class="col-4">
		        		<input type="radio" id="페이코" name="payment" value="payco.AUTOPAY">
		        		<label for="페이코">
		        			<img src="resources/img/payment/payco_com.jpg" class="w-100">
		        		</label>
		        	</div>
		        </div>
		        <div class="row mb-5 border-bottom">
		        </div>
		        <div class="row mb-5 amount-radio-btn text-center">
		        	<div class="col-3">
		        		<input type="radio" id="10000" name="amount" value="10000">
		        		<label for="10000" class="fs-1">10,000</label>
		        	</div>
		        	<div class="col-3">
		        		<input type="radio" id="30000" name="amount" value="30000">
		        		<label for="30000" class="fs-1">30,000</label>
		        	</div>
		        	<div class="col-3">
		        		<input type="radio" id="50000" name="amount" value="50000">
		        		<label for="50000" class="fs-1">50,000</label>
		        	</div>
		        	<div class="col-3">
		        		<input type="radio" id="100000" name="amount" value="100000">
		        		<label for="100000" class="fs-1">100,000</label>
		        	</div>
		        </div>
		        <div class="row mb-3">
		          <div class="col text-center">
		            <button class="green btn btn-lg" onclick="requestPay(3000)">결제하기</button>
		          </div>
		        </div>
        	</div>
        </div>
      </div>
    </div>
  </div>
  <script>
    var IMP = window.IMP;
    IMP.init("imp35220002");

    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function requestPay() {
    	
      let uid_date = new Date();
      let marchantUid = "testId" + uid_date;
      let payment = $("input[name='payment']:checked").val();
      let paymentName = $("input[name='payment']:checked").attr("id");
      let amountPrice = $("input[name='amount']:checked").val();
	
	  if(! payment) {
		  alert("결제수단을 선택해주세요");
		  return false;
		  
	  } else if(! amountPrice) {
		  alert("결제금액을 선택해주세요.");
		  return false;
		  
	  }
      
      IMP.request_pay(
        {
          pg: payment,
          pay_method: "card",
          merchant_uid: marchantUid, // 주문번호
          name: "테스트",
          amount: amountPrice,
          buyer_email: "Iamport@chai.finance",
          buyer_name: "포트원 기술지원팀",
          buyer_tel: "010-1234-5678",
          buyer_addr: "서울특별시 강남구 삼성동",
          buyer_postcode: "123-456",
        },
        function (rsp) {
          // callback
          if(rsp.success) {
          	console.log("success : ", rsp);
          	
          	$.ajax({
          		"url" : "rechargePoint.ajax", 
          		"data" : {
          			id : $("#id").val(),
          			payment : paymentName,
          			amount : amountPrice,
          			point : amountPrice
          		},
          		"type" : "post", 
          		"dataType" : "text", 
          		"success" : function(resData) {
          			console.log("ajax : success", resData);
          			
          		},
          		"error" : function(xhr, status, error) {
          			console.log("ajax : error", xhr, "-", error);
          			
          		}
          		
          	});
          	
          	alert("충전이 완료되었습니다.");
          	
            
          } else {
            console.log("error : ", rsp);
            alert("충전이 취소되었습니다.");
          }
          //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        }
      );
    }
  </script>

 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>