<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%  
//여기 아님~~~~~~~~~~~~~~!!!!!!!
	/*
	작성자 : 박민주
	최초작성일 : 2023-08-17
	관리자 계정으로 로그인 후, selectMenu.jsp 에서 [관리자 페이지로 이동] 클릭 시 로드 되는 jsp 입니다.
	*/

	MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
%>

<meta charset="UTF-8">
<title>관리자 - 메인페이지</title>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>

<style>

    /* Google web font CDN*/
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

    @font-face {
        font-family: 'GeekbleMalang2WOFF';
        src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
    }

    html,body {
        font-family: 'Noto Sans KR', sans-serif;
        margin : 0px;
        padding : 0px;
        height: 100%;
        box-sizing: border-box;
    }
    html {
        min-width: 1200px;
    }
    
    body{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .container-fluid {
        display: flex;
        flex-direction: row;
        width : 100%;
        height: 100%;
    }

    .logoSection{
        display: flex;
        height: 50px;
        align-items: center;
        margin-top: 20px;
    }

    .logoImg{
        flex : 2;
        margin: 0px;
        margin-left: 18px;
    }
    
     .logoImg img{
        margin: 0px;
        width: 35px;
        height: 35px;
        margin-left: 10px;
        margin-right: -50px;
        margin-top: 10px;
    }
    
    .logoText{
    	width : 30px;
        margin: 0px;
        margin-left: -20px;
        flex : 8;
        font-family: 'GeekbleMalang2WOFF', sans-serif;
        color: #03cd5d;
        font-size: 30px;
    }
    
    .nav {
        flex : 1.5;
        background-color: #383838;
        text-align : center;
        width : 20%;
        float : left;
        height : 100%;
    }
    
    .content {
        flex : 8.5;
        width : 80%;
        display : inline-block;
    }

    .managerInfo{
        border-radius: 20px;
        width: 150px;
        height: 170px;
        margin: 0 auto;
        margin-top: 30px;
        margin-bottom: 50px;
    }
    
    .managerInfo img{
        width: 110px;
        height: 110px;
        opacity: 50%;
    }
    
    .Mname{
        color: #03cd5d;
        font-size: 1.2rem;
    }
    .logout p{
        color: lightgray;
        font-size: 0.8rem;
        margin: 0 auto;
        margin-top: 11px;
        cursor: pointer;
        width: fit-content;
    }
    

    .list-group-item {
        position: relative;
        display: -webkit-flex;
        align-items: center;
        padding: 0.75rem 1.25rem;
        border: 1px solid rgba(0,0,0,.125);
        flex-direction: column;
    }

    .list-group-item:hover {
        transition: 0.5s ease-out;
        background-color: #03cd5d;
    }

    
    a {
        color : white;
        text-decoration: none;
    }
    
    
    .wrap {
        display: flex;
        flex-direction: column;
        height: 100vh;
    }

    .goToMain {
        flex: 0.3;
        width: 100%;
        background-color: white;
        border-bottom: 2px solid rgb(191, 191, 191);
        height: 100px;
        text-align: center;
        color : grey;
    }
    
    .goToMainA{
        text-decoration: none;
        color: black;
        border-radius: 3px;
        border : 1px solid rgb(0, 0, 0);
        font-size: 0.85rem;
        padding : 2px 10px 2px 10px;
        float: right;
        height: 20px;
        margin-top: 10px;
        margin-right: 50px;
    }

    #content {
        flex: 5;
    }
    
    .logout{
    	background-color: #383838;
    	border: none; 
    }
    </style>
<body>
    <div class="container-fluid">
        <div class="nav">
            <div class="logoSection">
                <div class="logoImg"><img src="../../images/Logo.png" alt="logo.png"></div>
                <div class="logoText">상추마켓</div>
            </div>
            <div class="managerInfo">
                <img src= "../../images/adminMainpage-adminImg.png" alt="manager.png">
                <div class="Mname">관리자</div>
                <div class="logout"><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></div>
            </div>
            <div class="list-group">
                <a href="javascript:void(0);" onclick="manageUsers()" class="list-group-item" id="list-group-manageUsers">회원 관리</a>
                <a href="javascript:void(0);" onclick="reportUsers()" class="list-group-item" id="list-group-reportUsers">신고 내역 관리</a>
                <a href="javascript:void(0);" onclick="userStopDate()" class="list-group-item" id="list-group-userStopDate">회원 계정정지 해제</a>
                <a href="javascript:void(0);" onclick="customerCenter()" class="list-group-item" id="list-group-customerCenter">문의 관리 페이지로 이동</a>
            </div>
        </div>
        <div class="content">
        	<div class="wrap">
            <div class="goToMain">
           		     관리자 모드입니다.
            </div>

            <div id="content">
            
            </div>
        </div>
        </div>
    </div>
    </body>
    <script>
     	
    	// 회원관리
    	function manageUsers() {
    		$('.list-group-item').css('backgroundColor', '#383838');
    		$('#content').empty();
    		$('#list-group-manageUsers').css('backgroundColor', '#03cd5d');
    		$('#content').load('<%=request.getContextPath()%>/manageUsers.do');
    	}
    	
    	// 신고관리
    	function reportUsers(){ 
    		$('.list-group-item').css('backgroundColor', '#383838');
    		$('#list-group-reportUsers').css('backgroundColor', '#03cd5d');
    		$('#content').empty();
    		$('#content').load('<%=request.getContextPath()%>/reportUsers.do');
    	}
    	
    	//회원 정지일 관리
    	function userStopDate() {
    		$('.list-group-item').css('backgroundColor', '#383838');
    		$('#list-group-userStopDate').css('backgroundColor', '#03cd5d');
    		$('#content').empty();
    		$('#content').load('<%=request.getContextPath()%>/userStopDate.do');
    	}
    	
    	
    	// 고객센터
    	function customerCenter() { 
    		$('.list-group-item').css('backgroundColor', 'rgba(0,0,0,.125)');
    		$('#content').empty();
    		location.href= "<%=request.getContextPath()%>/qnaBoardAdmin.do";
    	}
    	
    	
    </script>
</html>