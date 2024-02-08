<%@page import="sangchu.qnaBoard.vo.QNABoardVO"%>
<%@page import="java.util.List"%>
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
    
	
<script>
	
	$(function(){
		$('#goToSearch').on('click', function(){
			var userEmailInput = $('#userEmailInput').val();
			
			$.ajax({
				url : "<%=request.getContextPath()%>/searchUsers.do",
				data : {"userEmailInput": userEmailInput},
				dataType : 'json',
				
				success : function(res){
					if(res=="noexist"){
						alert('일치하는 회원 정보가 존재하지 않습니다.');
					}else{
						$('#here').load('<%=request.getContextPath()%>/printUserInfo.do?userEmailInput=' + userEmailInput);
					}
				},
				error : function(xhr){
					alert('오류 : '+xhr.status);
				},
				type : 'post'
			})
		})
	})
</script>
    
 <style>
 .modi-row px-xl-5{
 display: flex;
 flex-direction: row;
 justify-content: center;
 align-items: center;
 }
 
 .searchWrap{
	width: 100%;
	height: 100%;
        display: flex;
        flex-direction : column;
         justify-content: center;
        align-items: center;
	}
	
    .searchSection {
        display: flex;
        flex-direction: row;
        background-color: #03cd5d;
        border: 4px solid #03cd5d;
        width: 100% ;
        height: 60px;
        margin : 0px 0px 0px 0px;
    }

    .searchSection:focus-within {
      box-shadow: 0 0 3px #01f36e;
    }

    .searchSection input {
        flex: 20;
        border: none;
        outline: none;
        text-align: center;
        font-size: 20px;
        background-color: #fff;
    }

    .searchSection img{
        width: 30px;
        height: 30px;
        opacity: 60%;
        margin: 4px 5px 0px 10px;
        cursor: pointer;
        align-items: center;
    }
  
 
 
 </style>   
<script>
</script>
    
<meta charset="UTF-8">
<title>상추마켓 관리자페이지</title>
</head>
<body>
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
            <a href="<%=request.getContextPath()%>/mypageMain.do"><%=memVO.getEmail()%> 계정</a>　/　
            <a href="<%=request.getContextPath()%>/">로그아웃</a>
        </div>
    </div>
<% 
	}
%>   
 
    <div id="header" style="background: #03c75a;">
        <a class=logoSection href="<%=request.getContextPath()%>/adminMainPage.do">
            <img src="/images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
            <p class="font" style="color: #ffffff;">상추마켓 관리자모드 　　　　　　　　　　　　　　　　　　</p>
        </a>

        <div>
          
        </div>

<% 
	if(memVO == null){  //회원로그인이 안되어있을때
%>
        <div class="mypageNZzim2">
            <div class="mypageNZzim_img">
            </div>
        </div>
    </div>
<% 
	}else{ //회원로그인이 되어있을때
%>    
    <div class="mypageNZzim2">
            <div class="mypageNZzim_img">
            </div>
        </div>
    </div>
<% 
	}
%>     

    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                     <a href="<%=request.getContextPath()%>/manageUsers.do" class="nav-item nav-link" style="margin-left: -310px;">회원관리</a>
                     <a href="<%=request.getContextPath()%>/reportUsers.do" class="nav-item nav-link">신고내역 관리</a>
                     <a href="<%=request.getContextPath()%>/userStopDate.do" class="nav-item nav-link">회원 계정정지 해제</a>
                     <a href="<%=request.getContextPath()%>/qnaBoardAdmin.do" class="nav-item nav-link">문의관리</a>
                                          <a href="<%=request.getContextPath()%>/adminMainPage.do" class="nav-item nav-link">관리자 메인페이지</a>
                     
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
                    <a class="breadcrumb-item text-dark" href="<%=request.getContextPath()%>/adminMainPage.do">HOME</a>
                    <span class="breadcrumb-item active">회원관리</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="modi-row px-xl-5" id="here">
                         <div class="searchWrap" id="searchWrap">
 						       <div class="searchSection">
          							  <input type="text" id="userEmailInput" placeholder="회원이메일 입력">
          							  <img src="../../images/search.png" id="goToSearch">
       						  </div>
   						</div>
        </div>
        <div class="modi-row px-xl-5">
        </div>
    </div>
    <!-- Cart End -->
	
   <!--푸터시작-->
 	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <div class="title"><img src="../../images/Logo.png" alt="로고.png" class="logo" style="height: 30px;">상추마켓</div><br>
                <p class="mb-4">상호 : 상추마켓 | 대표자명 : 박민주 |<br> </p>
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