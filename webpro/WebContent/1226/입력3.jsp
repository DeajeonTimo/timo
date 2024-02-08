<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{
 color : red;
}
table{
   border : 1px solid blue;
   margin : 50px;
 }
 td{
   width : 100px;
   height : 50px;
 }
 .cont{
    width : 300px;
 }
</style>
</head>
<body>
<h1>JSP : Java Server Page</h1>

<%
  request.setCharacterEncoding("UTF-8");

  String userName  = request.getParameter("name");
  String title = request.getParameter("title");
  String area = request.getParameter("area"); //엔터기호(\r\n)가 포함 
  
  String cars1 = request.getParameter("cars1");
  String[] cars2 = request.getParameterValues("cars2");
  
  String str ="";
  for(String car : cars2){
	  str += car + "<br>";
  }
  area =  area.replaceAll("\n", "<br>");
  
    //db처리 - CRUD 
    
    //결과값으로 응답페이지를 생성 
%>

<table border="1">
  <tr>
    <td>이름</td>
    <td class="cont"><%= userName %></td>
  </tr>
  
  
   <tr>
    <td>제목</td>
    <td class="cont"><%= title %></td>
   </tr>
  
  <tr>
    <td>내용</td>
    <td class="cont"><%= area %></td>
  </tr>
  
   <tr>
    <td>자동차1</td>
    <td class="cont"><%= cars1 %></td>
  </tr>
  
  
   <tr>
    <td>자동차2</td>
    <td class="cont"><%= str %></td>
  </tr>
  
</table>

</body>
</html>



















