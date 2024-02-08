package sangchu.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.chat.vo.ForTradeLogVO;
import sangchu.chat.vo.OfferVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.OfferManageVO;

@WebServlet("/offerManage.do")
public class OfferManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.19
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.20 20:55
		
		수정 내역
		2023.08.20 20:55 - 김석호 : 서블릿 요청처리 수정 및 구현
		
		거래 제의 수락 요청을 처리하는 서블릿입니다
	*/
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 제시 수락을 누른 채팅방 번호
		String c_no = request.getParameter("cno");
		// 처리할거 처리하자!
		IMypageService service = MypageServiceImpl.getInstance();
		IChatService cService = ChatServiceImpl.getInstance();
		// 채팅방 번호로 거래제시정보를 들고온다
		OfferVO offerVO = cService.getOffer(c_no);
		
		// 거래제시정보를 거래로그 데이터 삽입용 VO객체에 세팅한다.
		ForTradeLogVO ftLogVO = new ForTradeLogVO();
		try {
			ftLogVO.setC_no(c_no);
			ftLogVO.setTl_tdate(offerVO.getO_date());
			ftLogVO.setTl_loc(offerVO.getO_loc());
			ftLogVO.setTl_loc2(offerVO.getO_loc2());
			ftLogVO.setTl_finalprice(offerVO.getO_price());
		} catch (NullPointerException e) {
			e.printStackTrace();
			System.out.println("거래방 번호로 가져온 제시정보가 null임");
			response.sendRedirect(request.getContextPath()+"/goErrorPage.do?error=NoOfferInfomation");
			return;
		}
		// 일단 거래이력 테이블에 데이터 삽입
		int res = cService.regTradeLog(ftLogVO);
		
		if(res>0) {
			// 거래 후기 테이블에 데이터 삽입
			res += cService.endTrade(c_no);
			// 채팅방 번호로 거래글 번호를 가져온다
			String t_no = cService.getTNOByCNO(c_no);
			// 거래글의 상태를 거래완료로 바꿈
			res += service.updateEndTradeState(t_no);
		}
		
		if(res>2) {
			request.setAttribute("result", res);
			request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
			return;
		}else {
			System.out.println("수행되었어야할 res의 수 : 3 // 수행된 res : "+ res);
			response.sendRedirect(request.getContextPath()+"/goErrorPage.do?error=SomethingError");
			return;
		}
	}
}