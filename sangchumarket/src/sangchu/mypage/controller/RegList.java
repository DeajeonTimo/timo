package sangchu.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.RegTradeVO;

@WebServlet("/regList.do")
public class RegList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.11 09:33
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.11 11:14
		
		수정내역
		2023.08.11 11:14 - 김석호 : 경로 미설정 부분 완성
		
		유저가 마이페이지에서 거래게시글 등록한걸 조회하기 위해 처리하는 서블릿입니다~
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/mypageRegList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 일단 이메일을 받아와요~
		String email = request.getParameter("email");
		// 서비스객체 가져와요~
		IMypageService service = MypageServiceImpl.getInstance();
		
		// 이메일로 거래게시글 형태VO를 리스트로 받아와요~
		List<RegTradeVO> list = service.getmyRegList(email);
		
		// 보낼준비를해요~
		request.setAttribute("resultList", list);
		
		// 보내요~
		request.getRequestDispatcher("/WEB-INF/jsp/util/mypageRegProductList.jsp").forward(request, response);
	}
}