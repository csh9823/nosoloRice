<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .darkgray {
            background-color : #2E2E2E !important;
            color : white !important;
        }
        .red {
            background-color : #C93C3C !important;
            color : white !important;
        }
        .text-red {
            color : #C93C3C !important;
        }
        #menumanagementbtn{
            margin-top: 5px;
            margin-left: 180px;
        }
        #modal {
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
        .modal-content {
          background-color: #fefefe;
          margin: 15% auto;
          padding: 20px;
          width: 400px;
          height: 300px;
        }
        #close-modal{
            background-color: white;
            border: none;
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
        #catesubmit{
            padding: 0;
            width: 100px;
            height: 27px;
        }
        #cateselect{
            width: 185px;
            height: 30px;
        }
        #catedelete{
            padding: 0;
            width: 100px;
            height: 27px;
        }

        .btn-upload {
        width: 100px;
        height: 37px;
        background: rgb(25, 135, 84);
        border-radius: 10px;
        font-weight: 500;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        &:hover {
            background: rgb(21,115,71);
            color: #fff;
        }
        }

        #menuimg {
        display: none;
        }
        #menuimgform{
            width: 200px;
            height: 200px;
        }
        #menuInfo {
                resize: none;
        }
        .menuCateNames{
         text-decoration: none;
         color: black;
        }
        .menuCateNames:hover {
			color: red;
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

#menuimgupdate {
  display: none;
}
#menuimgformupdate{
    width: 200px;
    height: 200px;
}
#menuInfo {
        resize: none;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
<%@ include file="../../temple/header/businessMenubar.jsp" %>
        <div class="col-2" style="border: 1px solid black;">
            <div class="row" style="margin-top: 100px; font-size: 30px; margin-left: 10px; margin-bottom: 40px;">
                <div class="col" id="menumanagement">메뉴관리</div>
            </div>
        <c:forEach var="menucate" items="${menuCategory}" >
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                	<a href="BusinessMenu?businessId=${sessionScope.BusinessUser.businessId}&menuCategoryNo=${menucate.menuCategoryNo}" class="menuCateNames">
	                	<div class="col">${menucate.menuCategoryName}</div>
                	</a>
            </div>
        </c:forEach>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col"><button type="button" class="btn btn-danger" id="menucatemanagementbtn">카테고리 관리</button></div>
            </div>
        </div>

        <div class="col-7" style="border: 1px solid black;">
            <div class="row" style="margin-top: 100px; font-size: 30px; margin-left: 10px; margin-bottom: 40px;">
            
            	<c:if test="${menuCategoryNo == null}">
                	<div class="col-4" style="margin-left: 35px">전체 메뉴</div>
            	</c:if>
            	
				<c:if test="${menuCategoryNo != null}">
				    <div class="col-4" style="margin-left: 35px">
				    			${menucatename}
				    <input type="hidden" id="thiscateno" value="${mapNoMenuList[0].menuCategory}">			
				    </div>
				    
				</c:if>
            	
                <div class="col-7"><button type="button" class="btn btn-success" id="menumanagementbtn" style="margin-top: 0px">메뉴등록</button>&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-danger" id="menumdelete">메뉴삭제</button></div>
            </div>

            <div class="row" id="rowimgs">
            
             <!-- 카테고리 있는 리스트 -->
				<c:if test="${not empty mapNoMenuList }">
				
				<c:forEach var="mapNoMenuList" items="${mapNoMenuList}">
				
				<div class="col-4 text-center imgmenucol" style="margin-top: 10px;">
				
				<c:if test="${not empty mapNoMenuList.menuPicture}">
                    <div class="row">
                        <div class="col">
                            <div style="background-image: url(${mapNoMenuList.menuPicture}); width: 200px; height: 200px; background-size : 100% 100%;">
                            </div>
                        </div>
                    </div>
                  </c:if>
                  
				<c:if test="${mapNoMenuList.menuPicture == null}">
                    <div class="row">
                        <div class="col">
                            <div style="background-image: url(https://via.placeholder.com/200); width: 200px; height: 200px; background-size : 100% 100%;">
                            </div>
                        </div>
                    </div>
                  </c:if>
                    <div class="row">
                        <div class="col"> ${mapNoMenuList.menuName}  </div>
                    </div>

                    <div class="row">
                        <div class="col"> ${mapNoMenuList.menuPrice}원 </div>
                    </div>
                    
                    <div class="row">
                    	<button type="button" class="btn btn-success openmodel" style="margin-top: 0px" value="${mapNoMenuList.menuNo}">메뉴수정</button>
                    </div>
                 </div>
                 </c:forEach> 
                 </c:if>
                 
                 <!-- 카테고리 없는 전체 리스트 -->
				<c:if test="${not empty map}">
				    <c:forEach var="menu" items="${map}">
				        <div class="col-4 text-center imgmenucol" style="margin-top: 10px;">
				
				            <c:if test="${not empty menu.menuPicture}">
				                <div class="row">
				                    <div class="col">
				                        <div style="background-image: url(${menu.menuPicture}); width: 200px; height: 200px; background-size : 100% 100%;">
				                        </div>
				                    </div>
				                </div>
				            </c:if>
				
				            <c:if test="${menu.menuPicture == null}">
				                <div class="row">
				                    <div class="col">
				                        <div style="background-image: url(https://via.placeholder.com/200); width: 200px; height: 200px; background-size : 100% 100%;">
				                        </div>
				                    </div>
				                </div>
				            </c:if>
				
				            <div class="row">
				                <div class="col"> ${menu.menuName} </div>
				            </div>
				
				            <div class="row">
				                <div class="col"> ${menu.menuPrice}원 </div>
				            </div>
				            
				            <div class="row">
				            <button type="button" class="btn btn-success openmodel" style="margin-top: 0px" value="${menu.menuNo}">메뉴수정</button>
				            </div>
				        </div>
				    </c:forEach>
			</c:if>
            </div>
        </div>
    </div>
