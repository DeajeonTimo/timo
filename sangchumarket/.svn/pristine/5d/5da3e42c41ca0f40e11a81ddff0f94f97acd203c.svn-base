<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email="";

	MemberVO memVO = (MemberVO)session.getAttribute("memVO");
	
	if(memVO != null){
		email = memVO.getEmail();
	}

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
	
	$(function(){
		
		//문의게시글 작성
		$('#sendMessageButton').on('click', function(){
		
			$.ajax({
				url : "/insertQNABoard.do",
				type : 'post',
				data : {
					"cm_no" 		: "D",
					"cm_cat"		: "4",
					"email"			: "<%=email%>",
					"cm_title"		: $('#cm_title').val(),
					"cm_content"	: $('#cm_content').val(),
					"cm_hit"		: "0"
				},
				dataType : 'json',
				success : function(res){
					if(res.sw =="성공"){
						alert("문의글이 등록되었습니다.")
						location.href="/qnaBoard.do"
						
					}else{
						alert("변경실패");
					}
				},
				error : function(xhr){
					alert("등록실패")
				}
			})
		});
		
		
		//취소
		$('#NotsendMessageButton').on('click', function(){
			
			location.href="/qnaBoard.do"
			
		});

	})
	
	








</script>




<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body style="background: #ffffff">

<%    
	if(memVO == null){  

%> 
    <div class="topDiv">
        <div class="buttonToLogin">
            <a href="<%=request.getContextPath()%>/loginMain.do">로그인 / 회원가입</a>
        </div>
    </div>
<%
	}else{
%>   

    <div class="topDiv">
        <div class="buttonToLogin">
            <a href="<%=request.getContextPath()%>/mypageMain.do"><%=memVO.getU_nick() %> 님 환영합니다</a>　/　
            <a href="<%=request.getContextPath()%>/">로그아웃</a>
        </div>
    </div>
<% 
	}
%>   
 
    <div id="header" style="background: #03c75a;">
        <a class=logoSection href="main.html">
            <img src="/images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
            <p class="font" style="color: #ffffff;">상추마켓 고객센터 　　　　　　　　　　　　　　　　　　</p>
        </a>

        <div>
          
        </div>

<% 
	if(memVO == null){  //회원로그인이 안되어있을때
%>
        <div class="mypageNZzim2">
            <div class="mypageNZzim_img">

                <a href="<%=request.getContextPath() %>/loginMain.do">
                    <img src="/images/mypagewhite.png" alt="마이페이지">
                </a>
                <a href="<%=request.getContextPath() %>/loginMain.do">
                    <img src="/images/heartwhite.png" alt="찜">
                </a>
            </div>
        </div>
    </div>
<% 
	}else{ //회원로그인이 되어있을때
%>    
    <div class="mypageNZzim2">
            <div class="mypageNZzim_img">

                <a href="<%=request.getContextPath() %>/mypageMain.do">
                    <img src="/images/mypagewhite.png" alt="마이페이지">
                </a>
                <a href="mypage.html">
                    <img src="/images/heartwhite.png" alt="찜">
                </a>
                
            </div>
        </div>
    </div>
<% 
	}
%>     

    <!-- 헤드 끝 -->

    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                     <a href="#" class="nav-item nav-link" style="margin-left: -310px;">1:1문의하기</a>
                     <a href="#" class="nav-item nav-link">자주 묻는 질문</a>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">HOME</a>
                    <span class="breadcrumb-item active">고객센터</span>
                    <span class="breadcrumb-item active">1:1문의하기</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

  <!-- Contact Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase-main mx-xl-5 mb-4"><span class="bg-secondary pr-3">상추마켓이 도와드릴게요!</span></h2>
        <div class="row px-xl-5" style="margin-left: 13%; width: 110%;">
            <div class="col-lg-7 mb-5">
                <div class="contact-form bg-light p-30">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label1" id="name" data-validation-required-message="Please enter your name" >이메일</label>
                        </div>
                        <div class="control-group control-group-right" >
                            <input type="email" class="form-control" id="email" disabled="disabled" value="<%=memVO.getEmail() %>"
                                required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                    	<div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >제목</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" placeholder="제목을 입력하세요"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >내용</label>
                        </div>
                        <div class="control-group control-group-right">
                            <textarea class="form-control" rows="8" id="cm_content" placeholder="내용을 입력하세요"
                                required="required"
                                data-validation-required-message="Please enter your message"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4 control-sand" type="button" id="sendMessageButton">문의 전송</button>
                            <button class="btn btn-primary py-2 px-4 control-sand" type="button" id="NotsendMessageButton" style="margin-left: 10px;">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
  


    <!--푸터시작-->
 	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <div class="title"><img src="../../images/Logo.png" alt="로고.png" class="logo" style="height: 30px;">상추마켓</div><br>
                <p class="mb-4">상호 : 상추마켓 | 대표자명 : 김석호 |<br> </p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>대전광역시
                        중구 계룡로 846</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>kdy@ddit.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+010-1234-5678 </p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>마켓소개</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>안심귀가서비스란?</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>고객센터</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>메인페이지</a>
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>마이페이지</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>커뮤니티</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>이용약관</a>
                            <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>개인정보처리방침</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                        <div class="d-flex">
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-secondary">
                    © <a class="text-primary" href="#">copyright</a>.상추마켓
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
 	
 	<!-- 푸터 끝 -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>



</body>
</html>