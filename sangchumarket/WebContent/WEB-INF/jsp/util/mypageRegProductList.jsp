<%@page import="sangchu.mypage.vo.RegTradeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.06 10:08
 	
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.11 11:08
 	
 	수정내역
 	2023.08.11 11:08 김석호 - 페이지에서 JSON객체 생성용 jsp로 전환 및 디렉토리 위치 변경
 	
 	
 	본인이 등록한 거래글 목록을 JSON객체로 처리해주기 위한 JSP 파일입니다.
--%>
<%
	response.setContentType("application/json; charset=utf-8");
	List<RegTradeVO> list = (List<RegTradeVO>)request.getAttribute("resultList");
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