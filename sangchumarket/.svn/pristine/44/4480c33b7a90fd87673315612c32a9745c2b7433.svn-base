<%@page import="sangchu.category.vo.CatLargeVO"%>
<%@page import="sangchu.category.vo.CatMiddleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//작성자 :김보영
//카테고리 부르는 jsp

List<CatMiddleVO> miList = (List<CatMiddleVO>)request.getAttribute("miResult");
List<CatLargeVO> laList = (List<CatLargeVO>)request.getAttribute("laResult");

%>
[
<%
// 	if(miList == null && laList == null){
		
// 	}else{
		
		for(int i=0; i<laList.size(); i++){
			CatLargeVO vo = laList.get(i);
			if(i>0) out.print(",");
%>
			{
				"c_largecat"   : "<%= vo.getC_largecat() %>",
				"c_name"   : "<%= vo.getC_name() %>",
				
				"miList" : [
					<%
						int cnt = 0;
						for(int j=0; j<miList.size(); j++){
							CatMiddleVO lvo = miList.get(j);
							if( lvo.getC_largecat().equals(vo.getC_largecat() ) ){
								if(cnt>0) out.print(",");
					%>
						{
							
							"c_largecat"   : "<%= lvo.getC_largecat() %>",
							"c_middlecat"   : "<%= lvo.getC_middlecat() %>",
							"c_name"   : "<%= lvo.getC_name() %>"
						}	
						
					<%
								cnt++;	
							}
						}		
					%>
				]
			}	
<%			
		}
// 	}
%>
]