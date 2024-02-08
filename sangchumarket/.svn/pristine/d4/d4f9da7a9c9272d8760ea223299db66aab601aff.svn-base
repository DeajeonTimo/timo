<%@page import="sangchu.mypage.vo.ReviewVO"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<!--
	최초 작성자 : 김석호
 	최초 작성일 : 2023.08.06 02:42
 	
 	최근 수정자 : 김석호
 	최근 수정일 : 2023.08.13 02:00
 	
 	미완성
 	
 	수정 내역
 	2023.08.10 10:19 - 김석호 : 세션 풀어헤쳐서 로그인 유저 갖고오는 방식 스크립트릿 추가
 	2023.08.10 13:26 - 김석호 : 찜리스트 로케이션 추가
 	2023.08.11 11:04 - 김석호 : 등록상품 버튼 로케이션 변경
 	2023.08.12 10:45 - 김석호 : 로그인세션 만료 처리
 	2023.08.12 15:04 - 김석호 : 닉네임변경 자바스크립트 js파일로 분리, 거래이력 로케이션 추가
 	2023.08.12 15:17 - 김석호 : JS분리시 vo객체 분해 및 전역변수 선언 문제로 버전 롤백
 	2023.08.12 15:30 - 김석호 : 거래후기버튼 로케이션 추가
 	2023.08.13 02:00 - 김석호 : 기본 거래관련 출력문 수정
 	
 	마이 페이지 우측에 표시되는 기본 페이지입니다.
 -->
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지 메인 기본값</title>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		
		
		
		// 등록 상품 버튼
		$('#regproduct').on('click',function(){
			$('#subcontent').empty();
			$('#subcontent').load("<%=request.getContextPath()%>/regList.do");
		});
		
		// 거래이력 버튼
		$('#tradelog').on('click',function(){
			$('#subcontent').empty();
			$('#subcontent').load("<%=request.getContextPath()%>/tradeLogList.do");
		});
		
		// 찜목록 버튼
		$('#jjimlist').on('click',function(){
			$('#subcontent').empty();
			$('#subcontent').load("<%=request.getContextPath()%>/jjimList.do");
		});
		
		// 상추톡 버튼
		$('#sangchutalk').on('click',function(){
			$('#subcontent').empty();
			$('#subcontent').load("<%=request.getContextPath()%>/openSangchuTalk.do");
		});
		
		// 거래후기 버튼
		$('#scoreboard').on('click',function(){
			$('#subcontent').empty();
			$('#subcontent').load("<%=request.getContextPath()%>/tradeReview.do");
		});
		
		$('#regproduct').trigger('click');
	});
</script>
</head>
<style>

	#nickname {
		display : inline-block;
	}
	#update-nickname, #nickname{
		vertical-align: top;
		margin-top : 10px;
	}
	.rounded-circle {
	    border-radius: 50%!important;
	    display : inline-block;
	    width : 200px;
	    height : 200px;
	}
	.logo {
		width : 20px;
		heigth : 20px;
	}
	.btn {
	    display: inline-block;
	    font-weight: 400;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    user-select: none;
	    border: 1px solid transparent;
	    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    float : left;
	}
	.btn-secondary {
	    color: #fff;
	    background-color: #6c757d;
	    border-color: #6c757d;
	}
	.btn-group-lg>.btn, .btn-lg {
	    padding: 0.5rem 1rem;
	    font-size: 1.25rem;
	    line-height: 1.5;
	    border-radius: 0.3rem;
	}
	.btn-group>.btn {
    	position: relative;
		width : 20%;
		margin : 0px;
	}
	.btn-group>.btn:first-child {
    	margin-left: 0;
	}
	.btn-group .btn+.btn{
		margin-left: -1px;
	}
	div.row {
		width : 100%;
	}
	.row>* {
		width : 100%;
	}
	.btn-group {
		width : 100%;
	}
	.btn:not(:disabled):not(.disabled) {
    	cursor: pointer;
	}
	.container-fluid-mypagedefault {
		width : 100%;
	}
	#subcontent {
		
	}
	.btn-group btn-group-lg{
		height : 50px;
	}
	#nickBtn {
		text-align : right;
	}
	#for-update-nickname {
		margin : 0px;
		display : inline-block;
	}
