package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/LogoutServlet.ddit")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =  request.getSession();
		
		MemberVO vo = (MemberVO)session.getAttribute("loginok");
		if(vo!=null) {
			
			session.removeAttribute("check");
			session.removeAttribute("loginok");
		}
		
		//view페이지로 - logPro.jsp
		request.getRequestDispatcher("/start/index.jsp").forward(request, response);
	}

}
