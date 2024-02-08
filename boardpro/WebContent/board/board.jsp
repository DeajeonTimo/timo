<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="../js/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="../css/board.css">
  <script src="../js/board.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  
  <script>
  <%
  //로그인 체크 - session의 값을 가져오기 - 비교하기
  MemberVO vo = (MemberVO)session.getAttribute("loginok");
  
  //json형태로
  String ss = null;
  
  Gson gson = new Gson();
  if(vo !=null) ss = gson.toJson(vo);
  
  %>
 
  
  
  uvo = <%=ss%>
  currentPage = 1;
  mypath = '<%=request.getContextPath()%>'
  reply = { };
  board = { };
  $(document).ready(function(){
	  //시작하자마자 listPageServer()를 실행하여 게시판 리스트 출력된다
	  
	  $.listPageServer();
	  
	  
	  //검색 이벤트
	  $('#search').on('click',function(){
		  if($('#modifyform').css('display')!="none"){
			  //열려있는상태
			  replyReset();
		  }
		  $.listPageServer();
	  })
	  //next 이벤트
	  $(document).on('click','#next',function(){
		  if($('#modifyform').css('display')!="none"){
			  //열려있는상태
			  replyReset();
		  }
		  currentPage = parseInt($('.pageno').last().text())+1;
		  $.listPageServer();
	  })
	  //prev 이벤트
	  $(document).on('click','#prev',function(){
		  if($('#modifyform').css('display')!="none"){
			  //열려있는상태
			  replyReset();
		  }
		  currentPage = parseInt($('.pageno').first().text())-1;
		  $.listPageServer();
	  })
	  //페이지 번호
	  $(document).on('click','.pageno',function(){
		  currentPage = parseInt($(this).text());
		  $.listPageServer();
	  })
	  
	  //글쓰기 이벤트
	  $('#write').on('click',function(){
		  if(uvo ==null){
			  alert("로그인하세요");
		  }else{
		  	$('#wModal').modal('show');			  
		  	$('#wwriter').val(uvo.mem_name);
		  }
	  })
	  
	  //글쓰기 전송 이벤트
	  $('#wsend').on('click',function(){
		  //입력한 모든 값을 가져온다
		  fdata = $('#wform').serializeJSON();
		  console.log(fdata);
		  
		  //서버로 전송
		  $.boardWriteServer();
		  
		  //모달창 닫기
		  $('.txt').val("");
		  $('#wModal').modal('hide');	
	  })
	  
	  //수정, 삭제, 등록 제목 클릭 이벤트
	  $(document).on('click','.action',function(){
		  vacation = $(this).attr('name');
		  vidx = $(this).attr('idx');
		  
		  gtarget = this;
		  
		  if(vacation == "delete"){
			 // alert(vidx + " 번 글을 삭제합니다.")
			 $.boardDeleteServer();
		  }else if(vacation == "modify"){
			  alert(vidx + " 번 글을 수정합니다.")
			  
			  $('#mnum').val(vidx);
			//본문의 게시글 내용을 모달창에 출력 - 수정을 위하여
			
			vparent = $(this).parents('.card');
			wr = $(vparent).find('.wr').text().trim();
			em = $(vparent).find('.em').text().trim();
			ti = $(vparent).find('a').text().trim();
			wp3 = $(vparent).find('.wp3').html();
			wp3 = wp3.replaceAll(/<br>/g,"\n").trim()
			
			$('#mModal #mwriter').val(wr);
			$('#mModal #msubject').val(ti);
			$('#mModal #mmail').val(em);
			$('#mModal #mcontent').val(wp3);
			  
			$('#mModal').modal('show');
			  
		  }else if(vacation == "reply"){
			  //alert(vidx + " 번 글에 댓글을 답니다.")
	  
		  	//입력한 값을 가져온다
	 	 	reply.cont = $(this).prev().val();
	  		reply.name = uvo.mem_name;
	  		reply.bonum = vidx;
	  
	 
	  		//서버로 전송
	  		$.replyInsertServer();
	  		$(this).prev().val("");
		  }else if(vacation == "title"){
			  $.replyList();
		  }else if(vacation =="r_modify"){
			  alert(vidx + " 번 댓글을 수정합니다.");
			  
			  //modifyform이 열려 있는지 비교
			  if($('#modifyform').css('display')!="none"){
				  //열려있는상태
				  replyReset();
			  }
			  
			  
			  
			  
			  vp3 = $(this).parents('.reply-body').find('.p3');
			  //원래 내용을 가져온다.
			  modifycont = $(vp3).html().trim(); //<br>포함
			  //<br>을 변경
			  mcont = modifycont.replaceAll(/<br>/g,"\n");
			  //수정 폼에 출력
			  $('#modifyform textarea').val(mcont);
			  
			  //수정폼을 p3으로 이동 - append
			  $(vp3).empty().append($('#modifyform'))
			  
			  //수정폼을 보이게
			  //$('#modifyform').css('display','block');
			  $('#modifyform').show();
			  
		  }else if(vacation == "r_delete"){
			  alert(vidx + " 번 댓글을 삭제합니다.")
			 $.replyDelete();
		  }
		})
	 
		//댓글 수정창에서 취소버튼 클릭 했을때 
		$('#btnreset').on('click',function(){
			replyReset();
		})
		
		replyReset = function(){
		  p3 = $('#modifyform').parent();
			
			//modifyform을 body로 이동 - 안보이도록 설정
			
			$('body').append($('#modifyform'));
			$('#modifyform').hide();
			
			//p3에 원래내용 modifycont를 출력
			$(p3).html(modifycont);
	  }
		
		//댓글 수정창에서 확인버튼 클릭 했을때 
		$('#btnok').on('click',function(){
			//입력한 내용을 가져 온다 -\n 포함
			modicont = $('#modifyform textarea').val();
			
			modiout = modicont.replace(/\n/g,"<br>");
			
			//p3을 찾는다
			p3 = $('#modifyform').parent();
			
			//modifyform을 body로 이동
			$('#modifyform').appendTo($('body'));
			$('#modifyform').hide();
			
			//p3에 출력
			//$(p3).html(modiout);
			
			//서버로 전송 - modicont, vidx
			reply.cont = modicont;
			reply.renum = vidx;
			$.replyUpdateServer();
			
		})
		
		//글 수정 모달창에서 수정 입력하고 전송 버튼 클릭
		$('#msend').on('click',function(){
			//모달창에서 새로 입력한 내용들을 가져온다 - subject,mail,password,content
			
			board.num = vidx;
			board.subject = $('#mModal #msubject').val();
			board.password = $('#mModal #mpassword').val();
			board.mail = $('#mModal #mmail').val();
			board.content = $('#mModal #mcontent').val();
			
			//서버로 전송 - 성공시 본문의 내용을 모달창 내용으로 변경
			$.boardUpdateServer();
			
			//모달창 닫기
			
			//입력내용지우기
			$('#mModal .txt').val("");
			$('#mModal').modal('hide');
			
		})
		
		
  })//document ready function
  </script>