</div>

<div id="modal">
    <div class="modal-content">
        
        <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
            <div class="col"><strong>카테고리 추가</strong></div>
            <div class="col" style="text-align: right;"><button id="close-modal"><i class="bi bi-x-lg"></i></button></div>
        </div>

        <form action="BusinessMenuCateadd" id="cateaddsubmit" method="get">
            <div class="row">
                    <div class="col">
                    <input type="text" name="menuCateName" id="cateadd">
                    <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                    </div>
					
                    <div class="col"><button type="submit" class="btn btn-success" id="catesubmit">추가하기</button></div>
            </div>
        </form>
            
            <div class="row" style="border: solid 0.5px lightgray; width: 385px; margin-top: 60px;">

            </div>

            <div class="row" style="margin-top: 40px; margin-bottom: 10px;">
                <div class="col"><strong>카테고리 삭제</strong></div>
            </div>
			
			<form action="MenuCateDelete" method="get">
            <div class="row">
                <div class="col">
                    <select name="menuCategoryNo" id="cateselect">
		                <c:forEach var="menucate" items="${menuCategory}" >
							<option value="${menucate.menuCategoryNo}">${menucate.menuCategoryName}</option>		                
		                </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-danger" id="catedelete">삭제하기</button>
                    <input type="hidden" name="businessId" value="${sessionScope.BusinessUser.businessId}">
                </div>
            </div>
            </form>
    </div>
</div>

<form action="MenuAdd"  id="menusumbit" method="post">
<div id="modal2">
    <div class="modal2-content">    
        <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
            <div class="col" style="border-right: solid 1px lightgray; height: 350px;">
                <div class="row">
                    <div class="col"><strong style="color: red;">메뉴등록</strong></div>
                </div>

                <div class="row">
                    <div class="col">메뉴사진</div>
                </div>

                <div class="row">
                    <div class="col">
                        <p style="color: red; font-size: 10px; margin: 0px;">업로드를 하지 않을 경우</p>
                        <p style="color: red; font-size: 10px; margin: 0px;">기본 이미지로 등록 됩니다.</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <img src="https://via.placeholder.com/200" alt="" id="menuimgform">
                    </div>
                    <div class="col" style="margin-top: 35px;">
                        <label for="menuimg">
                        	<div class="btn-upload"> 사진 업로드 </div>
                        </label>
                        <input type="file" name="menuimg" id="menuimg" accept="image/*">
                    </div>
                </div>
            </div>   

            <div class="col">
                <div class="row">
                    <div class="col"></div>
                </div>

                <div class="row">
                    <div class="col-4"><strong>카테고리</strong></div>
                    <div class="col-8">
	                    <select name="menuCategoryNo" id="menuCateno" style="width: 100%; height: 100%; font-size: 12px;">
			                <c:forEach var="menucate" items="${menuCategory}" >
								<option value="${menucate.menuCategoryNo}">${menucate.menuCategoryName}</option>		                
			                </c:forEach>
	                    </select>
                    </div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>메뉴명</strong></div>
                    <div class="col-8"><input name="menuName" id="menuName" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>가격</strong></div>
                    <div class="col-8"><input name="menuPrice" id="menuPrice" type="text"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>설명</strong></div>
                    <div class="col-8"><textarea name="menuInfo" id="menuInfomenuInfo" cols="30" rows="10" style="width: 170px; height: 130px; font-size: 12px;"></textarea></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>원산지</strong></div>
                    <div class="col-8"><input name="menuOrigin" id="menuOrigin" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 35px;">
                    <div class="col"><button type="button" class="btn btn-danger" id="close-modal2">취소하기</button></div>
                    <div class="col" style="text-align: right"><button type="submit" class="btn btn-success">등록하기</button></div>
                </div>                     
            </div>
        </div>
    </div>
