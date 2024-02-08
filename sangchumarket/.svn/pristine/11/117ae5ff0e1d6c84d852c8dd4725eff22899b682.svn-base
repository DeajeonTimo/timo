<%@page import="sangchu.main.vo.MainProdVO"%>
<%@page import="sangchu.main.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="sangchu.trade.vo.TradeVO"%>
<%@page import="sangchu.tboard.vo.TBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int Jjim = (int) request.getAttribute("Jjim");
String nick = (String) request.getAttribute("nick");
String email = "";

MemberVO memVO = (MemberVO) session.getAttribute("memVO");

if (memVO != null) {
	email = memVO.getEmail();
}
%>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>상추마켓 상품상세페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<style>
.screen_out {
	display: block;
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.wrap_content {
	overflow: hidden;
	height: 330px
}

.wrap_map {
	width: 50%;
	height: 300px;
	float: left;
	position: relative
}

.wrap_roadview {
	width: 50%;
	height: 300px;
	float: left;
	position: relative
}

.wrap_button {
	position: absolute;
	left: 15px;
	top: 12px;
	z-index: 2
}

.btn_comm {
	float: left;
	display: block;
	width: 70px;
	height: 27px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sample_button_control.png)
		no-repeat
}

.btn_linkMap {
	background-position: 0 0;
}

.btn_resetMap {
	background-position: -69px 0;
}

.btn_linkRoadview {
	background-position: 0 0;
}

.btn_resetRoadview {
	background-position: -69px 0;
}
</style>

<style>
#modal {
	display: none;
	position: fixed;
	top: 40%; /* 조정된 위치 */
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	max-width: 100%;
	z-index: 1000;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
}

.modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 25%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 900;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3ac9186683ff6ff0e2596f7637c4b94&libraries=services"></script>
<!-- 이미지 슬라이드 용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/header.css" rel="stylesheet">
</head>
<%
	TBoardVO vo = (TBoardVO) request.getAttribute("vo");
