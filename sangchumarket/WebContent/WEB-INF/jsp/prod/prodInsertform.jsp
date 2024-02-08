<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>상품등록폼</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/header.css" rel="stylesheet">
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/owl.carousel.min.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="/js/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/main/bootstrap.bundle.min.js"></script>
<script src="/js/main/easing.min.js"></script>
<script src="/js/main/owl.carousel.min.js"></script>
<script src="/js/main/main.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3ac9186683ff6ff0e2596f7637c4b94&libraries=services"></script>
	
</head>

<body style="background: #ffffff">

	<!-- 헤드 시작 -->

	
<%    String email="";

MemberVO memVO = (MemberVO)session.getAttribute("memVO");

if(memVO != null){
	email = memVO.getEmail();
}
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
 
    <div id="header">
        <a class=logoSection href="main.html">
            <img src="/images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
            <p class="font" >상추마켓</p>
        </a>

        <div class="searchBoxSection">
            <!-- 검색해서 동기방식 jsp로 이동 -->
            <form action="#" class="search" method="get">
                <input class="searchBoxInput" type="text" placeholder="상품명, 지역명 입력" maxlength="40">
                <input type="image" class="searchButtonImage" src="/images/search.png">
            </form>
        </div>

<% 
	if(memVO == null){  //회원로그인이 안되어있을때
%>
        <div class="mypageNZzim">
            <div class="mypageNZzim_img">

                <a href="<%=request.getContextPath() %>/loginMain.do">
                    <img src="/images/Main_Header_MyPage.png" alt="마이페이지">
                </a>
                <a href="<%=request.getContextPath() %>/loginMain.do">
                    <img src="/images/Main_Header_Heart.png" alt="찜">
                </a>
            </div>
        </div>
    </div>
<% 
	}else{ //회원로그인이 되어있을때
%>    
    <div class="mypageNZzim">
            <div class="mypageNZzim_img">

                <a href="<%=request.getContextPath() %>/mypageView.do">
                    <img src="/images/Main_Header_MyPage.png" alt="마이페이지">
                </a>
                <a href="mypage.html">
                    <img src="/images/Main_Header_Heart.png" alt="찜">
                </a>
                
            </div>
        </div>
    </div>
<% 
	}
%>     

    
    <br>


	<!-- 헤드 끝 -->


	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a
						class="breadcrumb-item text-dark" href="#">Shop</a> <span
						class="breadcrumb-item active">Checkout</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Checkout Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8">
				<h5 class="section-title position-relative text-uppercase-main mb-3">
					<span class="bg-secondary pr-3">상품등록</span>
				</h5>
				<form action="<%=request.getContextPath()%>/addTrade.do"
					method="post" enctype="multipart/form-data">
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label><i class="fa fa-image"></i> 상품이미지</label> <input
									class="form-control" type="file" name="file" multiple="multiple">
							</div>
							<div class="col-md-6 form-group">
								<label> </label>
							</div>
							<div class="col-md-6 form-group">
								<label><i class="fa fa-money-check"></i> 제목</label> <input
									class="form-control" type="text" id="tradeTitle" name="tradeTitle">
							</div>
							<div class="col-md-6 form-group">
								<label><i class="fa fa-clipboard-check"></i>구매/판매 선택</label> <select
									class="custom-select" id="tradeType" name="tradeType">
									<option selected value='0'>판매</option>
									<option value='1'>구매</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label><i class="fa fa-won-sign"></i> 가격</label> <input
									class="form-control" type="text" placeholder="가격 입력" id="tradeprice" name="tradeprice">
							</div>
							<div class="col-md-6 form-group">
								<label>네고가능여부</label> <input type="hidden" name="offer" id="hidden_offer" value="0">
								<input style="width:20px; height:20px;" class="form-control" type="checkbox" value="1" id="offer_checkbox" name="offer_checkbox" onclick="updateHiddenField()">
							</div>
							<script>
