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
import sangchu.chat.vo.ChatDetailVO;

@WebServlet("/getChatLog.do")
public class GetChatLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.10 01:52
		
		특정 채팅방 번호를 파라미터로 받아서 해당 채팅방의 채팅 이력을 전달하는 서블릿 입니다. 
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String c_no = request.getParameter("room");
		
		IChatService service = ChatServiceImpl.getInstance();
		List<ChatDetailVO> list = service.getChatLog(c_no);
		System.out.println(list);
		System.out.println(list.size());
		request.setAttribute("resultList", list);
		
		request.getRequestDispatcher("/WEB-INF/jsp/util/chatLogList.jsp").forward(request, response);
	}
}