package sangchu.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;
import sangchu.main.vo.MemberVO;

/**
 * Servlet implementation class SetStopdate
 */
@WebServlet("/setStopdate.do")
public class SetStopdate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target =request.getParameter("target");
		String inputdate = request.getParameter("inputdate");
		
		MemberVO memVO = new MemberVO();
		memVO.setEmail(target);
		memVO.setU_stopdate(inputdate);
		
		IAdminModeService service = AdminModeServiceImpl.getInstance();
		int res = service.setStopdate(memVO);
		request.setAttribute("result", res);
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
