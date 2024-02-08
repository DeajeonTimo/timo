<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table{
  border : 7px solid skyblue;
  border-spacing : 20px;
  padding : 10px;
}
tr{
}
td{
  /* 위쪽, 왼쪽, 오른쪽 선 속성 없음으로 설정  */
  border-top-style: none;
  border-left-style: none;
  border-right-style: none;
  border-bottom : 1px solid skyblue;
  width : 65px;
  height : 50px;
  margin : 50px;
  text-align : center;
}
/* div.dd{
  border-style : solid;
  border-bottom-style: solid;
  border-bottom-color: pink;
  width: 50px;
  height: 50px;
  padding: 10px;
} */
</style>

</head>
<body>

<div>
  <table border="1">
  <% request.setCharacterEncoding("UTF-8");
     int dan = Integer.parseInt(request.getParameter("dan"));
     for(int i = 1; i <= 9; i++) { 
  %>
    <tr>
      <td><%= dan %></td>
      <td>*</td>
      <td><%= i %></td>
      <td>=</td>
      <td><%= dan * i %></td>
    </tr>
    <%} %>
  </table>
</div>

</body>
</html>