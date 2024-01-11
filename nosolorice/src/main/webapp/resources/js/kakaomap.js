let originXPoint = "";
let originYPoint = "";

//loginId에 해당하는 회원정보에서 주소정보를 가져온다.
$.ajax({
	url : "/app/getNormalUserInfo",
	data : "normalId=" + $("#loginId").val(),
	type : "post",
	dataType : "json",
	async : false,
	success : function(resData){
		originXPoint = resData.xpoint;
		originYPoint = resData.ypoint;
	}, error : function(err){
		console.log(err);
	}
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(originXPoint, originYPoint), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

marker = new kakao.maps.Marker({
    map: map
});
infowindow = new kakao.maps.InfoWindow({ 
    content: `<div style="width:150px;text-align:center;padding:6px 0;">현재 설정 위치</div>`
});

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
    relayout();
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
    relayout();
}

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var circle = new kakao.maps.Circle({
    strokeWeight: 5, // 선의 두께입니다 
    strokeColor: '#069d66', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid', // 선의 스타일 입니다
    fillColor: 'white', // 채우기 색깔입니다
    fillOpacity: 0.5  // 채우기 불투명도 입니다   
}); 



// 미니맵 ------------------------------------------------------------------------------------------------------------------------
const getMiniMap = (coords)=> {
    var miniMapContainer = document.getElementById('miniMap'),
    miniMapOption = {center: new kakao.maps.LatLng(coords[0], coords[1]),level: 5};
    var miniMap = new kakao.maps.Map(miniMapContainer, miniMapOption);
    const miniCoords = new kakao.maps.LatLng(coords[0], coords[1]);
    
    miniMap.setCenter(new kakao.maps.LatLng(coords[0], coords[1]));
    marker = new kakao.maps.Marker({
        map: miniMap,
        position: miniCoords
    })
    infowindow.open(miniMap, marker);
    circle.setMap(miniMap);
    circle.setOptions({radius: 1*1000});
    circle.setPosition(new kakao.maps.LatLng(coords[0], coords[1]));
    
    miniMap.relayout();
    $("#miniMap").css("display", "block"); 
}