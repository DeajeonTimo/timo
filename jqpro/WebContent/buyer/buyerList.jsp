<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
		String name = request.getParameter("name");

		BuyerServiceImpl service = BuyerServiceImpl.getInstance();

		BuyerVO vo = service.selectAllByName(name);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/buyer/buyerView.jsp").forward(request,response);

%>