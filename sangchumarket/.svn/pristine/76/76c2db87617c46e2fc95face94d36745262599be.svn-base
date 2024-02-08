package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.UpdateMemberVO;

@WebServlet("/passwordUpdate.do")
public class PasswordUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/passwordUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("memVO");
		String pass = request.getParameter("pass");
		UpdateMemberVO upMemVO = new UpdateMemberVO();
		upMemVO.setEmail(vo.getEmail());
		upMemVO.setPass(pass);
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		int res = service.updateUserPassword(upMemVO);
		
		if(res>1) {
			session.invalidate();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script>alert('회원정보 수정에 성공했습니다! 다시 로그인 해주세요!');location.href='"+request.getContextPath()+"/sangchuMain.do';</script>");
			
		}else {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println("<script>alert('비밀번호 변경에 실패했습니다!');location.href='"+request.getContextPath()+"/mypageMain.do';</script>");
		}
	}
}