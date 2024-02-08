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
import sangchu.main.vo.MemberVO;

@WebServlet("/findEmail.do")
public class FindEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String userName = request.getParameter("userName").trim();
		String userBirth = request.getParameter("userBirth").trim();
		String userTel = request.getParameter("userTel").trim();
		
		MemberVO memVO = new MemberVO();
		memVO.setName(userName);
		memVO.setU_birth(userBirth);
		memVO.setU_tel(userTel);
		
		ILoginService service =  LoginServiceImpl.getInstance();
		List<String> emailList = service.findEmail(memVO);
		
		request.setAttribute("email", emailList);
		request.getRequestDispatcher(request.getContextPath() + "/goToShowEmail.do").forward(request, response);
		return;
	}
}
