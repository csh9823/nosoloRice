<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="ko">
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
</style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3 darkgray" style="height: 100hv;">
            <div class="row">
                <div class="col">
                    <div class="row red p-4" onclick="location.href=''">
                        <span class="menu fs-4 fw-bold">ìììì</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">ìì²´ì ë³´</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">ìì½ê´ë¦¬</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">ìì½ì´ë ¥</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">ë¦¬ë·°ê´ë¦¬</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">ë©ë´ê´ë¦¬</span>
                    </div>
                    <div class="menu row p-4" onclick="location.href=''">
                        <span class="fs-4 fw-bold">íí´</span>
                    </div>
                    <div class="row p-4 gy-2">
                        <span onclick="location.href=''">ê³µì§ì¬í­</span><br>
                        <span onclick="location.href=''">1:1ë¬¸ì</span><br>
                        <span onclick="location.href=''">ë´ ì ë³´ ìì </span><br>
                        <span onclick="location.href=''" class="text-red">ë¡ê·¸ìì</span><br>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-2" style="border: 1px solid black;">
            <div class="row" style="margin-top: 100px; font-size: 30px; margin-left: 10px; margin-bottom: 40px;">
                <div class="col" id="menumanagement">ë©ë´ê´ë¦¬</div>
            </div>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col">íë¼ì´ë ì¹í¨</div>
            </div>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col">íë¼ì´ë ì¹í¨</div>
            </div>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col">íë¼ì´ë ì¹í¨</div>
            </div>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col">íë¼ì´ë ì¹í¨</div>
            </div>
            <div class="row" style="margin-bottom: 20px; font-size: 20px; margin-left: 10px;">
                <div class="col"><button type="button" class="btn btn-danger" id="menucatemanagementbtn">ì¹´íê³ ë¦¬ ê´ë¦¬</button></div>
            </div>
        </div>

        <div class="col-7" style="border: 1px solid black;">
            <div class="row" style="margin-top: 100px; font-size: 30px; margin-left: 10px; margin-bottom: 40px;">
                <div class="col-4">íë¼ì´ë ì¹í¨</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="col-7"><button type="button" class="btn btn-success" id="menumanagementbtn">ë©ë´ë±ë¡</button>&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-danger" id="menumdelete" value="10">ë©ë´ì­ì </button></div>
            </div>

            <div class="row">
                <div class="col-4 text-center imgmenucol" style="margin-top: 10px;">

                    <div class="row">
                        <div class="col">
                            <div style="background-image: url(https://via.placeholder.com/200); width: 200px; height: 200px;">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col"> í©ê¸ ì¬ë¦¬ë¸ </div>
                    </div>

                    <div class="row">
                        <div class="col"> 20000ì </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modal">
    <div class="modal-content">
        
        <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
            <div class="col"><strong>ì¹´íê³ ë¦¬ ì¶ê°</strong></div>
            <div class="col" style="text-align: right;"><button id="close-modal"><i class="bi bi-x-lg"></i></button></div>
        </div>

        <form action="#" id="cateaddsubmit">
            <div class="row">
                    <div class="col"><input type="text" name="" id="cateadd"></div>
                    <div class="col"><button type="submit" class="btn btn-success" id="catesubmit">ì¶ê°íê¸°</button></div>
            </div>
        </form>
            
            <div class="row" style="border: solid 0.5px lightgray; width: 385px; margin-top: 60px;">

            </div>

            <div class="row" style="margin-top: 40px; margin-bottom: 10px;">
                <div class="col"><strong>ì¹´íê³ ë¦¬ ì­ì </strong></div>
            </div>

            <div class="row">
                <div class="col">
                    <select name="" id="cateselect">
                        <option>ë­ìë§</option>
                    </select>
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-danger" id="catedelete">ì­ì íê¸°</button>
                </div>
            </div>
    </div>
</div>


<div id="modal2">
    <div class="modal2-content">    
        <div class="row" style="margin-bottom: 10px; margin-top: 10px;">
            <div class="col" style="border-right: solid 1px lightgray; height: 350px;">
                <div class="row">
                    <div class="col"><strong style="color: red;">ë©ë´ë±ë¡</strong></div>
                </div>

                <div class="row">
                    <div class="col">ë©ë´ì¬ì§</div>
                </div>

                <div class="row">
                    <div class="col">
                        <p style="color: red; font-size: 10px; margin: 0px;">ìë¡ëë¥¼ íì§ ìì ê²½ì°</p>
                        <p style="color: red; font-size: 10px; margin: 0px;">ê¸°ë³¸ ì´ë¯¸ì§ë¡ ë±ë¡ ë©ëë¤.</p>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <img src="https://via.placeholder.com/200" alt="" id="menuimgform">
                    </div>
        <form action="##"  id="menusumbit">
                    <div class="col" style="margin-top: 35px;">
                        <label for="menuimg">
                        <div class="btn-upload">ì¬ì§ ìë¡ë</div>
                        </label>
                        <input type="file" name="menuPicture" id="menuimg" accept="image/*">
                    </div>
                </div>
            </div>   

            <div class="col">
                <div class="row">
                    <div class="col"></div>
                </div>

                <div class="row">
                    <div class="col-4"><strong>ì¹´íê³ ë¦¬</strong></div>
                    <div class="col-8">
                        <select name="menuCateno" id="menuCateno" style="width: 100%; height: 100%; font-size: 12px;">
                            <option value="1">ë­</option>
                        </select>
                    </div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>ë©ë´ëª</strong></div>
                    <div class="col-8"><input name="menuName" id="menuName" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>ê°ê²©</strong></div>
                    <div class="col-8"><input name="menuPrice" id="menuPrice" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>ì¤ëª</strong></div>
                    <div class="col-8"><textarea name="menuInfo" id="menuInfo" cols="30" rows="10" style="width: 170px; height: 130px; font-size: 12px;"></textarea></div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-4"><strong>ìì°ì§</strong></div>
                    <div class="col-8"><input name="menuOrigin" id="menuOrigin" type="text" style="width: 100%; height: 100%; font-size: 12px;"></div>
                </div>

                <div class="row" style="margin-top: 35px;">
                    <div class="col"><button type="button" class="btn btn-danger" id="close-modal2">ì·¨ìíê¸°</button></div>
                    <div class="col" style="text-align: right"><button type="submit" class="btn btn-success">ë±ë¡íê¸°</button></div>
                </div>

        </form>                     
            </div>
        </div>
    </div>
