<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
    <title>Welcome!</title>
    
        
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
 <script>
 
 /*
 최종 작성일 : 박민주
 (아마도) 최종 수정일 : 2023.08.09
 */
 
   
$(function(){
	
 var result1 = false;
 var result2 = false;
 var result3 = false;
 
 
 //도메인이 바뀔때마다 적용되는 함수
 $('#selectEmail').on('change', function(){
	 //선택된 이메일 도메인 값을 변수에 저장
	  selectedDomain1 = $('#selectEmail option:selected').val();
	 
	 if (selectedDomain1 === '1') { // 직접입력 선택 시
	        $('#str_email02').val(''); // 직접입력 필드 초기화
	        $('#str_email02').attr('disabled', false); // 직접입력 필드 활성화
	        
	 } else if (selectedDomain1 === '2') { // 직접입력 선택 시
	        $('#str_email02').val(''); // 직접입력 필드 초기화
	        $('#str_email02').attr('disabled', true); // 직접입력 필드 활성화
	        
	 }
	 
	 
	 else {
	
	        $('#str_email02').val(selectedDomain1); // 선택한 값으로 직접입력 필드 설정
	        $('#str_email02').attr('disabled', true); // 직접입력 필드 비활성화
// 	        selectedDomain = $('#selectEmail option:selected').val();
	 }
	 
 })
 
 //email 중복검사
 $('#checkEmail').on('click', function(){
	 email01 = $('#str_email01').val().trim();
	 selectedDomain = $('#str_email02').val();
	 email = email01 + '@'+ selectedDomain;
// 	var result=false;
	 
	 if(selectedDomain!="이메일선택" && email01!="" && selectedDomain!=""){
		 $.ajax({
			 url : "<%=request.getContextPath()%>/duplicateInspection.do",
			 type : "post",
			 data : {"email" : email},
			 success : function(data){
			 if(data.sw=="가입가능"){
				 $('#placehold-text').fadeIn();
				 $('#placehold-text').text('	●가입가능한 이메일입니다.');
				 $('#placehold-text').css('color', 'green');
				 result1 = true;
			 }else{
				 $('#placehold-text').fadeIn();
				 $('#placehold-text').text('	※[이메일중복]가입불가한 이메일입니다');
				 $('#placehold-text').css('color', 'red')
			 }
		 },
		 error : function(xhr){
			alert('상태' + xhr.status);	 
		 },
		 dataType : 'json'
		 })//ajax
	 }
	 
	 
	 else{
		 $('#placehold-text').fadeIn();
		 $('#placehold-text').text('	※올바른 이메일 형식을 작성해주세요');
		 $('#placehold-text').css('color', 'red');
	 }
 })

////비밀번호 일치 확인-------------------------
	$('#alert-success').hide();
	$('#alert-danger').hide();
	
	$('input').keyup(function(){
		
		var pw1 = $('#pw1').val();		
		var pw2 = $('#pw2').val();
		
		if(pw1!="" || pw2!=""){
			if(pw1==pw2){
				
				$('#alert-success').fadeIn();
				$('#alert-success').css('color', 'green');
				$('#alert-danger').hide();
				result3 = true;
			}else{
				$('#alert-danger').fadeIn();
				$('#alert-danger').css('color', 'red');;
				$('#alert-success').hide();
			}
		}
	})
////-------------------------여기까지비밀번호 일치 확인
	
		
// 	정규식??
	$('#pw1').keyup(function(){
		var result="";
// 		var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
		var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
		var pw1 = $('#pw1').val();
		if(pw1.match(regExp)==null){//정규식과 맞지 않으면 null 반환
			var not = "  ※적절하지 않은 비밀번호";
			$('#alertPass1').fadeIn();
			$('#alertPass1').text(not);
			$('#alertPass1').css('color','red');
			
		}else{
			$('#alertPass1').text("");
			result2 = true;
			
		}
		
	})
	
	
	$('#pw2').keyup(function(){
		var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
		var pw2 = $('#pw2').val();
		if(pw2.match(regExp)==null){//정규식과 맞지 않으면 null 반환
			var not = " ※적절하지 않은 비밀번호";
			$('#alertPass2').fadeIn();
			$('#alertPass2').text(not);
			$('#alertPass2').css('color','red');
			result2=false;
		}else{
			$('#alertPass2').text("");
			result2 = true;
		}
		
	})
	
	//submit 이벤트
	$('#memberSubmit').submit(function(){
		if(result1==false||result2==false||result3==false) {
			alert('올바르게 입력');
			return false;
		}
	})
	
	
	
})
</script>
    
    
    