</div>
</form>
<form action="menuUpdate"  id="menuupdate">
<div id="modal3">
    <div class="modal3-content">    
        <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
            <div class="col" style="border-right: solid 1px lightgray; height: 350px;">
                <div class="row">
                    <div class="col"><strong style="color: red;">메뉴등록</strong></div>
                </div>

                <div class="row">
                    <div class="col">메뉴사진</div>
                </div>

                <div class="row">
                    <div class="col">
                        <p style="color: red; font-size: 10px; margin: 0px;">업로드를 하지 않을 경우</p>
                        <p style="color: red; font-size: 10px; margin: 0px;">기본 이미지로 등록 됩니다.</p>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <img src="https://via.placeholder.com/200" alt="" id="menuimgformupdate">
                    </div>
                    <div class="col" style="margin-top: 35px;">
                        <label for="menuimgupdate">
                        <div class="btn-upload">사진 업로드</div>
                        </label>
                        <input type="file" name="menuPicture" id="menuimgupdate" accept="image/*">
                    </div>
                </div>
            </div>   

            <div class="col">
                <div class="row">
                    <div class="col"></div>
                </div>

                <div class="row">
                    <div class="col-4"><strong>카테고리</strong></div>
                    <div class="col-8">
	                    <select name="menuCategoryNo" id="menuCatenoupdate" style="width: 100%; height: 100%; font-size: 12px;">
			                <c:forEach var="menucate" items="${menuCategory}" >
								<option value="${menucate.menuCategoryNo}">${menucate.menuCategoryName}</option>		                
			                </c:forEach>
	                    </select>
                    </div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>메뉴명</strong></div>
                    <div class="col-8">
                    	<input name="menuName" id="menuNameupdate" type="text" style="width: 100%; height: 100%; font-size: 12px;">
                    </div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>가격</strong></div>
                    <div class="col-8"><input name="menuPrice" id="menuPriceupdate" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>설명</strong></div>
                    <div class="col-8"><textarea name="menuInfoupdate" id="menuInfoupdate" cols="30" rows="10" style="width: 170px; height: 130px; font-size: 12px;"></textarea></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>원산지</strong></div>
                    <div class="col-8"><input name="menuOrigin" id="menuOriginupdate" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                    <input type="hidden" id="menuupdateNo" value="" name="menuNo">
                </div>

                <div class="row" style="margin-top: 35px;">
                    <div class="col"><button type="button" class="btn btn-danger" id="close-modal3">취소하기</button></div>
                    <div class="col" style="text-align: right"><button type="submit" class="btn btn-success">수정하기</button></div>
                </div>           
            </div>
        </div>
    </div>
</div>
</form>          
<script>

$("#menumdelete").dblclick(function(){
    location.reload(true);
})


