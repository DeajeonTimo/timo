<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.06 14:23
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.06 14:23
 	
	result페이지입니다.
	select문을 제외한 CRUD에서  결과를 json객체로 만들 때 이쪽으로 오시면 될거같아요
	
--%>
<%
	int res = (int)request.getAttribute("result");

	if(res>0){
%>
	{
		"sw" : "성공"
	}
<%
	}else{
%>
	{
		"sw" : "실패"
	}
<%
	}
%>
