<%@page import="sangchu.qnaBoard.vo.QNABoardVO"%>
<%@page import="java.util.List"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="true"%>
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

 <style>
        .enquiryUsers_wrap {
            margin: 40px auto;
        }
        
        .enquiryUsers-title {
            margin-bottom: 30px;
        }
        
        .enquiryUsers-title strong {
            font-size: 2.3rem;
        }
        
        .enquiryUsers-table tbody tr:hover {
            background-color:  #03cd5e98;
            transition: 0.3s ease-in-out;
            cursor: pointer;
        }
        .enquiryUsers-table td {
            text-align: center;
        }

        .enquiryUsers-table td:nth-child(2) {
            max-width: 10px;
            overflow : hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        .align-middle{
        text-align: center;}
/* .report-row.has-stopdate { */
/*     background-color: rgba(128, 128, 128, 0.5); */
/*     text-decoration: line-through; */
/* } */

.modi-row px-xl-5{
background-color: white;
margin-bottom: 50px;
}
 
 </style>   
   
<meta charset="UTF-8">
<title>상추마켓 관리자-신고관리</title>
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
                    <span class="breadcrumb-item active">신고내역 관리</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Cart Start -->
    <div class="container-fluid">
     <div class="modi-row px-xl-5">
        <div class="enquiryUsers_wrap">
        
            <div class="enquiryUsers-title">
                <strong>전체 신고목록</strong>
            </div>
    
          <table id="enquiryUsers-table"  class="table table-light table-borderless table-hover text-center mb-0">
               <colgroup>
                   <col width="10%" />
                   <col width="30%" />
                   <col width="25%" />
                   <col width="25%" />
                   <col width="10%" />
               </colgroup>
               <thead class="thead-dark">
                <tr>
                    <th  class="align-middle">신고번호</th>
                    <th  class="align-middle">신고내용</th>
                    <th  class="align-middle">신고자</th>
                    <th  class="align-middle">신고대상자</th>
                    <th  class="align-middle">정지일 설정상태</th>
              </tr>
              </thead>
                 <tbody id="listBody">
              </tbody>
            </table>	
        </div>
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
<script>
		 $(function(){
			 getReportList();
			
			 function getReportList() {
					var code="";
					$.ajax({
						url		: "<%=request.getContextPath()%>/getReportList.do",
						type	: 'get',
						dataType: 'json',
						success: function(res) {
							 if(res.sw=="no"){
								 alert('신고글이 존재하지 않습니다.')
							 }else{ //조회결과 있는경우 => list를 가져와서 출력
								 $.each(res.datas, function(i, v){
									 code += `
										  <tr class="report-row ${v.u_stopdate ? 'has-stopdate' : ''}">
										    <td class="align-middle" id="e_no">${v.e_no}</td> 
										    <td class="align-middle">${v.e_accuser}</td>
										    <td class="align-middle">${v.email}</td>
										    <td class="align-middle">${v.e_target}</td>
										    <td class="align-middle">${v.u_stopdate ? '<span style="color: #28a745;">설정완료</span>' : '대기중'}</td>
										  </tr>
										`;
						               
							 	})///$.each 반복문
							 }//if-else문 끝
							 
						$('#listBody').append(code);
						},// 바깥쪽 ajax success 끝
						error : function(xhr){
							alert('상태 : ' + xhr.status)
						}
					})//ajax 끝
			  }//function getReportList
			  
			  $(document.body).delegate('.report-row', 'click', function() {
				  var row = $(this).closest('tr'); //클릭된 버튼이 속한 행
				  var eNoStr = row.find('td:eq(0)').text().trim();
		    	  $('.enquiryUsers_wrap').load(`<%=request.getContextPath()%>/getOneEnquiry.do?eNo=${eNoStr}`);
			  });
		});
</script>
</html>