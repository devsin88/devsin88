/**
 *  ajax 비동기식 통신
 */

var xhr = null;

//브라우저를 구별하여 xhr 객체를 생성하자. (익스플로러는 사용할수가 없기 때문에)
function getRequest() {
	
	
	if(window.ActiveXObject) //익스플로러일 경우
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	else //크롬, 사파리 등등.. 다른 브라우저
		xhr = new XMLHttpRequest();
}

