package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.vo.TradeLogVO;

@WebServlet("/afterTrade.do")
public class AfterTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.21 00:43
		
		후기를 남기는 요청을 처리하는 서블릿입니다.
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 채팅방 번호와 평가한 점수를 가져옵니다
		String c_no = request.getParameter("cno");
		String score = request.getParameter("score");
		
		// 로그인 유저의 정보를 갖고와요
		MemberVO memVO = (MemberVO)request.getSession().getAttribute("memVO");
		String email = memVO.getEmail();
		
		// 일단 채팅방번호에 해당하는 거래글을 누가썻는지 받아와요
		IChatService cService = ChatServiceImpl.getInstance();
		String regEmail = cService.whoRegByCNO(c_no);
		
		// 후기남길 VO객체를 생성
		TradeLogVO tLogVO = new TradeLogVO();
		tLogVO.setC_no(c_no);
		if(email.equals(regEmail)) {
			// 지금 평가하는사람이 작성자라면
			tLogVO.setSc_given(score);
		}else {
			// 작성자가 아니라 거래상대라면
			tLogVO.setSc_taken(score);
		}
		
		// 평가를 날려요
		int res = cService.afterTrade(tLogVO);
		request.setAttribute("result", res);
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		return;
	}

}
