package sangchu.adminMode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;

@WebServlet("/clearStopdate.do")
public class ClearStopdate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		IAdminModeService service = AdminModeServiceImpl.getInstance();
		int res= service.clearStopdate(email);
		request.setAttribute("result", res);
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response); //result 로 보내기
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
