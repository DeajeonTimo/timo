package sangchu.qnaBoard.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import sangchu.qnaBoard.service.IQNABoardService;
import sangchu.qnaBoard.service.QNABoardServiceImpl;
import sangchu.qnaBoard.vo.QNABoardVO;

/**
 * 작성자 : 김보영
 * qna문의 글을 등록하는서블릿
 */
@WebServlet("/insertQNABoard.do")
public class InsertQNABoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// vo에 저장
		QNABoardVO vo = new QNABoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IQNABoardService service = QNABoardServiceImpl.getInstance();
		
		int res = service.insertQNABoard(vo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		
	}

}
