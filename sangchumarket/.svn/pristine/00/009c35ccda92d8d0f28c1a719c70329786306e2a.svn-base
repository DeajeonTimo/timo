<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.16 15:00
	
	
	마이페이지에서 블랙리스트를 관리하는 페이지입니다. 
 -->
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>블랙리스트..관리..</title>
</head>
<body>
	<table id="for-print-blacklist">
		<thead>
			<tr>
				<th>차단 대상의 닉네임</th>
				<th>차단 일자</th>
				<th>차단 해제</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
<script>
	$(function(){
		// 처음 로딩시 ajax로 회원의 차단목록을 먼저 가져온다.
		
		$.ajax({
			url : "<%=request.getContextPath()%>/mypageBlackList.do",
			data : "command=load",
			dataType : 'json',
			type : 'post',
			success : function(res){
				commonCode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						commonCode += '<tr>';
						commonCode += '<td>' + v.u_nick + '</td>';
						commonCode += '<td>' + v.p_date + '</td>';
						commonCode += '<td><button idx="' + v.p_email + '" type="button" onclick="setFree(this)">차단해제</button></td>';
						commonCode += '</tr>';
					});
					
				}else{
					commonCode += '<tr><td colspan="3"><h4>차단목록이 없습니다.</h4></td></tr>';
				}
				$('tbody').append(commonCode);
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			}
		}) // ajax 끝..
		
		
	})//$function끝 위치
	// 파라미터 명 : targetforfree
function setFree(x){
	let targetforfree = $(x).attr('idx');
	let targetTr = $(x).parents('tr');
	$.ajax({
		url : "<%=request.getContextPath()%>/mypageBlackList.do",
		data : "command=remove&targetforfree="+targetforfree,
		dataType : 'json',
		type : 'post',
		success : function(res){
			if(res.sw=="성공"){
				targetTr.remove();
				let sizefor = $('tbody').html();
				if(sizefor==null||sizefor==""){
					$('tbody').append('<tr><td colspan="3"><h4>차단목록이 없습니다.</h4></td></tr>');
				}
			}else{
				alert('알 수 없는 오류로 차단 해제에 실패했습니다.');
			}
		},
		error : function(xhr){
			alert('오류 : '+xhr.status);
		}
	});
}
</script>
</html>