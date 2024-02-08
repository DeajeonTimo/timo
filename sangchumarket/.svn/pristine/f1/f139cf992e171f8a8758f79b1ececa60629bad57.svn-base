<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.20 ?
	
	마이페이지 어딘가에 있는.. 거래제시를 관리하는 페이지입니다. 
 -->

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>거래 제시 관리...</title>
<style>
table *{
	text-align : center;
	border-top : 1px solid black;
	border-bottom : 1px solid black;
}
tr * {
	padding : 2px;
}
</style>
</head>
<body>
	<h2>받은 거래 제의</h2>
	<table>
		<thead>
			<tr>
				<th>거래글 제목</th>
				<th>대화 상대 닉네임</th>
				<th>거래 가격</th>
				<th>거래 일자</th>
				<th>제시 승낙 하기</th>
			</tr>
		</thead>
		<tbody id="offer-list-body">
			
		</tbody>
	</table>
	<hr>
	<h4>거래 시, 승낙 후 거래해야 기록이 남아 사후관리를 받으실 수 있습니다.</h4>
	
</body>
<script>
	$(function(){
		// 제시 목록을 가져오는 ajax
		$.ajax({
			url : "<%=request.getContextPath()%>/getOffer.do",
			type : 'post',
			dataType : 'json',
			success : function(res){
				commonCode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						commonCode += "<tr>"
						commonCode += '<td>'+v.tb_title+'</td>';
						commonCode += '<td>'+v.u_nick+'</td>';
						commonCode += '<td>'+v.o_price+'</td>';
						commonCode += '<td>'+v.o_date+'</td>';
						commonCode += '<td><button type="button" idx="'+v.c_no+'" onclick="tryTradeWithThisOffer(this)">제시 수락</button></td>';
						commonCode += "</tr>"
					});
				}else{
					commonCode += '<tr><td colspan="5"><h4>받은 거래 제의가 없습니다.</h4></td>'
					commonCode += "</tr>"
				}
				$('#offer-list-body').html(commonCode);
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			}
		})
		
		
		
		
	});//$function끝
function tryTradeWithThisOffer(x){
	let offercno = $(x).attr('idx');
	$.ajax({
		url : "<%=request.getContextPath()%>/offerManage.do",
		data : "cno="+offercno,
		dataType : 'json',
		type : 'post',
		success : function(res){
			if(res.sw=="성공"){
				alert('거래를 수락했습니다!');
				location.href="<%=request.getContextPath()%>/mypageView.do";
			}else{
				alert('어딘가오류');
				location.href="<%=request.getContextPath()%>/goErrorPage.do?error=SomethingError";
			}
		},
		error : function(xhr){
			alert('오류 : '+xhr.status);
		}
	});
}
</script>
</html>