package sangchu.adminMode.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.reflection.SystemMetaObject;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;
import sangchu.main.vo.MemberVO;

@WebServlet("/clearStopdateAll.do")
public class ClearStopdateAll extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		IAdminModeService service = AdminModeServiceImpl.getInstance();
		int res= service.clearStopdateAll();
		System.out.println(res);
		
		request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/jsp/result.jsp").forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
