<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입 메인</title>
<script
	src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js">
</script>
 <script src="https://www.google.com/recaptcha/api.js" async defer></script>	
<style>
@font-face {
	font-family: 'GeekbleMalang2WOFF';
	src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
}

body, html {
	margin: 0;
	height: 100%;
}

input:focus {
	outline: none;
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
	justify-content: center;
	align-items: center;
	height: 100%;
	letter-spacing: -.5px;
	margin: 0 auto;
	width: 460px;
}

#temp {
	margin: 0 auto;
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

.login_wrap {
	margin: 0 auto;
	padding: 0 40px;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.form_wrap {
	display: flex;
	flex-direction: column;
	width: 428px;
	height: 254px;
	border: 2px solid rgb(203, 203, 203);
	padding: 50px 28px 20px 28px;
	border-radius: 10px;
	margin-bottom: 15px;
}

form {
	display: flex;
	flex-direction: column;
}

#loginInfo {
	width: 420px;
	font-size: 16px;
	/* 스크립트에서 여기  */

	/* border: none; */
}

.loginId {
	border-radius: 10px 10px 0px 0px;
}

.loginPass {
	border-radius: 0px 0px 10px 10px;
}

.loginId, .loginPass {
	display: flex;
	flex-direction: row;
	align-items: center;
	border: 1px solid rgb(203, 203, 203);
	height: 50px;
}

.loginPass {
	margin-bottom: 10px;
}

input[type=text], input[type=password] {
	border: none;
}

.login_wrap img {
	margin-left: 10px;
	margin-right: 10px;
	width: 25px;
	height: 25px;
	opacity: 20%;
}

.submitDiv{
display: flex;
justify-content: center;}

input[type=submit].submitLogin {
	height: 70px;
	border: none;
	background-color: #03cd5d;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
	color: rgb(255, 255, 255);
	cursor: pointer;
	    width: 80%;
	    margin-top: 30px;
}

label {
	margin-bottom: 50px;
	color: rgb(97, 97, 97);
}

.underFormMenu {
	margin: 0 auto;
}

ul {
	padding: 0;
	margin: 0 auto;
	list-style: none;
}

li {
	padding: 0px;
	float: left;
	margin-right: 10px;
}

li:first-child:before {
	color: rgb(97, 97, 97);
	content: " | ";
}

li:after {
	content: " | ";
	color: rgb(97, 97, 97);
}

a {
	text-decoration: none;
	color: rgb(97, 97, 97);
}

.footer {
	margin-top: 50px;
	width: 100%;
}

#cap{
	width: 400px;
	margin : 0 auto;
	margin-top : 30px;
	display: flex;
 }
 .g-recaptcha{
 margin: 0 auto;
 }
</style>
<body>
	<div id="wrap" class="wrap">
		<div id="temp">
			<header class="header" role="banner">
				<div class="header_inner">
					<a class=logoSection href="<%=request.getContextPath()%>/sangchuMain.do">
						<img
						src="../../images/Logo.png" class=logoImg width="40" height="40"
						alt="상추마켓로고">
						<p class="font">상추마켓</p>
					</a>
				</div>

			</header>

			<div id="container" class="container">
				<div class="login_wrap">
					<div class="form_wrap">
						<form action="<%=request.getContextPath()%>/login.do"
							method="post" id="submitLogin">
							<div class="loginId">
								<img src="../../images/loginInfo_id.png" alt="loginInfo_id">
								<input type="text" name="email" id="email" class="loginInfo_id"
									placeholder="이메일을 입력해주세요">
							</div>
							<div class="loginPass">
								<img src="../../images/loginInfo_pw.png" alt="loginInfo_pw">
								<input type="password" name="password" id="password"
									class="loginInfo_id" placeholder="비밀번호를 입력해주세요" >
							</div>
								<div class="submitDiv"><input id="submitLogin" name="submitLogin" class="submitLogin" type="submit" value="로그인" ></div>
						</form>
					</div>
					<div class="underFormMenu">
						<ul>
							<li><a href="javascript:void(0);" onclick="findEmail()">이메일
									찾기</a></li>
							<li><a href="javascript:void(0);" onclick="findPassword()">비밀번호
									찾기</a></li>
							<li><a href="javascript:void(0);" onclick="signup()">회원가입
							</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div id="cap">
		<%
				String res =(String) request.getAttribute("currentTry");
				int resInt =0;
				
				if(res!=null){ resInt = Integer.parseInt(res); }
				if(resInt>5){
		 %>
			 	
					      <div class="g-recaptcha" data-sitekey="6LedM4onAAAAAKOFk7ojLxM5itqiw5K_2mT4ymsU" data-callback="isOKforCheck"></div>
					      <br/>
		 <%
				 }
	
	 %>
			</div>
			 
			
		</div>
	</div>
</body>

<script>

        function findEmail() {
            location.href = "<%=request.getContextPath()%>/goToFindEmail.do";
        }

        function findPassword() {
            location.href = "<%=request.getContextPath()%>/findPassword.do";
        }

        function signup() {
            location.href = "<%=request.getContextPath()%>/termsOfUse.do";
        }

        var isOK = false;
        function isOKforCheck() {
            isOK = true;
        }
        
    	$(function() {

       		 $('#submitLogin').submit(function() {
        	 var res = '<%= request.getAttribute("currentTry") %>';
             var resInt = parseInt(res);
                console.log(resInt)
            if (resInt>5 && !isOK) {
                alert('캡챠 미진행! 로그인할 수 없습니다.');
//                 $('#testForm').show();
//                 event.preventDefault(); //이벤트 기본동작(제출)을 막는다.
                return false;
           
        			    }
       			 })
    });
</script>

</html>