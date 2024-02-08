<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//Controller에서 저장한 데이터꺼내기

List<MemberVO> list = (List<MemberVO>)request.getAttribute("listval");

//출력 - json obj의 배열을 생성

%>
[
<%
	for(int i=0; i<list.size(); i++){
		MemberVO vo = list.get(i);
		if(i>0){out.print(",");}
%>		
		{
			"mem_id" : "<%=vo.getMem_id() %>",
			"mem_name" : "<%=vo.getMem_name() %>",
			"mem_hp" : "<%=vo.getMem_hp() %>"
		}
<%		
	}
%>
]