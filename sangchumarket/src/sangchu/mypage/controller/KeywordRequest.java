package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/keywordRequest.do")
public class KeywordRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.15 10:37
		
		키워드 관리 페이지 요청을 처리하는 서블릿입니다.
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/keywordPage.jsp").forward(request, response);
	}
}