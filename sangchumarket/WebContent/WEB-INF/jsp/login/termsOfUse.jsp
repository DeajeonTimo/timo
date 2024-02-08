<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    
    <meta charset="UTF-8">
    <title>이용약관</title>
	<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');


        @font-face {
            font-family: 'GeekbleMalang2WOFF';
            src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
        }


        body{
            background-color: #f5f6f7;
        }

        body,
        html {
            margin: 0;
            height: 100%;
            font-family: 'Noto Sans KR', sans-serif;
            font-size:17px;
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
            width: 100%;
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


        .container {
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        
        
        /* 
    .form_wrap {
        display: flex;
        flex-direction: column;
        width: 428px;
        height: 254px;
        border: 2px solid rgb(203, 203, 203);
        padding: 20px 28px 20px 28px;
        border-radius: 10px;
        margin-bottom: 15px;
    }
    
    form {
        display: flex;
        flex-direction: column;
    } */
    
    .section1{
        margin-bottom: 15px;
        

    }

    .section3{
        margin-bottom: 25px;
        float: right;
        margin-right: 15px;
    }

    .choice{
        margin-top: 40px;
        margin: 0 auto;
    }
    
    
    input[type=submit] {
        width: 300px;
        height: 70px;
        border: none;
        background-color: #03cd5d;
        border-radius: 5px;
        font-size: 18px;
        font-weight: bold;
        color: rgb(255, 255, 255);
        cursor: pointer;
    }
    
    input[type=submit].disagree{
        background-color: #a3a3a3;
    
    }
    
        label {
            margin-bottom: 50px;
            color: rgb(97, 97, 97);
        }
        </style>
<script>

</script>

<body>
    <div id="wrap" class="wrap">
        <div id="temp">
            <header class="header" role="banner">
                <div class="header_inner">
                    <a class=logoSection href="<%=request.getContextPath()%>/sangchuMain.do">
                        <img src="../images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
                        <p class="font">상추마켓</p>
                    </a>
                </div>
            </header>

            <div id="container" class="container">
                <div class="terms1">
                    <div class="section1">
                        이용약관 동의 (필수)
                    </div>
                    <div class="section2">
                        <iframe src="<%=request.getContextPath()%>/html/terms1.html" width="700px" height="300px"></iframe>
                    </div>
                    <div class="section3">
                        <input type="checkbox" id="check1"> 동의합니다.
                    </div>
                </div>

                <div class="terms2">
                    <div class="section1">
                      	  개인정보 처리방침 (필수)
                    </div>
                    <div class="section2">
                        <iframe src="<%=request.getContextPath()%>/html/terms2.html" width="700px" height="300px"></iframe>
                    </div>
                    <div class="section3">
                        <input type="checkbox"  id="check2"> 동의합니다.
                    </div>
                </div>

                <div class="choice">
                    <input type="submit" value="동의" class="agree" id="agree">
                    <input type="submit" value="거부" class="disagree" id="disagree">
                </div>
            </div>
        </div>
    </div>
</body>

<script>
	$(function(){
		
		$('#agree').on('click', function(){
			check1 = $("#check1").is(":checked");
			check2 = $("#check2").is(":checked");
			
			if( check1==true && check2==true){
				location.href="<%=request.getContextPath()%>/signup.do"
			}else{
				alert("모두 동의시 회원가입이 가능합니다.")
			}
		})
		
		$('#disagree').on('click', function(){
			history.back()
		})
		
		
		
		
		
		
	})
</script>



</html>