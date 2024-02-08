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


@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reqdata = StreamData.dataChange(request);
		
		Gson gson = new Gson();
		
		BoardVO vo = gson.fromJson(reqdata, BoardVO.class);
		
		IBoardService service = BoardServiceImpl.getInsctance();
		
		int result = service.updateBoard(vo);
		
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
	}

}
