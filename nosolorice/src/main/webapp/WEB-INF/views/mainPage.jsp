<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    @keyframes bounce {
    0%{
      transform: translateY(0);
    }
    25% {
      transform: translateY(-5px);
    }
    50% {
      transform: translateY(-10px);
    }
    50% {
        transform: translateY(-5px);
    }
    50% {
    transform: translateY(0);
    }
  }

  .matchingTextAnimation span {
    display: inline-block;
    animation: bounce 2s infinite ease-in-out;
    letter-spacing: -0.4em; /* span 간 간격을 조절합니다 */
  }

  .matchingTextAnimation span:nth-child(1),
  .matchingTextAnimation span:nth-child(5) {
    animation-delay: 0.2s;
  }

  .matchingTextAnimation span:nth-child(2) {
    animation-delay: 0.4s;
  }

  .matchingTextAnimation span:nth-child(3) {
    animation-delay: 0.6s;
  }

  .matchingTextAnimation span:nth-child(4) {
    animation-delay: 0.8s;
  }
</style>
<body>
<div class="row">
   <div class="col p-5">
      <!-- 여기서부터 작업시작  -->
         <input type="hidden" id="isIntro" value="${introduce}">
         <!-- 매칭하기 버튼  -->
         <div class="row my-5">
            <div class="col text-center rounded" 
            style="height : 500px; background-image: url('resources/image/mainBanner01.jpg'); background-size: cover;">
               
               <div class="row h-100">
                  <div class="col d-flex align-items-center justify-content-start p-5">
                        <button class="btn btn-danger" style="width: 300px;height: 120px;" id="matchingStartBtn" onclick="location.href='matching'">
                           <div class="matchingTextAnimation">
                                   <span style="font-size:1em;">지</span>
                                   <span style="font-size:1em;">금</span>
                                   <span style="font-size:1em;">바</span>
                                   <span style="font-size:1em;">로</span>
                               </div>
                           <span class="fw-bold" style="font-size:3em;line-height: 1em;">매칭시작</span>
                        </button>
                  </div>
               </div>
               
               
               
               
            </div>
         </div>
         
         <!-- 소개하기 제목  -->
         <div class="row"  style="margin: 10vh 0;" id="introduceTitle">
            <div class="col text-center" >
                  <p class="fw-bold" style="color:#C93C3C; font-size:2.3em;line-height: 3em">
                     혼자 밥먹기 싫을때?
                  </p>
                  <p class="fw-bold" style="color:#C93C3C; font-size:6em;line-height: 0em;">혼밥시러</p>
                  <p class="text-secondary" style="font-size:2em; margin-top: 2em;">더이상 혼자 식사하지마세요<br>혼밥시러가 도와드릴게요!</p>
            </div>
         </div>
         
         <!-- 소개하기 컨텐츠1 -->
         <div class="row my-5 px-5">
            <div class="col" style="padding: 0 5vw;">
            
               <div class="row" style="margin-bottom: 10vh;">
                  <div class="col-auto">
                     <img src="resources/image/mainImg1.jpg">
                  </div>
                  <div class="col d-flex flex-column align-items-start justify-content-center">
                     <div class="row">
                        <div class="col">
                           <p class="fs-3 fw-bold" style="color:#C93C3C">
                              위치기반 매칭기능으로<br>
                              간편하게 이웃과 식사가능!
                           </p>
                        </div>
                     </div>
                     <div class="row ">
                        <div class="col">
                           <p class="fs-4 text-dark fw-bold">이럴 때 이용해 보세요</p>
                           <p class="fs-5" style="color:#555;">
                              근처 맛집에 가고 싶은데 1인분 주문이 안될 때<br>
                              맛있는 걸 먹고 싶은데 혼자 먹기에 양이 너무 많을 때<br>
                              꼭 한번 맛보고 싶은 음식이 있는데 가격이 부담될 때<br>
                              타지에 혼자 여행왔는데 현지 사람과 같이 먹고 싶을 때
                           </p>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- 소개하기 컨텐츠2 -->
               <div class="row" style="margin-bottom: 10vh;">
                  <div class="col d-flex flex-column align-items-start justify-content-center">
                     <div class="row">
                        <div class="col">
                           <p class="fs-3 fw-bold" style="color:#C93C3C">
                              매칭된 이웃과 채팅 앱으로<br>
                              예약장소와 메뉴선택을 해보세요!
                           </p>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col">
                           <p class="fs-4 text-dark fw-bold">이런 기능도 있습니다</p>
                           <p class="fs-5" style="color:#555;">
                              채팅창에 텍스트 입력과 이미지 첨부가 가능해요<br>
                              원하는 가게를 찾아 채팅창 멤버들에게 보여줄 수 있어요<br>
                              가고 싶은 곳이 있다면 채팅창 멤버들에게 예약제안을 할 수 있어요
                           </p>
                        </div>
                     </div>
                  </div>
                  <div class="col-auto">
                     <img src="resources/image/mainImg2.jpg">
                  </div>
               </div>
               
               <!-- 소개하기 컨텐츠3 -->
               <div class="row" style="margin-bottom: 10vh;">
                  <div class="col-auto">
                     <img src="resources/image/mainImg3.jpg">
                  </div>
                  <div class="col d-flex flex-column align-items-start justify-content-center">
                     <div class="row">
                        <div class="col">
                           <p class="fs-3 fw-bold" style="color:#C93C3C">
                              식사가 끝난 뒤<br>
                              후기를 남길 수 있어요!
                           </p>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col">
                           <p class="fs-4 text-dark fw-bold">이렇게 이용해 보세요</p>
                           <p class="fs-5" style="color:#555;">
                              방문하신 가게에 리뷰와 별점을 남길 수 있어요<br>
                              이용하신 음식점과 멤버들을 조회하실 수 있어요<br>
                              매너가 좋지 않은 매칭상대를 신고,차단 할 수 있어요 
                           </p>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
   </div>
</div>
<script>
   $(function(){
       let isIntro = $("#isIntro").val();
       if (isIntro == 'true') {
           let introTitle = $("#introduceTitle");
           $("html, body").scrollTop(introTitle.offset().top);
       }   
   });
</script>
</body>