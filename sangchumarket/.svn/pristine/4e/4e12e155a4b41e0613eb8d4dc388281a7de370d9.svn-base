<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.18 20:31
	
	채팅방 번호에 해당하는 거래글 작성자를 JSON처리해주는 JSP입니다.
 --%>
<%
	String regEmail = (String)request.getAttribute("result");
	response.setContentType("application/json; charset=utf-8");
	JsonObject obj = new JsonObject();
	Gson gson = new Gson();
	
	if(regEmail == null){
		obj.addProperty("sw", "no");
	}else {
		obj.addProperty("sw", "ok");
		obj.add("datas", gson.toJsonTree(regEmail));
	}
	out.print(obj);
%>