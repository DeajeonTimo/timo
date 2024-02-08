package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.config.StreamData;
import kr.or.ddit.member.service.IMeberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/LogProServlet.ddit")
public class LogProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reqdata = StreamData.dataChange(request);
		Gson gson = new Gson();
		MemberVO vo = gson.fromJson(reqdata, MemberVO.class);
		
		//service 객체 얻기
		IMeberService service = MemberServiceImpl.getService();
		//service 메소드 호출 - 결과값 얻기
		MemberVO mvo = service.logSelect(vo);
		//session객체 생성
		HttpSession session = request.getSession();
		
		//로그인 성공 실패 여부
		if(mvo != null) {
			//로그인 성공
			//session에 저장
			session.setAttribute("loginok",mvo);
			session.setAttribute("check","true");
		}else {
			//로그인 실패
			session.setAttribute("check","false");
		}
		//view페이지로 이동 - logpro.jsp html결과 생성
		request.getRequestDispatcher("/start/logpro.jsp").forward(request, response);
		
	}

}
