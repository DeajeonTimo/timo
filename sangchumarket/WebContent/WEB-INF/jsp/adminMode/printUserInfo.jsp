<%@page import="sangchu.mypage.service.IMypageService"%>
<%@page import="sangchu.mypage.service.MypageServiceImpl"%>
<%@page import="sangchu.mypage.vo.ReviewVO"%>
<%@page import="sangchu.adminMode.service.AdminModeServiceImpl"%>
<%@page import="sangchu.adminMode.service.IAdminModeService"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</script>
<%
//로그인 세션
MemberVO svo= (MemberVO)session.getAttribute("memVO");
if(svo==null){
	out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
}

//조회할 회원정보 VO
MemberVO memVO = (MemberVO) request.getAttribute("memVO");

IMypageService serviceMypage = MypageServiceImpl.getInstance();
ReviewVO rVo = serviceMypage.getUserTradeInfo(memVO.getEmail());

%>

<script> 
	var geocoderStart;
	
	window.onload = function(){
	var loc1 = <%=memVO.getU_loc()%> ;
	var	loc2 = <%=memVO.getU_loc2()%> ;
	// 좌표 변환용 객체 생성
	geocoderStart = new daum.maps.services.Geocoder();
	// 위도, 경도정보를 가지는 객체 생성
	var coordsStart = new kakao.maps.LatLng(loc1, loc2);
	var printJuso = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
			$('#print-addr').val(result[0].address_name);
			$('#print-addr').text(result[0].address_name);
	        console.log('지역 명칭 : ' + result[0].address_name);
	    }
	};
	geocoderStart.coord2RegionCode(coordsStart.getLng(), coordsStart.getLat(), printJuso);
	}
	
	function goback(){
		location.href="<%=request.getContextPath()%>/manageUsers.do"
	}
	
</script>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 1 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.sigungu; // 시군구 저장
                if(data.bname==null||data.bname==""){
                	addr += " " + data.bname1;
                }else{
                	addr += " " + data.bname;
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("print-addr").value = addr;
                // 주소로 상세 정보를 검색
                geocoderStart.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        console.log(result.y,result.x);
                        document.getElementById('loc').value = result.y;
                        document.getElementById('loc2').value = result.x;
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<style>
#span{
color :red;}

.imgDiv{
display : flex;
flex-direction : row;
justify-content : center;
align-items : center;
padding : 30px;
background-color : #ffffff;
margin-bottom: 15px;
margin-right: 20px;
width: 100%;
}

.duttonsDivs{
    padding-left: 225px;
}

/* 회원 이미지 */
.majorInfoSection-img img {
	width: 150px;
	height: 150px;
	padding: 10px 10px 10px 10px;
	margin-top: 30px;
	margin-bottom: 15px;
}

/*거래 통계*/
.memberTradeInfo{
	margin-left: 20px
}
</style>
<body style="background: #ffffff">

  <!-- Contact Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase-main mx-xl-5 mb-4"><span class="bg-secondary pr-3">회원정보</span></h2>
        <div class="row px-xl-5" style="margin-left: 13%; width: 110%;">
            <div class="col-lg-7 mb-5">
            	<div class="imgDiv">
            		<div class="majorInfoSection-img">
					<img alt="회원이미지" src="<%=request.getContextPath() %>/imageViewforChat.do?email=<%=memVO.getEmail()%>" class="rounded-circle">
					</div>
					<div class="memberTradeInfo">
							<div class="review-title">회원 거래내역 통계</div>
							<div class="review">
								<div class="rVO">
								 판매수 &nbsp;&nbsp;&nbsp; <%=rVo.getSell_cnt() %> 건
								</div>
								<div class="rVO">
								구매수 &nbsp;&nbsp;&nbsp; <%=rVo.getBuy_cnt() %> 건
								</div>
								<div class="rVO">
								평점 &nbsp;&nbsp;&nbsp; <%=rVo.getScore() %>점<a href=""></a>
								</div>
							</div>
					</div>
            	</div>
            
            
                <div class="contact-form bg-light p-30">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label1" id="name" data-validation-required-message="Please enter your name" >이메일</label>
                        </div>
                        <div class="control-group control-group-right" >
                            <input type="email" class="form-control" id="email" disabled="disabled" value="<%=memVO.getEmail()%>"
                                required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                    	<div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >이름</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%=memVO.getName() %>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >비밀번호</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%=memVO.getPass()%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >회원상태</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getA_code().equals("1")) {%>이메일 인증 대기 중<%	} else {%>사용 가능<%}	%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        
                     	<%if (memVO.getU_stopdate() != null) {%>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="span" data-validation-required-message="Please enter your name">회원상태2</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="span" disabled="disabled" value="[정지계정]  <%=memVO.getU_stopdate()%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div><%}%>
                        
                          <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >연락처</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_nick() != null) {%><%=memVO.getU_tel()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >마케팅활용동의</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_marketing() != null) {%><%=memVO.getU_marketing()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >생년월일</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_birth() != null) {%><%=memVO.getU_birth()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >성별</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_gender() != null) {%><%=memVO.getU_gender()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >지역</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_loc() != 0) {%><%=memVO.getU_loc()%><%	}%>, <%if (memVO.getU_loc2() != 0) {%><%=memVO.getU_loc2()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                       
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >마지막접속일</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getLogindate() != null) {%><%=memVO.getLogindate()%><%}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                       
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >가입일</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_regdate() != null) {%><%=memVO.getU_regdate()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                       
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >비밀번호변경일</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%if (memVO.getU_update() != null) {%><%=memVO.getU_update()%><%	}%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        
                        <%if (memVO.getU_withdrawdate() != null) {%>
                        <div class="control-group control-group-left" >
                            <label  class="form-control control-label" id="name" data-validation-required-message="Please enter your name" >탈퇴일</label>
                        </div>
                        <div class="control-group control-group-right">
                            <input type="text" class="form-control" id="cm_title" disabled="disabled" value="<%=memVO.getU_withdrawdate()%>"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <%} %>
                        
                        <div class="duttonsDivs">
                            <button class="btn btn-primary py-2 px-4 control-sand" type="button" id="close" onclick="goback()">닫기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


</body>


</html>