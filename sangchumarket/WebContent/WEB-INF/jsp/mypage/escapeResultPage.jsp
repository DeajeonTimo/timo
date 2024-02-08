<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.12 10:04
	
	회원 탈퇴 신청이 정상적으로 처리되었을때 도착하는 페이지입니다. 
 -->
<html lang="ko">
<head>
<link href="/css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
	body, body * {
		text-align: center;
		margin-top : 20px;
	}
</style>
<title>회원탈퇴 신청 완료</title>
</head>
<%
String ok = (String)request.getAttribute("checkaccess");
if(ok==null||!ok.equals("ok")){
	out.println("<script>location.href='/goErrorPage.do?error=잘못된접근'</script>");
}

%>
<body>
	<h4>회원 탈퇴 신청이 완료되었습니다!</h4>
	<h6>상추는 언제나 신선하게 당신을 기다립니다!</h6>
	<p>7일 이내 로그인 시도시 회원탈퇴 신청이 취소됩니다.</p>
	<p>7일이 경과되면 회원정보가 삭제됩니다.</p>
		<button type="button" id="goMain">
		메인으로 돌아가기
	</button>
</body>
<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
	$('#goMain').on('click',function(){
		location.href="<%=request.getContextPath()%>/sangchuMain.do";
	});
</script>
</html>