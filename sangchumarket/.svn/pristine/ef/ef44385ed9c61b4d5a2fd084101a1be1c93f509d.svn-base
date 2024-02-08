package sangchu.qnaBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.qnaBoard.service.IQNABoardService;
import sangchu.qnaBoard.service.QNABoardServiceImpl;
import sangchu.qnaBoard.vo.QNABoardVO;

/**
 *  관리자 답변 입력창으로 가는 서블릿
 */
@WebServlet("/callReplyForm.do")
public class CallReplyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cm_no = request.getParameter("id");
		
		IQNABoardService service= QNABoardServiceImpl.getInstance();
		
		QNABoardVO res =service.selectQnaInfo(cm_no);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/WEB-INF/jsp/qnaBoard/qnaReplyForm.jsp").forward(request, response);
	}

}