</style>
<body>
<%
	/* 로그인 유저의 정보를 이곳에서 풀어헤친다!! */
	MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	String email = vo.getEmail();
	
	ReviewVO rVo = (ReviewVO)session.getAttribute("tradeInfo");
	if(rVo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
%>
	<div class="container-fluid-mypagedefault">
		<div class="row">
			<table>
				<tr>
					<td rowspan="2" style="text-align:center;">
						<img alt="회원이미지" src="<%=request.getContextPath() %>/imageViewforChat.do?email=<%=email %>" class="rounded-circle">
					</td>
					<td>
						<h4 id="print-nickname"><%=vo.getU_nick() %></h4>
						<input type="text" id="for-update-nickname" style="display:none;"><span id="checkresult"></span>
					</td>
					<td id="nickBtn" colspan="3">
						<button type="button" class="" id="check-for-update-nickname" style="display:none;">
							중복검사
						</button>
						<button type="button" class="" id="go-for-update-nickname" style="display:none;">
							확인
						</button>
						<button type="button" class="" id="cancel-for-update-nickname" style="display:none;">
							취소
						</button>
						<button type="button" class="" id="update-nickname">
							닉네임 수정
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<img class="logo" alt="판매로고" src="<%=request.getContextPath()%>/images/sale_button.png"> 판매수 &nbsp;&nbsp;&nbsp; <%=rVo.getSell_cnt() %> 건
					</td>
					<td>
						<img class="logo" alt="구매로고" src="<%=request.getContextPath()%>/images/buy_button.png"> 구매수 &nbsp;&nbsp;&nbsp; <%=rVo.getBuy_cnt() %> 건
					</td>
					<td>
					<!-- 여기서 상추이미지를 누르면 상추 신선도에 대한 설명이 들어간 설명문을 띄워준다. -->
						내 상추 <%=rVo.getScore() %>점<a href=""><img class="logo" alt="상추리뷰" src="<%=request.getContextPath()%>/images/reviewpoint.png"></a>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="btn-group btn-group-lg" role="group">
			<button class="btn btn-secondary" type="button" id="regproduct">
				등록상품
			</button> 
			<button class="btn btn-secondary" type="button" id="tradelog">
				거래이력
			</button> 
			<button class="btn btn-secondary" type="button" id="jjimlist">
				찜 목록
			</button> 
			<button class="btn btn-secondary" type="button" id="sangchutalk">
				상추톡
			</button> 
			<button class="btn btn-secondary" type="button" id="scoreboard">
				거래후기
			</button>
		</div>
		<div id="subcontent">
		</div>
	</div>
</body>
<script>

// 닉네임 중복검사를 위한 변수
var checkForNicknameChange = false;
// 닉네임 정규식..?
const regexForNickName = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]+$/;


$('#update-nickname').on('click',function(){
	$('#for-update-nickname').val($('#print-nickname').text());
	$('#print-nickname').css('display','none');
	$('#update-nickname').css('display','none');
	$('#for-update-nickname').css('display','block');
	$('#check-for-update-nickname').css('display','inline-block');
	$('#go-for-update-nickname').css('display','inline-block');
	$('#cancel-for-update-nickname').css('display','inline-block');
})

$('#cancel-for-update-nickname').on('click',function(){
	checkForNicknameChange = false;
	$('#print-nickname').css('display','block');
	$('#for-update-nickname').css('display','none');
	$('#update-nickname').css('display','inline-block');
	$('#check-for-update-nickname').css('display','none');
	$('#go-for-update-nickname').css('display','none');
	$('#cancel-for-update-nickname').css('display','none');
	$('#checkresult').text('');
})

$('#for-update-nickname').on('change',function(){
	checkForNicknameChange = false;
})

$('#go-for-update-nickname').on('click',function(){
		$('#checkresult').text("");
	if(!checkForNicknameChange){
		$('#checkresult').css('color','red');
		$('#checkresult').text("중복 검사를 진행해주세요");
		return false;
	}
	var email = "<%=vo.getEmail()%>"
	let targetNick = $('#for-update-nickname').val();
	$.ajax({
		url : "<%=request.getContextPath()%>/forChangNickname.do",
		data : "nick="+targetNick,
		dataType : 'json',
		type : 'post',
		success : function(res){
			if(res.sw=="성공"){
				alert('닉네임 변경 성공!');
				location.href="<%=request.getContextPath()%>/mypageMain.do"
			}
		},
		error : function(xhr){
			location.href=`<%=request.getContextPath()%>/goErrorPage.do?error=${xhr.status}`;
		}
	})
	
});
$('#check-for-update-nickname').on('click',function(){
	$('#for-spinner').css('display','inline-block');
	$('#checkresult').text("");
	let targetNick = $('#for-update-nickname').val();
	if(!regexForNickName.test(targetNick)){
		$('#for-spinner').css('display','none');
		$('#checkresult').css('color','red');
		$('#checkresult').text("부적합한 문자 포함");
		return false;
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/forChangNickname.do",
		data : "targetnick="+targetNick,
		dataType : 'json',
		type : 'get',
		success : function(res){
			$('#for-spinner').css('display','none');
			if(res.sw=="실패"){
				$('#checkresult').css('color','green');
				$('#checkresult').text("사용 가능한 닉네임");
				checkForNicknameChange = true;
			}else{
				$('#checkresult').css('color','red');
				$('#checkresult').text("사용중인 닉네임");
			}
		},
		error : function(xhr){
			location.href=`<%=request.getContextPath()%>/goErrorPage.do?error=${xhr.status}`;
		}
	})
})
</script>
</html>