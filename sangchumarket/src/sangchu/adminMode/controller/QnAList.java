package sangchu.adminMode.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;
import sangchu.qnaBoard.service.IQNABoardService;
import sangchu.qnaBoard.service.QNABoardServiceImpl;
import sangchu.qnaBoard.vo.QNABoardVO;

@WebServlet("/qnAList.do")
public class QnAList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ILoginService service =  LoginServiceImpl.getInstance();
		List<QNABoardVO> qnaVOlist =  service.qnAList();
		
		request.setAttribute("list", qnaVOlist);
		request.getRequestDispatcher("/WEB-INF/jsp/adminMode/qnaList.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
