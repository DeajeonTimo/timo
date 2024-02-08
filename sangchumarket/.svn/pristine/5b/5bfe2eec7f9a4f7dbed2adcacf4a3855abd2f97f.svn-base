<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

/*
	작성자 : 박민주
	작성일 : 2023-08-17 12:29
	users 테이블에서 정지일이 null 이 아닌 회원들의 정보
*/
	response.setContentType("application/json; charset=utf-8");
	List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");
	
	JsonObject obj = new JsonObject(); 
	Gson gson = new Gson();
	
	if(list!=null && list.size()!=0){
		obj.addProperty("sw", "ok");
		obj.add("datas", gson.toJsonTree(list));
	}else{
		obj.addProperty("sw", "no");
	}
	out.print(obj);
%>
	
	