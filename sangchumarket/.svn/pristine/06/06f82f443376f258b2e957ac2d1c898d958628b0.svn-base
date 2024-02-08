<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 
	최조 작성자 : 김석호
	최초 작성일 : 2023.08.14 20:04
	
	
	비밀번호 변경 창입니다..
 -->
<%  MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
%>
<title>비밀번호 변경..</title>
</head>
<body>
	
		
		<button type="button" id="goCheck">확인</button>
	
        <div class="field">
            <b>변경 비밀번호<small><span id="alertPass1"></span></small></b>
            <input class="userpw-check" maxlength="15" type="password" id="checkpass" placeholder="현재 비밀번호 입력">
        </div>
        <form id="goforUpdate" method="post" action="<%=request.getContextPath() %>/passwordUpdate.do">
	        <div class="field">
	            <b>변경 비밀번호<small><span id="alertPass1"></span></small></b>
	            <input class="userpw" name="pass" maxlength="15" type="password" id="pw1" placeholder="대문자, 소문자, 숫자 포함 8~15자리 입력" required>
	        </div>
			<div class="field">
	            <b>비밀번호 확인<small><span id="alertPass2"></span></small></b>
	            <input class="userpw-confirm" maxlength="15" type="password" id="pw2" placeholder="대문자, 소문자, 숫자 포함 8~15자리 입력" required>
	        </div>
        </form>
		
		
</body>
<script>
var result1 = false;
var result2 = false;
	$(function(){
		var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
		
		$('#goCheck').on('click',function(){
			let inputpass = $('#checkpass').val();
			if(inputpass==""||inputpass==null){
				alert('현재 비밀번호를 입력해주세요');
				return false;
			}
			$.ajax({
				url :"<%=request.getContextPath()%>/checkPassword.do",
				data : "passcheck="+inputpass,
				dataType : 'json',
				type : 'post',
				success : function(res){
					if(res.sw=="성공"){
						goforUpdatePassword();
					}else{
						alert('현재 비밀번호가 틀렸습니다.');
						return false;
					}
				},
				error : function(xhr){
					location.href=`<%=request.getContextPath()%>/goErrorPage.do?error=${xhr.status}`;
				}
			});
		});
		
		$('#pw1').keyup(function(){
			var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
			var pw1 = $('#pw1').val();
			if(pw1.match(regExp)==null){//정규식과 맞지 않으면 null 반환
				result1 = false;
			}else{
				result1 = true;
			}
		})
		
		$('#pw2').keyup(function(){
			var regExp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
			var pw2 = $('#pw2').val();
			if(pw2.match(regExp)==null){//정규식과 맞지 않으면 null 반환
				result2 = false;
			}else{
				result2 = true;
			}
		})
	});

function goforUpdatePassword(){
	let pw11 = $('#pw1').val();
	let pw22 = $('#pw2').val();
	if(pw11!=pw22){
		alert('변경할 비밀번호가 일치하지 않습니다');
		return false;
	}
	if(!result1||!result2){
		alert('변경할 비밀번호에 적절치않은 문자가 포함되어있습니다.');
		return false;
	}
	$('#goforUpdate').submit();
}
	
	
</script>
</html>