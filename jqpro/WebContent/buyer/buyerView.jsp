<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BuyerVO vo =  (BuyerVO)request.getAttribute("vo");
%>
 			{
 				"buyer_id" : "<%=vo.getBuyer_id()%>",
 				"buyer_name" : "<%=vo.getBuyer_name()%>",
 				"buyer_lgu" : "<%=vo.getBuyer_lgu()%>",
 				"buyer_bank" : "<%= vo.getBuyer_bank() %>",
 				"buyer_bankno" : "<%= vo.getBuyer_bankno() %>",
 				"buyer_bankname" : "<%= vo.getBuyer_bankname() %>",
 				"buyer_zip" : "<%= vo.getBuyer_zip() %>",
 				"buyer_add1" : "<%= vo.getBuyer_add1() %>",
 				"buyer_add2" : "<%= vo.getBuyer_add2() %>",
 				"buyer_comtel" : "<%= vo.getBuyer_comtel() %>",
 				"buyer_fax" : "<%= vo.getBuyer_fax() %>",
 				"buyer_mail" : "<%= vo.getBuyer_mail() %>",
 				"buyer_charger" : "<%= vo.getBuyer_charger() %>",
 				"buyer_telext" : "<%= vo.getBuyer_telext() %>"
 			}
