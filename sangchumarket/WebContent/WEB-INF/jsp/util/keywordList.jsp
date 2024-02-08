<%@page import="sangchu.mypage.vo.UserKeywordVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--

	최초 작성자 : 김석호
	최초 작성일 : 2023.08.15 19:08
	
	유저의 키워드를 리스트로 받아 JSON객체로 처리해주는 JSP파일입니다.
--%>
<%
	response.setContentType("application/json; charset=utf-8");
	List<UserKeywordVO> list = (List<UserKeywordVO>)request.getAttribute("resultList");
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