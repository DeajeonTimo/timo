package sangchu.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.main.vo.MemberVO;
import sangchu.mypage.service.IMypageService;
import sangchu.mypage.service.MypageServiceImpl;
import sangchu.mypage.vo.UserKeywordVO;


@WebServlet("/keywordManage.do")
public class KeywordManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/*
		최조 작성자 : 김석호
		최초 작성일 : 2023.08.15 19:36
		
		수정 내역
		2023.08.15 19:36 - 김석호 :java.util.ConcurrentModificationException 예외 처리
		
		관심/차단키워드와 관련된 요청을 처리하는 서블릿입니다.
	*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이메일을 받아와요..
		request.setCharacterEncoding("utf-8");
		MemberVO memVO = (MemberVO)request.getSession().getAttribute("memVO");
		String email = memVO.getEmail();
		// 여기에는 요청할때 관심키워드를 요청했나, 차단키워드를 요청했나에대한 구분이 담겨있어요
		String k_code = request.getParameter("k_code");
		System.out.println(email);
		System.out.println(k_code);
		// 서비스 객체를 불러와요
		IMypageService service = MypageServiceImpl.getInstance();
		// 리스트를 받아와요
		List<UserKeywordVO> list = service.getUserKeyword(email);
		// 리스트를 갈무리해요
		list = tidyUpList(list, k_code);
		
		// 그대로 resultList.jsp로 넘어가요
		request.setAttribute("resultList", list);
		request.getRequestDispatcher("/WEB-INF/jsp/util/keywordList.jsp").forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 키워드 등록, 삭제 요청이 들어왔을 때의 메소드
		MemberVO memVO =(MemberVO) request.getSession().getAttribute("memVO");
		String command = request.getParameter("command");
		String keyword = request.getParameter("keyword");
		String email = memVO.getEmail();
		System.out.println("이메일 : "+email);
		System.out.println("명령 : "+command);
		System.out.println("키워드 : "+keyword);
		// vo객체를 생성하고 공통으로 쓸 정보를 미리 세팅
		UserKeywordVO ukeyVO = new UserKeywordVO();
		ukeyVO.setEmail(email);
		ukeyVO.setK_keyword(keyword);
		// 데이터를 처리해줄 서비스객체 생성
		IMypageService service = MypageServiceImpl.getInstance();
		
		if("remove".equals(command)) {
			// 삭제 요청일 경우
			int res = service.deleteUserKeyword(ukeyVO);
			request.setAttribute("result", res);
		}else if("inter".equals(command)) {
			// 관심키워드 등록 요청일 경우
			ukeyVO.setK_code("1");
			// 일단 등록된 키워드인지 먼저 확인
			if(checkthisout(ukeyVO, service, request, response)>0) return;
			// 관심키워드가 이미 5개 있는지 확인
			int cnt = service.countInKeyword(email);
			if(cnt>4) {
				request.setAttribute("result", 0);
				request.getRequestDispatcher("/WEB-INF/jsp/result2.jsp").forward(request, response);
				return;
			}
			// 없다면 이제 키워드 등록
			int res = service.insertUserKeyword(ukeyVO);
			request.setAttribute("result", res);
		}else if("block".equals(command)) {
			// 차단키워드 등록 요청일 경우
			ukeyVO.setK_code("2");
			// 일단 등록된 키워드인지 먼저 확인
			if(checkthisout(ukeyVO, service, request, response)>0) return;
			// 차단키워드가 이미 5개 있는지 확인
			int cnt = service.countBlKeyword(email);
			if(cnt>4) {
				request.setAttribute("result", 0);
				request.getRequestDispatcher("/WEB-INF/jsp/result2.jsp").forward(request, response);
				return;
			}
			// 없다면 이제 키워드 등록
			int res = service.insertUserKeyword(ukeyVO);
			request.setAttribute("result", res);
		}
		// 결과는 위에서 등록했으니 포워드로 결과페이지로 보낸다
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		return;
	}
	
	
	
	// 키워드 리스트를 받아서 관심키워드, 차단키워드에 따라 자료를 남기고 정리해주는 메소드
	private List<UserKeywordVO> tidyUpList(List<UserKeywordVO> list, String k_code){
		if(list!=null && list.size()>0) {
			for(int i = list.size()-1; i>=0 ; i--) {
				if(!list.get(i).getK_code().equals(k_code)) {
					list.remove(i);
				}
			}
			/* java.util.ConcurrentModificationException
			for(UserKeywordVO vo : list) {
				if(!vo.getK_code().equals(k_code)) {
					list.remove(vo);
				}
			}*/
			
			
			
			// list에 뭐가 들었을때, 구분한 결과를 돌려줌
			// 결과는 size가 0이상 5이하, null이 아닌경우에만 들어오기때문에 null은 아님
			return list;
		}
		
		// 애초에 list가 null이거나 size가 0이면 그대로 돌려줌
		return list;
	}
	
	// 등록된 키워드인지 확인하는 메소드 공통으로 쓰기위해 빼놓음
	public int checkthisout(UserKeywordVO vo, IMypageService service, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int check = service.checkKeyword(vo);
		if(check>0) { // 이미 등록되어있는 키워드일 경우
			request.setAttribute("result", check);
			request.getRequestDispatcher("/WEB-INF/jsp/result2.jsp").forward(request, response);
		}
		// 등록된 키워드가 아니라면 그냥 빠져나간다.
		return check;
	}
	
}