</head>
<body>

<div id="modifyform">
	<textarea rows="5" cols="40"></textarea>
	<input type="button" value="확인" id="btnok">
	<input type="button" value="취소" id="btnreset">
</div>

<h1> 게시판 </h1>
<input type="button" value="글쓰기" id="write">
<br><br>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
      	<select class="form-select" id="stype">
      		<option value="">전체</option>
      		<option value="writer">작성자</option>
      		<option value="subject">제목</option>
      		<option value="content">내용</option>
      	</select>
        <input id="sword" class="form-control me-2" type="text" placeholder="Search">
        <button id="search" class="btn btn-primary" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>

<div id="result"></div>
<br><br>
<div id="pagelist"></div>

<!-- 글쓰기 Modal  -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글쓰기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name ="wform" id="wform">
        	<label>이 름</label>
        	<input readonly="readonly" type="text" name="writer" class ="txt" id="wwriter"><br>
        	<label>제 목</label>
        	<input type="text" name="subject" class ="txt" id="wsubject" ><br>
        	<label>메 일</label>
        	<input type="text" name="mail" class ="txt" id="wmail"><br>
        	<label>비밀번호</label>
        	<input type="password" name="password" class ="txt" id="wpassword"><br>
        	<label>본문</label>
        	<textarea name="content" class ="txt" id="wcontent"></textarea>
  
        	<br>
        	<br>
        	<input type="button" value="전송" id="wsend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 글수정 Modal  -->
<div class="modal" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name ="wform" id="mform">
        	<input type="hidden" name="num" id="mnum">
        	<label>이 름</label>
        	<input readonly="readonly" type="text" name="writer" class ="txt" id="mwriter"><br>
        	<label>제 목</label>
        	<input type="text" name="subject" class ="txt" id="msubject" ><br>
        	<label>메 일</label>
        	<input type="text" name="mail" class ="txt" id="mmail"><br>
        	<label>비밀번호</label>
        	<input type="password" name="password" class ="txt" id="mpassword"><br>
        	<label>본문</label>
        	<textarea name="content" class ="txt" id="mcontent"></textarea>
  
        	<br>
        	<br>
        	<input type="button" value="전송" id="msend">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>