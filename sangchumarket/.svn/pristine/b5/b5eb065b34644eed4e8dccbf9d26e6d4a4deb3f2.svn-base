<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="sangchu.chat.vo.OfferVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.18 16:31
	
	거래 제시의 정보 OfferVO객체를 JSON처리해주는 JSP입니다.
 --%>
<%
	OfferVO vo = (OfferVO)request.getAttribute("result");
	response.setContentType("application/json; charset=utf-8");
	JsonObject obj = new JsonObject(); 
	Gson gson = new Gson();
	
	
	if(vo==null){
		obj.addProperty("sw", "no");
	}else {
		obj.addProperty("sw", "ok");
		obj.add("datas", gson.toJsonTree(vo));
	}
	out.print(obj);
%>