<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

StringBuffer buf = new StringBuffer();
String line = null;
BufferedReader reader = request.getReader();
while((line = reader.readLine())!=null){
	buf.append(line);
}

String reqdata = buf.toString(); //{"prod_lgu" : "p101"}

//역직렬화 (객체 형태로 변환)
Gson gson =new Gson();
MemberVO vo = gson.fromJson(reqdata, MemberVO.class);

//service 객체 얻어오기
MemberServiceImpl service  = MemberServiceImpl.getService();

//service 메소드 호출 - 결과값 받기
int res = service.insertMember(vo);

//결과값을 requset에 저장
request.setAttribute("res", res);

//view페이지로 이동
request.getRequestDispatcher("/member/joinView.jsp").forward(request, response);

%>
    