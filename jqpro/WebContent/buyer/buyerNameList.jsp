<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BuyerServiceImpl service = BuyerServiceImpl.getInstance();
	
	List<BuyerVO> list = service.selectBuyerName();
	
	request.setAttribute("list", list);
	
	request.getRequestDispatcher("/buyer/buyerNameView.jsp").forward(request,response);
%>
    