$("#menumdelete").on("click", function(){
    let value = $("#menumdelete").val();
    let imgmenucol = $(".imgmenucol");
    let thiscateno = $("#thiscateno").val();
    console.log(value);
    console.log(thiscateno);
    $("#rowimgs").empty();
    // ajax 추가 코딩 필요
      $.ajax({
  		"url" : "MenudleteForm.ajax",
		"data" : "menuCategoryNo="+thiscateno,
		"type" : "POST" ,
		"dataType" : "json",
		"success" : function(resData){
			 for(i=0; i<resData.length; i++){
				 console.log(resData[i].menuPicture);
				 
				    $("#rowimgs").append(
				      '<div class="col-4 text-center imgmenucol" style="margin-top: 10px;">'
				            + "<div class='row'>" 
				      		      +'<div class="col">'+
				      		      	(resData[i].menuPicture != null ? '<div style="background-image: url('+resData[i].menuPicture+'); background-size : 100% 100%; width: 200px; height: 200px;">'
				      		      	: '<div style="background-image: url(https://via.placeholder.com/200); background-size : 100% 100%; width: 200px; height: 200px;">')
				                		+ '<button type="button" class="btn btn-danger thisdelete" style="margin-top: 80px;" value='+resData[i].menuNo+'>삭제하기</button>' 
				                		+'</div>'         
				            	+ '</div>'    
				        	 +'</div>'
				             +'<div class="row">'
				             		+'<div class="col">'+resData[i].menuName + '</div>'
				             +'</div>'   
				           +'<div class="row">'
				             		+'<div class="col">'+ resData[i].menuPrice + '</div>'
				           +'</div>'
				         +'</div>'
				        )
			 }
				$(".thisdelete").on("click",function(){

				   	let clickedValue  = $(this).val();
				   	$(this).closest(".imgmenucol").remove();
				      $.ajax
				      ({
				  		"url" : "Menudelete.ajax",
						"data" : "menuNo="+clickedValue,
						"type" : "POST" ,
						"dataType" : "json",
						"success" : function(resData){
						},
				        "error" : function(xhr,statusText,err){
				        }
					  })
				})
			 },
          "error" : function(xhr,statusText,err){
  			console.error("error...");
  		}
// ajax 끝
})
})


const modal = document.getElementById("modal");
const openModalBtn = document.getElementById("menucatemanagementbtn");
const closeModalBtn = document.getElementById("close-modal");

// 모달창 열기
openModalBtn.addEventListener("click", () => {
  modal.style.display = "block"
  document.body.style.overflow = "hidden"; // 스크롤바 제거
  
});

// 모달창 닫기
closeModalBtn.addEventListener("click", () => {
  modal.style.display = "none";
  document.body.style.overflow = "auto"; // 스크롤바 보이기
});

document.addEventListener("DOMContentLoaded", function() {

    let modal = document.getElementById("modal");
    let modalContent = document.querySelector(".modal-content");

    modal.addEventListener("click", function(e) {
        if (!modalContent.contains(e.target)) {
            modal.style.display = "none";
        }
    });

    document.getElementById("close-modal").addEventListener("click", function() {
        modal.style.display = "none";
    });
});

