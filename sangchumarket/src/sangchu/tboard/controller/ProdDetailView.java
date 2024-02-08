package sangchu.tboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.vo.JjimVO;
import sangchu.tboard.service.ITBoardService;
import sangchu.tboard.service.TBoardServiceImpl;
import sangchu.tboard.vo.TBoardVO;
import sangchu.trade.vo.TradeVO;
import sangchu.uView.vo.UViewVO;

@WebServlet("/prodDetailView.do")
public class ProdDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String tid = request.getParameter("id");
		System.out.println(tid);
		ITBoardService service = TBoardServiceImpl.getInstance();

		TradeVO tvo = service.selectTradeOne(tid);
		TBoardVO vo = service.selectTBoardOne(tid);
		
		String nick=service.getUNick(tvo.getEmail());
		
		int Jjim=service.checkJJim(tid);
		System.out.println("찜 수 :"+Jjim);
		int res=service.upCnt(tid);
		
		String mid=tvo.getC_middlecat();
		
		List<TBoardVO> list=service.selectTBoard(mid);
		List<TradeVO> tlist=service.selectTrade(mid);
		if(res>0) {
			System.out.println("조회수 업!");
		}else {
			System.out.println("조회수 업 실패...");
		}
		List<String> imgList = service.tImage(tid);

		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO)request.getSession().getAttribute("memVO");
		if (memVO != null) {
			UViewVO uvo = new UViewVO();
			uvo.setT_no(tid);
			uvo.setEmail(memVO.getEmail());
			
			res = service.addUView(uvo);

			if (res > 0) {
				System.out.println("최근 본 상품 저장 완료");
			} else {
				System.out.println("최근 본 상품 저장 실패");
			}
		}
		
		MainProdVO mVo = new MainProdVO();
		
		String email="";
		
		if(memVO != null){
			email = memVO.getEmail();
		}
		
		mVo.setEmail(email);
		
		IMainService mainService= MainServiceImpl.getInstance();
		
		List<MainProdVO> hotList = mainService.hotItemRank(mVo);

		request.setAttribute("nick", nick);
		request.setAttribute("tblist", list);
		request.setAttribute("tlist", tlist);
		request.setAttribute("tvo", tvo);
		request.setAttribute("vo", vo);
		request.setAttribute("imgList", imgList);
		request.setAttribute("Jjim", Jjim);
		request.setAttribute("hotList", hotList);

		request.getRequestDispatcher("/WEB-INF/jsp/prod/prodDetailView.jsp").forward(request, response);
	}

}
