<%@page import="sangchu.main.vo.MainProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//작성자 :김보영

List<MainProdVO> list = (List<MainProdVO>)request.getAttribute("result");

%>
[
<%
	if(list == null){
		return;
	}
	for(int i=0; i<list.size(); i++){
		MainProdVO vo = list.get(i);
		if(i>0) out.print(",");
%>
		{
			"t_no"   : "<%= vo.getT_no() %>",
			"tb_title" : "<%= vo.getTb_title() %>",
			"tb_content"   : "<%= vo.getTb_content() %>",
			"tb_cnt" : "<%= vo.getTb_cnt() %>",
			"tb_loc" : "<%= vo.getTb_loc() %>",
			"tb_loc2" : "<%= vo.getTb_loc2() %>",
			"tb_price" : "<%= vo.getTb_price() %>",
			"tb_offer" : "<%= vo.getTb_offer() %>"
		}	
<%			
	}
%>


]
