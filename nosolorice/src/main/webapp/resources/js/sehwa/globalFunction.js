// 다음우편번호 API
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 			
 			// 주소 - 좌표 변환
            var geocoder = new daum.maps.services.Geocoder(); // Geocoder 객체 생성
   
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    console.log(result);
                }
            };
            
            geocoder.addressSearch('#address1', callback);

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
             
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postNum').value = data.zonecode;
            document.getElementById("address1").value = addr;
            document.getElementById("address2").value = '';   
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
            
            // 주소를 가져옴
            var address = $("#address1").val();
            
            // 주소를 좌표로 변환하는 Geocoder 객체 생성
            var geocoder = new kakao.maps.services.Geocoder();
            
            // 주소 검색 요청
           	geocoder.addressSearch(address, function(result, status) {
            	if (status === kakao.maps.services.Status.OK) {
		            // 검색 결과에서 좌표값 가져오기
		            var coords = new kakao.maps.LatLng(result[0].y, result[0].x)
            		// hidden 폼에 좌표값 설정
	               $("#xpoint").val(coords.getLat());
	               $("#ypoint").val(coords.getLng())
	            }
	        });
        }
    }).open();
};




$(function() {
  /* 이미지 눌렀을 때 fileInput */
  $(document).on("click", "#clickImg", function() {
    $("#fileInput").trigger("click");
    return false;
  });
  
	// 이미지 미리보기 
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            // e.target.result를 사용하여 이미지를 미리보기로 표시합니다.
	            document.querySelector('.preview').src = e.target.result;
	        };
	        reader.readAsDataURL(input.files[0]);
	    } else {
	        document.querySelector('.preview').src = "";
	    }
	}










});


