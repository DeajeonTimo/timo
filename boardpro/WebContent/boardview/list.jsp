<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    //서블릿에서 저장한 데이터 꺼내기
    
    List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
    int startp = (Integer)request.getAttribute("start");
    int endp = (Integer)request.getAttribute("end");
    int totalp = (Integer)request.getAttribute("total");
    
    JsonObject obj = new JsonObject();
    obj.addProperty("sp", startp);
    obj.addProperty("ep", endp);
    obj.addProperty("tp", totalp);
    
    Gson gson = new Gson();
    JsonElement jele = gson.toJsonTree(list);
    obj.add("datas", jele);
    //String result = gson.toJson(list);

   // out.print(result);
    out.print(obj);
    out.flush();
    
    
    %>