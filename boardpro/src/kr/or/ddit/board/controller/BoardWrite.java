package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.config.StreamData;


@WebServlet("/BoardWrite.do")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//요청시 전송 데이터 받기 - writer, subject, mail , password, content
		String reqdata = StreamData.dataChange(request);
		
		Gson gson = new Gson();
		
		BoardVO vo = gson.fromJson(reqdata, BoardVO.class);
		vo.setWip(request.getRemoteAddr());
		//service 객체
		IBoardService service = BoardServiceImpl.getInsctance();
		
		//메소드 호출
		int res = service.insertBoard(vo);
		
		//request에 저장
		request.setAttribute("result", res);
		
		//view페이지로 이동
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
		
	}

}
