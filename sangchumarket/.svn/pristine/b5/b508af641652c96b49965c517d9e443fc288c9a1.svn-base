package sangchu.category.controller;

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
import sangchu.tboard.service.ITBoardService;
import sangchu.tboard.service.TBoardServiceImpl;
import sangchu.tboard.vo.TBoardVO;

/**
 	작성자 : 김보영
 	카테고리를 출력하는 서블릿
 	
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.16 09:23
		수정 내역
		2023.08.16 09:23 - 김석호 : 전달값 없는 파라미터타입 제거
	
 */
@WebServlet("/categoryList.do")
public class CategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ICategoryService service = CategoryServiceImpl.getService();
		
		List<CatLargeVO> lalist = service.selectCatLargeList();
		List<CatMiddleVO> milist = service.selectCatMiddleList();
		
		
		request.setAttribute("laResult", lalist);
		request.setAttribute("miResult", milist);
		
		request.getRequestDispatcher("/WEB-INF/jsp/main/categoryJson.jsp").forward(request, response);
	
		
	}

	

}
