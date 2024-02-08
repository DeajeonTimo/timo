/**
 * 
 */
$.boardUpdateServer = function(){
	$.ajax({
		url : `${mypath}/BoardUpdate.do`,
		method : 'post',
		data : JSON.stringify(board),
		success : function(res){
			//alert(res.flag);
			//모달창에 입력된 냐용으로 본문의 내용을 변경
			//수정버튼 객체 자신을 기준으로 본문의 작성자 찾기
			$(vparent).find('.wr').text(board.writer);
			$(vparent).find('.em').text(board.mail);
			$(vparent).find('a').text(board.subject);
			cont = board.content.replaceAll(/\n/g,"<br>");
			$(vparent).find('.wp3').html(cont);
			//본문날짜변경
			today = new Date();
			today = today.toLocaleString()
			$(vparent).find('.da').text(today);
		
		},
		error : function(xhr){
			alert("상태 :" + xhr.status)
		},
		dataType : 'json'
	})
} 

 

$.boardDeleteServer= function(){
	$.ajax({
		url : `${mypath}/BoardDelete.do`,
		method : 'get',
		data : {"num":vidx},
		success : function(res){
			$.listPageServer();
		},
		error : function(xhr){
			alert("상태 :" + xhr.status)
		},
		dataType : 'json'
	})
}



$.replyUpdateServer = function(){
	$.ajax({
		url : `${mypath}/ReplyUpdate.do`,
		method : 'post',
		data : JSON.stringify(reply),
		success : function(res){
			//성공 했으면 화면을 수정한다.
			$(p3).html(modiout);
		},
		error : function(xhr){
			alert("상태 :" + xhr.status)
		},
		dataType : 'json'
	})
}




$.replyDelete = function(){
	$.ajax({
		url : `${mypath}/ReplyDelete.do`,
		method : 'get',
		data : {"renum" : vidx},
		success : function(res){
			//db에서 삭제 성공시 화면 삭제
			$(gtarget).parents('.reply-body').remove();
		},
		error : function(xhr){
			alert("상태 :" + xhr.status)
		},
		dataType : 'json'
	})
}




$.replyList = function(){
	$.ajax({
		url : `${mypath}/ReplyList.do`,
		method : 'get',
		data : {"bonum" : vidx},
		success : function(res){
			//클릭한 등록버튼을 기준으로 조상(card-body)를 찾기
			vparent = $(gtarget).parents('.card');
			
			rcode = "";
			
			$.each(res,function(i,v){
				
			cont = v.cont;
			
			cont = cont.replaceAll(/\n/g,"<br>");
			
			rcode +=`<div class="reply-body">
				          <div class="p12">
				            <p class="p1">작성자 <span>${v.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				            날짜<span>${v.redate}</span>&nbsp;&nbsp;&nbsp;&nbsp;</p>
				            <p class="p2">`
							if(uvo!=null && uvo.mem_name == v.name){
				              rcode +=`<input idx="${v.renum}" type="button" value="댓글 수정" name="r_modify" class="action">
				              <input idx="${v.renum}" type="button" value="댓글 삭제" name="r_delete" class="action">`
							}
				            
						rcode +=	`</p> 
				          </div>
				          <p class="p3">${cont}</p>
				        </div>`
			
			})
			$(vparent).find('.reply-body').remove();
			$(vparent).find('.card-body').append(rcode);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType : 'json'
	})
}



$.replyInsertServer = function(){
	
	$.ajax({
		url :`${mypath}/ReplyWrite.do`,
		method : "post",
		data : JSON.stringify(reply),
		success : function(res){
			$.replyList();
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType : 'json'
	})
}






$.boardWriteServer = function(){
	$.ajax({
		url : `${mypath}/BoardWrite.do`,
		method : 'post',
		data : JSON.stringify(fdata),
		success : function(res){
			//성공했으면 
			if(res.flag=="성공"){
				currentPage = 1;
				$.listPageServer();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}




$.listPageServer = function(){
	//검색 type과 검색어 가져오기 - 최초실행시에는 없다.
	vtype = $('#stype option:selected').val().trim();
	sword = $('#sword').val().trim();
	
	$.ajax({
		url : `${mypath}/BoardList.do`,
		method : 'post',
		data : JSON.stringify({
			"page" : currentPage,
			"stype" : vtype,
			"sword" : sword
		}),
		success : function(res){
			code = "";
			code += `<div class="container mt-3">
			<div id="accordion">`;
			$.each(res.datas,function(i,v){
 			cont = v.content;
			cont = cont.replaceAll("/\n\g","<br>");
code += `<div class="card">
    <div class="card-header">
      <a class="btn action" idx="${v.num}" name="title" data-bs-toggle="collapse" href="#collapse${v.num}">
        ${v.subject}
      </a>
    </div>
    <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
      <div class="card-body">
       <div class="p12">
       		<p class ="p1">
       		작성자<span class="wr">${v.writer}</span>
       		이메일<span class="em">${v.mail}</span>
       		조회수<span class="hi">0</span>
       		날짜<span class="da">${v.wdate}</span>
       		
       		</p>
       		<p class ="p2">`;
				if(uvo !=null && uvo.mem_name ==v.writer){
	       		code+= `<input idx="${v.num}" type="button" name="modify" class="action" value="수정">
    	   				<input idx="${v.num}" type="button" name="delete" class="action" value="삭제">`			
				}
       	code+=`</p>
       </div>
       		<p class ="p3 wp3">
       		${cont}
			</p>
       		<p class ="p4">
       			<textarea cols="50" class="area"></textarea>
       			<input idx="${v.num}" type="button" name="reply" class="action" value="등록">
       		</p>
      </div>
    </div>
  </div>`;
})
 code += `</div>
</div>`	

$('#result').html(code);

pager = $.pageList(res.sp,res.ep,res.tp)
$('#pagelist').html(pager);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

$.pageList = function(sp,ep,tp){
	pager = `<ul class="pagination">`;
	//이전버튼
	if(sp>1){
		pager += `<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
	}
	//페이지번호
	for(i=sp; i<=ep; i++){
		if(i==currentPage){
			pager+= `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;
		}else{
			pager+=`<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
		}
	}
	//다음	
	if(tp>ep){
		pager += `<li class="page-item"><a id ="next" class="page-link" href="#">Next</a></li>`;
	}
	
	pager += `</ul>`;
	
	return pager;
}














