<%@page import="sangchu.qnaBoard.vo.QNABoardVO"%>
<%@page import="java.util.List"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email="";

	MemberVO memVO = (MemberVO)session.getAttribute("memVO");
	
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
    <script src="/js/help/helpPage.js"></script>
    
    
    <!-- 아코디언  -->
   <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="slick/slick.min.js"></script>

 
    
    
    
<script>
	
	$(function(){
		
		$(".button").click(function(){
			if(!$(this).next().is(":visible")){
				$.each($(".button"), function(i, ele){
					$(this).next().slideUp();
				})
				$(this).next().slideToggle();
			}
		})
		
		
	});
	
</script>
    
<meta charset="UTF-8">
<title>자주묻는 질문</title>
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
            <a href="<%=request.getContextPath()%>/mypageView.do"><%=memVO.getU_nick() %> 님 환영합니다</a>　/　
            <a href="<%=request.getContextPath()%>/">로그아웃</a>
        </div>
    </div>
<% 
	}
%>   
 
    <div id="header" style="background: #03c75a;">
        <a class=logoSection href="main.html">
            <img src="/images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
            <p class="font" style="color: #ffffff;">상추마켓 자주묻는질문　　　　　　　　　　　　　　　　</p>
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

                <a href="<%=request.getContextPath() %>/mypageView.do">
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
                     <a href="/qnaBoard.do" class="nav-item nav-link" style="margin-left: -310px;">1:1문의하기</a>
                     <a href="/callHelpPage.do" class="nav-item nav-link">자주 묻는 질문</a>
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
                    <a class="breadcrumb-item text-dark" href="/sangchuMain.do">HOME</a>
                    <span class="breadcrumb-item active">고객센터</span>
                    <span class="breadcrumb-item active">자주묻는 질문</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


