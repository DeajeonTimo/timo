<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 찾기</title>
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

    .overContainer{
        color: rgb(134, 134, 134);
    }

    .memberInfo {
        display: flex;
        flex-direction: column;
        width: 428px;
        height: 320px;
        border: 2px solid rgb(203, 203, 203);
        padding: 20px 28px 20px 28px;
        border-radius: 10px;
        margin-bottom: 15px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    form input[type=date] {
        font-family: 'Noto Sans KR', sans-serif;
        color: rgb(134, 134, 134);


    }

    form>div:not(.submitDiv) {
        margin-bottom: 15px;
    }

    form>div>input:not(input[type=submit]) {
        border: 2px solid rgb(203, 203, 203);
        border-radius: 5px;
        width: 394px;
        height: 40px;
        padding-left: 15px;
        padding-right: 15px;
    }

    form>div>input[type=submit] {
        margin: 0 auto;
        font-family: 'Noto Sans KR', sans-serif;
    }

    form>div.submitDiv {
        display: flex;
        margin-top: 10px;
    }

    input[type=submit] {
        width: 450px;
        height: 60px;
        border: none;
        background-color: #03cd5d;
        justify-items: center;
        border-radius: 5px;
        font-size: 18px;
        font-weight: bold;
        color: rgb(255, 255, 255);
        cursor: pointer;
    }

    form>div>input:not(input[type=submit]):focus {
        border-color:  #03cd5d;
        outline: none;
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

        <div class="overContainer">이메일을 잊어버리셨나요? <br>&nbsp;</div>

        <div id="container" class="container">
            <div class="memberInfo">
                <form action="<%=request.getContextPath()%>/findEmail.do" method="get">
                    <div class="userName">
                        <div class="title">이름 입력</div>
                        <input type="text" name="userName" class="InputUserName" required>
                    </div>
                    <div class="userBirth">
                        <div class="title">생년월일 입력</div>
                        <input type="text" name="userBirth" class="userBirth" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength='6' placeholder="생년월일 6자리를 입력해주세요. ex)970101">
                    </div>
                    <div class="userTel">
                        <div class="title">휴대전화 입력</div>
                        <input type="tel" class="userTel" name="userTel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength='11' required placeholder="- 없이 입력해주세요" >
                    </div>
                    <div class="submitDiv">
                        <input type="submit" value="이메일 찾기">
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