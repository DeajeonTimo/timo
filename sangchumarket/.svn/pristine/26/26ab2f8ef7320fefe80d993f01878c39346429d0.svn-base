package sangchu.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;
import sangchu.adminMode.vo.EnquiryVO;
import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;

@WebServlet("/goToShowEmail.do")
public class GoToShowEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/login/showEmail.jsp").forward(request, response);
		
	}

}
