package sangchu.tboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import sangchu.main.vo.PageVO;
import sangchu.tboard.service.ITBoardService;
import sangchu.tboard.service.TBoardServiceImpl;
import sangchu.tboard.vo.TBoardVO;
import sangchu.trade.vo.TradeVO;

@WebServlet("/tBoardList.do")
public class TBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("id");

		ITBoardService service= TBoardServiceImpl.getInstance();
		ICategoryService categoryService = CategoryServiceImpl.getService();
		
		List<CatLargeVO> lalist = categoryService.selectCatLargeList();
		List<CatMiddleVO> milist = categoryService.selectCatMiddleList();
		
		List<TBoardVO> list=service.selectTBoard(mid);
		List<TradeVO> tlist=service.selectTrade(mid);
		
		String MiddleName=service.selectMiddleName(mid);
		
		IMainService mainService= MainServiceImpl.getInstance();
		MainProdVO vo = new MainProdVO();
		
		String email="";

		MemberVO memVO = (MemberVO)request.getSession().getAttribute("memVO");
		
		if(memVO != null){
			email = memVO.getEmail();
		}
		
		vo.setEmail(email);
		
		List<MainProdVO> hotList = mainService.hotItemRank(vo);

		request.setAttribute("mName", MiddleName);
		request.setAttribute("tblist", list);
		request.setAttribute("tlist", tlist);
		request.setAttribute("laResult", lalist);
		request.setAttribute("miResult", milist);
		request.setAttribute("hotList", hotList);
		
		//----------------------------------------
//		
//		for(TBoardVO tvo : list) {
//			List<String> fileStrList= service.tImage(tvo.getT_no());
//			
//			// 이미지가 저장된 폴더 설정
//			String filePath = "d:/midlleproforImages";
//			
//			List<File> fileList = new ArrayList<File>();
//			
//			if(fileStrList!=null) {   // 이미지 테이블에서 파일이 있다고 판단되면
//				for(String i:fileStrList) {
//					fileList.add(new File(filePath + File.separator + i));
//				}
//			}else { // 없다면 기본이미지로 세팅
//				fileList.add(new File("D:\\A_TeachingMeterial\\NormalJava\\workspace\\sangchumarket\\WebContent\\images\\defaultUserImage.png"));
//			}
//			System.out.println(fileList);
//			tvo.setFileList(fileList);
//		}
//		
		
		//------------------------------------------
		
		request.getRequestDispatcher("/WEB-INF/jsp/prod/shop.jsp").forward(request, response);
	}
}
