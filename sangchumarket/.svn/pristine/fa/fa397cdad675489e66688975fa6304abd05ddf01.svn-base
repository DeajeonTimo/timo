<%@page import="com.google.gson.Gson"%>
<%@page import="sangchu.category.vo.CatMiddleVO"%>
<%@page import="sangchu.category.vo.CatLargeVO"%>
<%@page import="java.util.List"%>
<%@page import="sangchu.category.service.CategoryServiceImpl"%>
<%@page import="sangchu.category.service.ICategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Welcome!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

		 <script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
	     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
	     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		 <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3ac9186683ff6ff0e2596f7637c4b94&libraries=services"></script>
        
</head>

<body>
    <div>
        <div class="member">
        <form id="memberSubmit" method="post" action="<%=request.getContextPath()%>/signup2.do"  enctype="multipart/form-data">
            <!-- 1. 로고 -->
            <header class="header" role="banner">
                <div class="header_inner">
                    <a class=logoSection href="<%=request.getContextPath()%>/sangchuMain.do">
                        <img src="../../images/Logo.png" class=logoImg width="40" height="40" alt="상추마켓로고">
                        <p class="font">상추마켓</p>
                    </a>
                </div>
                <div class="welcomeMessage">  <%=request.getAttribute("userEmail")%> 님 </div>

            </header>

            <div class="field nickname">
                <b>닉네임<small>(선택)</small></b><span id="placehold-text"></span>
                <div>
                    <input type="text" id="inputNickname" name="inputNickname" placeholder="30자이내로 입력해주세요" required maxlength='30'>
                    <input type="button" id="checkNickname" value="중복검사">
                </div>
                <div class="smallText">*마이페이지에서 변경 가능합니다</div>
            </div>

            <div class="field">
                <b>휴대전화<small>(필수)</small></b>
                <input type="tel"  name="tel" id="tel" placeholder="- 없이 입력해주세요" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength='11'>
                <div class="smallText">*마이페이지에서 변경 가능합니다</div>
            </div>

            <div class="field birth">
                <b>주민등록번호<small>(필수)</small></b>
                <div>
                    <div class="inputGroup--personalNo">
                        <input type="text" id="jumin1"  name="jumin1" maxlength="6" name="personal1" class="personalNo-1" placeholder="주민번호 앞 6자리" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">
                    </div>
                    <div class="juminB">
                        -
                        <input type="text"  id="jumin2" name="jumin2" maxlength="1" placeholder="주민번호 뒷 1자리" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                        <label>●●●●●●</label>
                    </div>
                </div>

            </div>

            <div class="field">
                <b>관심카테고리<small>(선택)</small></b>
                <button id="buttonCat"  class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#demo" type="button">카테고리 펼치기</button>
                <div id="demo" class="collapse">
    			<div id="printLargeCat"></div>
  			</div>
                <div>
                <ul>
                	
                </ul>
                
                </div>
                <div class="smallText">*마이페이지에서 변경 가능합니다</div>
            </div>

            <div class="field">
                <b>대표이미지<small>(선택)</small></b>
                <input type="file" id="" name="file" >
            </div>
            
            <div class="field">
                <b>주소<small>(선택)</small></b>

			<body>
				<input type="text" id="sample5_address" placeholder="주소" name="addr">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>





            <div class="field marketing">
                <b>마케팅 활용 동의</b>
                <div>
                    <label><input type="radio" name="marketing" checked>동의합니다</label>
                    <label><input type="radio" name="marketing">동의하지 않습니다</label>
                </div>
            </div>

			<input type = "hidden" id="email" name="email" value="<%=request.getAttribute("userEmail")%>">
			<input type = "hidden" id="addrX" name="addrX">
			<input type = "hidden" id="addrY" name="addrY">
			
			
			
            <!-- 6. 가입하기 버튼 -->
            <input type="submit" value="가입하기" id="submitSignup">
            </form>

            <!-- 7. 푸터 -->
            <div class="member-footer">
                <div>
                    <a href="#none">이용약관</a>
                    <a href="#none">개인정보처리방침</a>
                </div>
                <span><a href="#none">NAVER Corp.</a></span>
            </div>
         </div>
    </div>
</body>

<script>

