<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.15 16:41
 	
	result페이지입니다.
	키워드나 관심카테고리 등록 시 기등록상태를 확인하기 위한 페이지입니다.
	
--%>
<%
	int res = (int)request.getAttribute("result");

	if(res>0){
%>
	{
		"sw" : "기등록"
	}
<%
	}else{
%>
	{
		"sw" : "초과"
	}
<%
	}
%>
