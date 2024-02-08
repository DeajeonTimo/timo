<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
 List<LprodVO> list = (List<LprodVO>)request.getAttribute("list");
%>
[

<% 
 	for(int i=0; i<list.size(); i++){
 		LprodVO vo = list.get(i);
 		if(i>0) out.print(",");
 %>	
 			{
 				"lprod_id" : "<%= vo.getLprod_id() %>",
 				"lprod_gu" : "<%= vo.getLprod_gu() %>",
 				"lprod_nm" : "<%= vo.getLprod_nm() %>"
 			}
 <% 
		}	 
 %>			
 	

]
