<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
private Connection conn = null;
private ResultSet rs = null;
private PreparedStatement ps = null;

private String driver = "oracle.jdbc.driver.OracleDriver";
private String url = "jdbc:oracle:thin:@localhost:1521:xe";
private String user = "NSJ";
private String password = "java";
%>

<%
    
	request.setCharacterEncoding("UTF-8");
	//입력한 id값 을 가져온다
   String userId = request.getParameter("id");
   
   //OracleDriver클래스를 로드시킨다 
   
 	Class.forName(driver);

   //db 연결객체
   conn= DriverManager.getConnection(url,user, password);
   
   //sql쿼리문 작성
   String sql =" SELECT MEM_ID FROM MEMBER WHERE MEM_ID=? ";
   
    //실행 객체 
   ps = conn.prepareStatement(sql);
    
   //실행문에 값 셋팅
   ps.setString(1, userId);
   
   
   //실행 
   rs =  ps.executeQuery();
   
   //실행결과 비교하기 - 사용가능 불가능 상테를 출력
   String answer="";
   if(rs.next()){
	   answer += "사용 불가능";
   }else{   
	   answer += "사용 가능";
  }
 %>
 
 <%=answer %>

</body>
</html>









