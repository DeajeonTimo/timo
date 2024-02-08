<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>찜목록..</title>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.10 ?
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.12 13:06
	
	수정 내역
	css 이동, 확인용 alert문 삭제 
	2023.08.12 13:06 - 김석호 : 로그인 세션불러오기 및 처리
 -->
<% MemberVO vo = (MemberVO) session.getAttribute("memVO");
	if(vo==null){
	    out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	String email = vo.getEmail();
%>




</head>
<body>
	<div id="jjimList">
	</div>
</body>
<script>
	/* 출력문 만드는 위치 $('#subcontent') */
	$(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/jjimList.do",
			data : "email=<%=email%>",
			dataType : 'json',
			success : function(res){
				var jjcode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						if(v.t_state=="0"){
							jjcode += '<div class="col-lg-3 col-md-4 col-sm-6 pb-1"><a class="text-decoration-none" href="<%=request.getContextPath()%>/prodDetailView.do?id=';
							jjcode += v.t_no+'"><div class="cat-item d-flex align-items-center mb-4"><div class="overflow-hidden" style="width: 100px; height: 100px;"><img class="img-fluid" src="<%=request.getContextPath()%>/productImageView.do?src=';
							jjcode += v.t_no+'" alt="이미지가없어요..?"></div><div class="flex-fill pl-3"><h6>';
							jjcode += '</h6><small class="text-body">';
							jjcode += v.tb_title+'</small>';
							jjcode += '</div></div></a></div>';
						}
					});
				}else{
					jjcode += '<h4>찜한 상품이 없습니다</h4>';
				}
				if(jjcode==""){
					jjcode += '<h4>찜한 상품이 없습니다</h4>';
				}
				$('#jjimList').append(jjcode);
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			},
			type : 'post'
		});
	});
	
	
	
</script>
</html>