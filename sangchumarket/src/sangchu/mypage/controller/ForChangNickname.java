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

@WebServlet("/forChangNickname.do")
public class ForChangNickname extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.11 23:30
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.12 17:28
		
		수정내역
		2023.08.12 17:28 - 김석호 : 불필요한 코드 및 주석 제거
		
		
		마이페이지에서 닉네임 변경과 관련된 내용을 처리해주는 서블릿입니다.
		
	*/
	// 닉네임 체크할때는 이쪽으로 들어옵니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String targetNickname = request.getParameter("targetnick");
		IMypageService service = MypageServiceImpl.getInstance();
		
		int res = service.checkNickname(targetNickname);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		
	}
	
	// 닉네임 변경할때는 이쪽으로 들어옵니다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 사용자 이메일은 세션에서 갖고와요~
		
		// 세션에서 먼저 로그인정보를 꺼낼거에요~
		HttpSession session = request.getSession();
		MemberVO memVO = null;
		// 이렇게 하는 이유는 혹시나 세션정보가 날아갔을 수도 있어서에요~
		try {
			memVO = (MemberVO)session.getAttribute("memVO");
		}catch(NullPointerException e) {
			e.printStackTrace();
			response.setCharacterEncoding("utf-8");
			response.sendRedirect(request.getContextPath()+"/goErrorPage.do?error=로그인세션만료");
		}
		// 이건 ajax로 보낸 데이터에요~
		String nickname = request.getParameter("nick");
		
		// 세션에서 가져온 VO에 새로 바뀔 닉네임을 세팅해줘요~
		memVO.setU_nick(nickname);
		
		// 이제 데이터베이스에 보낼거에요~
		IMypageService service = MypageServiceImpl.getInstance();
		int res = service.updateNickName(memVO);
		
		// 결과가 0보다 크면 업데이트 성공, 실패면 0이니까 나눠줘요~
		if(res>0) { // 성공일 때
			// 로그인 유저의 세션을 업데이트 해줘야해요~ memVO에 저장되어있는 그대로 보내요~
			session.setAttribute("memVO", memVO);
			
			// ajax 방식이라 여기서 result 세팅해주고 결과페이지로 포워딩해요~
			request.setAttribute("result", res);
			request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		}else {// 실패일때..ㅠ
			// 어쩔수 없죠 오류페이지로 보내요~
			response.setCharacterEncoding("utf-8");
			response.sendRedirect(request.getContextPath()+"/goErrorPage.do?error=닉네임변경오류");
		}
		// 빠이~
		
		
		
		
	}
}