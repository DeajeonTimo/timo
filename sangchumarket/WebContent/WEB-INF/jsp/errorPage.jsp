<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.06 14:12
	최근 수정자 : 김석호 
	최근 수정일 : 2023.08.11 21:47
	
	수정내역
	2023.08.11 21:47 김석호 : 메인으로 돌아가기 버튼 및 기능 추가
	
	
	ajax나 기타 상황에서 오류가 발생했을때 request를 가지고 이쪽으로 보내주시면 될거같아요.
	오류 메시지 전용 페이지입니다.
 -->
<head>
<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.7.0.min.js"></script>
<%
	// ajax일 경우 xhr변수를 데이터로 넘겨주시고
	// 다른 상황일 경우 오류메시지 만들어서 넘겨주셔도 될거같아요
	// 아니면 e.printstackTrace에서 e변수에 담긴 메시지를 넘겨줘도 좋구요
	String errorMessage = (String)request.getAttribute("errorMessage");
%>
<meta charset="UTF-8">
<title>오류 : <%=errorMessage %></title>
</head>
<body>
	<h2>오류가 발생했습니다.</h2>
	<h4>오류 : <%=errorMessage %></h4>
	<br>
	<button type="button" id="goMain">
		메인으로 돌아가기
	</button>
</body>

<script>
	$('#goMain').on('click',function(){
		location.href="<%=request.getContextPath()%>/sangchuMain.do";
	});
</script>
</html>