</div>

<script>

$("#menumdelete").dblclick(function(){
    location.reload(true);
})


$("#menumdelete").on("click", function(){
    let value = $("#menumdelete").val();
    console.log(value)
    let imgmenucol = $(".imgmenucol");
    $(".imgmenucol").empty();
    $(".imgmenucol").append(

        "<div class='row'>" 
            +'<div class="col">'
                +'<div style="background-image: url(https://via.placeholder.com/200); width: 200px; height: 200px;">'
                + '<button type="button" class="btn btn-danger thisdelete" style="margin-top: 80px;" value="ì´ê±°ì ë²í¸">ì­ì íê¸°</button>'
                +'</div>'         
            +'</div>'    
         +'</div>'
         +'<div class="row">'
         +'<div class="col"> í©ê¸ ì¬ë¦¬ë¸ </div>'
         +'</div>'   
         +'<div class="row">'
         +'<div class="col"> 20000ì </div>'
         +'</div>'   
    ); 

    // ajax ì¶ê° ì½ë© íì
    $(".thisdelete").on("click",function(){

    let clickedValue  = $(this).val();

    console.log(clickedValue)

    })
})


const modal = document.getElementById("modal");
const openModalBtn = document.getElementById("menucatemanagementbtn");
const closeModalBtn = document.getElementById("close-modal");

// ëª¨ë¬ì°½ ì´ê¸°
openModalBtn.addEventListener("click", () => {
  modal.style.display = "block"
  document.body.style.overflow = "hidden"; // ì¤í¬ë¡¤ë° ì ê±°
  
});

// ëª¨ë¬ì°½ ë«ê¸°
closeModalBtn.addEventListener("click", () => {
  modal.style.display = "none";
  document.body.style.overflow = "auto"; // ì¤í¬ë¡¤ë° ë³´ì´ê¸°
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

$("#cateaddsubmit").submit( function(){
    let cateadd = $("#cateadd").val();

    if(cateadd.length == 0){
        alert("ì¹´íê³ ë¦¬ë¥¼ ìë ¥ í´ì£¼ì¸ì");
        return false;
    }
})

const modal2 = document.getElementById("modal2");
const openModal2Btn = document.getElementById("menumanagementbtn");
const closeModal2Btn = document.getElementById("close-modal2");
    
    // ì½ì ê° ì°ê¸°
    $("#menuInfo").on("input", function() {
        console.log($("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>')); 
    });

    // ëª¨ë¬ì°½ ì´ê¸°
    openModal2Btn.addEventListener("click", () => {
      modal2.style.display = "block"
      document.body.style.overflow = "hidden"; // ì¤í¬ë¡¤ë° ì ê±°
      
    });
    
    // ëª¨ë¬ì°½ ë«ê¸°
    closeModal2Btn.addEventListener("click", () => {
      modal2.style.display = "none";
      document.body.style.overflow = "auto"; // ì¤í¬ë¡¤ë° ë³´ì´ê¸°
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
            alert("ì¹´íê³ ë¦¬ë¥¼ ìë ¥ í´ì£¼ì¸ì");
            return false;
        }
    })


// íì¼ í¼ì ê°ì´ ë°ëë ì´ë²¤í¸ë¥¼ ì²´í¬í´ì¤
$("#menuimg").on("change", function(event) {

// íì¬ ë°ë ì´ë²¤í¸ì íì¼ëªì ê°ì ¸ì´
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

    $("textarea[name=menuInfo]").val().replace(/(?:\r\n|\r|\n)/g, '<br>');

    if(menuInfo.length == 0){
        alert("ë©ë´ ì¤ëªì ìë ¥í´ì£¼ì¸ì");
        return false;
    }

    if(menuOrigin.length == 0){
        alert("ìì°ì§ë¥¼ ìë ¥í´ì£¼ì¸ì");
        return false;
    }

    if(menuPrice.length == 0){
        alert("ë©ë´ ê°ê²©ì ìë ¥í´ì£¼ì¸ì");
        return false;
    }

    if(menuName.length == 0){
        alert("ë©ë´ ì´ë¦ì ìë ¥í´ì£¼ì¸ì");
        return false;
    }

})

$('input[type="text"]').keydown(function() {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
});
</script>
</body>
</html>