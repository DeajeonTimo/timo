<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
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
//String prodId = request.getParameter("id"); 

//직렬화된 데이터를 stream을 이용하여 가져온다.
StringBuffer buf = new StringBuffer();
String line = null;
BufferedReader reader = request.getReader();
while((line = reader.readLine())!=null){
	buf.append(line);
}
String reqdata = buf.toString();
Gson gson = new Gson();
ProdVO pvo = gson.fromJson(reqdata, ProdVO.class);
String prodId = pvo.getProd_id();

ProdServiceImpl service = ProdServiceImpl.getInstance();
ProdVO vo = service.selectById(prodId);
request.setAttribute("vo", vo);
request.getRequestDispatcher("/0122/prodView2.jsp").forward(request,response);

%>

</body>
</html>