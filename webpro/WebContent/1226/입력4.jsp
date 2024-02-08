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
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String content = request.getParameter("content");



%>



<table border="1">
	<tr>
		<td>이름</td>
		<td class="cont"><%=userName %></td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td class="cont"><%=address %></td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td class="cont"><%=email %></td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td class="cont"><%=gender %></td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td class="cont"><%=content %></td>
	</tr>		
</table>

</body>
</html>