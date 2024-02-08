/**
 * 
 */

function fprint(){
	//id = id인 요소에 접근하여 값을 가져온다.
	idvalue = document.querySelector('#id').value;
	// 처리
	str = "당신이 입력한 id = " + idvalue +"입니다.";
	// 출력장소에 접근하여 내용을 출력한다.
	
	document.querySelector('#result').innerText = str;
}