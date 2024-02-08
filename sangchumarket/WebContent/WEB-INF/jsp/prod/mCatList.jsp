<%@page import="sangchu.category.vo.CatMiddleVO"%>
<%@page import="sangchu.category.vo.CatLargeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String jsonData = (String) request.getAttribute("jsonData");
out.println(jsonData);
%>