package sangchu.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.BlackListVO;

@WebServlet("/mypageBlackList.do")
public class MypageBlackList extends HttpServlet {
	/*
		최초 작성자 : 김석호
		최초 작성일: 2023.08.16 15:00
		
		
		마이페이지 블랙리스트 관리 관련 요청을 처리하는 서블릿입니다.
	*/
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/mypageBlacklist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		MemberVO vo = (MemberVO)request.getSession().getAttribute("memVO");
		
		if(vo==null) {
			response.sendRedirect(request.getContextPath()+"/loginsessionError.do");
			return;
		}
		String email = vo.getEmail();
		IMypageService service = MypageServiceImpl.getInstance();
		
		if("load".equals(command)) {
			List<BlackListVO> list = service.getMyBlackList(email);
			request.setAttribute("resultList", list);
			request.getRequestDispatcher("/WEB-INF/jsp/util/blackList.jsp").forward(request, response);
			return;
		}else if("remove".equals(command)) {
			BlackListVO blackVO = new BlackListVO();
			blackVO.setEmail(email);
			blackVO.setP_email(request.getParameter("targetforfree"));
			int res = service.setThemFree(blackVO);
			request.setAttribute("result", res);
			request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
			return;
		}
		return;
	}
}