package sangchu.main.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;

/**
 * Servlet implementation class DeleteJJim
 */
@WebServlet("/deleteJJim.do")
public class DeleteJJim extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// vo에 저장
		MainProdVO vo = new MainProdVO();

		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		IMainService service = MainServiceImpl.getInstance();

		int res = service.deleteJjim(vo);

		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(request, response);
		
	}

}
