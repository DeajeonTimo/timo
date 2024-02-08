<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--

	최초 작성자 : 김석호
	최초 작성일 : 2023.08.17 11:38
	
	채팅방을 새로 만드는 결과를 JSON으로 만들어줄 JSP파일입니다.
--%>
<%
	int res = (int)request.getAttribute("result");

	if(res>0){
%>
	{
		"sw" : "성공"
	}
<%
	}else if(res==-1){
%>
	{
		"sw" : "기등록"
	}
<%
	}else if(res==-2){
		
%>
	{
		"sw" : "본인"
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