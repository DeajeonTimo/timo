package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;

@WebServlet("/escapeHere.do")
public class EscapeHere extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : ?
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.12 09:25
		
		수정내역
		2023.08.12 09:25 - 김석호 : doPost구현
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/withdrawalform.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원탈퇴일 처리하는 메소드~
		
		// 파라미터로 전달된 회원탈퇴 신청자 먼저 받아와!
		String email = request.getParameter("email");
		
		// 처리해주기 위한 service객체 얻어와요~
		IMypageService service = MypageServiceImpl.getInstance();
		
		// 슥샥
		int res = service.escapeHere(email);
		
		// 처리 결과에 따라 이케 저케 처리
		if(res>0) { // 처리 성공시
			HttpSession session = request.getSession();
			// 회원 탈퇴가 정상적으로 처리되면 session을 죽여버려요~
			session.invalidate();
			// ajax로 요청했기때문에 result페이지로 포워딩해요~
			request.setAttribute("result", res);
			request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
			
		}else { // 실패시
			// ㅠ..또 오류여
			response.setCharacterEncoding("utf-8");
			response.sendRedirect(request.getContextPath()+"/goErrorPage.do?error=탈퇴신청처리오류");
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
