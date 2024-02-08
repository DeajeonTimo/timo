package sangchu.adminMode.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sangchu.adminMode.dao.AdminModeDaoImpl;
import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;
import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;
import sangchu.main.vo.MemberVO;

@WebServlet("/printUserInfo.do")
public class PrintUserInfo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String userEmailInput = request.getParameter("userEmailInput");
			IAdminModeService service = AdminModeServiceImpl.getInstance();
			MemberVO memVO = service.searchUserEmail(userEmailInput);
			request.setAttribute("memVO", memVO);
			request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/adminMode/printUserInfo.jsp").forward(request, response);
			return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
