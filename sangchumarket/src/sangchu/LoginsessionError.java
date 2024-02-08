package sangchu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginsessionError.do")
public class LoginsessionError extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/*
		최초 작성자 : 김석호
		최초 작성일 :2023.08.12 10:33
		
		로그인 세션이 만료되었을 경우 세션 만료창 요청을 처리하는 서블릿입니다.
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/util/loginsessionError.jsp").forward(request, response);
	}
}