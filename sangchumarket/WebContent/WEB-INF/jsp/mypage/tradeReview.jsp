<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>
	.starpoint_box .star_radio{
		width : 0px;
		height : 0px;
		opacity: 0;
		position : absolute;
	}
	.for-the-king {
		filter : grayscale(100%);
	}
</style>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<title>거래후기...</title>
<!--
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.12 15:00
	
	최근 수장자 : 김석호
	최근 수정일 : 2023.08.13 21:12
	
	수정내역
	2023.08.13 21:12 - 김석호 : 스타일 태그 및 내용 추가
	
	마이페이지 우측 기본페이지에 하단에 표시될 거래후기 페이지입니다. 
 -->
<%
	/* 로그인 유저의 정보를 이곳에서 풀어헤친다!! */
	MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	String email = vo.getEmail();
	String nickname = vo.getU_nick();
%>
</head>
<body>
	<h4><%=nickname %>님이 준 상추</h4>
	<div id="given-sangchu" class="row px-xl-5 pb-3">
	</div>
	<hr>
	<h4><%=nickname %>님이 받은 상추</h4>
	<div id="taken-sangchu" class="row px-xl-5 pb-3">
	</div>
</body>
<script>
	$(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/tradeReview.do",
			data : "email=<%=email%>",
			dataType : 'json',
			success : function(res){
				givenCode = "";
				takenCode = "";
				if(res.sw=="ok"){
					$.each(res.datas,function(i,v){
						commonCode = "";
						commonCode += '<div><div class="col-lg-12 col-md-4 col-sm-6 pb-1"><a class="text-decoration-none" href="<%=request.getContextPath()%>/prodDetailView.do?id=';
						commonCode += v.t_no+'"><div class="cat-item d-flex align-items-center mb-4"><div class="overflow-hidden" style="width: 100px; height: 100px;"><img class="img-fluid" src="<%=request.getContextPath()%>/productImageView.do?src=';
						commonCode += v.t_no+'" alt="<%=request.getContextPath()%>/images/defaultUserImage.png"></div><div class="flex-fill pl-3"><h6>';
						commonCode += v.tb_title+'</h6><small class="text-body">';
						commonCode += v.tl_finalprice+'원<br>거래일 ';
						commonCode += v.tl_tdate+'</small></div></div></a></div><br>';
						// 작성자가 본인일때
						if(v.email=="<%=email%>"){
							// 받은 평가가 null이 아닌경우
							if(v.sc_taken!=null){
								commonCode += '<div class="starpoint_wrap">받은평점';
								for(i = 1 ; i<=v.sc_taken ; i++){
									commonCode += '<img src="<%=request.getContextPath()%>/images/o_reviewpoint.png" alt="상추">';
								}
								commonCode += '</div>';
							}else{
								commonCode += '<div class="starpoint_wrap">상대가 아직 평가 전입니다.</div>';
							}
							if(v.sc_given!=null){ // 준 평가가 null이 아닌경우
								commonCode += '<div class="starpoint_wrap">준평점';
								for(i = 1 ; i <= v.sc_given ; i++){
									commonCode += '<img src="<%=request.getContextPath()%>/images/o_reviewpoint.png" alt="상추">';
								}
								commonCode += '</div></div><br>';
							}else{
								// 준 평가가 null인 경우
								commonCode += '<div id="'+v.t_no+'"><input id="' + v.c_no + '" step="1" type="number" max="5" min="1" step="1" pattern="[1-5]" maxlength="1" oninput="numberMaxLength(this)"><button class="review-button" idx="'+v.c_no+'" onclick="nigamondenalpyonggahae(this)">평가하기</button></div>';
							}
							takenCode += commonCode; 
						}else{
							// 작성자가 본인이 아닌경우
							// 준 평가가 null이 아닌경우
							if(v.sc_taken!=null){
								commonCode += '<div class="starpoint_wrap">준 평점';
								let getS = parseInt(v.sc_taken);
								for(i = 1 ; i<=getS ; i++){
									commonCode += '<img src="<%=request.getContextPath()%>/images/o_reviewpoint.png" alt="상추">';
								}
								commonCode += '</div>';
							}else{
								commonCode += '<div id="'+v.t_no+'"><input id="' + v.c_no + '" step="1" type="number" max="5" min="1" step="1" pattern="[1-5]" maxlength="1" oninput="numberMaxLength(this)"><button class="review-button" idx="'+v.c_no+'" onclick="nigamondenalpyonggahae(this)">평가하기</button></div>';
								
							}
							if(v.sc_given!=null){ // 준 평가가 null이 아닌경우
								commonCode += '<div class="starpoint_wrap">받은 평점';
								let getS = parseInt(v.sc_given);
								for(i = 1 ; i <= getS ; i++){
									commonCode += '<img src="<%=request.getContextPath()%>/images/o_reviewpoint.png" alt="상추">';
								}
								commonCode += '</div>';
							}else{
								// 준 평가가 null인 경우
								commonCode += '<div class="starpoint_wrap">상대가 아직 평가 전입니다.</div>';
							}
							givenCode += commonCode; 
						}
					}); //each함수 끝
				}
				// sw가 no일때 및 뭐가 없을때
				if(givenCode==""){
					givenCode += '<h6>다른 사람의 글에 준 상추가 없습니다.</h6>';
				}
				if(takenCode==""){
					takenCode += '<h6><%=nickname%>님의 등록글에서 받은 상추가 없습니다.</h6>';
				}
				$('#given-sangchu').append(givenCode);
				$('#taken-sangchu').append(takenCode);
				
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			},
			type : 'post'
		});
		 $("input[type='radio']").change(function() {
			 $('.sangc').addClass('for-the-king');
		        if ($(this).is(":checked")) {
		            var vidx = $(this).attr('value');
		            var vid = $(this).attr("id");
		            var gogo = vid.slice(0, -1);
		            for(i = 1;i <= vidx;i++){
		            	$("label[for='" + gogo + i + "']>img").removeClass("for-the-king");
		            }
		        }
		    });
	});
function nigamondenalpyonggahae(x){
	let vidx = $(x).prev();
	let vcno = $(x).attr('idx');
	let vscore = $(vidx).val();
	if(vscore!=null&&vscore!=""){
		$.ajax({
			url : "<%=request.getContextPath()%>/afterTrade.do",
			data : {"score":vscore,"cno":vcno},
			dataType : 'json',
			type : 'post',
			success : function(res){
				if(res.sw=="성공"){
					alert('평가 완료했습니다!');
					location.href="<%=request.getContextPath()%>/mypageView.do";
				}else{
					alert('알 수 없는 오류로 평가에 실패했습니다!');
				}
			},
			error : function(xhr){
				alert('오류 : '+xhr.status);
			}
		})
	}else{
		alert('뭔가 오류');
	}
	
}
function numberMaxLength(x){
	if(x.value.length > 1 || x.value > 5){
		x.value = 5;
	}else if(x.value<1){
		x.value = 1;
	}
}


</script>	
</html>