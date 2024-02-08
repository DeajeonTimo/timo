<%@page import="com.google.gson.Gson"%>
<%@page import="sangchu.main.vo.MainProdVO"%>
<%@page import="sangchu.tboard.vo.TBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//작성자 :김보영
//메인 상품 불러올때 공통으로 쓰이는 jsp

List<MainProdVO> list = (List<MainProdVO>)request.getAttribute("result");

%>
[
<%
	if(list != null){
		
		for(int i=0; i<list.size(); i++){
			MainProdVO vo = list.get(i);
			if(i>0) out.print(",");
	
	
%>
			{
				"t_no"   		: "<%= vo.getT_no() %>",
				"tb_title" 		: "<%= vo.getTb_title() %>",
				"tb_content"   	: "<%= vo.getTb_content() %>",
				"tb_cnt" 		: "<%= vo.getTb_cnt() %>",
				"tb_loc" 		: "<%= vo.getTb_loc() %>",
				"tb_loc2" 		: "<%= vo.getTb_loc2() %>",
				"tb_price" 		: "<%= vo.getTb_price() %>",
				"tb_offer" 		: "<%= vo.getTb_offer() %>",
				"email" 		: "<%= vo.getEmail() %>",	
				"c_middlecat" 	: "<%= vo.getC_middlecat() %>",
				"t_type" 		: "<%= vo.getT_type() %>",
				"t_date" 		: "<%= vo.getT_date() %>",
				"t_recentdate" 	: "<%= vo.getT_recentdate() %>",
				"t_state" 		: "<%= vo.getT_state() %>",
				"v_date"		: "<%= vo.getV_date() %>",
				"jjim"			: "<%= vo.getJjim() %>"
			
			}	
<%		}	
	}
%>

]