<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .line-break {
        white-space: pre-line; /* or pre-wrap */
    }
    .revdelete{
    	background-color: rgb(201,60,60);
    	border-radius: 3px;
    	 border: none;
    }
    .revdelete:hover{
    	color: white;
    }
    
    .revblind{
    background-color: rgb(250,152,132); 
    border-radius: 3px; 
    border: none;
    margin-right: 3px;
    }
    
    .revblind:hover{
    	color: white;
    }
    
    .revupdate{
    background-color: rgb(250,152,132); 
    border-radius: 3px; 
    border: none;
    }
    
	.revupdate:hover{
		color: white;
	}
    
    .revupdate2{
	    background-color: rgb(250,152,132); 
	    border-radius: 3px; 
	    border: none;
    }
    .revupdate2:hover{
		color: white;
    }
    .rev2delete{
    	margin-left: 20px; 
    	background-color: rgb(201,60,60); 
    	border-radius: 3px; 
    	border: none;
    }
    
    .rev2delete:hover{
    	color: white;
    }
            #modal2 {
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            display: none;
        }
        .modal2-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            width: 600px;
            height: 400px;
        }
            #modal3 {
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            display: none;
        }
        .modal3-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            width: 600px;
            height: 400px;
        }
        a {
        	text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
<div class="row">
	<%@ include file="../../temple/header/businessMenubar.jsp" %>
        <div class="col p-5" style="height:100vh; overflow: auto;">
            <div class="row mt-3">
                <div class="col-2 fs-2"><span style="color: rgb(201,60,60);"><strong>리뷰(${reviewCount})</strong></span></div>
            </div>
            
            <c:forEach var="rev" items="${review}">
            <fmt:formatDate value="${rev.reviewRegdate}" pattern="YYYY/MM/dd HH:mm" var="bookingTime" />
             <c:if test="${rev.reviewBlind eq '1'}">
            
             </c:if>
             	
        	<c:if test="${rev.reviewBlind ne '1'}">
            <div class="row mt-3">
                <div class="col">
                    <div class="row">
                        <div class="col-auto pe-0 d-flex align-items-center justify-content-center">
                        	<img src="resources/upload/${rev.normalProfile}" class="rounded-circle" style="width: 50px; height: 50px;">
                        </div>
                        <div class="col-6">
                        	<div class="row">
                        		<div class="col fs-4 fw-bold">
		                        	${rev.normalNickname}                        		
                        		</div>
                        	</div>
                        	<div class="row">
                        		<div class="col">
		                        	${bookingTime}
                        		</div>
                        	</div>
                        </div>
                    </div>
                </div>

                <div class="col-auto fs-4 d-flex align-items-center">
					<i class="bi ${rev.reviewScore >=1 ? 'bi-star-fill' : 'bi-star'}"></i>
					<i class="bi ${rev.reviewScore >=2 ? 'bi-star-fill' : 'bi-star'}"></i>
					<i class="bi ${rev.reviewScore >=3 ? 'bi-star-fill' : 'bi-star'}"></i>
					<i class="bi ${rev.reviewScore >=4 ? 'bi-star-fill' : 'bi-star'}"></i>
					<i class="bi ${rev.reviewScore >=5 ? 'bi-star-fill' : 'bi-star'}"></i>
                </div>

			    <div class="col-auto text-end d-flex align-items-center">
		    		<a href="Businessriviewblind?revireNo=${rev.revireNo}">
                  		<button class="revblind px-3 py-2 me-2">블라인드</button>
                  	</a>
			    	<c:if test="${rev.revieWdelet eq '1'}">
			        	<button class="revdelete px-3 py-2">요청중</button>
					</c:if>
			    
					<c:if test="${rev.revieWdelet ne '1'}">
				        <a href="Businessriviewdelete?revireNo=${rev.revireNo}">
				        	<button class="revdelete px-3 py-2">삭제요청</button>
				        </a>
					</c:if>
			    </div>   
            </div>

            <div class="row py-3">
                <div class="col">
                            ${rev.reviewContent}
                </div>
            </div>
            
            <div class="row">
                    <div class="col">
	        			<c:if test="${rev.reviewPicture != null}">
	                    	<img src="resources/upload/${rev.reviewPicture}" style="max-width: 100%;">
	                    </c:if>
                    </div>
            </div>
            
            <div class="row my-2">
                    <c:if test="${rev.ownerComment != null}">
                    <div class="col text-end">
                        <button class="revupdate2 px-3 py-2" value="${rev.revireNo}.${rev.ownerComment}">답글수정</button>
                        <a href="OwnerCommentdelete?reviewNo=${rev.revireNo}"><button class="rev2delete px-3 py-2">답글삭제</button></a>
                    </div>
                    </c:if>
                    
                    <c:if test="${rev.ownerComment == null}">
					<div class="col text-end">
                    	<button class="revupdate px-3 py-2" value="${rev.revireNo}.${rev.normalId}">답글달기</button>
                    </div>
                    </c:if>
            </div>
            <!--  -->
			<!--  -->
            
			<c:if test="${rev.ownerComment != null}">
	            <div class="row">
	                <div class="col me-3 p-3 rounded border" style="padding: 0px; margin-left: 11px;">
	                	<span class="fw-bold fs-5">답글 내용 </span><br>
	                	<span class="line-break">${rev.ownerComment}</span>
	                </div>
	            </div>
			</c:if>
            </c:if>
            
		</c:forEach>
        </div>
</div>
</div>

<div id="modal2">
        <div class="modal2-content">
            <div class="row">
                <div class="col" style="font-size: 20px; margin-left: 28px;margin-bottom: 10px;"> <strong>사장님 답글을 달아주세요~</strong></div>
            </div>

            <div class="row">
                <div class="col">
                    <form action="Businessreviewadd" method="get">
                    
                        <textarea cols="30" rows="10" style="resize: none; width: 500px; height: 250px; margin-left: 30px;" id="reason" name="businessComment"></textarea> <br>
                        
                        <input type="hidden" name="reviewNo" value="" id="reviewNo">
                        <input type="hidden" name="normalId" value="" id="normalId">
                        <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                        <button type="submit" class="btn btn-success" style="margin-top: 15px; margin-left: 345px;">답글달기</button>
                        <button type="button" class="btn btn-danger" id="close-modal2" style="width: 90px; margin-top: 15px;">취소</button>
                    </form>
                </div>
            </div>

        </div>
</div>

<div id="modal3">
        <div class="modal3-content">
            <div class="row">
                <div class="col" style="font-size: 20px; margin-left: 28px;margin-bottom: 10px;"> <strong>답글을 달아 주세요</strong></div>
            </div>

            <div class="row">
                <div class="col">
                    <form action="OwnerCommentupdate" method="get">
                        <textarea cols="30" rows="10" style="resize: none; width: 500px; height: 250px; margin-left: 30px;" id="reason2" name="businessComment2"></textarea> <br>
                        <input type="hidden" name="reviewNo" value="" id="reviewNo2">
                        <button type="submit" class="btn btn-success" style="margin-top: 15px; margin-left: 345px;">수정하기</button>
                        <button type="button" class="btn btn-danger" id="close-modal3" style="width: 90px; margin-top: 15px;">취소</button>
                    </form>
                </div>
            </div>

        </div>
</div>
  <script>
  // 수정 모달
    // 콘솔 값 찍기
    $("#reason2").on("input", function() {
        console.log($("textarea[name=businessComment2]").val().replace(/(?:\r\n|\r|\n)/g, '<br>')); 
    });
  
$("textarea[name=businessComment2]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
  const modal3 = document.getElementById("modal3");
  
  const openModal3Btns = document.querySelectorAll(".revupdate2");
  
  const closeModal3Btn = document.getElementById("close-modal3");
  // 모달창 열기
	openModal3Btns.forEach((openModal3Btn) => {
		openModal3Btn.addEventListener("click", () => {
	    if (modal2) {
	      modal3.style.display = "block";
	      document.body.style.overflow = "hidden"; // remove scrollbar
	    }
	  });
	});

// 모달창 닫기
closeModal3Btn.addEventListener("click", () => {
  modal3.style.display = "none";
  document.body.style.overflow = "auto"; // 스크롤바 보이기
});

document.addEventListener("DOMContentLoaded", function() {

let modal3 = document.getElementById("modal3");
let modal3Content = document.querySelector(".modal3-content");

modal3.addEventListener("click", function(e) {
    if (!modal3Content.contains(e.target)) {
    	modal3.style.display = "none";
    }
});
});

openModal3Btns.forEach((openModal3Btn) => {
	openModal3Btn.addEventListener("click", (event) => {
		  let buttonValue = event.target.value;
		  let numericPart = buttonValue.split('.')[0];
		  let StringicPart = buttonValue.split('.')[1];
	        // 콘솔에 출력
	        console.log(numericPart);
	      	console.log(StringicPart);
	        // 아이디가 bookingNo인걸 선택
	        let reviewNo = document.getElementById('reviewNo2');
	      	reviewNo.value = numericPart;
	        
	        let normalId = document.getElementById('reason2');
	      	normalId.value = StringicPart;
	  });
	});
	


  // 등록 모달
  const modal2 = document.getElementById("modal2");
  
  const openModal2Btns = document.querySelectorAll(".revupdate");
  
  const closeModal2Btn = document.getElementById("close-modal2");

  // 모달창 열기
	openModal2Btns.forEach((openModal2Btn) => {
	  openModal2Btn.addEventListener("click", () => {
	    if (modal2) {
	      modal2.style.display = "block";
	      document.body.style.overflow = "hidden"; // remove scrollbar
	    }
	  });
	});
  
  // 모달창 닫기
  closeModal2Btn.addEventListener("click", () => {
    modal2.style.display = "none";
    document.body.style.overflow = "auto"; // 스크롤바 보이기
  });

  document.addEventListener("DOMContentLoaded", function() {
  
  let modal2 = document.getElementById("modal2");
  let modal2Content = document.querySelector(".modal2-content");

  modal2.addEventListener("click", function(e) {
      if (!modal2Content.contains(e.target)) {
          modal2.style.display = "none";
      }
  });
});
   
  
  
  $(document).on("mouseover", ".menu", function() {
      $(this).css("opacity", "30%");
    });
    
    $(document).on("mouseleave", ".menu", function() {
      $(this).css("opacity", "100%");
    });
    
    openModal2Btns.forEach((openModal2Btn) => {
  	  openModal2Btn.addEventListener("click", (event) => {
  		  let buttonValue = event.target.value;
		  let numericPart = buttonValue.split('.')[0];
		  let StringicPart = buttonValue.split('.')[1];
  	        // 콘솔에 출력
  	        console.log(numericPart);
  	      	console.log(StringicPart);
  	        // 아이디가 bookingNo인걸 선택
  	        let reviewNo = document.getElementById('reviewNo');
  	        
  	      	reviewNo.value = numericPart;
  	        
  	        let normalId = document.getElementById('normalId');
  	      	normalId.value = StringicPart;
  	  });
  	});
    
  $("textarea[name=businessComment]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
  </script>
</body>
</html>