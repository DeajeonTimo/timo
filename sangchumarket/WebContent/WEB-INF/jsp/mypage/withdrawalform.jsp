<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.06 14:08
 	
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.12 09:42
 	
 	수정 내역
 	2023.08.12 09:42 - 김석호 : 회원탈퇴 ajax구현 및 주석 변경
 	
 	마이 페이지 에서 회원탈퇴를 눌렀을 때 우측에 표시되는 페이지입니다.
 -->
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="<%=request.getContextPath() %>/js/jquery/jquery-3.7.0.min.js"></script>
<%MemberVO vo = (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}

	String email = vo.getEmail();
%>
<script>
	$(function(){
		// 취소버튼 누르면 mypageMain.jsp에있는 마이페이지 버튼 누르게 만듦
		$('#goback').on('click',function(){
			location.href="<%=request.getContextPath()%>/mypageMain.do";
		});
		// 삭제버튼 누를시
		$('#run').on('click',function(){
			// 아이디 정보가 담긴 변수 이쪽으로 갖고옴
			
			$.ajax({
				url : "<%=request.getContextPath()%>/escapeHere.do",// 회원탈퇴일 처리해주는 서블릿
				data : "email=<%=email%>",
				dataType :'json',
				type : 'post',
				success : function(res){
					if(res.sw=="성공"){
						// alert('탈퇴 신청이 정상적으로 처리되었습니다.');
						// 회원탈퇴 결과 알려주는 페이지로 이동
						location.href= "<%=request.getContextPath()%>/escapeResult.do?access=ok"
					}else{
						location.href= "<%=request.getContextPath()%>/goErrorPage.do?error=null";
					}
				},
				error : function(xhr){
					location.href=`<%=request.getContextPath()%>/goErrorPage.do?error=${xhr.status}`;
				}
					
			});//ajax끝
		});// 탈퇴신청 버튼 끝
	});
</script>
<style>
	html, body {
		margin : 0px;
		padding : 0px;\
		text-align: center;
	}
	h4 {
		text-align: center;
	}
	html * {
		text-align: center;
	}
</style>
</head>
<body>
	<br><br><br><br><br><br><br>
	<h4>회원탈퇴를 신청하시겠습니까?</h4>
	<br><br>
	<input type="button" value="탈퇴 신청" id="run">&nbsp;&nbsp;&nbsp;<input type="button" value="취소" id="goback">
	
</body>
</html>