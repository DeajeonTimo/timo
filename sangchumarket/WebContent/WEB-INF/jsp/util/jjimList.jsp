<%@page import="sangchu.mypage.vo.JjimVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--

	최초 작성자 : 김석호
	최초 작성일 : 2023.08.10 16:05
	
	유저의 찜목록을 List로 받아서 Json트리로 만들어주는 JSP파일입니다.
--%>
<%
	response.setContentType("application/json; charset=utf-8");
	List<JjimVO> list = (List<JjimVO>)request.getAttribute("resultList");
	JsonObject obj = new JsonObject(); 
	Gson gson = new Gson();
	if(list!=null && list.size()!=0){
		obj.addProperty("sw", "ok");
		obj.add("datas", gson.toJsonTree(list));
	} else {
		obj.addProperty("sw", "no");
	}
	out.print(obj);
%>