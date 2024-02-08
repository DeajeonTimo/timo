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

import sangchu.main.vo.PageVO;
import sangchu.qnaBoard.service.IQNABoardService;
import sangchu.qnaBoard.service.QNABoardServiceImpl;
import sangchu.qnaBoard.vo.QNABoardVO;

/**
 * Servlet implementation class AdminQNABoardList
 */
@WebServlet("/adminQNABoardList.do")
public class AdminQNABoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		//페이징
		PageVO pvo1= service.AdminpageInfo(vo);
		vo.setEnd(pvo1.getEnd());
		vo.setStart(pvo1.getStart());
		
		List<QNABoardVO> list = service.qnaBoardManageList(vo);

		request.setAttribute("result", list);
		request.setAttribute("startpage", pvo1.getStartPage());
		request.setAttribute("endpage", pvo1.getEndPage());
		request.setAttribute("totalpage", pvo1.getTotalPage());

		request.getRequestDispatcher("/WEB-INF/jsp/qnaBoard/qnaResult.jsp").forward(request, response);
	}
}
