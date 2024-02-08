<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>거래기록..</title>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.12 13:03
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.12 13:03
	
	미완성
	
	수정 내역
	
	마이페이지 우측 기본페이지 하단 거래이력 버튼을 눌렀을 때 출력하는 화면입니다.
 -->
<% MemberVO vo = (MemberVO) session.getAttribute("memVO");
	if(vo==null){
	    out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	String email = vo.getEmail();
	String nickname = vo.getU_nick();
%>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h4><%=nickname %>님이 등록하신 글</h4>
	<div id="regList-self" class="row px-xl-5 pb-3">
	</div>
	<hr>
	<h4>다른 사람의 글</h4>
	<div id="regList-nam" class="row px-xl-5 pb-3">
	</div>
</body>
<script>
	$(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/tradeLogList.do",
			data : "email=<%=email%>",
			dataType : 'json',
			success : function(res){
				var selfcode = "";
				var namcode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						commonCode="";
						commonCode += '<div class="col-lg-3 col-md-4 col-sm-6 pb-1"><a class="text-decoration-none" href="<%=request.getContextPath()%>/prodDetailView.do?id=';
						commonCode += v.t_no+'"><div class="cat-item d-flex align-items-center mb-4"><div class="overflow-hidden" style="width: 100px; height: 100px;"><img class="img-fluid" src="<%=request.getContextPath()%>/productImageView.do?src=';
						commonCode += v.t_no+'" alt="<%=request.getContextPath()%>/images/defaultUserImage.png"></div><div class="flex-fill pl-3"><h6>';
						commonCode += v.tb_title+'</h6><small class="text-body">';
						commonCode += v.tl_finalprice+'원<br>거래일 ';
						commonCode += v.tl_tdate+'</small></div></div></a></div>';
						if(v.email=="<%=email%>"){
							selfcode += commonCode;
						}else{
							namcode += commonCode;
						}
					});
				}else{
					selfcode += '<h6><%=nickname%>님의 등록글에서 거래이력이 없습니다</h6>';
					namcode += '<h6>다른 사람의 글에서 거래이력이 없습니다</h6>';
				}
				$('#regList-self').append(selfcode);
				$('#regList-nam').append(namcode);
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			},
			type : 'post'
		});
	});
	
	
	
</script>
</html>