<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="sangchu.qnaBoard.vo.QNABoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//작성자 :김보영
//메인 상품 불러올때 공통으로 쓰이는 jsp

List<QNABoardVO> list = (List<QNABoardVO>)request.getAttribute("result");
int startp = (Integer)request.getAttribute("startpage");
int endp = (Integer)request.getAttribute("endpage");
int totalp = (Integer)request.getAttribute("totalpage");

JsonObject obj = new JsonObject(); 
obj.addProperty("sp", startp);
obj.addProperty("ep", endp);
obj.addProperty("tp", totalp);

Gson gson = new Gson();
JsonElement ele = gson.toJsonTree(list);
obj.add("datas", ele);




String result = gson.toJson(list);

response.setContentType("application/json; charset=utf-8");
out.print(obj);
    
%>    
    
    