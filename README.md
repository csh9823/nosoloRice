<p align="center">
  <img src="https://github.com/csh9823/nosoloRice/assets/141537487/ab3178c8-f78c-4f46-a429-2c9bad2bf415">
</p>

# 혼밥싫어 프로젝트
> 글로벌IT Final Project </br>
> 개발기간 : 2023-11-22 ~ 2024-01-16 </br>
> 팀원 : 최현진, 김대현, 박한선, 심세화, 고영은

## 기획의도
혼밥 먹기 싫은 사람들의 식사메이트 매칭 서비스

## 개발환경
- Windows 10
- Spring Framework 4.2.4.REALESE
- Apache Tomcat 9.0

## 사용언어
- JAVA
- HTML5
- CSS3
- JavaScript
- JQuery
- Bootstrap

## 화면구성
|회원가입|로그인|
|-------|-------|
|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/cf818c46-adfc-45bb-be4b-80ea2aca7532" style="width:500px">|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/1394e06a-b0f5-4b97-a2b5-c886a9ad735f" style="width:500px">|

|메인페이지|매칭 및 채팅|
|-------|-------|
|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/f6d7d9ef-95f1-42fb-851e-0682382ce246" style="width:500px">|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/465bab5e-a89a-4e87-9b37-d737d1a10b9e" style="width:500px">|

|가게정보설정|공지사항|
|-------|-------|
|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/ef1b2381-3fd0-48c3-8e59-f62b627a8d1a" style="width:500px">|<img src="https://github.com/csh9823/nosoloRice/assets/141537487/1d1b4936-2c81-4ace-89b5-fe97c01bcd88" style="width:500px">|

## 설정사항
> 웹소켓설정 </br>
>> IP 변경필요 </br>
>> - resources/js/matching.js
>>> 421번째 줄 </br>
>>> let url = "ws:서버아이피:서버포트/app/matching";
>> - resources/js/chating.js
>>> 233번째줄 </br>
>>> let url = "ws:서버아이피:서버포트/app/chating" + roomId; </br>
>>> 374번째줄 </br>
>>> let url = "ws:서버아이피:서버포트/app/booking" + businessId;
>> - views/BusinessMenu/yesnoList.jsp
>>> 317번째 줄 </br>
>>> let url = "ws:서버아이피:서버포트/app/booking" + loginId;
>> - Server IP와 Server Port 변경 (ws:로 검색하면 편리합니다.)




