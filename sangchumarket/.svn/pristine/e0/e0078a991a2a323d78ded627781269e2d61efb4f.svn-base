package sangchu.main.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import sangchu.main.service.IMainService;
import sangchu.main.service.MainServiceImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.main.vo.PageVO;

/**
	작성자:김보영
	메인에서 회원이 설정한 관심카테고리만 뿌려주는 서블릿


**/
@WebServlet("/userCateProd.do")
public class UserCateProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		//페이징
		PageVO pvo= service.pageInfo(vo);
		vo.setEnd(pvo.getEnd());
		vo.setStart(pvo.getStart());
		
		List<MainProdVO> list = service.selectUserCate(vo);

		request.setAttribute("result", list);

		request.getRequestDispatcher("/WEB-INF/jsp/main/commResult.jsp").forward(request, response);
	}
	


}
