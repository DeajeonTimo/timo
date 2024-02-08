package sangchu.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.category.service.CategoryServiceImpl;
import sangchu.category.service.ICategoryService;
import sangchu.category.vo.CatLargeVO;
import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.CatManageVO;

@WebServlet("/getCategory.do")
public class GetCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/mypage/catManage.jsp").forward(request, response);
		return;
	}

	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.16 10:00
		
		마이 페이지 관심카테고리 관리 관련 요청을 처리하는 서블릿입니다.
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		// 요청이 무엇인지 먼저 받아옴
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO)session.getAttribute("memVO");
		if(memVO==null) {
			response.sendRedirect(request.getContextPath()+"/WEB-INF/jsp/util/loginsessionError.jsp");
			return;
		}
		String email = memVO.getEmail();
		// 처음 대분류 카테고리요청 시
		if("large".equals(command)) {
			ICategoryService catservice = CategoryServiceImpl.getService();
			List<CatLargeVO> catlargeList = catservice.selectCatLargeList();
			request.setAttribute("resultList", catlargeList);
			request.getRequestDispatcher("/WEB-INF/jsp/util/catLargeList.jsp").forward(request, response);
			return;
		}else if("middle".equals(command)) {
			// 대분류를 선택해서 중분류를 요청할 시
			String c_largecat = request.getParameter("largecatcode");
			IMypageService service = MypageServiceImpl.getInstance();
			List<CatMiddleVO> catmiddleList = service.selectMiddlecat(c_largecat);
			request.setAttribute("resultList", catmiddleList);
			request.getRequestDispatcher("/WEB-INF/jsp/util/catMiddleList.jsp").forward(request, response);
			return;
		}else if("insert".equals(command)) {
			// 관심카테고리 등록 요청 시
			IMypageService service = MypageServiceImpl.getInstance();
			// 등록용 VO객체 생성
			CatManageVO catManVO = new CatManageVO();
			// 이메일 세팅
			catManVO.setEmail(email);
			// 해당 유저의 관심카테고리 갯수 먼저 확인
			int check = service.countUserCat(email); 
			if(check>4) {// 관심카테고리가 이미 5개가 있으면
				request.setAttribute("result", 0);
				// 기등록 페이지 초과쪽으로 넣어준다.
				request.getRequestDispatcher("/WEB-INF/jsp/result2.jsp").forward(request, response);
				return;
			}
			// 파라미터로 전달받은 중분류코드 세팅
			catManVO.setC_middlecat(request.getParameter("insertformiddlecode"));
			
			
			// 이미 등록되어있는지 먼저 확인
			int cnt = service.isThereCatAlready(catManVO);
			if(cnt>0) { // 이미 등록되어있을 경우
				// 기등록 result페이지로 포워딩
				request.setAttribute("result", cnt);
				request.getRequestDispatcher("/WEB-INF/jsp/result2.jsp").forward(request, response);
				return;
			}
			// 등록 안되어있을경우 등록 요청
			int res = service.insertCat(catManVO);
			request.setAttribute("result", res);
			
		}else if("delete".equals(command)) {
			// 관심카테고리 삭제 요청 시
			IMypageService service = MypageServiceImpl.getInstance();
			CatManageVO catManVO = new CatManageVO();
			catManVO.setEmail(email);
			catManVO.setC_middlecat(request.getParameter("deleteformiddlecode"));
			int res = service.delInterCat(catManVO);
			request.setAttribute("result", res);
		}else if("mylist".equals(command)) {
			// 유저가 이미 등록해놓은 카테고리 정보 요청 시
			IMypageService service = MypageServiceImpl.getInstance();
			List<CatManageVO> list = service.myCatList(email);
			request.setAttribute("resultList", list);
			request.getRequestDispatcher("/WEB-INF/jsp/util/myCatList.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		return;
	}
}