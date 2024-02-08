package sangchu.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.tboard.service.ITBoardService;
import sangchu.tboard.service.TBoardServiceImpl;
import sangchu.tboard.vo.TBoardVO;

/**
 * 작성자 : 김보영
 * 작성일  : 23.08.10
 * 인기상품을 꺼내오는 서블릿
 */
@WebServlet("/hotItem.do")
public class HotItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMainService service = MainServiceImpl.getInstance();
		
		List<MainProdVO> list = service.hotItemRank(null);
		
		request.setAttribute("result", list);
		
		request.getRequestDispatcher("/WEB-INF/jsp/main/commResult.jsp").forward(request, response);
		
		
		
		
	}


}
