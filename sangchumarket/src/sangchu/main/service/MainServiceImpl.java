package sangchu.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sangchu.main.dao.IMainDao;
import sangchu.main.dao.MainDaoImpl;
import sangchu.main.vo.MainProdVO;
import sangchu.main.vo.PageVO;
import sangchu.tboard.vo.TBoardVO;

public class MainServiceImpl implements IMainService {
	
	private IMainDao dao;
	private static IMainService service;
	private MainServiceImpl() {
		dao = MainDaoImpl.getInstance();
	}
	public static IMainService getInstance() {
		if(service==null) service = new MainServiceImpl();
		return service;
	}
	@Override
	public List<MainProdVO> hotItemRank(MainProdVO vo) {
		// TODO Auto-generated method stub
		return dao.hotItemRank(vo);
	}
	
	@Override
	public List<MainProdVO> recentProd(MainProdVO vo) {
		// TODO Auto-generated method stub
		return dao.recentProd(vo);
	}
	@Override
	public int saveInterest(MainProdVO vo) {
		dao.deleteInterest(vo);
		
		String middleCat[] =  vo.getC_middlecat().split(",");
		
		//카테고리 설정한 것들이 스플릿해서 하나씩 들어감
		for(String mi : middleCat) {
			
			if(mi == null || mi.equals("")) {
				continue;
			}else{
				vo.setC_middlecat(mi);
				dao.insertInterest(vo);
			}
		}
		return 1;
	}
	@Override
	public List<MainProdVO> selectUserCate(MainProdVO vo) {
		// TODO Auto-generated method stub
		return dao.selectUserCate(vo);
	}
	@Override
	public List<MainProdVO> recentView(MainProdVO vo) {
		// TODO Auto-generated method stub
		return dao.recentView(vo);
	}
	
	
	@Override
	public int insertJjim(MainProdVO vo) {
		return dao.insertJjim(vo);
	}
	
	
	@Override
	public int deleteJjim(MainProdVO vo) {
		return dao.deleteJjim(vo);
	}
	
	@Override
	public PageVO pageInfo(MainProdVO vo) {
		
		//전체글갯수 구하기 
		int count = dao.selectUserCateCount(vo);
		
		//전체페이지수 구하기
		int perList = 4;
		int totalPage = (int)Math.ceil(count / (double)perList);
		
		//start, end 구하기   19 21
		int start = (vo.getPage() -1) * perList + 1;
		int end = start + perList - 1;
		if(end>count) end = count;
		
		//시작페이지끝페이지 
		int perPage = 999999999;
		int startPage = ((vo.getPage()-1)/perPage*perPage)+1;
		int endPage = startPage+perPage-1;
		if(endPage>totalPage) endPage = totalPage;
		
		PageVO  pvo = new PageVO();
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
	}
}
