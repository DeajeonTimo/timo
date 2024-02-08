package sangchu.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.chat.vo.ChatVO;
import sangchu.main.vo.MemberVO;

@WebServlet("/newChatRequest.do")
public class NewChatRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.17 10:09
		
		거래 상세페이지에서 상추톡 버튼을 눌렀 을 때, 새로운 채팅방 개설 요청을 처리하는 서블릿입니다.
	*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유저의 정보를 세션에서 받아온다.
		MemberVO vo = (MemberVO) request.getSession().getAttribute("memVO");
		
		if(vo==null) {
			response.sendRedirect(request.getContextPath()+"/loginMain.do");
			return;
		}
		
		
		// 로그인 한 유저의 이메일을 세팅한다.
		String email = vo.getEmail();
		// 파라미터를 넘겨받는다
		// 파라미터 넘길때 key값 : tradeNo
		String t_no = request.getParameter("tradeNo");
		
		// 서비스 객체를 가져온다
		IChatService service = ChatServiceImpl.getInstance();
		
		// 거래 번호로 작성자를 먼저 가져온다
		String regEmail = service.whoRegThis(t_no);
		
		if(email.equals(regEmail)) {
			// 거래글 작성자와 채팅신청하려는 사람이 같을 경우 ! 
			// 오류가 발생하므로 여기서 자기 자신에게는 못한다고 보내준다.
			// ajax에 맞게 요청을 처리해준다.
			request.setAttribute("result", -2);
			request.getRequestDispatcher("/WEB-INF/jsp/util/resultForNewchat.jsp").forward(request, response);
			return;
		}
		
		ChatVO chatVO = new ChatVO();
		chatVO.setT_no(t_no);
		chatVO.setEmail(email);
		
		int check = service.isThereAlreadyChatRoom(chatVO);
		
		if(check>0) {
			// 이미 등록처리가 되어있는 경우. ajax에 맞게 처리해준다.
			request.setAttribute("result", -1);
		}else {
			int res = service.createNewChatRoom(chatVO);
			request.setAttribute("result", res);
		}
		request.getRequestDispatcher("/WEB-INF/jsp/util/resultForNewchat.jsp").forward(request, response);
		return;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		return;
	}

}
