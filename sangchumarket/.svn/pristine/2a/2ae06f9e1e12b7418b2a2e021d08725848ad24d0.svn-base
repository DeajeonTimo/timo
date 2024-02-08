package sangchu.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.chat.vo.ChatVO;

@WebServlet("/getAllChatList.do")
public class GetAllChatList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.09 21:02
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.09 22:10
		
		수정이력 :
		2023.08.09 22:10 - 김석호 : 맵퍼 구현 후 insert 처리, connection시 세션정보 처리 수정
		
		로그인 유저가 자신의 이메일을 파라미터로 전달해 채팅방 목록을 요청하는 서블릿입니다.
		
		
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		
		IChatService service = ChatServiceImpl.getInstance();
		
		List<ChatVO> list = service.getAllChatList(email);
		
		request.setAttribute("resultList", list);
		request.getRequestDispatcher("/WEB-INF/jsp/util/chatList.jsp").forward(request, response);
	}
}