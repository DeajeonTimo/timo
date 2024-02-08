package sangchu.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangchu.category.service.CategoryServiceImpl;
import sangchu.category.service.ICategoryService;
import sangchu.category.vo.CatLargeVO;
import sangchu.category.vo.CatMiddleVO;
import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.main.vo.MemberVO;

@WebServlet("/sangchuMain.do")
public class SangchuMain extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		IMainService mainService= MainServiceImpl.getInstance();
		MainProdVO vo = new MainProdVO();
		
		String email="";

		MemberVO memVO = (MemberVO)request.getSession().getAttribute("memVO");
		
		if(memVO != null){
			email = memVO.getEmail();
		}
		
		vo.setEmail(email);
		
		List<MainProdVO> recentList=mainService.recentProd(null);
		List<MainProdVO> hotList = mainService.hotItemRank(vo);
		List<MainProdVO> viewList = mainService.recentView(vo);
		
		
		ICategoryService categoryService = CategoryServiceImpl.getService();
		
		List<CatLargeVO> lalist = categoryService.selectCatLargeList();
		List<CatMiddleVO> milist = categoryService.selectCatMiddleList();
		
		
		request.setAttribute("viewList",viewList);
		request.setAttribute("laResult", lalist);
		request.setAttribute("miResult", milist);
		
		request.setAttribute("recentList", recentList);
		request.setAttribute("hotList", hotList);


		request.getRequestDispatcher("/WEB-INF/jsp/main/mainView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
