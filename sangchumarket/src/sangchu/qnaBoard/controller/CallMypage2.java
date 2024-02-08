package sangchu.qnaBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.ReviewVO;

/**
 * Servlet implementation class CallMypage2
 */
@WebServlet("/mypageView.do")
public class CallMypage2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		MemberVO vo= (MemberVO)session.getAttribute("memVO");
		if(vo==null) {
			request.getRequestDispatcher(request.getContextPath()+"/loginMain.do").forward(request, response);
		}
		
		String email = vo.getEmail();
		IMypageService service = MypageServiceImpl.getInstance();
		
		ReviewVO rVo = service.getUserTradeInfo(email);
		session.setAttribute("tradeInfo", rVo);
	
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/mypageView.jsp").forward(request, response);
	}

}
