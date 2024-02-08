<%@page import="sangchu.category.vo.CatMiddleVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.16 09:52
	
	마이페이지 관심카테고리 관리에서 사용할 중분류 카테고리 List를 JSON으로 만들어주는 JSP입니다.
 --%>
<%
	response.setContentType("application/json; charset=utf-8");
	List<CatMiddleVO> list = (List<CatMiddleVO>) request.getAttribute("resultList");
	JsonObject obj = new JsonObject(); 
	Gson gson = new Gson();
	if(list!=null && list.size()!=0){
		obj.addProperty("sw", "ok");
		obj.addProperty("size", list.size());
		obj.add("datas", gson.toJsonTree(list));
	} else {
		obj.addProperty("sw", "no");
	}
	out.print(obj);
%>