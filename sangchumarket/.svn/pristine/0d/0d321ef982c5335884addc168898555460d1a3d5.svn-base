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
 *  자주묻는질문 게시판
 */
@WebServlet("/helpPageList.do")
	public class HelpPageList extends HttpServlet {
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
		PageVO pvo= service.pageInfo(vo);
		vo.setEnd(pvo.getEnd());
		vo.setStart(pvo.getStart());
		
		List<QNABoardVO> list = service.qnaBoardList(vo);

		request.setAttribute("result", list);
		request.setAttribute("startpage", pvo.getStartPage());
		request.setAttribute("endpage", pvo.getEndPage());
		request.setAttribute("totalpage", pvo.getTotalPage());

		request.getRequestDispatcher("/WEB-INF/jsp/qnaBoard/qnaResult.jsp").forward(request, response);
	}

}
