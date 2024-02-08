package sangchu.adminMode.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;

@WebServlet("/cancelStopdate.do")
public class CancelStopdate extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email").trim();
		System.out.println("여기 서블릿 " + email);
		IAdminModeService service = AdminModeServiceImpl.getInstance();
		int res = service.updateStopdate(email);
		System.out.println(res);
		request.setAttribute("result", res);
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/result.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
