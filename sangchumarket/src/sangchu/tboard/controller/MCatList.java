package sangchu.tboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sangchu.category.service.CategoryServiceImpl;
import sangchu.category.service.ICategoryService;
import sangchu.category.vo.CatMiddleVO;
import sangchu.tboard.service.ITBoardService;
import sangchu.tboard.service.TBoardServiceImpl;

@WebServlet("/mCatList.do")
public class MCatList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String lCategory=request.getParameter("lCategory");
		
		ITBoardService service = TBoardServiceImpl.getInstance();

		List<CatMiddleVO> milist = service.selectCatMiddleOne(lCategory);
		
		Gson gson = new Gson();
	    String json = gson.toJson(milist);
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}
}
