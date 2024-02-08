package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.ReviewVO;

@WebServlet("/mypageMain.do")
public class MypageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
			최초 작성자 : 김석호
			최초 작성일 : ? 
			
			최근 수정자 :김석호
			최근 수정일: 2023.08.21 10:44
			
			마이페이지 요청을 처리하는 서블릿입니다.
		*/
		
		HttpSession session = request.getSession();
		
		MemberVO vo= (MemberVO)session.getAttribute("memVO");
		if(vo==null) {
			request.getRequestDispatcher(request.getContextPath()+"/loginMain.do").forward(request, response);
		}
		String email = vo.getEmail();
		IMypageService service = MypageServiceImpl.getInstance();
		
		ReviewVO rVo = service.getUserTradeInfo(email);
		
		double score = rVo.getScore();
		
		// 소숫점 첫번째자리까지만 살려놓는다.
		score = (Math.ceil(score * 10))/10;
		rVo.setScore(score);
		
		session.setAttribute("tradeInfo", rVo);
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/mypageMain.jsp").forward(request, response);
	}
	
/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
*/
	
}
