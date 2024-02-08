<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>키워드</title>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.15 00:41
	
	
	키워드를 관리하는 페이지입니다. 
 -->
</head>
<%
	MemberVO vo = (MemberVO) session.getAttribute("memVO");
if(vo==null){
	out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
}
%>
<style>
.for-keyword {
	height : 500px;
	overflow: scroll;
}
.print-list {
}
</style>
<body>
<!-- 바디 전체 시작부 -->
<div class="container-fluid">

<!-- 관심 키워드 부분 -->
	<div class="row for-keyword">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-8">
					<input type="text" id="interest-keyword" placeholder="관심 키워드">
				</div>
				<div class="col-md-4">
					<button type="button" id="insert-inter-keyword">추가이미지</button>
				</div>
			</div>
		</div>
		<hr>
		<!-- 목록 출력부 -->
		<div class="print-list" id="inter-list">
		</div>
	</div>
	<hr>
<!-- 차단 키워드 부분 -->
	<div class="row for-keyword">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-8">
					<input type="text" id="block-keyword" placeholder="차단 키워드">
				</div>
				<div class="col-md-4">
					<button type="button" id="block-inter-keyword">추가이미지</button>
				</div>
			</div>
		</div>
		<hr>
		<!-- 목록 출력부 -->
		<div class="print-list" id="block-list">
		</div>
	</div>
	
	
</div>
</body>
<script>
	$(function(){
		// 처음 로딩시 원래 있는 정보를 먼저 가져온다.
		// ajax1 : 관심키워드
    	$.ajax({
    		url : "<%=request.getContextPath()%>/",
    		data : {"email" : "<%=vo.getEmail()%>", "k_code" : "1"},
    		dataType : 'json',
    		type : 'get',
    		success : function(res){
    			if(res.sw=="ok"){
    				// 리스트가 뭐라도 있을경우?
    				interCode = "";
    				$.each(res.datas,function(i,v){
    					interCode += '<div class="inter-list-detail keyword-list" id="' + v.k_keyword;
    					interCode += '"><button type="button" class="remove">x표시</button></div>';
    				})
    				$('#inter-list').html(interCode);
    			}else{
    				// 리스트가 아예 없을경우?
    				// 아무일도 해주지 않는다..?
    			}
    		},
    		error : function(xhr){
    			alert('오류 : '+xhr.status);
    		}
    	})//ajax1 끝 위치
    	
		// ajax2 : 차단키워드
    	$.ajax({
    		url : "<%=request.getContextPath()%>/",
    		data : {"email" : "<%=vo.getEmail()%>", "k_code" : "2"},
    		dataType : 'json',
    		type : 'get',
    		success : function(res){
    			if(res.sw=="ok"){
    				// 리스트가 뭐라도 있을경우?
    				blockCode = "";
    				$.each(res.datas,function(i,v){
    					blockCode += '<div class="block-list-detail keyword-list" id="'+v.k_keyword;
    					blockCode += '"><button type="button" class="remove">x표시</button></div>';
    				})
    				$('#block-list').html(blockCode);
    			}else{
    				// 리스트가 아예 없을경우?
    				// 아무일도 해주지 않는다..?
    			}
    		},
    		error : function(xhr){
    			alert('오류 : '+xhr.status);
    		}
    	})//ajax2 끝 위치
	//---------- 페이지가 로드되면 처리되는 ajax 2개 끝 -------------------------------------------------------
    	
	});// $function끝위치
   </script>
</html>