function updateHiddenField() {
    var offerCheckbox = document.getElementById('offer_checkbox');
    var hiddenOffer = document.getElementById('hidden_offer');
    
    if (offerCheckbox.checked) {
        hiddenOffer.value = '1'; // 체크되었을 때 값 설정
    } else {
        hiddenOffer.value = '0'; // 체크되지 않았을 때 값 설정
    }
}
</script>
							<div class="col-md-6 form-group">
								<label><i class="fa fa-clipboard-check"></i>대분류</label>
								<select id="lCategory" class="custom-select">
									
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label><i class="fa fa-clipboard-check"></i>중분류</label>
								<select id="mCategory" name="mCategory" class="custom-select">
								</select>
								<script>
    $(document).ready(function () {
        lCategory(); // 대분류 옵션을 불러오는 함수 호출

        // 대분류가 변경될 때 중분류 업데이트
        $('#lCategory').on('change', function () {
            var lCategoryValue = $(this).val();
            mCategory(lCategoryValue);
        });
    });

    function lCategory() {
        $.ajax({
            url: "<%= request.getContextPath()%>/lCatList.do",
            type: 'get',
            dataType: 'json',
            success: function (res) {
                var lCategorySelect = $('#lCategory');
                $.each(res, function (i, v) {
                    lCategorySelect.append($("<option></option>")
                        .attr("value", v.c_largecat)
                        .text(v.c_name));
                });

                // 첫 번째 대분류 값을 선택
                var firstLCategoryValue = lCategorySelect.find('option:first').val();
                lCategorySelect.val(firstLCategoryValue);

                // mCategory 함수 호출하여 첫 번째 대분류 값에 해당하는 중분류 업데이트
                mCategory(firstLCategoryValue);
            },
            error: function (xhr) {
                // 에러 처리
            }
        });
    }

    function mCategory(lCat) {
        $.ajax({
            url: "<%= request.getContextPath()%>/mCatList.do",
            type: 'post',
            dataType: 'json',
            data: {
                lCategory: lCat
            },
            success: function (res) {
                var mCategorySelect = $('#mCategory');
                mCategorySelect.empty();

                $.each(res, function (i, v) {
                    mCategorySelect.append($("<option></option>")
                        .attr("value", v.c_middlecat)
                        .text(v.c_name));
                });
            },
            error: function (xhr) {
                // 에러 처리
            }
        });
    }
</script>
							</div>
							<div class="col-md-6 form-group">
							<label><i class="fa fa-image"></i>주소</label><br>
								<input type="text" id="sample5_address" placeholder="주소" readonly>
					<input type="hidden" id="loc" name="loc" placeholder="주소">
	<input type="hidden" id=loc2 name="loc2" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							</div>
							<div id="map" class="col-md-6 form-group"
								style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
							<div class="col-md-6 form-group" id="invisible">
								<label> </label>
							</div>
							<div class="col-md-12 form-group">
								<label><i class="fa fa-money-check"></i>제품 설명</label> <textarea
									class="form-control" style="height:120px; resize: none;" id="tContent" name="tContent" placeholder="제품 상세 설명"></textarea>
							</div>
							<script>
								//전역변수 위도경도 받는용도로 null값으로 두개 선언해
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
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
               var addr = data.address; // 최종 주소 변수
				
                 
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                
                var geocoder = new daum.maps.services.Geocoder();
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                     //여기서 위도 경도 먼저 빼서 전역번수 안에 저장해
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        document.getElementById('loc').value = result.y;
                        document.getElementById('loc2').value = result.x;
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
																			document
																					.getElementById('invisible').style.display = "none";
																		}
																	});
												}
											}).open();
								}
							</script>
							<div class="col-md-12 form-group">
							<input type="submit" value="상품 등록"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Checkout End -->


	<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <div class="title"><img src="../../images/Logo.png" alt="로고.png" class="logo" style="height: 30px;">상추마켓</div><br>
                <p class="mb-4">상호 : 상추마켓 | 대표자명 : 김보영 |<br> </p>
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
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>



</body>
</html>