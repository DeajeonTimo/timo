<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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
//String lgu = request.getParameter("gu");
//JSON.stringfy({"prod_lgu" : guvalue}) 형식의 직렬화 데이터
StringBuffer buf = new StringBuffer();
String line = null;
BufferedReader reader = request.getReader();
while((line = reader.readLine())!=null){
	buf.append(line);
}

String reqdata = buf.toString(); //{"prod_lgu" : "p101"}

//역직렬화 (객체 형태로 변환)
Gson gson =new Gson();
ProdVO vo = gson.fromJson(reqdata, ProdVO.class);
String lgu = vo.getProd_lgu();

//service 객체 얻기
IProdService service = ProdServiceImpl.getInstance();

//service 메소드 호출 - 결과값 받기 - List<ProdVO>
List<ProdVO> list = service.selectByLgu(lgu);

//결과값을 request에 저장
request.setAttribute("list", list);
//view페이지로 이동
request.getRequestDispatcher("/0122/prodView.jsp").forward(request,response);
%>
</body>
</html>