//전역변수 위도경도 받는용도로 null값으로 두개 선언해
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
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
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용
						//여기서 위도 경도 먼저 빼서 전역번수 안에 저장해
                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords);
                    
                    var  addrY = results[0].y;//위도
                    var  addrX = results[0].x;//경도
                    
                    document.getElementById("addrY").value=addrY;
                    document.getElementById("addrX").value=addrX;
                }
            });
        }
    }).open();
}


	var flag1 = false; //전송 전 체크를 위한 flag
	
	$(function(){
		
		$('#memberSubmit').submit(function(event) {
		    if (flag1 === false) {
		        alert('닉네임 중복검사를 다시 진행해주세요.');
		        event.preventDefault(); // 폼 제출을 막기 위해 추가
		    }
		});
		
		
		$('#checkNickname').on('click', function(){
			var nickname = $('#inputNickname').val().trim();
			
			if(nickname==""){
				alert('닉네임을 입력해주세요.');
			}else{
			$.ajax({
				url : "<%=request.getContextPath()%>/duplicateInspection.do",
				type : "get",
				data : {"nickname" : nickname},
				
				success : function(data){
					if(data.sw=="가입가능"){
						 $('#placehold-text').fadeIn();
						 $('#placehold-text').text('	●사용가능한 닉네임입니다.');
						 $('#placehold-text').css('color', 'green');
						 flag1 = true;
					}else{
						 $('#placehold-text').fadeIn();
						 $('#placehold-text').text('	※[닉네임중복]사용불가한 닉네임입니다');
						 $('#placehold-text').css('color', 'red')	
					}
				},
				error : function(xhr){
					alert('상태' + xhr.status);	 
				 },
				 dataType : 'json'
			})//ajax 끝
			}
		
			
		}) //$('#checkNickname') 클릭시 이벤트 함수 끝
		
			
		$('#buttonCat').on('click', function(){
			<%
					ICategoryService service = CategoryServiceImpl.getService();
					List<CatLargeVO> listLa = service.selectCatLargeList();
					List<CatMiddleVO> listMi = service.selectCatMiddleList();
			%>
			
			$('#printLargeCat').empty();
			$('#buttonCat').css('backgroundColor', '#2db400');
			if($('#buttonCat').text()==='카테고리 접기'){
				$('#buttonCat').text('카테고리 펼치기');
			}else{
				$('#buttonCat').text('카테고리 접기');
				$('#buttonCat').css('backgroundColor', '#f0f0f0');
				$('#buttonCat').css('border', 'none');
			}
		
			 	var catLaName = [];
			 	
			 	<%
			 	
					for(int i=0; i<listLa.size(); i++){
						CatLargeVO catLaVO = listLa.get(i);
						String name = catLaVO.getC_name(); //선택한 대분류 이름
						String largeCatCode = catLaVO.getC_largecat(); //선택한 대분류 코드
						%>
						  catLaName.push('<%=name%>');
						<%
					}//for문
			%>
			
			for(var i = 0; i < catLaName.length; i++) {
			    $('<div id="showCat" class="showCat"><div id="divv"><p id=showCatP>' + catLaName[i] + '</p><div></div>').appendTo('#printLargeCat');
			}
			//여기까지가 카테고리(접기/펼치기) & 대분류 클릭 시, 중분류 카테고리 펼치기
			
		}) //buttonCat 클릭시 function  끝
		
		
		$('#printLargeCat').on('click', '.showCat', function() {
			
			var selectedCat = $(this).text(); //클릭한 대분류 이름
// 			alert(selectedCat)
			var self = this;
			$.ajax({
				url : '<%=request.getContextPath()%>/getMiCatfromLaCat.do',
				data : {"selectedCat": selectedCat}, //선택한 대분류 이름
				type : "get",
				success(data){
					var code="";
					$.each(data, function(i,v){
						code+= `<div class="miCat" id="\${v.c_name}">
									<label><p>\${v.c_name}</p><input type="checkbox" name="catCheckbox" value="\${v.c_middlecat}" id="\${v.c_name}"/></label>
									</div>
									`;
					})//반복문 끝
					$(self).after(code);
				},
				error(xhr){
					alert('상태 : ' + xhr.status)
				},
				dataType : 'json'
			}) //ajax
			
		})
		
		
	
	}) //$(function() 끝
			
			