<style>
        /* Google web font CDN*/
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
       
        @font-face {
            /*로고 폰트*/
            font-family: 'GeekbleMalang2WOFF';
            src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
        }


        * {
            box-sizing: border-box;
            /*전체에 박스사이징*/
            outline: none;
            /*focus 했을때 테두리 나오게 */
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        html, body{
            height: 100%;
            margin: 0 auto;
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
            width: 80px;
            height: 70px;
        }


        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 14px;
            background-color: #f5f6f7;
            line-height: 1.5em;
            color: #222;
            margin: 0;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* 푸터에 있는 이용약관 등등등 */
        a {
            text-decoration: none;
            color: #222;
        }

        /*member sign in*/
        .member {
            width: 550px;
            /* border: 1px solid #000; */
            margin: auto;
            /*중앙 정렬*/
            padding: 0 20px;
            margin-bottom: 20px;
        }


        .member .field {
            margin: 5px 0;
            /*상하로 좀 띄워주기*/
        }


        .member b {
            display: block;
            /*수직 정렬하기 */
            margin-bottom: 5px;
        }

        

        
        .field.email div,
        .field.nickname div {
            display: flex;
        }

        .field.email div > input:nth-child(1){
            flex : 0.6
        }
        
        .field.email div > div:nth-child(2) {
            flex: 0.1;
            justify-content: center;
            align-items: center;
            padding: 0;
            border-right: none;
            background-color: white;
        } 
        .field.email div > input:nth-child(3) {
            flex: 0.6;
            border-left: none;
            padding: 0;
               background-color: white;
        } 
        .field.email div > select:nth-child(4) {
            flex: 0.5;
        } 

        .field.email div > input:nth-child(5){
            flex : 0.3;

        } 
       

        
        .field.nickname div input:nth-child(1){
            flex: 3;
        }
        
       .field.nickname div input:nth-child(2) {
            flex: 1;
        }

       

        .member input, select, .anno {
            border: 1px solid #dadada;
            padding: 15px;
            width: 100%;
            margin-bottom: 5px;
        }

		.member input[type=submit]{
		margin-top: 20px;
		}
		
		
        .member input[type=button],
        .member input[type=submit] {
            background-color: #2db400;
            color: #fff;
            cursor: pointer;
        }

        
        .member-footer {
            text-align: center;
            font-size: 12px;
            margin-top: 20px;
        }

        .member-footer div a:hover {
            text-decoration: underline;
            color: #2db400
        }

        .member-footer div a:after {
            content: '|';
            font-size: 10px;
            color: #bbb;
            margin-right: 5px;
            margin-left: 7px;
            /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
            display: inline-block;
            transform: translateY(-1px);

        }

        .member-footer div a:last-child:after {
            display: none;
        }
			
		.placehold-text{
		border : 1px solid red;}


    </style>

    
</head>

<body>
    <div class="container">
    <div class="member">
        <!-- 1. 헤더(로고) -->
        <header class="header" role="banner">
            <div class="header_inner">
                <a class=logoSection href="<%=request.getContextPath()%>/sangchuMain.do">
                    <img src="../../images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
                    <p class="font">상추마켓</p>
                </a>
            </div>

        </header>

        <!-- 2. 필드 -->
        <div>
        <form id="memberSubmit" method="post" action="<%=request.getContextPath()%>/signup.do">
        <div class="field email">
        
            <!-- 이메일 중복검사 -->
            <b>이메일 <small>(필수)<span id="placehold-text"></span></small></b>
          			
            <div>
                <input type="text" name="mail" id="str_email01" placeholder="이메일입력" required>
                <div class="anno">@</div>
                <input type="text" name="domain" id="str_email02" value="이메일선택" required>
                <select id="selectEmail" name="selectDomain">
                  <option value="2" selected disabled hidden>이메일선택</option>
                    <option value="naver.com" >naver.com</option>
                    <option value="gmail.com" >gmail.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="outlook.com">outlook.com</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="empas.com">empas.com</option>
                    <option value="freechal.com">freechal.com</option>
                    <option value="paran.com">paran.com</option>
                    <option value="1">직접입력</option>
<!--                     <option value="1" selected>직접입력</option> -->
                </select>
                <input type="button" id="checkEmail" value="중복검사">
            </div>
            
            </div>
        
        <div class="field">
            <b>이름<small>(필수)</small></b>
            <input id="name" name="name" type="text" placeholder="이름입력" required>
        </div>
        <div class="field">
            <b>비밀번호<small>(필수)<span id="alertPass1"></span></small></b>
            <input class="userpw" name="pass" maxlength="15" type="password" id="pw1" placeholder="대문자, 소문자, 숫자 포함 8~15자리 입력" required>
        </div>
        <div class="field">
            <b>비밀번호 확인<small>(필수)<span id="alertPass2"></span></small></b>
            <input class="userpw-confirm" maxlength="15" type="password" id="pw2" placeholder="대문자, 소문자, 숫자 포함 8~15자리 입력" required>
        </div>
        
        <div class="alert alert-success" id="alert-success">● 비밀번호가 일치합니다.</div>
        <div class="alert alert-danger" id="alert-danger">※비밀번호가 일치하지 않습니다.</div>


        <!-- 3. 이메일 인증 버튼 -->
        <input type="submit" value="이메일 인증">
	</form>
	</div>
        <!-- 4. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">개인정보처리방침</a>
            </div>
            <span><a href="#none">Sangchu Corp.</a></span>
        </div>
    </div>
</div>
</body>



</html>