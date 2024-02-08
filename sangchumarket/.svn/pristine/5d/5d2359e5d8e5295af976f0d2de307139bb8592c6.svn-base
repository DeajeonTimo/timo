package sangchu.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sangchu.category.vo.CatMiddleVO;
import sangchu.login.service.ILoginService;
import sangchu.login.service.LoginServiceImpl;

/**
 * Servlet implementation class GetMiCatfromLaCat
 */
@WebServlet("/getMiCatfromLaCat.do")
public class GetMiCatfromLaCat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String selectedCat = request.getParameter("selectedCat");
		ILoginService service = LoginServiceImpl.getInstance();
		List<CatMiddleVO> list= service.getMiCatfromLaCat(selectedCat);
				
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