<div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">회원가입</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">회원정보</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">거래</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="tab-pane-1">
                         	<ul class ="acco-ul" style="margin-left: 5%;">
							  	<li class="acco-li ">
							    	<button class="button fa fa-question-circle">　본인인증 시 이미 가입되어 있는 정보라고 나옵니다.</button>
							    	<p id="menu1" class="content-acco">
							    		상추마켓은 1개의 ID만 실명인증이 가능하기 때문에 인증된 ID를 사용해 주시기 바랍니다.<br><br>
										회원 가입하신 사실을 잊으셨을 경우가 많습니다.<br><br>
										아이디 찾기 또는 비밀번호 찾기를 진행해 주세요.<br><br>
							    	</p>  
							  	</li>
							  	<li class="acco-li">
							    	<button class="button fa fa-question-circle">　로그인 이메일, 비밀번호가 생각나지 않아요.</button>
							    	<p id="menu2" class="content-acco">
										[아이디 찾기] 클릭 시 등록된 이메일 인증을 통해 아이디 확인이 가능합니다.<br><br>
										[비밀번호 재설정] 시에는 아이디 입력/확인 후 휴대폰 본인인증 또는 아이핀 본인인증 이후 재설정 가능합니다.<br><br>
										
										■ 참고사항<br>
										- 비밀번호 설정 시 8~15자의 영문 대/소문자, 숫자, 특수문자 중 2개 이상 조합<br>

										- 사용가능 특수문자 : ! " $ % & ` ( ) + - . / : ; < > + ? @ # [ ] \ ^ _ ' { } ~ |<br>
										
										- 동일하거나 연속된 4자리 이상의 숫자/영문 반복 사용불가<br>
										
										- 아이디, 생일, 전화번호 등 개인정보 사용 불가<br>
										
										- 이전 사용 암호 재사용 불가
											

									</p>  
							  	</li>
							  	<li class="acco-li">
							  	  	<button class="button fa fa-question-circle">　아이디를 여러 개 사용할 수 있나요?</button>
							   		 <p id="menu3" class="content-acco">
							   		 	이메일 인증 후 여러 개의 ID로 가입이 가능합니다.
							   		 </p>  
							  	</li>
							 	 <li class="acco-li">
							    	<button class="button fa fa-question-circle">　회원가입은 어떻게 하나요?</button>
							    	<p id="menu4" class="content-acco">홈페이지 오른쪽 상단에 [회원가입] 버튼을 클릭해 가입해 주세요!</p>  
							 	 </li>
							</ul>
                        </div>
                       <div class="tab-pane fade" id="tab-pane-2">
                           <ul class ="acco-ul" style="margin-left: 5%;">
							  	<li class="acco-li ">
							    	<button class="button a fa fa-question-circle">　고객센터 연락처가 어떻게 되나요?</button>
							    	<p id="menu1" class="content-acco">
							    	관련 문의가 있으실 경우 아래 번호로 문의하시면 자세한 상담이 가능합니다.<br><br>
							    	연락처 : 010-2421-1096
							    	</p>  
							  	</li>
							  	<li class="acco-li">
							    	<button class="button  fa fa-question-circle">　개인정보 관련안내</button>
							    	<p id="menu2" class="content-acco">
										개인정보 이용내역 통지제도<br><br>
										정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 30조의 1, 동법 시행령 제 17조에 의거<br><br>
										서비스 제공을 위해 이용한 고객의 개인정보 내역을 연 1회 안내하는 제도<br><br>
										1. 상추마켓 페이지 최하단 > 개인정보취급방침 클릭 > 페이지 하단 개인정보 이용내역 조회<br><br>
										2. 1년 간 로그인 이력이 없는 경우 개인정보 유효기간 종료<br><br>
										개인정보 유효기간 연장 동의<br><br>
										원칙적으로 1년 간 로그인 이력이 없으면 개인정보 유효기간 종료되나, 유효기간 연장 동의 시 3년으로 연장<br><br>
										1. 나의쇼핑 > 나의설정 > 회원정보 설정 > 개인정보 유효기간 연장 동의<br><br>
										2. 해당 유효기간 동안 1년 간 로그인 이력이 없어도 장기미이용 회원으로 분류되지 않음<br><br>
										개인정보 공유 동의<br><br>
										판매자와 구매자 사이의 원활한 거래이행을 위하여 최소한의 개인정보를 아래와 같이 공유<br><br>
										1. 개인정보를 공유받는자 : 판매자<br><br>
										2. 공유하는 개인정보 항목 : 구매자 성명, 전화번호, ID, 휴대폰 번호, 구매정보, 수취확인 정보(성명, 주소, 전화번호)<br><br>
										3. 개인정보를 공유받은 자의 이용 목적 : 거래의 원활한 진행, 본인의사의 확인, 고객 상담, 불만처리, 배송지 확인 등<br><br>
										4. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관<br><br>
										5. 동의 거부 시 불이익 : 개인정보 공유 동의를 거부할 수 있음 (거부한 경우 구매가 제한될 수 있음)<br><br>
										6. 개인정보 공유 내용은 주문결제 페이지 > 결제하기 버튼 하단에서 확인<br><br>
										인터넷 자기 게시물 접근배제요청(인터넷상 잊힐 권리)<br><br>
										직접 지울 수 없게 된 글, 사진, 동영상 등 게시물에 대해 정보통신서비스 사업자에게 타인의 접근(열람)배제 요청<br><br>
									 	상추마켓은 상품평, 프리미엄 상품평, 판매자에게 문의하신 글 등에 대해 삭제요청 가능<br><br>
										1. 프리미엄 상품평 : PC 경로를 통해 직접 삭제 및 수정 가능(모바일 경로 없음) <br><br>
										2. 판매자 문의글 : 답변 등록 이전까지 직접 삭제 가능<br><br>
										3. 상품평 및 판매자 문의글 : 상추마켓 고객센터(010-2421-1096)로 삭제요청<br><br>
										
										</p>  
							  	</li>
							 	  <li class="acco-li">
							    	<button class="button  fa fa-question-circle">　회원정보를 수정하고 싶어요.</button>
							    	<p id="menu4" class="content-acco">
							    		마이페이지를 클릭후 좌측에서 원하시는 정보를 수정하시면 됩니다.
							    	</p>  
							 	 </li>
							  	<li class="acco-li">
							  	  	<button class="button   fa fa-question-circle">　회원탈퇴는 어떻게 하나요?</button>
							   		 <p id="menu3" class="content-acco">마이페이지 좌측 하단에서 회원탈퇴를 진행할 수 있습니다.</p>  
							  	</li>
							 	 <li class="acco-li">
							    	<button class="button  fa fa-question-circle">　문의게시판, 후기 기재 시 주의해야 할 부분이 있나요.</button>
							    	<p id="menu4" class="content-acco">
							    		상추마켓에서는 당사 약관에 의거하여 게시물을 관리하고 있습니다.<br><br>
										작성된 게시물이 다음 각 호에 해당하는 경우 사전통보 없이 해당 게시물을 삭제하거나 게시자에 대하여 특정 서비스의 이용제한, 이용계약의 해지 등의 조치가 취해질 수 있으니 주의하여 주시기 바랍니다.
							    	
							    	</p>  
							 	 </li>
							 	 
							</ul>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <ul class ="acco-ul" style="margin-left: 5%;">
							  	<li class="acco-li ">
							    	<button class="button fa fa-question-circle">　중고거래 사기를 주의하세요</button>
							    	<p id="menu1" class="content-acco">
							    		당근마켓은 사용자 보호를 위해 다양한 사기 사례를 분석하고 신속하게 대응하고 있어요.<br><br>
							    		이웃에게 손해를 입히는 행위는 근절되어야 해요.<br><br>
							    		사기꾼들은 이웃인 척 접근하여 우리를 속이고, 매일 새롭고 교모해진 사기 수업을 사용해요.<br><br>
							    		우리의 작은 관심으로 사기를 막을 수 있어요.<br><br>
							    		사기로 의심되는 경우, 신고하기를 통해 알려주세요.<br><br>
							    		
							    	</p>  
							  	</li>
							  	<li class="acco-li">
							    	<button class="button fa fa-question-circle">　거래 분쟁이 발생한 경우 어떻게 해야 할까요?</button>
							    	<p id="menu2" class="content-acco">
							    		상추마켓의 모든 거래는 기본적으로 거래 당사자들끼리 대화를 통해 문제를 해결하도록 안내드리고 있어요.<br><br>
							    		대화를 통해 거래 문제가 해결되지 않는 경우 상대방을 신고해주세요.<br><br>
							    	
									</p>  
							  	</li>
							  	<li class="acco-li">
							  	  	<button class="button  fa fa-question-circle">　사기를 당했을 때는 어떻게 하나요?</button>
							   		 <p id="menu3" class="content-acco">
							   		 	1. 경찰서에 신고하기<br><br>
							   		 	사기죄 신고는 국내법상 피해자가 직접 신고해야 하기 때문에 관할 경찰서의 민원실에 직접 가져서 신고해주셔야 해요<br><br>
							   		 	2.상추마켓이 도와드릴게요!<br><br>
										경찰서에 신고 시 거래 상대방의 개인 정보를 모르는 경우, 수사기관에 상추 마켓으로 관련 공문을 보내 달라고 요청해 주세요<br><br>
							  	</li>
							 	 <li class="acco-li">
							    	<button class="button fa fa-question-circle">　불법/매매부적합 상품 또는 판매자를 신고하려면 어떻게 해야 하나요</button>
							    	<p id="menu4" class="content-acco">
							    		상추마켓은 안전한 거래를 위해 불법/매매부적합 상품 및 거래에 대하여 모니터링을 실시하고 있습니다.<br><br>
										불법/매매부적합 상품 또는 판매자를 발견하신 경우, 아래의 신고 방법에 따라 신고하여 주시기 바랍니다.<br><br>
										상추마켓 판매자 아이디 클릭 후 신고하기 클릭
							    	
							    	</p>  
							 	 </li>
							</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    
  

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