const modal2 = document.getElementById("modal2");
const openModal2Btn = document.getElementById("menumanagementbtn");
const closeModal2Btn = document.getElementById("close-modal2");
    
    // 콘솔 값 찍기
    $("#menuInfo").on("input", function() {
        console.log($("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>')); 
    });

    // 모달창 열기
    openModal2Btn.addEventListener("click", () => {
      modal2.style.display = "block"
      document.body.style.overflow = "hidden"; // 스크롤바 제거
      
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
    
    $("#cateaddsubmit").submit( function(){
        let cateadd = $("#cateadd").val();
    
        if(cateadd.length == 0){
            alert("카테고리를 입력 해주세요");
            return false;
        }
    })


// 파일 폼의 값이 바뀔때 이벤트를 체크해줌
$("#menuimg").on("change", function(event) {

// 현재 바뀐 이벤트의 파일명을 가져옴
let file = event.target.files[0];

let reader = new FileReader(); 
reader.onload = function(e) {
    $("#menuimgform").attr("src", e.target.result);
}
reader.readAsDataURL(file);
});

$("#menusumbit").on("submit", function(){
	
    let menuInfo = $("#menuInfo").val();
    let menuOrigin = $("#menuOrigin").val();
    let menuPrice = $("#menuPrice").val();
    let menuName = $("#menuName").val();
    
    if ($("#menuimg").get(0).files.length != 0) {
        $("#menusumbit").attr("enctype", "multipart/form-data");
    }else {
    	$("#menusumbit").attr("action", "Nofilemenuadd");
    	$("#menuimg").remove();
    }
	
    $("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');

    if(menuInfo.length == 0){
        alert("메뉴 설명을 입력해주세요");
        return false;
    }

    if(menuOrigin.length == 0){
        alert("원산지를 입력해주세요");
        return false;
    }

    if(menuPrice.length == 0){
        alert("메뉴 가격을 입력해주세요");
        return false;
    }

    if(menuName.length == 0){
        alert("메뉴 이름을 입력해주세요");
        return false;
    }


})

$('input[type="text"]').keydown(function() {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
});

// 수정하기
    const modal3 = document.getElementById("modal3");
    const openModalButtons = document.querySelectorAll(".openmodel");
    const closeModal3Btn = document.getElementById("close-modal3");
    
    // 콘솔 값 찍기
    $("#menuInfo").on("input", function() {
        console.log($("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>')); 
    });

    // 모달 열기 
    openModalButtons.forEach((button) => {
        button.addEventListener("click", () => {

            modal3.style.display = "block"
            document.body.style.overflow = "hidden"; // 스크롤바 제거

        });
    });
    
    // 버튼 콘솔 출력
    openModalButtons.forEach((button) => {
        button.addEventListener("click", (event) => {
    		  	let buttonValue = event.target.value;
  	          	console.log(buttonValue);
  	        	// 아이디가 bookingNo인걸 선택
  	        	let hiddenInput = document.getElementById('menuupdateNo');
  				// value를 선택된 버튼의 value로 변환
	        	hiddenInput.value = buttonValue;
	    		let menuInfo = $("#menuInfoupdate");
	    		let menuOrigin = $("#menuOriginupdate");
	    		let menuPrice = $("#menuPriceupdate");
	    		let menuName = $("#menuNameupdate");
	    		let menuImg = document.getElementById("menuimgformupdate");
	    		let menuCategoryDropdown = document.getElementById("menuCatenoupdate");
    		  $.ajax({
    		  		"url" : "getMenu.ajax",
    				"data" : "menuNo="+buttonValue,
    				"type" : "POST" ,
    				"dataType" : "json",
    				"success" : function(resData){
    					console.log(resData.menuInfo);
    					console.log(resData.menuOrigin);
    					console.log(resData.menuPrice);
    					console.log(resData.menuName);
    					menuInfo.val(resData.menuInfo);
    					menuOrigin.val(resData.menuOrigin);
    					menuPrice.val(resData.menuPrice)
    					menuName.val(resData.menuName)
    					if(resData.menuPicture != null){
    						menuImg.src = resData.menuPicture;	
    					}
    					menuCategoryDropdown.value = resData.menuCategoryNo;
    				},
    		          "error" : function(xhr,statusText,err){
    		  			console.error("error...");
    		  		}
    		  })
    	  });

    	});

    // 모달창 닫기
    closeModal3Btn.addEventListener("click", () => {
      modal3.style.display = "none";
      document.body.style.overflow = "auto"; // 스크롤바 보이기
    });
    

    $("#cateaddsubmit").submit( function(){
        let cateadd = $("#cateadd").val();
    
        if(cateadd.length == 0){
            alert("카테고리를 입력 해주세요");
            return false;
        }
    })


// 파일 폼의 값이 바뀔때 이벤트를 체크해줌
$("#menuimgupdate").on("change", function(event) {

// 현재 바뀐 이벤트의 파일명을 가져옴
let file = event.target.files[0];

let reader = new FileReader(); 
reader.onload = function(e) {
    $("#menuimgformupdate").attr("src", e.target.result);
}
reader.readAsDataURL(file);
});

$("#menuupdate").on("submit", function(){
    let menuInfo = $("#menuInfo").val();
    let menuOrigin = $("#menuOrigin").val();
    let menuPrice = $("#menuPrice").val();
    let menuName = $("#menuName").val();
    
    if ($("#menuimgupdate").get(0).files.length != 0) {
        $("#menuupdate").attr("enctype", "multipart/form-data");
    }else {
    	$("#menuupdate").attr("action", "NofilemenuUpdate");
    	$("#menuimgupdate").remove();
    }
    
    $("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');

    if(menuInfo.length == 0){
        alert("메뉴 설명을 입력해주세요");
        return false;
    }

    if(menuOrigin.length == 0){
        alert("원산지를 입력해주세요");
        return false;
    }

    if(menuPrice.length == 0){
        alert("메뉴 가격을 입력해주세요");
        return false;
    }

    if(menuName.length == 0){
        alert("메뉴 이름을 입력해주세요");
        return false;
    }

})
</script>
</body>
</html>