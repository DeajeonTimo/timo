package sangchu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/goErrorPage.do")
public class GoErrorPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// error메시지 전달할때 쿼리스트링에 ?error=value형태로 넣어주세용
		String error = request.getParameter("error");
		request.setAttribute("errorMessage", error);
		request.getRequestDispatcher("/WEB-INF/jsp/errorPage.jsp").forward(request, response);
	}

}