</script>
<style>
        /* Google web font CDN*/
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
       
        @font-face {
            /*로고 폰트*/
            font-family: 'GeekbleMalang2WOFF';
            src: url('../../font/GeekbleMalang2WOFF.woff') format('woff');
     	   }

        * {
            box-sizing: border-box;
            /*전체에 박스사이징*/
            outline: none;
            /*focus 했을때 테두리 나오게 */
       		}

	        html{
	            overflow : auto 
	      	  }
	      	  
	        .logoSection {
	            display: inline-flex;
	            flex-direction: row;
	            text-decoration: none;
	            align-items: center;
	            margin-right: 30px;
	      	  }
	
	        .font {
	            font-family: 'GeekbleMalang2WOFF', sans-serif;
	            color: #03cd5d;
	            font-size: 60px;
	            margin-left: 10px;
	     	  }
	
	        #wrap {
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100%;
	            letter-spacing: -.5px;
	            margin: 0 auto;
	            width: 460px;
			   }

		        #temp {
		            margin: 0 auto;
		        }
		
		        .header {
		            padding-bottom: 10px;
		            box-sizing: border-box;
		        }
		
		        .welcomeMessage{
		            font-family: 'Noto Sans KR', sans-serif;
		            color: grey;
		            font-size: 17px;
		            text-align: center;
		         }
		
		        .header .header_inner{
		            position: relative;
		            margin: 0 auto;
		            text-align: center;
		            box-sizing: border-box;
		         }
		
		        .header img {
		            width: 80px;
		            height: 70px;
		         }
		         
		        body {
		            font-family: 'Noto Sans KR', sans-serif;
		            font-size: 14px;
		            background-color: #f5f6f7;
		            line-height: 1.5em;
		            color: #222;
		            margin: 0;
		            height: 100%;
		            display: flex;
		            align-items: center;
		            justify-content: center;
		       		 }
				
				p{
				margin-right: 2px;
				margin-left: 2px;
				margin-bottom: 0;
				flex : 5;
				}
				
			
				
		        /* 푸터에 있는 이용약관 등등등 */
		        a {
		            text-decoration: none;
		            color: #222;
		        }
		
		        /*member sign in*/
		        .member {
		            width: 460px;
		            margin: auto;
		            padding: 0 20px;
		            margin-bottom: 20px;
		        }
		
		        .member .field {
		            margin: 5px 0;
		        }
		        
		        .member b {
		            display: block;
		            margin-bottom: 5px;
		        }
		
		        
		        .field.nickname div {
		            display: flex;
		        }
		        .field.nickname div input:nth-child(1) {
		            flex: 3;
		        }
		
		        .field.nickname div input:nth-child(2) {
		            flex: 1;
		        }
		
		       .smallText {
		            font-size: 8px;
		            color: grey;
		            font-style: italic;
		        }
		
		        /*input 중 radio 는 width 가 100%면 안되니까 */
		        .member input:not(input[type=radio]), .member input:not(input[type=checkbox])
		        select {
		            border: 1px solid #dadada;
		            padding: 15px;
		            width: 100%;
		            margin-bottom: 5px;
		        }
		        
		        input[type=button]{
		        background-color: #2db400;
		        color: #fff;
		        border : none;
		         opacity: 70%;
		        }
		        
		     
		        .field.marketing{
		            margin: 20px 0px 20px 0px;
		        }
		        
		        button{
		            background-color: #2db400;
		            color: #fff;
		            cursor: pointer;
		            border: 1px solid #dadada;
		            padding: 15px;
		            width: 100%;
		            margin-bottom: 5px;
		            opacity: 70%;
		        }
		
		        .member input[type=submit] {
		            background-color: #2db400;
		            color: #fff;
		            cursor: pointer;
		        }
		
		        .field.birth div {
		            /*field 이면서 birth*/
		            display: flex;
		            gap: 10px;
		            /*간격 벌려줄때 공식처럼 사용핟나 */
		        }
		
		        .juminB {
		            display: flex;
		            flex-direction: row;
		            border: 2px dottedd orange;
		            flex-shrink: 1;
		            flex: 1 1 0;
		            align-items: center;
		        }

		        .member-footer {
		            text-align: center;
		            font-size: 12px;
		            margin-top: 20px;
		        }
		
		        .member-footer div a:hover {
		            text-decoration: underline;
		            color: #2db400
		        }
		
		        .member-footer div a:after {
		            content: '|';
		            font-size: 10px;
		            color: #bbb;
		            margin-right: 5px;
		            margin-left: 7px;
		            display: inline-block;
		            transform: translateY(-1px);
		
		        }
		
		        .member-footer div a:last-child:after {
		            display: none;
		        }
		        
		        #printLargeCat {
		        	margin-top : 10px;
		        	display : flex;
		        	flex-direction: row;
		        	flex-wrap : wrap;
		        }
		        
		        .showCat{
		        	background-color : #f5f6f7;
		        	margin-right : 3px;
		        	display : flex;
		        	flex-direction: row;
		        	align-items: center;
		        	flex-shrink: 1;
		        	
		        }
		        
		        
				.showCat:hover, lable:hover {
		    	background-color:  #2db400;
		    	 transition: 1s ease-out;
		    	}
		    	
		    	
		        .miCat {
				    background-color: #f0f0f0;
				}
		        
				#divv{
				display: flex;
				align-items: center;
		        	border-radius: 20px;
				}
				#buttonCat {
				    margin-top: 10px;
				    background-color:  #2db400;
				    border : none;
				}
				
				#buttonCat:hover {
				    margin-top: 10px;
				    background-color:  #2db400;
				    border : none;
				     transition: 1s ease-out;
				}
	
				  input[type=checkbox]:checked	 {
				    background-color:  #2db400;
				     transition: 1s ease-out;
				    border: none;
				  }
				   input[type=checkbox]{
				   flex :0.2;
				   margin-bottom : 0px;
					padding: 0px
				   }
				   
				   label{
				   	display: flex;
				   	align-items : center;
				   	flex-direction: row;
				 	font-size : 0.8rem;
				 	border-radius: 5px;
				 	border-radius: 20px;
				   }
			        
      	  </style>
	
</html>