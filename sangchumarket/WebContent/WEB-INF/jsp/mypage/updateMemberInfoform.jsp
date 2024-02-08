<%@page import="sangchu.main.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.13 21:05
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.14 20:00
	
	미완성
	
	수정내역
	2023.08.14 02:34 - 김석호 : 스크립트 꼬인거 풀고 load함수가 아닌 location.href 로드로 바꿈
	2023.08.14 20:00 - 김석호 : 일단 css빼곤 완성
	
	마이이지 우측에 표시할 회원정보 수정 페이지입니다.
 -->
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet">
<style>
	body {
		padding-left: 100px;
		padding-top: 100px;
	}
	.rounded-circle {
	    border-radius: 50%!important;
	    display : inline-block;
	    width : 300px;
	    height : 300px;
	}
	#change-image, .loc {
		width : 0px;
		height : 0px;
		opacity: 0;
	}
</style>
<title>회원정보 수정폼~</title>
<%
	/* 로그인 유저의 정보를 이곳에서 풀어헤친다!! */
	MemberVO vo= (MemberVO)session.getAttribute("memVO");
	if(vo==null){
		out.println("<script>location.href='"+request.getContextPath()+"/loginsessionError.do'</script>");
	}
	
%>
</head>



<body>
<h4>회원 정보 수정</h4>
<form id="uppdateform" method="post" action="<%=request.getContextPath() %>/memberUpdateForm.do" enctype="multipart/form-data">
	<input type="hidden" value="<%=vo.getEmail() %>" id="email" name="email">
	<table>
		<thead>
			<tr>
				<td colspan="4" rowspan="4">
					<img alt="회원이미지" src="<%=request.getContextPath() %>/imageViewforChat.do?email=<%=vo.getEmail() %>" class="rounded-circle">
				</td>
			</tr>
			
		</thead>
		<tbody>
			<tr>
				<td class="half" colspan="2">
					<button id="for-select-file" type="button">이미지 등록</button>
					<input id="change-image" type="file" name="profile" accept="image/*" />
				</td>
				<td class="half" colspan="2">
					<button type="button" id="remove-image">이미지 제거</button>
				</td>
			</tr>
			<tr>
				<td class="hankan">이름</td>
				<td colspan="3">
					<%=vo.getName() %>
				</td>
			</tr>
			<tr>
				<td class="hankan">닉네임</td>
				<td colspan="3"><%=vo.getU_nick() %></td>
			</tr>
			<tr>
				<td class="hankan">연락처</td>
				<td colspan="3">
					<input type="tel" placeholder="- 없이 입력해주세요" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength='11' name="u_tel" value="<%=vo.getU_tel()%>">
				</td>
			</tr>
			<tr>
				<td class="hankan">주소</td>
				<td colspan="3">
					<input type="text" id="print-addr" placeholder="주소" value="" readonly>
					<input type="text" class="loc" id="loc" name="loc" value="<%=vo.getU_loc()%>">
					<input type="text" class="loc" id="loc2" name="loc2" value="<%=vo.getU_loc2()%>">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
				</td>
			</tr>
			<tr>
				<td class="half" colspan="2"><input type="submit" value="수정하기"></td>
				<td class="half" colspan="2"><input type="button" id="goMypageMain" value="돌아가기"></td>
			</tr>
		</tbody>
	</table>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
</form>

<!-- ************************************************************************************ -->
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3ac9186683ff6ff0e2596f7637c4b94&libraries=services"></script>
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
var geocoderStart;
	window.onload = function(){
		
		
		var loc1 = <%=vo.getU_loc()%> ;
		var	loc2 = <%=vo.getU_loc2()%> ;
		// 좌표 변환용 객체 생성
		geocoderStart = new daum.maps.services.Geocoder();
		// 위도, 경도정보를 가지는 객체 생성
		var coordsStart = new kakao.maps.LatLng(loc1, loc2);
		var printJuso = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
				$('#print-addr').val(result[0].address_name);
		        //console.log('지역 명칭 : ' + result[0].address_name);
		    }
		};
		geocoderStart.coord2RegionCode(coordsStart.getLng(), coordsStart.getLat(), printJuso);
		
		
		
		
		//***************이미지파일 업로드 관련 스크립트*****************************
	    var readURL = function (input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
            	   $('.rounded-circle').attr('src',e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
         }
		$('#remove-image').on('click',function(){
			$('#change-image').val("");
			// 여기서 기본이미지로 만들어줌
			$('.rounded-circle').attr('src',"");
		});


		$('#for-select-file').on('click',function(){
			$('#change-image').trigger('click');
		});
		  
		$('#change-image').on('change', function (event) {
			readURL(this);
		});
		
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
    document.getElementById('goMypageMain').addEventListener('click',function(){
    	location.href="<%=request.getContextPath()%>/mypageMain.do";
    });
</script>
</html>