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
 *  작성자 : 김보영
 *  최초작성일:23.8.9
 *  최근 등록된 상품을 조회하는 서블릿
 */

/**
 * get : 주소에 파라미터가 있고 ?aa=00
 * post : 주소에서 안보이고 body에 값을 넣어서 던진다.
 * 		  파라미터가 숨어있다 
 **/

@WebServlet("/recentProd.do")
public class RecentProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMainService service= MainServiceImpl.getInstance();
		
		List<MainProdVO> list=service.recentProd(null);
		
		
		request.setAttribute("result", list);
		
		request.getRequestDispatcher("/WEB-INF/jsp/main/commResult.jsp").forward(request, response);
	
		//비동기 : ajax  -> 화면이랑 따로 자기혼자 통신함
	}

	

}
