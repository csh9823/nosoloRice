// 사업자번호 조회 API
function BusinessNumber() { 
	// 사업자번호 가져오기
	let num = document.getElementById('businessNumber').value;
	
	const data = {
		"b_no" : [ num ]
	};
	
	console.log(data);
	
	// 사업자번호 상태조회
	$.ajax({
	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=d6OJScI6vsUkh5GM98sbnWAjmx9mrtslnWM4OPthMp94kdGGXK7FMjvRzERzRK2nNB3q9FwiepjpwxXjXgjvCA%3D%3D",  // serviceKey 값을 xxxxxx에 입력
	  type: "POST",
	  data: JSON.stringify(data), 
	  dataType: "JSON",
	  contentType: "application/json",
	  accept: "application/json",
	  success: function(result) {
	      alert("확인이 완료되었습니다");
	      console.log(result);
	  },
	  error: function(result) {
	  	  alert("올바르지 않은 사업자번호 입니다. \n 다시 입력해 주세요.");
	      console.log(result.responseText); //responseText의 에러메세지 확인
	  }
	  
	  
});
	  