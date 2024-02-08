<%@page import="sangchu.adminMode.vo.EnquiryVO"%>
<%@page import="sangchu.qnaBoard.vo.QNABoardVO"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberVO svo= (MemberVO)session.getAttribute("memVO");
if(svo==null){
	out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
}

EnquiryVO vo = (EnquiryVO)request.getAttribute("vo");
%> 
   
<!DOCTYPE html>
<html>
<head>
<!-- Customized Bootstrap Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/owl.carousel.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- JavaScript Libraries -->
    <script src="/js/jquery/jquery-3.7.0.min.js"></script>
    <script src="/js/main/owl.carousel.min.js"></script>
    <script src="/js/main/bootstrap.bundle.min.js"></script>
    <script src="/js/main/easing.min.js"></script>
    <script src="/js/main/owl.carousel.min.js"></script>
    <script src="/js/main/main.js"></script>

<script type="text/javascript">	

function closeWindow(){
	location.href ='<%=request.getContextPath()%>/reportUsers.do' ;
}


function setStopdate(){
	var inputdate = $('#date').val();
		$.ajax({
			url :  "<%=request.getContextPath()%>/setStopdate.do",
			type	: 'get',
			dataType: 'json',
			data : {
				"target" : "<%=vo.getE_target()%>",
				"inputdate" 	: inputdate
			},
			success : function(res){
				if(res.sw=="성공"){
				alert('회원정지일이 저장되었습니다.');
				$(this).closest('tr').attr('id', 'completed');
				}else{
					alert('회원정지일 저장 실패')	
				}
				location.href ='<%=request.getContextPath()%>/reportUsers.do' ;
			}, 
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
			
		})//ajax 끝
}//setSopdate function 끝

</script>

<meta charset="UTF-8">
<title>상추마켓 관리자 정지일설정창</title>
	
</head>

<style>
#save{
margin-left: 230px}

</style>
<body style="background: #ffffff">

  <!-- Contact Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase-main mx-xl-5 mb-4"><span class="bg-secondary pr-3">신고글 상세</span></h2>
        <div class="row px-xl-5" style="margin-left: 13%; width: 110%;">
            <div class="col-lg-7 mb-5">
                <div class="contact-form bg-light p-30">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label1" id="name" data-validation-required-message="Please enter your name" >신고 번호</label>
                        </div>
                        <div class="control-group control-group-right" >
                            <input type="email" class="form-control" id="email" disabled="disabled" value="<%=vo.getE_no() %>"
                                required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                    	<div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >신고자</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%=vo.getEmail() %>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >신고대상자</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%=vo.getE_target()%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >신고내용</label>
                        </div>
                        <div class="control-group control-group-right">
                            <textarea class="form-control" rows="8"  placeholder="내용을 입력하세요"
                                required="required"
                                data-validation-required-message="Please enter your message" disabled="disabled"><%=vo.getE_accuser()%></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <div class="control-group control-group-left" >
                            <label  style="margin-top: 175px;" class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >정지일</label>
                        </div>
                        
                        
                        <div class="control-group control-group-right">
                            <textarea class="form-control" rows="1" id="date" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="8" placeholder="정지날짜입력 ex)20230102"
                                required="required"
                                data-validation-required-message="Please enter your message" ></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="duttonsDivs">
                             <button class="btn btn-primary py-2 px-4 control-sand" id="save"  type="button"onclick="setStopdate()">저장</button>
                            <button class="btn btn-primary py-2 px-4 control-sand" type="button" onclick="closeWindow()" id="NotsendMessageButton" style="margin-left: 10px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


</body>
</html>