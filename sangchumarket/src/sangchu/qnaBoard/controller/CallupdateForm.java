package sangchu.qnaBoard.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.qnaBoard.service.IQNABoardService;
import sangchu.qnaBoard.service.QNABoardServiceImpl;
import sangchu.qnaBoard.vo.QNABoardVO;

/**
 * 회원 문의글 수정창으로 가는 서블릿
 */
@WebServlet("/callupdateForm.do")
public class CallupdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String cm_no = request.getParameter("id");
		
		IQNABoardService service= QNABoardServiceImpl.getInstance();
		
		QNABoardVO res =service.selectQnaInfo(cm_no);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/WEB-INF/jsp/qnaBoard/qnaUpdateForm.jsp").forward(request, response);
	}

}
