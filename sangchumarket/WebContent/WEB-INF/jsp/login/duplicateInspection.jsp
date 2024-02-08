<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String res = (String)request.getAttribute("result");
	
if(res==null){
%>

{"sw" : "가입가능"}

<%
}else{
%>

{"sw" : "가입불가능"}

<%
}
%>