TradeVO tvo = (TradeVO) request.getAttribute("tvo");
String offer = "";
if (vo.getTb_offer().equals("1")) {
	offer = "네고 가능";
} else {
	offer = "네고 불가능";
}
%>
<body style="background: #FFFFFF;">

	<!-- 헤드 시작 -->

	<%
		if (memVO == null) {
	%>

	<div class="topDiv">
		<div class="buttonToLogin">
			<a href="<%=request.getContextPath()%>/loginMain.do">로그인 / 회원가입</a>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="topDiv">
		<div class="buttonToLogin">
			<a href="<%=request.getContextPath()%>/mypageView.do"><%=memVO.getU_nick()%>
				님 환영합니다</a> / <a href="<%=request.getContextPath()%>/">로그아웃</a>
		</div>
	</div>
	<%
		}
	%>

	<div id="header">
		<a class=logoSection href="main.html"> <img src="/images/Logo.png"
			class=logoImg width="40" height="40" alt="상추마켓로고">
			<p class="font">상추마켓</p>
		</a>

		<div class="searchBoxSection">
			<!-- 검색해서 동기방식 jsp로 이동 -->
			<form action="#" class="search" method="get">
				<input class="searchBoxInput" type="text" placeholder="상품명, 지역명 입력"
					maxlength="40"> <input type="image"
					class="searchButtonImage" src="/images/search.png">
			</form>
		</div>

		<%
			if (memVO == null) { //회원로그인이 안되어있을때
		%>
		<div class="mypageNZzim">
			<div class="mypageNZzim_img">

				<a href="<%=request.getContextPath()%>/loginMain.do"> <img
					src="/images/Main_Header_MyPage.png" alt="마이페이지">
				</a> <a href="<%=request.getContextPath()%>/loginMain.do"> <img
					src="/images/Main_Header_Heart.png" alt="찜">
				</a>
			</div>
		</div>
	</div>
	<%
		} else { //회원로그인이 되어있을때
	%>
	<div class="mypageNZzim">
		<div class="mypageNZzim_img">

			<a href="<%=request.getContextPath()%>/mypageView.do"> <img
				src="/images/Main_Header_MyPage.png" alt="마이페이지">
			</a> <a href="mypage.html"> <img src="/images/Main_Header_Heart.png"
				alt="찜">
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
						class="breadcrumb-item active">Shop Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Detail Start -->
	<!-- Carousel -->
	<div class="container-fluid pb-5" style="height:930px;">
		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">

				<!-- Indicators/dots -->
				<div class="carousel-indicators">
					<%
						List<String> imgList = (List<String>) request.getAttribute("imgList");
					for (int i = 0; i < imgList.size(); i++) {
					%>
					<button type="button" data-bs-target="#demo"
						data-bs-slide-to="<%=i%>" <%if (i == 0) {%> class="active" <%}%>></button>
					<%
						}
					%>
				</div>
				<div class="carousel-inner" style="width: 500px; height: 500px;">
					<%
						for (int i = 0; i < imgList.size(); i++) {
					%>
					<div class="carousel-item <%if (i == 0) {%> active <%}%> ">
						<img class="d-block" style="width: 500px; height: 500px;"
							src="<%=request.getContextPath()%>/imageViewMany2.do?id=<%=imgList.get(i)%>"
							alt="Image">
					</div>
					<%
						}
					%>
				</div>
				<!--                         <div class="carousel-item active"> -->
				<!--                             <img class="w-100 h-100" src="img/product-1.jpg" alt="Image"> -->
				<!--                         </div> -->
				<!--                         <div class="carousel-item"> -->
				<!--                             <img class="w-100 h-100" src="img/product-2.jpg" alt="Image"> -->
				<!--                         </div> -->
				<!--                         <div class="carousel-item"> -->
				<!--                             <img class="w-100 h-100" src="img/product-3.jpg" alt="Image"> -->
				<!--                         </div> -->
				<!--                         <div class="carousel-item"> -->
				<!--                             <img class="w-100 h-100" src="img/product-4.jpg" alt="Image"> -->
				<!--                         </div> -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#demo" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<div class="d-flex mb-3">
						<a href="#" class="nav-link dropdown-toggle prod-seller"
							data-toggle="dropdown"><%=nick%></a>
						<div class="dropdown-menu bg-sangchu1 rounded-0 border-0 m-0">
							<a href="#" class="dropdown-item" id="btn-modal">신고하기</a>
						</div>
					</div>
					<hr class="hr-15">
					<h3><%=vo.getTb_title()%></h3>
					<div class="d-flex mb-3">
						<span id="nego" style="color: red"><%=offer%></span>
					</div>
					<h3 class="font-weight-semi-bold mb-4"><%=vo.getTb_price()%></h3>
					<p class="mb-4"><%=vo.getTb_content()%></p>
					<div class="d-flex mb-4"></div>
					<div class="d-flex align-items-center mb-4 pt-2">
						<%
							List<MainProdVO> hotList = (List<MainProdVO>) request.getAttribute("hotList");
						MainProdVO mVo = null;
						for (MainProdVO mpVo : hotList) {
							if (mpVo.getT_no().equals(vo.getT_no())) {
								mVo = mpVo;
							}
						}
						%>
						<button
							class="btn btn-primary px-3 <%="Y".equals(mVo.getJjim()) ? "addJJim" : ""%>"
							onclick="jjimClick('<%=vo.getT_no()%>', this)"
							style="margin-right: 20px;" value="<%=vo.getT_no()%>">
							<i class="fa fa-heart mr-1"></i> 찜
						</button>
						<button class="btn btn-primary px-3" value="<%=vo.getT_no()%>"
							data-tradeNo="<%=vo.getT_no()%>" onclick="newChatLink(this)">
							<i class="fa  mr-1"></i> <img src="/images/img/Logo.png"
								style="height: 20px; <%="Y".equals(Jjim) ? "addJJim" : ""%>">
							상추톡
						</button>

					</div>
					<hr>
					<div>
						<p class="mb-4">
							찜(<span id="Jjim" class="Jjim"><%=Jjim%></span>)
						</p>
						<p class="mb-4">
							조회 수(<%=vo.getTb_cnt()%>)
						</p>
						<p class="mb-4"><%=tvo.getT_date()%></p>
					</div>
				</div>
			</div>
		</div>

		<%-- <div class="row px-xl-5">
			<div class="col">
				<div class="bg-light p-30">
					<div class="nav nav-tabs mb-4">
						<a class="nav-item nav-link text-dark active" data-toggle="tab"
							href="#tab-pane-1">관련 상품</a> <a
							class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-2">지도</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<!-- 관련상품 -->
							<div class="container-fluid py-5">
								<h2
									class="section-title position-relative text-uppercase mx-xl-5 mb-4">
									<span class="bg-secondary pr-3">관련상품</span>
								</h2>
								<div class="row px-xl-5">
									<div class="col">
										<div class="owl-carousel related-carousel">
											<%
												List<TBoardVO> list = (List<TBoardVO>) request.getAttribute("tblist");
											if (list == null || list.size() == 0) {
											%>
											<h1>관련 상품이 없습니다.</h1>

											<%
												} else {
											for (int i = 0; i < list.size(); i++) {
												String tid = list.get(i).getT_no();
												//                     				List<File> file= list.get(i).getFileList();  //(List<File>)request.getAttribute("imagesList");
												//                     				if(file!=null|| file.size()!=0){
												mVo = hotList.get(i);
											%>
											<div class="product-item bg-light">
												<div class="product-img position-relative overflow-hidden">
													<img class="img-fluid w-100"
														src="<%=request.getContextPath()%>/imageViewMany.do?id=<%=tid%>&view=0"
														alt="">
													<div class="product-action">
														<a
															class="btn btn-outline-dark btn-square <%="Y".equals(mVo.getJjim()) ? "addJJim" : ""%>"
															onclick="jjimClick('<%=list.get(i).getT_no()%>', this)"
															href="#none"><i class="far fa-heart"></i></a> <a
															class="btn btn-outline-dark btn-square"
															data-tradeNo="<%=list.get(i).getT_no()%>"
															href="<%=request.getContextPath()%>/newChatRequest.do?tradeNo=<%=list.get(i).getT_no()%>"><i
															class="fa fa-comment"></i></a> <a
															class="btn btn-outline-dark btn-square"
															href="<%=request.getContextPath()%>/prodDetailView.do?id=<%=list.get(i).getT_no()%>"><i
															class="fa fa-search"></i></a>
													</div>
												</div>
												<div class="text-center py-4">
													<a class="h6 text-decoration-none text-truncate"
														href="<%=request.getContextPath()%>/prodDetailView.do?id=<%=list.get(i).getT_no()%>"><%=list.get(i).getTb_title()%></a>
													<div
														class="d-flex align-items-center justify-content-center mt-2">
														<h5><%=list.get(i).getTb_price()%>원
														</h5>
													</div>
													<div
														class="d-flex align-items-center justify-content-center mb-1">
														<small
															style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 180px; height: 30px;">
															<%=list.get(i).getTb_content()%></small>
													</div>
												</div>
											</div>


											<%
												}
											}
											%>
										</div>
									</div>
								</div>
							</div>
							<!-- 관련상품 END-->

						</div>

						<!--리뷰기능 사용 X-->
						<div class="tab-pane fade" id="tab-pane-2">
							<div class="wrap_map">
								<div id="map" style="width: 100%; height: 100%"></div>
								<!-- 지도를 표시할 div 입니다 -->
								<div class="wrap_button">
									<a href="javascript:;" class="btn_comm btn_linkMap"
										target="_blank" onclick="moveKakaoMap(this)"><span
										class="screen_out">지도 크게보기</span></a>
									<!-- 지도 크게보기 버튼입니다 -->
									<a href="javascript:;" class="btn_comm btn_resetMap"
										onclick="resetKakaoMap()"><span class="screen_out">지도
											초기화</span></a>
									<!-- 지도 크게보기 버튼입니다 -->
								</div>
							</div>
							<div class="wrap_roadview">
								<div id="roadview" style="width: 100%; height: 100%"></div>
								<!-- 로드뷰를 표시할 div 입니다 -->
								<div class="wrap_button">
									<a href="javascript:;" class="btn_comm btn_linkRoadview"
										target="_blank" onclick="moveKakaoRoadview(this)"><span
										class="screen_out">로드뷰 크게보기</span></a>
									<!-- 로드뷰 크게보기 버튼입니다 -->
									<a href="javascript:;" class="btn_comm btn_resetRoadview"
										onclick="resetRoadview()"><span class="screen_out">로드뷰
											크게보기</span></a>
									<!-- 로드뷰 리셋 버튼입니다 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
								<h2
									class="position-relative text-uppercase mx-xl-5 mb-4" style="text-align: center;">지도
								</h2><hr>
							<div class="wrap_map">
								<div id="map" style="width: 100%; height: 100%"></div>
								<!-- 지도를 표시할 div 입니다 -->
								<div class="wrap_button">
									<a href="javascript:;" class="btn_comm btn_linkMap"
										target="_blank" onclick="moveKakaoMap(this)"><span
										class="screen_out">지도 크게보기</span></a>
									<!-- 지도 크게보기 버튼입니다 -->
									<a href="javascript:;" class="btn_comm btn_resetMap"
										onclick="resetKakaoMap()"><span class="screen_out">지도
											초기화</span></a>
									<!-- 지도 크게보기 버튼입니다 -->
								</div>
							</div>
							<div class="wrap_roadview">
								<div id="roadview" style="width: 100%; height: 100%"></div>
								<!-- 로드뷰를 표시할 div 입니다 -->
								<div class="wrap_button">
									<a href="javascript:;" class="btn_comm btn_linkRoadview"
										target="_blank" onclick="moveKakaoRoadview(this)"><span
										class="screen_out">로드뷰 크게보기</span></a>
									<!-- 로드뷰 크게보기 버튼입니다 -->
									<a href="javascript:;" class="btn_comm btn_resetRoadview"
										onclick="resetRoadview()"><span class="screen_out">로드뷰
											크게보기</span></a>
									<!-- 로드뷰 리셋 버튼입니다 -->
								</div>
							</div>
	</div>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapCenter = new kakao.maps.LatLng(
	<%=vo.getTb_loc()%>
		,
	<%=vo.getTb_loc2()%>
		), // 지도의 중심 좌표
		mapOption = {
			center : mapCenter, // 지도의 중심 좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도에 올릴 마커를 생성합니다.
		var mMarker = new kakao.maps.Marker({
			position : mapCenter, // 지도의 중심좌표에 올립니다.
			map : map
		// 생성하면서 지도에 올립니다.
		});

		// 지도에 올릴 장소명 인포윈도우 입니다.
		var mLabel = new kakao.maps.InfoWindow({
			position : mapCenter, // 지도의 중심좌표에 올립니다.
			content : '거래 장소' // 인포윈도우 내부에 들어갈 컨텐츠 입니다.
		});
		mLabel.open(map, mMarker); // 지도에 올리면서, 두번째 인자로 들어간 마커 위에 올라가도록 설정합니다.

		var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
		var rv = new kakao.maps.Roadview(rvContainer); // 로드뷰 객체 생성
		var rc = new kakao.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성
		var rvResetValue = {} //로드뷰의 초기화 값을 저장할 변수
		rc.getNearestPanoId(mapCenter, 50, function(panoId) {
			rv.setPanoId(panoId, mapCenter);//좌표에 근접한 panoId를 통해 로드뷰를 실행합니다.
			rvResetValue.panoId = panoId;
		});

		// 로드뷰 초기화 이벤트
		kakao.maps.event.addListener(rv, 'init', function() {

			// 로드뷰에 올릴 마커를 생성합니다.
			var rMarker = new kakao.maps.Marker({
				position : mapCenter,
				map : rv
			//map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올라갑니다.
			});

			// 로드뷰에 올릴 장소명 인포윈도우를 생성합니다.
			var rLabel = new kakao.maps.InfoWindow({
				position : mapCenter,
				content : '거래 장소'
			});
			rLabel.open(rv, rMarker);

			// 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정 합니다.
			var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.

			// 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
			var viewpoint = projection.viewpointFromCoords(rMarker
					.getPosition(), rMarker.getAltitude());
			rv.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정합니다.

			//각 뷰포인트 값을 초기화를 위해 저장해 놓습니다.
			rvResetValue.pan = viewpoint.pan;
			rvResetValue.tilt = viewpoint.tilt;
			rvResetValue.zoom = viewpoint.zoom;
		});

		//지도 이동 이벤트 핸들러
		function moveKakaoMap(self) {

			var center = map.getCenter(), lat = center.getLat(), lng = center
					.getLng();

			self.href = 'https://map.kakao.com/link/map/'
					+ encodeURIComponent('스페이스 닷원') + ',' + lat + ',' + lng; //Kakao 지도로 보내는 링크
		}

		//지도 초기화 이벤트 핸들러
		function resetKakaoMap() {
			map.setCenter(mapCenter); //지도를 초기화 했던 값으로 다시 셋팅합니다.
			map.setLevel(mapOption.level);
		}

		//로드뷰 이동 이벤트 핸들러
		function moveKakaoRoadview(self) {
			var panoId = rv.getPanoId(); //현 로드뷰의 panoId값을 가져옵니다.
			var viewpoint = rv.getViewpoint(); //현 로드뷰의 viewpoint(pan,tilt,zoom)값을 가져옵니다.
			self.href = 'https://map.kakao.com/?panoid=' + panoId + '&pan='
					+ viewpoint.pan + '&tilt=' + viewpoint.tilt + '&zoom='
					+ viewpoint.zoom; //Kakao 지도 로드뷰로 보내는 링크
		}

		//로드뷰 초기화 이벤트 핸들러
		function resetRoadview() {
			//초기화를 위해 저장해둔 변수를 통해 로드뷰를 초기상태로 돌립니다.
			rv.setViewpoint({
				pan : rvResetValue.pan,
				tilt : rvResetValue.tilt,
				zoom : rvResetValue.zoom
			});
			rv.setPanoId(rvResetValue.panoId);
		}
	</script>
	<!-- Shop Detail End -->

	<!-- 신고 Modal Start -->
	<div class="modal-overlay" id="modal">
		<div class="modal-window">
			<div class="title" style="margin: auto;">
				<h2>신고하기</h2>
			</div>

			<!-- Modal body -->
			<div class="content">
				<form name="mfrom" id="mform">

					<input type="hidden" id="num" name="num"> <label>신고대상자</label>
					<input type="text" class="txt" id="writer" name="reported"
						value="<%=tvo.getEmail()%>" readonly> <br> <label>내용</label>
					<br>
					<textarea style="width: 350px; height: 40px; resize: none;"
						class="txt" id="contents" name="contents"></textarea>
					<br> <input type="button" value="전송" id="msend"
						style="float: right;">
				</form>
			</div>

		</div>
	</div>
	<!-- 신고 Modal end -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->

	<!-- Contact Javascript File -->
	<!-- <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script> -->

	<!-- Template Javascript -->
	<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
	<script src="/js/main/bootstrap.bundle.min.js"></script>
	<script src="/js/main/owl.carousel.min.js"></script>
	<script src="/js/main/easing.min.js"></script>
	<script src="/js/main/main.js"></script>

	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<div class="title">
					<img src="../../images/Logo.png" alt="로고.png" class="logo"
						style="height: 30px;">상추마켓
				</div>
				<br>
				<p class="mb-4">
					상호 : 상추마켓 | 대표자명 : 김보영 |<br>
				</p>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>대전광역시 중구 계룡로
					846
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>kdy@ddit.com
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>+010-1234-5678
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>마켓소개</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>안심귀가서비스란?</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>고객센터</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>메인페이지</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>마이페이지</a> <a
								class="text-secondary" href="#"><i
								class="fa fa-angle-right mr-2"></i>커뮤니티</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>이용약관</a> <a
								class="text-secondary" href="#"><i
								class="fa fa-angle-right mr-2"></i>개인정보처리방침</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
						<div class="d-flex">
							<a class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-primary btn-square" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-top mx-xl-5 py-4"
			style="border-color: rgba(256, 256, 256, .1) !important;">
			<div class="col-md-6 px-xl-0">
				<p class="mb-md-0 text-center text-md-left text-secondary">
					© <a class="text-primary" href="#">copyright</a>.상추마켓
				</p>
			</div>
			<div class="col-md-6 px-xl-0 text-center text-md-right">
				<img class="img-fluid" src="images/img/payments.png" alt="">
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	//이미지 지도에 표시할 마커입니다
	$(function() {

		$('#btn-modal').on('click', function() {
			$('#modal').fadeIn();
			$('#modal').addClass('active');
		});

		$('#msend').on('click', function() {
			var reported = $('#writer').val();
			var content = $('#contents').val();

			$.ajax({
				url : '/reportUser.do',
				type : 'POST',
				data : {
					reported : reported,
					contents : content
				},
				success : function(rr) {
					if (rr.sw == "성공") {
						$('#mform')[0].reset();
						closeModal();
					}
				},
				error : function(xhr, status, error) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			});
		});

		function closeModal() {
			$('#modal').fadeOut();
			$('#modal').removeClass('active');
		}

		$('#modal').on('click', function(event) {
			event.stopPropagation();
		});

		$('.modal-overlay').on('click', function(event) {
			if (!$(event.target).closest('.modal-window').length) {
				closeModal();
			}
		});
		
	});
function newChatLink(x){
	   // var tradeNo = $(x).data("tradeNo");
	    var tradeNo = $(x).attr("data-tradeNo");
	    
	    
	    console.log(tradeNo);
	    
	    var servletUrl = "newChatRequest.do";
	    
	    var fullUrl = servletUrl + "?tradeNo=" + tradeNo;
	    
	    $.ajax({
	        url : '<%=request.getContextPath()%>/newChatRequest.do',
		data : "tradeNo=" + tradeNo,
        type : "POST",
        dataType : "json",
        success : function(res) {
        	if(res.sw=="성공"){
            	// 성공 기등록 본인 실패
            	alert('해당 거래글에 새로운 채팅이 개설되었습니다! 마이페이지에서 채팅을 하실 수 있습니다!');
            }else if(res.sw=="기등록"){
            	alert('해당 게시글에 이미 채팅방이 개설되어있습니다!');
            }else if(res.sw=="본인"){
            	alert('회원님이 작성한 게시글입니다!');
            }else{
            	alert('알 수 없는 오류로 채팅방 개설에 실패했습니다!');
            }
        },
        error : function( jqXHR, textStatus, errorThrown ) {

        	alert( textStatus );

        	alert( errorThrown );

       	}
    })
};

var currentJjim =<%=Jjim%>;

//버튼 클릭 시 호출될 함수
function increaseJjimCount() {
	currentJjim++; // Jjim 값을 1 증가시킴

	// span 업데이트
	var jjimSpan = document.getElementById('Jjim');
	jjimSpan.textContent = currentJjim;
}

//버튼 클릭 시 호출될 함수
function decreaseJjimCount() {
	currentJjim--; // Jjim 값을 1 증가시킴

	// span 업데이트
	var jjimSpan = document.getElementById('Jjim');
	jjimSpan.textContent = currentJjim;
}

function jjimClick(t_no , t_this){
	
	//찜이 되어있는 상태
	if($(t_this).hasClass("addJJim")){
		alert("addJJim")
		$.ajax({
			url : "/deleteJJim.do",
			type : 'post',
			data : {
				"email" : "<%=email%>",
				"t_no" 	: t_no
		},
			dataType : 'json',
			success : function(res){
				
				if(res.sw == "성공"){
					alert("찜을 삭제했습니다.");
					var btr = $(t_this);
					btr.removeClass("addJJim");
					btr.blur();
					
					decreaseJjimCount();
				}
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			}
		})
		
	}else{
		alert("no addJJim")
		//찜이 안되어있는 상태
		$.ajax({
			url : "/insertJJim.do",
			type : 'post',
			data : {
				"email" : "<%=email%>",
					"t_no" : t_no
				},
				dataType : 'json',
				success : function(res) {
					if (res.sw == "성공") {
						alert("찜을 추가했습니다.");
						var btr = $(t_this);
						btr.addClass("addJJim");
						btr.blur();

						increaseJjimCount();
						;
					} else {
						alert("로그인 후 이용가능합니다.");
					}
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			})
		}
	}
	
	/*
	 const modal = document.getElementById("modal")
	 const btnModal = document.getElementById("btn-modal")

	 btnModal.addEventListener("click", e => {
	 modal.style.display = "flex"
	 })

	 modal.addEventListener("click", e => {
	 const evTarget = e.target
	 if(evTarget.classList.contains("modal-overlay")) {
	 modal.style.display = "none"
	 }
	 }) */
</script>
</html>