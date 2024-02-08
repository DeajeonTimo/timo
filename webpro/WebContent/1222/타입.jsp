<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
  border : 2px solid blue;
}
td{
  width : 300px;
  height : 40px;
  text-align: center;
}
.title{
   background-color : lightgreen;
}
</style>
</head>
<body>
<h1>JSP : Java Server Page </h1>

<%
//전송 데이타 가져오기 

request.setCharacterEncoding("UTF-8");

String userName = request.getParameter("name");
String userMail = request.getParameter("email");
String userTel = request.getParameter("tel");
String userBir = request.getParameter("bir");

%>

<table border="1">
 <tr>
   <td class="title">이름</td>
   <td><%= userName %></td>
 </tr>
 
  <tr>
   <td class="title">전화번호</td>
   <td><%= userTel %></td>
  </tr> 
   
   <tr>
     <td class="title">이메일</td>
     <td><%= userMail %></td>
   </tr>
   
   <tr>
     <td class="title">생일</td>
     <td><%= userBir %></td>
   </tr>
</table>

</body>
</html>