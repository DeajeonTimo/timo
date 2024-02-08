package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/escapeResult.do")
public class EscapeResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.12 09:49
		
		
		회원 탈퇴요청이 성공적으로 되었을 때, 회원탈퇴 결과 페이지로 넘어가는 요청을 하는 서블릿
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String access = request.getParameter("access");
		if(access!=null&&access.equals("ok")) {
			request.setAttribute("checkaccess", "ok");
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/escapeResultPage.jsp").forward(request, response);
	}
}