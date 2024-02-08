<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
	
	//Service 객체 얻기
	MemberServiceImpl service = MemberServiceImpl.getService();

	//Service 메서드 호출 - 결과값 받기
	List<MemberVO> memberList = service.getAllMember();

	
	//결과값을 request에 저장
	request.setAttribute("listval", memberList);
	//결과값을 출력 - view 페이지로 이동
	
	//결과값을 공유 - forward
	request.getRequestDispatcher("/0119/MemberView.jsp").forward(request, response);

%>

