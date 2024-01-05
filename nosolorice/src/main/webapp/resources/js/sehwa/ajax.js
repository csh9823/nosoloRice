$(function() {
	
	$(document).on("click", "#depositUpdateBtn", function() {
		let id = $("#businessId").val();
		let deposit = $("#deposit").val();
		let intDeposit = deposit.replaceAll(/[^0-9]/g, "");
		
		$.ajax({
			"url" : "storeDepositUpdate.ajax",
			"data" : {
				id : id,
				deposit : intDeposit
			},
			"type" : "post",
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
				let num = resData.deposit
				$("#deposit").val(num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			},
			"error" : function(xhr, status, err) {
				console.log("error : ", status, "-", err);
			}		
		});
	}); 
	
	$(document).on("click", "#storeTimeUpdateBtn", function() {
		let id = $("#businessId").val();
		let openTime = $("#openTime").val();
		let closeTime = $("#closeTime").val();
		let dayOff = $("#dayOff").val();
		let break01 = $("#breakTime01").val();
		let break02 = $("#breakTime02").val();
		let breakTime = break01 + "~" + break02;
		
		$.ajax({
			"url" : "storeTimeUpdate.ajax",
			"data" : {
				id : id,
				openTime : openTime,
				closeTime : closeTime,
				dayOff : dayOff,
				breakTime : breakTime
			},
			"type" : "post",
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
			},
			"error" : function(xhr, status, err) {
				console.log("error : ", status, "-", err);
			}		
		});
	}); 

	$(document).on("click", "#storeIntroductionUpdateBtn", function() {
		let id = $("#businessId").val();
		let introduction = $("#editordata").val();
		
		$.ajax({
			"url" : "storeIntroductionUpdate.ajax", 
			"data" : {
				id : id,
				introduction : introduction
			},
			"type" : "post", 
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
			},
			"error" : function(xhr, status, err) {
				console.log(err);
			}
		});
	});

	$(document).on("click", "#storeSectorUpdateBtn", function() {
		let id = $("#businessId").val();
		let sectors = []; 
		
		$("input[type='checkbox']:checked").each(function() {
			sectors.push($(this).val());
		}); 
		
		$.ajax({
			"url" : "storeSectorUpdateBtn.ajax",
			"data" : {
				id : id,
				sectors : sectors
			},
			"type" : "post", 
			"dataType" : "json",
			"success" : function(resData) {
				console.log(resData);
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", err);
			}
		});
	});
	
	// 신고모달 유효성검사
	$(document).on("click", ".reportSubmit", function(event) {
		event.preventDefault();
		
		let reportContent = $("#reportContent").val().trim();
		let fileInput = $(".fileInput")[0].files[0];
		
		if(reportContent.length <= 0) {
			alert("신고내용을 작성해주세요.");
			return false;
		}
		if(!fileInput) {
			alert("파일을 첨부해주세요.");
			return false;
		}
	
		let formData = new FormData();
		formData.append("reporter", $("#reporter").val());
		formData.append("attacker", $("#attacker").val());
		formData.append("reportContent", $("#reportContent").val());
		formData.append("reportFileInput", fileInput);
		
		$.ajax({
			"url" : "insertReport.ajax",
			"data" : formData,
			"type" : "post",
			"contentType" : false,
			"processData" : false,
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				$("#reporter").val("");
				$("#reportContent").val("");
				$("#fileInput").val("");
				$("#reportModal").modal("hide");
				$("#reportCompleteModal").modal("show");
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", err);
			}
		});
	});
	
	// 차단모달 프로세스
	$(document).on("click", ".blockSubmit", function() {
		$.ajax({
			"url" : "insertBlock.ajax",
			"data" : {
						blocker : $("#blocker").val(),
						attacker : $("#blockAttacker").val()
			},
			"type" : "post",
			"dataType" : "text",
			"success" : function(resData) {
				console.log(resData);
				$("#blockModal").modal("hide");
				$("#blockCompleteModal").modal("show");
			},
			"error" : function(xhr, status, err) {
				console.log("err : ", err);
			}
		});
	
	});
	
    

	
	
	
	

});