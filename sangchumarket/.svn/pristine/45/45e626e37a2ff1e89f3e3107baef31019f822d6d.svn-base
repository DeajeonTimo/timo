<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.06 02:42
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.16 15:02
 	
 	미완성
 	수정 내역
 	2023.08.11 20:23 김석호 - 로그인 세션 추가, 커뮤니티 관리 주석처리
 	2023.08.12 08:53 김석호 - renew함수 load삭제, location.href로 변경
 	2023.08.12 10:45 - 김석호 : 로그인세션 만료 처리
 	2023.08.13 00:10 - 김석호 : 회원정보 수정 로케이션 추가
 	2023.08.14 20:36 - 김석호 : 비밀번호 변경nav및 location추가
 	2023.08.15 11:24 - 김석호 : 키워드 관리 location추가
 	2023.08.16 14:00 - 김석호 : 관심카테고리 관리 location추가
 	2023.08.16 15:02 - 김석호 : 블랙리스트 관리 location추가
 	2023.08.20 17:52 - 김석호 : 거래제시관리 location추가
 	
 	마이 페이지 메인 화면 입니다.
 -->
<html lang="ko">
<head>
<%  MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
%>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chat.css">
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#content").load("<%=request.getContextPath()%>/mypageDefaultView.do");

	});
</script>
<style>
html,body {
	margin : 0px;
	padding : 0px;
	box-sizing: border-box;
}
html {
	min-width: 1200px;
	height : 100%;
}
.list-group-item {
    position: relative;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    
    -webkit-flex-flow: row wrap;
    flex-flow: row wrap;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    padding: 0.75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,.125);
    flex-direction: column;
}
a {
	text-decoration: none;
}
#for-empty-space{
	height : 671px;
}

.nav {
	text-align : center;
	width : 20%;
	display : inline-block;
	float : left;
	height : 1000px;
}
#content {
	width : 80%;
	display : inline-block;
	float : left;
	height : 1000px;
}
.container-fluid {
	width : 100%;
}
.list-group {
	height : 1000px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="nav">
		<div class="list-group">
			<a href="javascript:void(0);" onclick="goBackToMain()" class="list-group-item" id="goBackToMain">메인 페이지</a>
			<a href="javascript:void(0);" onclick="renew()" class="list-group-item" id="gomypage">마이 페이지</a>
			<a href="javascript:void(0);" onclick="memberUpdate()" class="list-group-item">내 정보 수정</a>
			<a href="javascript:void(0);" onclick="passwordUpdate()" class="list-group-item">비밀번호 변경</a>
			<a href="javascript:void(0);" onclick="keywordManage()" class="list-group-item">키워드 관리</a>
			<a href="javascript:void(0);" onclick="catManage()" class="list-group-item">관심 카테고리 관리</a>
			<a href="javascript:void(0);" onclick="offerManage()" class="list-group-item">거래 제시 관리</a>
			<a href="javascript:void(0);" onclick="blackManaga()" class="list-group-item">차단 관리</a>
			<div class="list-group-item" id="for-empty-space"></div>
			<a href="javascript:void(0);" onclick="escapeHere()" class="list-group-item">회원 탈퇴</a>
		</div>
	</div>
	<div id="content">
	</div>
</div>
</body>
<script>
function renew(){
	location.href="<%=request.getContextPath()%>/mypageMain.do"
};
function memberUpdate(){
	$('#content').empty();
	// 회원정보 수정창
	location.href="<%=request.getContextPath()%>/memberUpdateForm.do";
};
function keywordManage(){
	$('#content').empty();
	$('#content').load("<%=request.getContextPath()%>/keywordRequest.do");
	// 키워드 관리창
};
function catManage(){
	$('#content').empty();
	$('#content').load("<%=request.getContextPath()%>/getCategory.do");
};
function offerManage(){
	$('#content').empty();
	// 거래 제시 관리창
	$('#content').load("<%=request.getContextPath()%>/getOffer.do");
};
function blackManaga(){
	$('#content').empty();
	$('#content').load("<%=request.getContextPath()%>/mypageBlackList.do");
};
// 도망쳐..
function escapeHere(){
	$('#content').empty();
	$('#content').load("<%=request.getContextPath()%>/escapeHere.do");
};
function passwordUpdate(){
	$('#content').empty();
	$('#content').load("<%=request.getContextPath()%>/passwordUpdate.do");
}
function goBackToMain(){
	location.href = "<%=request.getContextPath()%>/sangchuMain.do";
}

</script>
</html>