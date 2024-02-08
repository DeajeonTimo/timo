package sangchu.mypage.controller;

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

@WebServlet("/checkPassword.do")
public class CheckPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.14 21:46
		
		비밀번호 변경시 현재 비밀번호를 입력받아 받는지 체크를 요청하는 서블릿입니다.
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pass = request.getParameter("passcheck");
		
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("memVO");
		memVO.setPass(pass);
		IMypageService service = MypageServiceImpl.getInstance();
		
		int res = service.checkPassword(memVO);
		
		request.setAttribute("result", res);
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
	}
}