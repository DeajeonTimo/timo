<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.12 10:32
	
	로그인 세션이 만료되었을 때 이쪽으로 보내주시면 됩니다.
	url요청 주소 : loginsessionError.do
-->
<meta charset="UTF-8">
<title>로그인세션이 만료되었습니다.</title>
</head>
<body>
<h4>로그인 세션이 만료되었습니다.</h4>
<h6>다시 로그인 해주세요</h6>
	<button type="button" id="goMain">
		메인으로 돌아가기
	</button>
	<button type="button" id="goLogin">
		로그인 하러가기
	</button>

</body>
<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
	$('#goMain').on('click',function(){
		location.href="<%=request.getContextPath()%>/sangchuMain.do";
	});
	$('#goLogin').on('click',function(){
		location.href="<%=request.getContextPath()%>/loginMain.do";
	});
</script>
</html>