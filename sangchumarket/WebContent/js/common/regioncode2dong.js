//<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3ac9186683ff6ff0e2596f7637c4b94"></script>
// 경도와 위도로 좌표정보를 가지고있는 객체 생성
let latlng; 
let coords;
var geocoder = new kakao.maps.services.Geocoder();
// x : 경도 , y : 위도
function getDong(x,y){
	// 좌표정보로 한번에 쫙~
	latlng = new kakao.maps.LatLng(x, y);
	// coords객체로 변환한다.
	coords = latlng.toCoords();
	// 얻은 좌표로 동 정보 얻기
	return geocoder.coord2RegionCode(coords.getX(), coords.getY(), callback);
}

// 위에서 생성한 정보로 콜백함수
function callback(result, status){
    if (status === kakao.maps.services.Status.OK) {
		return result[0].address_name;
    } else {
		return false;
	}
}


// 좌표 객체를 위도경도 객체로 바꾸는 메소드
/*
coords.toLatLng()

위도 반환
coords.getLat()

경도 반환
coords.getLng()
*/