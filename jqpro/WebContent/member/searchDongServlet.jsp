<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.dao.IMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//요청시 전송 데이터 받기
request.setCharacterEncoding("UTF-8");
String dong = request.getParameter("dong");

//service 객체 얻기
MemberServiceImpl service = MemberServiceImpl.getService();

//service 메소드 호출 - 결과값 받기

List<ZipVO> list = service.selectByDong(dong);

//결과값을 request에 저장
request.setAttribute("list", list);
//view페이지로 이동

request.getRequestDispatcher("/member/dongView.jsp").forward(request, response);


%>

</body>
</html>