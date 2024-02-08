<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	LprodServiceImpl service  = LprodServiceImpl.getInstance();

	List<LprodVO> list = service.selctLprod();
	
	request.setAttribute("list", list);
	
	request.getRequestDispatcher("/0119/LprodView.jsp").forward(request, response);


%>
