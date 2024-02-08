<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.corba.se.impl.ior.WireObjectKeyTemplate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 찾기</title>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
$(function(){
	
	$('#goToLogin').on('click', function(){
		location.href="<%=request.getContextPath()%>/loginMain.do"
	})
	$('#again').on('click', function(){
		location.href="<%=request.getContextPath()%>/findPassword.do"
	})
	
})

</script>
</head>
<style>
    /* Google web font CDN*/
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

    @font-face {
        font-family: 'GeekbleMalang2WOFF';
        src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
    }

    body,
    html {
        margin: 0;
        height: 100%;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .logoSection {
        display: inline-flex;
        flex-direction: row;
        text-decoration: none;
        align-items: center;
        margin-right: 30px;
    }

    .font {
        font-family: 'GeekbleMalang2WOFF', sans-serif;
        color: #03cd5d;
        font-size: 60px;
        margin-left: 10px;
    }

    #wrap {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100%;
        letter-spacing: -.5px;
        margin: 0 auto;
        width: 460px;
    }

    .header {
        padding-bottom: 10px;
        box-sizing: border-box;
    }

    .header .header_inner {
        position: relative;
        margin: 0 auto;
        text-align: center;
        box-sizing: border-box;
    }

    .header img {
        width: 130px;
        height: 100px;
    }

    .title{
        color: rgb(134, 134, 134);
    }

    .memberInfo {
        display: flex;
        flex-direction: column;
        width: 428px;
        height: 320px;
        border: 2px solid rgb(203, 203, 203);
        padding: 40px 28px 20px 28px;
        border-radius: 10px;
        margin-bottom: 15px;
    }

    button {
        width: 212px;
        height: 40px;
        border: none;
        background-color: #03cd5d;
        justify-items: center;
        border-radius: 5px;
        font-size: 15px;
        font-weight: bold;
        color: rgb(255, 255, 255);
        cursor: pointer;
    }

    .res{
        margin-top: 30px;
        border: 2px solid rgb(203, 203, 203);
        border-radius: 10px;
        margin-bottom: 70px;
        height: 120px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .footer {
        width: 100%;
        color: rgb(134, 134, 134);
        text-align: center;
        font-size: 0.8rem;
    }
</style>

<body>
    <div id="wrap" class="wrap">

        <header class="header">
            <div class="header_inner">
                <a class=logoSection href="<%=request.getContextPath()%>/sangchuMain.do">
                    <img src="../../images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
                    <p class="font">상추마켓</p><br>
                </a>
            </div>

        </header>

        <div id="container" class="container">
            <div class="memberInfo">
                <form action="<%=request.getContextPath()%>/findEmail.do" method="get">
                    <div class="userName">
                        <div class="title">요청하신 이메일 찾기 결과입니다.</div>
                        <div class="res">
                        <%
                        List<String> emailList =(List<String>)request.getAttribute("email");
                        if(emailList==null) {
                        	for(int i=0; emailList.size()<i; i++){
                        		%><%=emailList.get(i)%>
                        		<%
                        	}
                        %>
                        일치하는 정보가 존재하지 않습니다.
                        <%	
                        }else{
                        %>	
                        <%=request.getAttribute("email")%>
                        <%	
                        }
                        %>
                        </div>
                    </div>
                    <div class="buttons">
                        <button type="button" id="goToLogin">로그인</button>
                        <button type="button" id="again"> 비밀번호 찾기 </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">
            Sangchu Corp.
        </div>
    </div>
</body>
</html>