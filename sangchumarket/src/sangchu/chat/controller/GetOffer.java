package sangchu.chat.controller;

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
import sangchu.mypage.vo.OfferManageVO;

@WebServlet("/getOffer.do")
public class GetOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.18 11:19
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.20 19:31
		
		수정내역
		2023.08.20 19:31 - 김석호 : 서블릿 설명문 수정 및 get메소드 재정의, post메소드 전면 개편
		거래제시관리페이지와 제시목록 요청을 처리하는 서블릿입니다.
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 로그인유저의 정보를 갖고온다
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("memVO");
		
		// 세션에 로그인 유저의 정보가 없거나 세션만료로 MemberVO객체가 null이라면 로그인 세션만료페이지로 보낸다.
		if(memVO==null) {
			request.getRequestDispatcher("/loginsessionError.do").forward(request, response);
			return;
		}
		
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		// 유저의 이메일로 거래 제의가 온 목록을 받아옴
		List<OfferManageVO> list = service.getOfferToMe(memVO.getEmail());
		
		request.setAttribute("resultList", list);
		request.getRequestDispatcher("/WEB-INF/jsp/util/offerList.jsp").forward(request, response);
		return;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/offerManage.jsp").forward(request, response);
		return;
	}
}