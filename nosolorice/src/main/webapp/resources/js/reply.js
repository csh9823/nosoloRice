

// DOM이 준비되면
$(function() {
	$("#replyWrite").on("click",function(){
		// 자식요소로 이동 또는 추가하는 것
		
		// 형제 요소의 앞 뒤로 이동
		//$("#replyForm").insertBefore("#replyTitle").removeClass("d-none").css("display","none").slideDown(300);

		// 화면에 보이는 상태인지 체크
		console.log($("#replyForm").css("display"));
		console.log($("#replyForm").is(":visible")) // 지금 폼이 보이고 있냐?? 안보이면 false 보이면 true로 찍힘
		
		 // 현재 폼이 화면에서 보이고 있는 상태 처리
		if($("#replyForm").is(":visible")) {
			
			// 현재 폼잉 보이고 있는 버튼이 아닐때만 동작
			var $prev = $("#replyTitle").prev();
			
			if(! $prev.is("#replyForm")) {
			
				$("#replyForm").slideUp(300);
			}
			
			setTimeout(function(){ // 0.3초간 화면에 보여라
			
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
				
			},300) 		// 0.3초 후에 실행해라
			
		} else {	// 댓글 쓰기 폼이 보이지 않는 상태이면		
			$("#replyForm").removeClass("d-none")
				.css("display", "none").insertBefore("#replyTitle").slideDown(300);			
		}
		
		$("#replyForm").find("form")
			.attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
		$("#replyWriteButton").val("댓글쓰기");
		
	});
	
	// 댓글 쓰기 폼잉 submit 될 때
	$("#replyWriteForm").on("submit",function(){
	
		if($("#replyContent").val().length < 5){
			alert("댓글은 5자 이상이어야 합니다.");
			return false;
		}
		
		let params = $(this).serialize(); // //{no: 23, bbsNo: 200, replyContent: 'ㅇㄴㅁㅇㅁㄴㅇㅁㅇㄴㅁ', replyWriter: '', regDate: 1699842633000} form에 있는 값을 이렇게 넣어줌
		console.log(params);
		
		$.ajax({
			url : "replyWrite.ajax",
			data : params, // 데이터를 params에서 넣어준대로 보냄 자동으로 Reply의 이름과 매칭하여 넣어줌
			type : "post",
			dataType: "json",
			success: function(resData){ // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 메서드
				console.log(resData);
				
				// 기존 화면에서 삭제
				$("#replyList > .col").empty();
				
				// 반복문				
				$.each(resData,function(index,data){
					console.log(this.replyContent,"-",data.replyContent);
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" + ((date.getMonth() + 1  < 10) ? "0" + date.getMonth() + 1 : date.getMonth() +1) + " "
					+((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + " "
					+((date.getHours()<10) ? "0" + date.getHours() : date.getHours()) + " : "
					+((date.getMinutes()<10) ? "0" + date.getMinutes() : date.getMinutes()) + " : "
					+((date.getSeconds()<10) ? "0" + date.getSeconds() : date.getSeconds());
					
					let result =
							'<div class="replyRow row border">'
								+'<div class="col">'
									+'<div class="row p-2 bg-light">'
										+'<div class="col-4">'
										+	'<span>'+ data.replyWriter +'</span>'
										+'</div>'
										+ '<div class="col-8 text-end">'
										+	'<span class="me-3">'+strDate+'</span>'
										+	'<button data-no="'+data.no+'" class="modifyReply btn btn-outline-success btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text">수정</i>'									
										+	'</button>'
										+	'<button data-no="'+data.no+'" class="modifyReply btn btn-outline-warning btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text">삭제</i>'									
										+	'</button>'
										+	'<button class="modifyReply btn btn-outline-danger btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text" onclick="reportReply(\''+data.no+'\');">신고</i>'									
										+	'</button>'
										+'</div>'
									+'</div>'
									+'<div class="row">'
									+	'<div class="col p-3">'
									+		'<pre>' + data.replyContent + '</pre>'
									+	'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
							$("#replyList > .col").append(result);
				});
				// 댓글 쓰기 완료되면 되면 폼을 숨기고 전에 썻던 내용을 지운다.
				$("#replyForm").slideUp(300).add("#replyContent").val("");
			},
			error: function(xhr, status, error){ // ajax 통신시 오류 발생 할 때 호출디는 콜백
				console.log("error : ", status);
			}
		
		})
		
		return false;
	})
	
	// 댓글 수정 폼이 서브밋 될때
	$(document).on("submit","#replyUpdateForm",function(){
	
		if($("#replyContent").val().length < 5){
			alert("댓글은 5자 이상이어야 합니다.");
			return false;
		}
		
		let params = $(this).serialize() + "&no="+$(this).attr("data-no"); // //{no: 23, bbsNo: 200, replyContent: 'ㅇㄴㅁㅇㅁㄴㅇㅁㅇㄴㅁ', replyWriter: '', regDate: 1699842633000} form에 있는 값을 이렇게 넣어줌
		console.log(params);
		
		// 밑에서 화면 삭제하면  #replyList 밑에 폼이 있어서 같이 삭제됨. 따로 빼서 빽업해둠
		let $replyForm = $("#replyForm").slideUp(300);
		
		$.ajax({
			url : "replyUpdateForm.ajax",
			data : params, // 데이터를 params에서 넣어준대로 보냄 자동으로 Reply의 이름과 매칭하여 넣어줌
			type : "post",
			dataType: "json",
			success: function(resData){ // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 메서드
				console.log(resData);
				
				// 기존 화면에서 삭제
				$("#replyList > .col").empty();
				
				// 반복문				
				$.each(resData,function(index,data){
					console.log(this.replyContent,"-",data.replyContent);
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" + ((date.getMonth() + 1  < 10) ? "0" + date.getMonth() + 1 : date.getMonth() +1) + " "
					+((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + " "
					+((date.getHours()<10) ? "0" + date.getHours() : date.getHours()) + " : "
					+((date.getMinutes()<10) ? "0" + date.getMinutes() : date.getMinutes()) + " : "
					+((date.getSeconds()<10) ? "0" + date.getSeconds() : date.getSeconds());
					
					let result =
							'<div class="replyRow row border">'
								+'<div class="col">'
									+'<div class="row p-2 bg-light">'
										+'<div class="col-4">'
										+	'<span>'+ data.replyWriter +'</span>'
										+'</div>'
										+ '<div class="col-8 text-end">'
										+	'<span class="me-3">'+strDate+'</span>'
										+	'<button data-no="'+data.no+'" class="modifyReply btn btn-outline-success btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text">수정</i>'									
										+	'</button>'
										+	'<button data-no="'+data.no+'" class="modifyReply btn btn-outline-warning btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text">삭제</i>'									
										+	'</button>'
										+	'<button class="modifyReply btn btn-outline-danger btn-sm" data-no="'+data.no+'">'
										+		'<i class="bi bi-journal-text" onclick="reportReply(\''+data.no+'\');">신고</i>'									
										+	'</button>'
										+'</div>'
									+'</div>'
									+'<div class="row">'
									+	'<div class="col p-3">'
									+		'<pre>' + data.replyContent + '</pre>'
									+	'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
							$("#replyList > .col").append(result);
				});
				// 댓글 수정하기가 완료되면 되면 폼을 숨기고 전에 썻던 내용을 지운다.
				$("#replyContent").val("");
				// 백업해둔 폼을 다시 넣음
				$replyForm.css("display","none")
				$("#global-content > div.col-10").append($replyForm);
			},
			error: function(xhr, status, error){ // ajax 통신시 오류 발생 할 때 호출디는 콜백
				console.log("error : ", status);
			}
		
		})
		
		return false;
	})
	
	// 댓글 삭제 
	$(document).on("click",".deleteReply",function(){
		
		let datano = $(this).data("no"); // 현재 클릭한곳의 data no값을 가져옴
		let reply = $(this).parent().parent().next().find("pre").text()
		console.log(datano) // 콘솔로 확인
		console.log(reply) // 콘솔로 확인
		$(this).remove(".replyRow ");
		$.ajax({
			url: "deleteReply.ajax",
			type: "post",
			data : {no:datano}, // {파라미터 이름: 벨류, no: $("#no").val()}
			// dataType: "json",
			success: function(resData){
				console.log(resData);
			
				alert("삭제 되었습니다.");
				location.reload(); // 새로 고침
			},
			error: function(xhr,status,err){
				console.log("error : ",status,"-",err)
			}
		});
	
	})
	
	//	$(".modifyReply").click(function(){
	//	$(".modifyReply").on("click",function(){ 
	// 딜리게이션 이벤트 방식 위에 처럼 주면 수정 폼 안에 있는 글을 가져옴 안 그럼 안가져옴 이벤트 위임 방식 딜리게이션 [JS]이벤트 위임(Event Delegation)
	$(document).on("click",".modifyReply",function(){
		
		let $replyRow = $(this).parents(".replyRow") // 리플라이 로우의 모든 자식들 중 this 클릭한 곳을 의미함
				
		console.log($("#replyForm").is(":visible")) // 지금 폼이 보이고 있냐?? 안보이면 false 보이면 true로 찍힘
		
		if($("#replyForm").is(":visible")){ // 현재 폼이 화면에서 보이고 있는 상태 처리
			
			// 현재 폼잉 보이고 있는 버튼이 아닐때만 동작
			if(! $replyRow.next().is("#replyForm")){
				$("#replyForm").slideUp(300);
			}
			
			setTimeout(function(){ // 0.3초간 화면에 보여라
				$("#replyForm").insertAfter($replyRow).slideDown(300);
			},300) 		// 0.3초 후에 실행해라
			
		}else{
			$("#replyForm").insertAfter($replyRow).removeClass("d-none").css("display","none").slideDown(300);
		}
	 	
	 	
	 	let reply = $(this).parent().parent().next().find("pre").text()
	 	console.log(reply);
	 	$("#replyContent").val($.trim(reply));
	 	
		$("#replyForm").find("form").attr({"id": "replyUpdateForm", "data-no": $(this).attr("data-no") });	
		
		$("#replyWriteButton").val("댓글수정");
	})
	
	
	$(".btnCommend").click(function() {
		let com = $(this).attr("id");
		// let obj = JSON.parse({"id": "midas", "num":0})
		// JSON.stringify(obj)
	$.ajax({
		url: "recommend.ajax",
		type: "post",
		data : { recommend: com, no : $("#no").val()}, // {파라미터 이름: 벨류, no: $("#no").val()}
		dataType: "json",
		success: function(resData){
			console.log(resData.recommend, ":" , resData.thank);
			let msg = com == 'commend' ? "추천이" : "땡큐가";
			alert(msg+" 반영 되었습니다.")
			$("#commend > .recommend").text("("+resData.recommend+")");
			$("#thank > .recommend").text("("+resData.thank+")");
		},
		error: function(xhr,status,err){
			console.log("error : ",status,"-",err)
		}
	});
})
	
});

function reportReply (replyNo){
	let result = confirm("이 댓글을 신고 하시겠습니까?")
	if(result){
		alert("신고 기능으로 연결....");
	}
}