package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PListVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.config.StreamData;

@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//요청시 전송 데이터 받기
		//request.getParameter("Page");
		String reqdata = StreamData.dataChange(request);
		
		//역직렬화
		Gson gson = new Gson();
		PListVO vo = gson.fromJson(reqdata, PListVO.class);
		
		//page 정보 구하기 - 전체글갯수, 총페이지수, 1~3글번호, 1~2 페이지번호
		
		IBoardService service = BoardServiceImpl.getInsctance();
		
		PageVO pvo = service.pageInfo(vo.getPage(), vo.getStype(), vo.getSword());
		//start, send, startPage, endPage, totalPage
		
		//해당 페이지의 글 목록 가져오기
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",pvo.getStart());
		map.put("end",pvo.getEnd());
		map.put("stype",vo.getStype());
		map.put("sword",vo.getSword());
		
		List<BoardVO> list = service.selctByPage(map);
		
		//결과값을 request에 저장
		request.setAttribute("list", list);
		request.setAttribute("start", pvo.getStartPage());
		request.setAttribute("end", pvo.getEndPage());
		request.setAttribute("total", pvo.getTotalPage());
		
		
		//view페이지로 이동
		 request.getRequestDispatcher("/boardview/list.jsp").forward(request, response);
		
		
	}

}
