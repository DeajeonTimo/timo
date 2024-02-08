package sangchu.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.chat.vo.OfferVO;
import sangchu.chat.vo.TBoardOfferVO;
import sangchu.tboard.vo.TBoardVO;

@WebServlet("/tradeOffer.do")
public class TradeOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.19 13:11
		
		최근 수정일 : 김석호 
		
		거래 제시 요청을 처리하는 서블릿입니다.
	*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 채팅방 번호 갖고옴
		String c_no = request.getParameter("cno");
		
		// 약속잡는 날짜도 갖고옴
		String date = request.getParameter("date");
		IChatService cService = ChatServiceImpl.getInstance();
		
		// 채팅방 번호로 거래글에서 희망 위치, 가격정보 갖고옴
		TBoardOfferVO tVO = cService.getTBoardInfoByCNO(c_no);
		// 거래제시 처리할 VO객체 세팅
		OfferVO oVO = new OfferVO();
		oVO.setC_no(c_no);
		oVO.setO_date(date);
		oVO.setO_loc(tVO.getTb_loc());
		oVO.setO_loc2(tVO.getTb_loc2());
		oVO.setO_price(tVO.getTb_price());
		
		// 레코드 insert
		int res = cService.tradeOffer(oVO);
		
		// 결과창으로 이동
		request.setAttribute("result", res);
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cno = request.getParameter("room");
		
		IChatService cService = ChatServiceImpl.getInstance();
		
		String regEmail = cService.whoRegByCNO(cno);
		
		request.setAttribute("result", regEmail);
		request.getRequestDispatcher("/WEB-INF/jsp/util/offerResult2.jsp").forward(request, response);
		return;
	}
	 
}
