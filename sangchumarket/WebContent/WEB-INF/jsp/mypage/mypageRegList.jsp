<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>등록글 목록..</title>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.11 09:44
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.12 13:24
	
	수정 내역
	2023.08.11 10:47 - 김석호 : 거래글 타입에 따라 분류
	2023.08.12 13:24 - 김석호 : 로그인세션 처리
	
	마이 페이지 우측 기본페이지 하단에 표기되는 화면중 등록상품에 관한 화면입니다.
 -->
<% MemberVO vo = (MemberVO) session.getAttribute("memVO");
	if(vo==null){
	    out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	String email = vo.getEmail();
%>
</head>
<body>
	<h4>판매글</h4>
	<div id="regList-sell" class="row px-xl-5 pb-3">
	</div>
	<hr>
	<h4>구매글</h4>
	<div id="regList-buy" class="row px-xl-5 pb-3">
	</div>
</body>
<script>
	$(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/regList.do",
			data : "email=<%=email%>",
			dataType : 'json',
			success : function(res){
				var selcode = "";
				var buycode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						commonCode="";
						commonCode += '<div class="col-lg-3 col-md-4 col-sm-6 pb-1"><a class="text-decoration-none" href="<%=request.getContextPath()%>/prodDetailView.do?id=';
						commonCode += v.t_no+'"><div class="cat-item d-flex align-items-center mb-4"><div class="overflow-hidden" style="width: 100px; height: 100px;"><img class="img-fluid" src="<%=request.getContextPath()%>/productImageView.do?src=';
						commonCode += v.t_no+'" alt="<%=request.getContextPath()%>/images/defaultUserImage.png"></div><div class="flex-fill pl-3"><h6>';
						commonCode += v.tb_title+'</h6><small class="text-body">';
						if(v.t_state=="0"){
							commonCode += '거래 대기'
						}else if(v.t_state=="1"){
							commonCode += '거래 중'
						}else{
							commonCode += '거래 완료'
						}
						commonCode += '</small></div></div></a></div>';
						if(v.t_type=="0"){
							selcode += commonCode;
						}else{
							buycode += commonCode;
						}
					});
					if(selcode==""){
						selcode += '<h6>판매 등록글이 없습니다</h6>';
					}
					if(buycode==""){
						buycode += '<h6>구매 등록글이 없습니다</h6>';
					}
				}else{
					selcode += '<h6>판매 등록글이 없습니다</h6>';
					buycode += '<h6>구매 등록글이 없습니다</h6>';
				}
				$('#regList-sell').append(selcode);
				$('#regList-buy').append(buycode);
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			},
			type : 'post'
		});
	});
	
	
	
</script>
</html>