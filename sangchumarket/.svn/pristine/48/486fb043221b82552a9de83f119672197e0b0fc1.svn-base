package sangchu.adminMode.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sangchu.adminMode.service.AdminModeServiceImpl;
import sangchu.adminMode.service.IAdminModeService;
import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;
import sangchu.main.vo.MemberVO;

@WebServlet("/searchUsers.do")
public class SearchUsers extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userEmailInput = request.getParameter("userEmailInput");
		System.out.println(userEmailInput);
		IAdminModeService service= AdminModeServiceImpl.getInstance();
		MemberVO memVO = service.searchUserEmail(userEmailInput);
		
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		String json = null;
		String res = null;
		if (memVO == null) {
			res = "noexist";
		} else {
			res="exist";
		}
		json = gson.toJson(res);
		out.write(json);
	}

}
