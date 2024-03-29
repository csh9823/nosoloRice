        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById('wrap');

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }

        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    if(data.jibunAddress == "" || data.jibunAddress.length == 0){
                		addr = data.autoJibunAddress;
                	}
                    else {
                    	addr = data.jibunAddress;
                    }
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                let index = addr.lastIndexOf(" ");
				let result = addr.substring(0, index);

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addressValue").textContent = result;

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                $("#searchAddressBtn").css("display", "block");
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '575px',
            animation : true
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';

        $("#searchAddressBtn").on("click", function(){
            $(this).css("display", "none");
            new daum.Postcode({
                oncomplete: function(data) {
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    	if(data.jibunAddress == "" || data.jibunAddress.length == 0){
                    		addr = data.autoJibunAddress;
                    	}
                        else {
                        	addr = data.jibunAddress;
                        }
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
	                let index = addr.lastIndexOf(" ");
					let result = addr.substring(0, index);
                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("addressValue").textContent = result;

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                    $("#searchAddressBtn").css("display", "block");
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                
                width : '100%',
                height : '575px',
                animation : true
            }).embed(element_wrap);
        })