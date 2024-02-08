<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="sangchu.mypage.vo.TradeLogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.12 14:05
 	
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.12 14:05
 	
 	수정내역
 	
 	본인이 거래한 글 목록을 JSON객체로 처리해주기 위한 JSP 파일입니다.
--%>
<%
	response.setContentType("application/json; charset=utf-8");
	List<TradeLogVO> list = (List<TradeLogVO>)request.getAttribute("resultList");
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